`timescale 1ns / 1ps
module alu(sel,A,B,res);
    input [2:0]sel;
    input [31:0]A,B;
    output reg [32:0] res;
    always @(*)
    begin
    case(sel)
    3'b000:res=~A;
    3'b001:res=A|B;
    3'b010:res=A&B;
    3'b011:res=-A;
    3'b100:res=A+B;
    3'b101:res=A-B;
    3'b110:res=A*B;
    3'b111:res=(B!=0)?A/B:0;
    default: res=32'b0;
    endcase
    end
    
endmodule
