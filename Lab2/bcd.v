/* Machine-generated using Migen */
module bcd(
	input [7:0] value,
	output [3:0] hundreds,
	output [3:0] tens,
	output [3:0] ones
);

reg [3:0] hundreds1 = 4'd0;
reg [3:0] tens1 = 4'd0;
reg [3:0] ones1 = 4'd0;
reg [3:0] hundreds2;
reg [3:0] tens2;
reg [3:0] ones2;
reg [3:0] next_hundreds0;
reg [3:0] next_tens0;
reg [3:0] next_ones0;
reg [3:0] hundreds3;
reg [3:0] tens3;
reg [3:0] ones3;
reg [3:0] next_hundreds1;
reg [3:0] next_tens1;
reg [3:0] next_ones1;
reg [3:0] hundreds4;
reg [3:0] tens4;
reg [3:0] ones4;
reg [3:0] next_hundreds2;
reg [3:0] next_tens2;
reg [3:0] next_ones2;
reg [3:0] hundreds5;
reg [3:0] tens5;
reg [3:0] ones5;
reg [3:0] next_hundreds3;
reg [3:0] next_tens3;
reg [3:0] next_ones3;
reg [3:0] hundreds6;
reg [3:0] tens6;
reg [3:0] ones6;
reg [3:0] next_hundreds4;
reg [3:0] next_tens4;
reg [3:0] next_ones4;
reg [3:0] hundreds7;
reg [3:0] tens7;
reg [3:0] ones7;
reg [3:0] next_hundreds5;
reg [3:0] next_tens5;
reg [3:0] next_ones5;
reg [3:0] hundreds8;
reg [3:0] tens8;
reg [3:0] ones8;
reg [3:0] next_hundreds6;
reg [3:0] next_tens6;
reg [3:0] next_ones6;
reg [3:0] hundreds9;
reg [3:0] tens9;
reg [3:0] ones9;
reg [3:0] next_hundreds7;
reg [3:0] next_tens7;
reg [3:0] next_ones7;

// synthesis translate_off
reg dummy_s;
initial dummy_s <= 1'd0;
// synthesis translate_on


