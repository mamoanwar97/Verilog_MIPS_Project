module Sign_Extend(Sign_Ext_Output, Inst_15_0);
input wire[15:0] Inst_15_0;
output reg[31:0] Sign_Ext_Output;

always @(Inst_15_0)
begin
if(Inst_15_0[15] == 1)
Sign_Ext_Output = Inst_15_0 | 32'hffff0000;
else if (Inst_15_0[15] == 0)
Sign_Ext_Output = Inst_15_0 | 32'h00000000;
else
Sign_Ext_Output =0'bx;
end

endmodule

module tb_sign();

reg[15:0] inst;
wire[31:0] ext;
Sign_Extend proto(ext,inst);
initial
begin
$monitor("inst: %h, sign: %h",inst,ext);

inst <= 16'hff22;

#5

inst <= 16'h0022;
end

endmodule
