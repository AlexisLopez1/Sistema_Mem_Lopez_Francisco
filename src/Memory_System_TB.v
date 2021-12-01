/******************************************************************
* Description
*	This is the verification environment for testing the Memory System.
* Version:
*	1.0
* Author:
*	Ing. Francisco Alexis Lopez Avila
* email:
*	francisco.lopez@iteso.mx
* Date:
*	29/09/2021
******************************************************************/

module Memory_System_TB;

parameter MEMORY_DEPTH 	= 64;
parameter DATA_WIDTH 	= 32;

reg [32:0] Instruction_Range_i_tb;
reg clk_tb = 0;
reg Write_Enable_i_tb;
reg [(DATA_WIDTH-1):0] 	Write_Data_i_tb;
reg [(DATA_WIDTH-1):0] 	Address_i_tb;
wire [(DATA_WIDTH-1):0] Instruction_o_tb;

  
Memory_System
#
(
	.MEMORY_DEPTH(MEMORY_DEPTH),
	.DATA_WIDTH(DATA_WIDTH)
)
DUV
(
	.Instruction_Range_i(Instruction_Range_i_tb),
	.clk(clk_tb),
	.Write_Enable_i(Write_Enable_i_tb),
	.Write_Data_i(Write_Data_i_tb),
	.Address_i(Address_i_tb),
	.Instruction_o(Instruction_o_tb) 
);
/*********************************************************/
initial // Clock generator
  begin
    forever #2 clk_tb = !clk_tb;
  end
/*********************************************************/
initial begin
	#0 Write_Enable_i_tb = 1'b0;
	#0 Instruction_Range_i_tb = 32'h400000;
	
	#450 Write_Enable_i_tb = 1'b1;
	#450 Instruction_Range_i_tb = 32'h10010000;
end

initial begin
	#0 Address_i_tb = 32'h400000;
	#50 Address_i_tb = 32'h400004;
	#50 Address_i_tb = 32'h400008;
	#50 Address_i_tb = 32'h40000c;
	#50 Address_i_tb = 32'h400010;
	#50 Address_i_tb = 32'h400014;
	#50 Address_i_tb = 32'h400018;
	#50 Address_i_tb = 32'h40001c;

	#50 Address_i_tb = 32'h10010000;
	#50 Address_i_tb = 32'h10010008;
	#50 Address_i_tb = 32'h1001000c;
	#50 Address_i_tb = 32'h10010010;
	#50 Address_i_tb = 32'h10010014;
end

initial begin
	#450  Write_Data_i_tb = 32'h2008ffff;
	#50 Write_Data_i_tb = 32'h20090010;
	#50 Write_Data_i_tb = 32'h200a000a;
	#50 Write_Data_i_tb = 32'h200b0019;
	#50 Write_Data_i_tb = 32'h012a8020;
end 

/*********************************************************/

endmodule
