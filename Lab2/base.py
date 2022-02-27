#!/usr/bin/env python3

from migen import *
from migen.build.generic_platform import *
from litex.build.generic_platform import *
from litex.build.altera import AlteraPlatform
from litex.build.altera.programmer import USBBlaster
from migen.genlib.cdc import MultiReg

from tick import *
from display import *
from bcd import *
from core import *

# IOs ----------------------------------------------------------------------------------------------

_io = [
    ("clk50", 0, Pins("N14"), IOStandard("3.3-V LVTTL")),


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

    ("user_btn_r", 0, Pins("B8"), IOStandard("3.3-V LVTTL")),
    ("user_btn_l", 0, Pins("A7"), IOStandard("3.3-V LVTTL")),


	("display_1", 0, Pins("C14 E15 C15 C16 E16 D17 C17 D15"), IOStandard("3.3-V LVTTL")), 
	("display_2", 0, Pins("C18 D18 E18 B16 A17 A18 B17 A16"), IOStandard("3.3-V LVTTL")),
	("display_3", 0, Pins("B20 A20 B19 A21 B21 C22 B22 A19"), IOStandard("3.3-V LVTTL")),
	("display_4", 0, Pins("F21 E22 E21 C19 C20 D19 E17 D22"), IOStandard("3.3-V LVTTL")),
	("display_5", 0, Pins("F18 E20 E19 J18 H19 F19 F20 F17"), IOStandard("3.3-V LVTTL")),
	("display_6", 0, Pins("J20 K20 L18 N18 M20 N19 N20 L19"), IOStandard("3.3-V LVTTL")),
]

# Platform -----------------------------------------------------------------------------------------

class Platform(AlteraPlatform):
    default_clk_name   = "clk50"
    default_clk_period = 1e9/50e6
    create_rbf = False 

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
        
        tick = Tick(self.sys_clk_freq,1)
        self.submodules += tick
        
        display1 = SevenSegmentDisplay(self.sys_clk_freq)
        display2 = SevenSegmentDisplay(self.sys_clk_freq)
        display3 = SevenSegmentDisplay(self.sys_clk_freq)
        display4 = SevenSegmentDisplay(self.sys_clk_freq)
        display5 = SevenSegmentDisplay(self.sys_clk_freq)
        display6 = SevenSegmentDisplay(self.sys_clk_freq)
        self.submodules += display1, display2, display3, display4, display5, display6

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
            display1.values.eq(bcd_seconds.ones),
            display2.values.eq(bcd_seconds.tens),

            # Convert core minutes to bcd and connect
            # to display
            bcd_minutes.value.eq(core.minutes),
            display3.values.eq(bcd_minutes.ones),
            display4.values.eq(bcd_minutes.tens),

            # Convert core hours to bcd and connect
            # to display
            bcd_hours.value.eq(core.hours),
            display5.values.eq(bcd_hours.ones),
            display6.values.eq(bcd_hours.tens),

            # Connect display to pads
            platform.request("display_1").eq(~display1.abcdefg),
            platform.request("display_2").eq(~display2.abcdefg),
            platform.request("display_3").eq(~display3.abcdefg),
            platform.request("display_4").eq(~display4.abcdefg),
            platform.request("display_5").eq(~display5.abcdefg),
            platform.request("display_6").eq(~display6.abcdefg)
        ]

module = Clock()

# Build --------------------------------------------------------------------------------------------

platform.build(module)
