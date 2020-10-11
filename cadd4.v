module cadd4 (
	A,
	B,
	Cin,
	s,
	Cout
);
	input [3:0] A ,B;
	input Cin;
	output [3:0] s;
	output Cout;
	wire c0,c1,c2;
	wire [3:0] p,g;

	assign p[0]=A[0]|B[0];
	assign p[1]=A[1]|B[1];
	assign p[2]=A[2]|B[2];
	assign p[3]=A[3]|B[3];

	assign g[0]=A[0]&B[0];
	assign g[1]=A[1]&B[1];
	assign g[2]=A[2]&B[2];
	assign g[3]=A[3]&B[3];

	assign c0=g[0]|(Cin&p[0]);
	assign c1=g[1]|(p[1]&g[0])|(Cin&p[1]&p[0]);
	assign c2=g[2]|(p[2]&g[1])|(p[2]&p[1]&g[0])|(Cin&p[2]&p[1]&p[0]);
	assign Cout=g[3]|(p[3]&g[2])|(p[3]&p[2]&g[1])|(p[3]&p[2]&p[1]&g[0])|(Cin&p[3]&p[2]&p[1]&p[0]);

	assign s[0]=A[0]^B[0]^Cin;
	assign s[1]=A[1]^B[1]^c0;
	assign s[2]=A[2]^B[2]^c1;
	assign s[3]=A[3]^B[3]^c2;
endmodule 
