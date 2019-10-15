module Register_File(Read_Data_1, Read_Data_2, Read_Reg_1, Read_Reg_2, Write_Reg, Write_Data, Reg_Write, Clock);

input wire[4:0] Read_Reg_1, Read_Reg_2, Write_Reg;
input wire[31:0] Write_Data;
input Reg_Write, Clock;
output reg[31:0] Read_Data_1, Read_Data_2;

reg[31:0] Reg_File[0:31];

initial
begin
Reg_File[0] <= 32'h00000000; //zero register
Reg_File[29] <= 32'h00000000; //change this address to stack pointer 
end

always @(posedge Clock)
begin
if(Reg_Write)
Reg_File[Write_Reg] <= Write_Data;
end

always @(negedge Clock)
begin
Read_Data_1 <= Reg_File[Read_Reg_1];
Read_Data_2 <= Reg_File[Read_Reg_2];
end
endmodule
