module Program_Memory
#
(	
	parameter MEMORY_DEPTH 	= 64,
	parameter DATA_WIDTH 	= 32
)(
	input 	  [(DATA_WIDTH-1):0]	Address_i,
	output reg [(DATA_WIDTH-1):0]	Instruction_o
);
	
	reg [DATA_WIDTH-1:0] rom [MEMORY_DEPTH-1:0]; //ROM declaration
	
	initial begin
		$readmemh("/home/alopez/Workspace/repos/PreSi-Arq/MemorySystem/src/text.dat", rom);
	end
	
	always @ (Address_i) begin
		Instruction_o = rom[Address_i];
		//$display($time," ROM: %h", Instruction_o);
	end
endmodule 
