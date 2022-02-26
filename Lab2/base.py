#!/usr/bin/env python3

from migen import *
from migen.build.generic_platform import *
from litex.build.generic_platform import *
from litex.build.altera import AlteraPlatform
from litex.build.altera.programmer import USBBlaster

from tick import *
from display import *
from bcd import *
from core import *

# IOs ----------------------------------------------------------------------------------------------

_io = [
    ("clk10", 0, Pins("N5"), IOStandard("3.3-V LVTTL")),
    ("clk50", 0, Pins("P11"), IOStandard("3.3-V LVTTL")),
    ("clk50", 1, Pins("N14"), IOStandard("3.3-V LVTTL")),

    ("serial", 0,
        Subsignal("tx", Pins("V10"), IOStandard("3.3-V LVTTL")), # JP1 GPIO[0]
        Subsignal("rx", Pins("W10"), IOStandard("3.3-V LVTTL"))  # JP1 GPIO[1]
    ),

    ("user_led", 0, Pins("A8"), IOStandard("3.3-V LVTTL")),
    ("user_led", 1, Pins("A9"), IOStandard("3.3-V LVTTL")),
    ("user_led", 2, Pins("A10"), IOStandard("3.3-V LVTTL")),
    ("user_led", 3, Pins("B10"), IOStandard("3.3-V LVTTL")),
    ("user_led", 4, Pins("D13"), IOStandard("3.3-V LVTTL")),
    ("user_led", 5, Pins("C13"), IOStandard("3.3-V LVTTL")),
    ("user_led", 6, Pins("E14"), IOStandard("3.3-V LVTTL")),
    ("user_led", 7, Pins("D14"), IOStandard("3.3-V LVTTL")),
    ("user_led", 8, Pins("A11"), IOStandard("3.3-V LVTTL")),
    ("user_led", 9, Pins("B11"), IOStandard("3.3-V LVTTL")),

    ("user_btn", 0, Pins("B8"), IOStandard("3.3-V LVTTL")),
    ("user_btn", 1, Pins("A7"), IOStandard("3.3-V LVTTL")),

    ("user_sw", 0, Pins("C10"), IOStandard("3.3-V LVTTL")),
    ("user_sw", 1, Pins("C11"), IOStandard("3.3-V LVTTL")),
    ("user_sw", 2, Pins("D12"), IOStandard("3.3-V LVTTL")),
    ("user_sw", 3, Pins("C12"), IOStandard("3.3-V LVTTL")),
    ("user_sw", 4, Pins("A12"), IOStandard("3.3-V LVTTL")),
    ("user_sw", 5, Pins("B12"), IOStandard("3.3-V LVTTL")),
    ("user_sw", 6, Pins("A13"), IOStandard("3.3-V LVTTL")),
    ("user_sw", 7, Pins("A14"), IOStandard("3.3-V LVTTL")),
    ("user_sw", 8, Pins("B14"), IOStandard("3.3-V LVTTL")),
    ("user_sw", 9, Pins("F15"), IOStandard("3.3-V LVTTL")),
]

# Platform -----------------------------------------------------------------------------------------

class Platform(AlteraPlatform):
    default_clk_name   = "clk50"
    default_clk_period = 1e9/100e6

    def __init__(self):
        AlteraPlatform.__init__(self, "10M50DAF484C7G", _io)

# Design -------------------------------------------------------------------------------------------

# User button detection
class UserButtonPress(Module):
    def __init__(self, user_btn):
        self.rising = Signal()

        # # #

        _user_btn = Signal()
        _user_btn_d = Signal()

        # resynchronize user_btn
        self.specials += MultiReg(user_btn, _user_btn)
        # detect rising edge
        self.sync += [
            _user_btn_d.eq(user_btn),
            self.rising.eq(_user_btn & ~_user_btn_d)
        ]

# Create our platform (fpga interface)
platform = Platform()

# Create our main module (fpga description)
class Clock(Module):
    sys_clk_freq = int(100e6)
    def __init__(self):
        # Tick generation : timebase
        tick = Tick(self.sys_clk_freq, 1)
        self.submodules += tick

        # SevenSegmentDisplay
        display = SevenSegmentDisplay(self.sys_clk_freq)
        self.submodules += display

        # Core : counts ss/mm/hh
        core = Core()
        self.submodules += core

        # set mm/hh
        btn0_press = UserButtonPress(platform.request("user_btn_r"))
        btn1_press = UserButtonPress(platform.request("user_btn_l"))
        self.submodules += btn0_press, btn1_press

        # Binary Coded Decimal: convert ss/mm/hh to decimal values
        bcd_seconds = BCD()
        bcd_minutes = BCD()
        bcd_hours = BCD()
        self.submodules += bcd_seconds, bcd_minutes, bcd_hours
        # use the generated verilog file
        platform.add_source("bcd.v")

        # combinatorial assignement
        self.comb += [
            # Connect tick to core (core timebase)
            core.tick.eq(tick.ce),

            # Set minutes/hours
            core.inc_minutes.eq(btn0_press.rising),
            core.inc_hours.eq(btn1_press.rising),

            # Convert core seconds to bcd and connect
            # to display
            bcd_seconds.value.eq(core.seconds),
            display.values[0].eq(bcd_seconds.ones),
            display.values[1].eq(bcd_seconds.tens),

            # Convert core minutes to bcd and connect
            # to display
            bcd_minutes.value.eq(core.minutes),
            display.values[2].eq(bcd_minutes.ones),
            display.values[3].eq(bcd_minutes.tens),

            # Convert core hours to bcd and connect
            # to display
            bcd_hours.value.eq(core.hours),
            display.values[4].eq(bcd_hours.ones),
            display.values[5].eq(bcd_hours.tens),

            # Connect display to pads
            platform.request("display_cs_n").eq(~display.cs),
            platform.request("display_abcdefg").eq(~display.abcdefg)
        ]

module = Clock()

# Build --------------------------------------------------------------------------------------------

platform.build(module)
