module ALU(Read_Data_1, Alu_Src_Output, ALUctrl , Alu_Result ,Zero);

input  wire signed [31:0] Read_Data_1;
input  wire signed [31:0] Alu_Src_Output;
input  wire signed [3:0] ALUctrl;
output reg  signed [31:0] Alu_Result;
input  wire Zero;

localparam AND = 4'b0000;
localparam OR  = 4'b0001;
localparam ADD = 4'b0010;
localparam SUB = 4'b0110;
localparam SLT = 4'b0111;
//localparam NOR = 4'b1100;

assign Zero = ( Read_Data_1 == Alu_Src_Output);
always@(Read_Data_1,Alu_Src_Output,ALUctrl)
begin 

	case(ALUctrl)
	AND: Alu_Result <= Read_Data_1 &  Alu_Src_Output ;
	OR : Alu_Result <= Read_Data_1 |  Alu_Src_Output ;
	ADD: Alu_Result <= Read_Data_1 +  Alu_Src_Output ;
	SUB: Alu_Result <= Read_Data_1 -  Alu_Src_Output ;
	SLT: Alu_Result <=(Read_Data_1 <  Alu_Src_Output);
//	NOR: Alu_Result <= Read_Data_1 ~| Alu_Src_Output ;
	default : $display ("ERROR_NOT_RAY2 CODE: %b",ALUctrl);
	endcase
end

endmodule


module Test_ALU_Ray2;
localparam AND = 4'b0000;
localparam OR  = 4'b0001;
localparam ADD = 4'b0010;
localparam SUB = 4'b0110;
localparam SLT = 4'b0111;
localparam NOR = 4'b1100;

reg  signed[31:0] in1;
reg  signed[31:0] in2;
reg  signed[3:0]  ctrl;
wire signed[31:0] result;
wire zero;

initial
begin
$monitor ("in1=%d in2=%d ctrl=%b result=%d zero=%b",in1,in2,ctrl,result,zero);

#1
in1 = 50;
in2 =20;
ctrl = ADD;

#1
in1 = 50;
in2 =20;
ctrl = SUB;

end

ALU test_ray2(in1, in2, ctrl , result ,zero);


endmodule