// synthesis translate_off
reg dummy_d;
// synthesis translate_on
always @(*) begin
	hundreds2 <= 4'd0;
	hundreds2 <= hundreds1;
	if ((hundreds1 >= 3'd5)) begin
		hundreds2 <= (hundreds1 + 2'd3);
	end else begin
		hundreds2 <= hundreds1;
	end
// synthesis translate_off
	dummy_d <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_1;
// synthesis translate_on
always @(*) begin
	tens2 <= 4'd0;
	tens2 <= tens1;
	if ((tens1 >= 3'd5)) begin
		tens2 <= (tens1 + 2'd3);
	end else begin
		tens2 <= tens1;
	end
// synthesis translate_off
	dummy_d_1 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_2;
// synthesis translate_on
always @(*) begin
	ones2 <= 4'd0;
	ones2 <= ones1;
	if ((ones1 >= 3'd5)) begin
		ones2 <= (ones1 + 2'd3);
	end else begin
		ones2 <= ones1;
	end
// synthesis translate_off
	dummy_d_2 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_3;
// synthesis translate_on
always @(*) begin
	next_hundreds0 <= 4'd0;
	next_hundreds0[3:1] <= hundreds2;
	next_hundreds0[0] <= tens2[3];
// synthesis translate_off
	dummy_d_3 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_4;
// synthesis translate_on
always @(*) begin
	next_tens0 <= 4'd0;
	next_tens0[3:1] <= tens2;
	next_tens0[0] <= ones2[3];
// synthesis translate_off
	dummy_d_4 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_5;
// synthesis translate_on
always @(*) begin
	next_ones0 <= 4'd0;
	next_ones0[3:1] <= ones2;
	next_ones0[0] <= value[7];
// synthesis translate_off
	dummy_d_5 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_6;
// synthesis translate_on
always @(*) begin
	hundreds3 <= 4'd0;
	hundreds3 <= next_hundreds0;
	if ((next_hundreds0 >= 3'd5)) begin
		hundreds3 <= (next_hundreds0 + 2'd3);
	end else begin
		hundreds3 <= next_hundreds0;
	end
// synthesis translate_off
	dummy_d_6 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_7;
// synthesis translate_on
always @(*) begin
	tens3 <= 4'd0;
	tens3 <= next_tens0;
	if ((next_tens0 >= 3'd5)) begin
		tens3 <= (next_tens0 + 2'd3);
	end else begin
		tens3 <= next_tens0;
	end
// synthesis translate_off
	dummy_d_7 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_8;
// synthesis translate_on
always @(*) begin
	ones3 <= 4'd0;
	ones3 <= next_ones0;
	if ((next_ones0 >= 3'd5)) begin
		ones3 <= (next_ones0 + 2'd3);
	end else begin
		ones3 <= next_ones0;
	end
// synthesis translate_off
	dummy_d_8 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_9;
// synthesis translate_on
always @(*) begin
	next_hundreds1 <= 4'd0;
	next_hundreds1[3:1] <= hundreds3;
	next_hundreds1[0] <= tens3[3];
// synthesis translate_off
	dummy_d_9 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_10;
// synthesis translate_on
always @(*) begin
	next_tens1 <= 4'd0;
	next_tens1[3:1] <= tens3;
	next_tens1[0] <= ones3[3];
// synthesis translate_off
	dummy_d_10 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_11;
// synthesis translate_on
always @(*) begin
	next_ones1 <= 4'd0;
	next_ones1[3:1] <= ones3;
	next_ones1[0] <= value[6];
// synthesis translate_off
	dummy_d_11 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_12;
// synthesis translate_on
always @(*) begin
	hundreds4 <= 4'd0;
	hundreds4 <= next_hundreds1;
	if ((next_hundreds1 >= 3'd5)) begin
		hundreds4 <= (next_hundreds1 + 2'd3);
	end else begin
		hundreds4 <= next_hundreds1;
	end
// synthesis translate_off
	dummy_d_12 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_13;
// synthesis translate_on
always @(*) begin
	tens4 <= 4'd0;
	tens4 <= next_tens1;
	if ((next_tens1 >= 3'd5)) begin
		tens4 <= (next_tens1 + 2'd3);
	end else begin
		tens4 <= next_tens1;
	end
// synthesis translate_off
	dummy_d_13 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_14;
// synthesis translate_on
always @(*) begin
	ones4 <= 4'd0;
	ones4 <= next_ones1;
	if ((next_ones1 >= 3'd5)) begin
		ones4 <= (next_ones1 + 2'd3);
	end else begin
		ones4 <= next_ones1;
	end
// synthesis translate_off
	dummy_d_14 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_15;
// synthesis translate_on
always @(*) begin
	next_hundreds2 <= 4'd0;
	next_hundreds2[3:1] <= hundreds4;
	next_hundreds2[0] <= tens4[3];
// synthesis translate_off
	dummy_d_15 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_16;
// synthesis translate_on
always @(*) begin
	next_tens2 <= 4'd0;
	next_tens2[3:1] <= tens4;
	next_tens2[0] <= ones4[3];
// synthesis translate_off
	dummy_d_16 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_17;
// synthesis translate_on
always @(*) begin
	next_ones2 <= 4'd0;
	next_ones2[3:1] <= ones4;
	next_ones2[0] <= value[5];
// synthesis translate_off
	dummy_d_17 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_18;
// synthesis translate_on
always @(*) begin
	hundreds5 <= 4'd0;
	hundreds5 <= next_hundreds2;
	if ((next_hundreds2 >= 3'd5)) begin
		hundreds5 <= (next_hundreds2 + 2'd3);
	end else begin
		hundreds5 <= next_hundreds2;
	end
// synthesis translate_off
	dummy_d_18 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_19;
// synthesis translate_on
always @(*) begin
	tens5 <= 4'd0;
	tens5 <= next_tens2;
	if ((next_tens2 >= 3'd5)) begin
		tens5 <= (next_tens2 + 2'd3);
	end else begin
		tens5 <= next_tens2;
	end
// synthesis translate_off
	dummy_d_19 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_20;
// synthesis translate_on
always @(*) begin
	ones5 <= 4'd0;
	ones5 <= next_ones2;
	if ((next_ones2 >= 3'd5)) begin
		ones5 <= (next_ones2 + 2'd3);
	end else begin
		ones5 <= next_ones2;
	end
// synthesis translate_off
	dummy_d_20 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_21;
// synthesis translate_on
always @(*) begin
	next_hundreds3 <= 4'd0;
	next_hundreds3[3:1] <= hundreds5;
	next_hundreds3[0] <= tens5[3];
// synthesis translate_off
	dummy_d_21 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_22;
// synthesis translate_on
always @(*) begin
	next_tens3 <= 4'd0;
	next_tens3[3:1] <= tens5;
	next_tens3[0] <= ones5[3];
// synthesis translate_off
	dummy_d_22 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_23;
// synthesis translate_on
always @(*) begin
	next_ones3 <= 4'd0;
	next_ones3[3:1] <= ones5;
	next_ones3[0] <= value[4];
// synthesis translate_off
	dummy_d_23 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_24;
// synthesis translate_on
always @(*) begin
	hundreds6 <= 4'd0;
	hundreds6 <= next_hundreds3;
	if ((next_hundreds3 >= 3'd5)) begin
		hundreds6 <= (next_hundreds3 + 2'd3);
	end else begin
		hundreds6 <= next_hundreds3;
	end
// synthesis translate_off
	dummy_d_24 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_25;
// synthesis translate_on
always @(*) begin
	tens6 <= 4'd0;
	tens6 <= next_tens3;
	if ((next_tens3 >= 3'd5)) begin
		tens6 <= (next_tens3 + 2'd3);
	end else begin
		tens6 <= next_tens3;
	end
// synthesis translate_off
	dummy_d_25 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_26;
// synthesis translate_on
always @(*) begin
	ones6 <= 4'd0;
	ones6 <= next_ones3;
	if ((next_ones3 >= 3'd5)) begin
		ones6 <= (next_ones3 + 2'd3);
	end else begin
		ones6 <= next_ones3;
	end
// synthesis translate_off
	dummy_d_26 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_27;
// synthesis translate_on
always @(*) begin
	next_hundreds4 <= 4'd0;
	next_hundreds4[3:1] <= hundreds6;
	next_hundreds4[0] <= tens6[3];
// synthesis translate_off
	dummy_d_27 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_28;
// synthesis translate_on
always @(*) begin
	next_tens4 <= 4'd0;
	next_tens4[3:1] <= tens6;
	next_tens4[0] <= ones6[3];
// synthesis translate_off
	dummy_d_28 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_29;
// synthesis translate_on
always @(*) begin
	next_ones4 <= 4'd0;
	next_ones4[3:1] <= ones6;
	next_ones4[0] <= value[3];
// synthesis translate_off
	dummy_d_29 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_30;
// synthesis translate_on
always @(*) begin
	hundreds7 <= 4'd0;
	hundreds7 <= next_hundreds4;
	if ((next_hundreds4 >= 3'd5)) begin
		hundreds7 <= (next_hundreds4 + 2'd3);
	end else begin
		hundreds7 <= next_hundreds4;
	end
// synthesis translate_off
	dummy_d_30 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_31;
// synthesis translate_on
always @(*) begin
	tens7 <= 4'd0;
	tens7 <= next_tens4;
	if ((next_tens4 >= 3'd5)) begin
		tens7 <= (next_tens4 + 2'd3);
	end else begin
		tens7 <= next_tens4;
	end
// synthesis translate_off
	dummy_d_31 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_32;
// synthesis translate_on
always @(*) begin
	ones7 <= 4'd0;
	ones7 <= next_ones4;
	if ((next_ones4 >= 3'd5)) begin
		ones7 <= (next_ones4 + 2'd3);
	end else begin
		ones7 <= next_ones4;
	end
// synthesis translate_off
	dummy_d_32 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_33;
// synthesis translate_on
always @(*) begin
	next_hundreds5 <= 4'd0;
	next_hundreds5[3:1] <= hundreds7;
	next_hundreds5[0] <= tens7[3];
// synthesis translate_off
	dummy_d_33 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_34;
// synthesis translate_on
always @(*) begin
	next_tens5 <= 4'd0;
	next_tens5[3:1] <= tens7;
	next_tens5[0] <= ones7[3];
// synthesis translate_off
	dummy_d_34 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_35;
// synthesis translate_on
always @(*) begin
	next_ones5 <= 4'd0;
	next_ones5[3:1] <= ones7;
	next_ones5[0] <= value[2];
// synthesis translate_off
	dummy_d_35 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_36;
// synthesis translate_on
always @(*) begin
	hundreds8 <= 4'd0;
	hundreds8 <= next_hundreds5;
	if ((next_hundreds5 >= 3'd5)) begin
		hundreds8 <= (next_hundreds5 + 2'd3);
	end else begin
		hundreds8 <= next_hundreds5;
	end
// synthesis translate_off
	dummy_d_36 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_37;
// synthesis translate_on
always @(*) begin
	tens8 <= 4'd0;
	tens8 <= next_tens5;
	if ((next_tens5 >= 3'd5)) begin
		tens8 <= (next_tens5 + 2'd3);
	end else begin
		tens8 <= next_tens5;
	end
// synthesis translate_off
	dummy_d_37 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_38;
// synthesis translate_on
always @(*) begin
	ones8 <= 4'd0;
	ones8 <= next_ones5;
	if ((next_ones5 >= 3'd5)) begin
		ones8 <= (next_ones5 + 2'd3);
	end else begin
		ones8 <= next_ones5;
	end
// synthesis translate_off
	dummy_d_38 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_39;
// synthesis translate_on
always @(*) begin
	next_hundreds6 <= 4'd0;
	next_hundreds6[3:1] <= hundreds8;
	next_hundreds6[0] <= tens8[3];
// synthesis translate_off
	dummy_d_39 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_40;
// synthesis translate_on
always @(*) begin
	next_tens6 <= 4'd0;
	next_tens6[3:1] <= tens8;
	next_tens6[0] <= ones8[3];
// synthesis translate_off
	dummy_d_40 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_41;
// synthesis translate_on
always @(*) begin
	next_ones6 <= 4'd0;
	next_ones6[3:1] <= ones8;
	next_ones6[0] <= value[1];
// synthesis translate_off
	dummy_d_41 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_42;
// synthesis translate_on
always @(*) begin
	hundreds9 <= 4'd0;
	hundreds9 <= next_hundreds6;
	if ((next_hundreds6 >= 3'd5)) begin
		hundreds9 <= (next_hundreds6 + 2'd3);
	end else begin
		hundreds9 <= next_hundreds6;
	end
// synthesis translate_off
	dummy_d_42 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_43;
// synthesis translate_on
always @(*) begin
	tens9 <= 4'd0;
	tens9 <= next_tens6;
	if ((next_tens6 >= 3'd5)) begin
		tens9 <= (next_tens6 + 2'd3);
	end else begin
		tens9 <= next_tens6;
	end
// synthesis translate_off
	dummy_d_43 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_44;
// synthesis translate_on
always @(*) begin
	ones9 <= 4'd0;
	ones9 <= next_ones6;
	if ((next_ones6 >= 3'd5)) begin
		ones9 <= (next_ones6 + 2'd3);
	end else begin
		ones9 <= next_ones6;
	end
// synthesis translate_off
	dummy_d_44 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_45;
// synthesis translate_on
always @(*) begin
	next_hundreds7 <= 4'd0;
	next_hundreds7[3:1] <= hundreds9;
	next_hundreds7[0] <= tens9[3];
// synthesis translate_off
	dummy_d_45 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_46;
// synthesis translate_on
always @(*) begin
	next_tens7 <= 4'd0;
	next_tens7[3:1] <= tens9;
	next_tens7[0] <= ones9[3];
// synthesis translate_off
	dummy_d_46 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_47;
// synthesis translate_on
always @(*) begin
	next_ones7 <= 4'd0;
	next_ones7[3:1] <= ones9;
	next_ones7[0] <= value[0];
// synthesis translate_off
	dummy_d_47 <= dummy_s;
// synthesis translate_on
end
assign hundreds = next_hundreds7;
assign tens = next_tens7;
assign ones = next_ones7;

endmodule
