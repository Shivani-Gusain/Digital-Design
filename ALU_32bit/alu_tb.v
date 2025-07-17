`timescale 1ns / 1ps
module alu_tb;
    reg [31:0] A,B;
    reg [2:0]sel;
    wire [32:0]res;

    //instantiate ALU
    alu dut(.A(A),.B(B),.sel(sel),.res(res));
    //test case A=7,B=1
    initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0,alu_tb);
    $monitor($time,"A=%h,B=%h,sel=%b,res=%h",A,B,sel,res);
        A=32'h00000007; 
        B=32'h00000001;
        //not
        sel=3'b000;
        #10 sel=3'b001; //or
        #10 sel=3'b010;//and
        #10 sel=3'b011; //negative
        #10 sel=3'b100;//A+B
        #10 sel=3'b101;//sub
        #10 sel=3'b110;//mul
        #10 sel=3'b111; //div
        #10
        $finish;
        end
        
endmodule
