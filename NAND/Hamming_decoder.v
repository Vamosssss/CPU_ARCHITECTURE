module encoder(A, B);
    input[16:1] A;
    output[1:21] B;
    // Copying Data/Message bits into the output stream
    buf u2(B[3], A[1]);
    buf u3(B[5], A[2]);
    buf u4(B[6], A[3]);
    buf u5(B[7], A[4]);
    buf u6(B[9], A[5]);
    buf u7(B[10], A[6]);
    buf u8(B[11], A[7]);
    buf u9(B[12], A[8]);
    buf u10(B[13], A[9]);
    buf u11(B[14], A[10]);
    buf u12(B[15], A[11]);
    buf u13(B[17], A[12]);
    buf u14(B[18], A[13]);
    buf u15(B[19], A[14]);
    buf u16(B[20], A[15]);
    buf u17(B[21], A[16]);
    // Copying Completed
    // Caluclating Parity Bits
    xor p1(B[1], B[3], B[5], B[7], B[9], B[11], B[13], B[15], B[17], B[19], B[21]);
    xor p2(B[2], B[3], B[6], B[7], B[10], B[11], B[14], B[15], B[18], B[19]);
    xor p4(B[4], B[5], B[6], B[7], B[12], B[13], B[14], B[15], B[20], B[21]);
    xor p8(B[8], B[9], B[10], B[11], B[12], B[13], B[14], B[15]);
    xor p16(B[16], B[17], B[18], B[19], B[20], B[21]);
    //Calculation of Parity bits completed
endmodule

module decoder_ham(
    var1, var2, var3, var4, var5, op1, op2, op3, op4, op5, op6, op7, op8, op9, op10, op11, op12, op13, op14, op15, op16, op17, op18, op19, op20, op21, op22
    );
    input var1, var2, var3, var4, var5;
    output op1, op2, op3, op4, op5, op6, op7, op8, op9, op10, op11, op12, op13, op14, op15, op16, op17, op18, op19, op20, op21, op22;
    assign op1 =  ~var1 & ~var2 & ~var3 & ~var4 & ~var5;
    assign op2 =  ~var1 & ~var2 & ~var3 & ~var4 & var5;
    assign op3 =  ~var1 & ~var2 & ~var3 & var4 & ~var5;
    assign op4 =  ~var1 & ~var2 & ~var3 & var4 & var5;
    assign op5 =  ~var1 & ~var2 & var3 & ~var4 & ~var5;
    assign op6 =  ~var1 & ~var2 & var3 & ~var4 & var5;
    assign op7 =  ~var1 & ~var2 & var3 & var4 & ~var5;
    assign op8 = ~var1 & ~var2 & var3 & var4 & var5;
    assign op9 =  ~var1 & var2 & ~var3 & ~var4 & ~var5;
    assign op10 =  ~var1 & var2 & ~var3 & ~var4 & var5;
    assign op11 =  ~var1 & var2 & ~var3 & var4 & ~var5;
    assign op12 =  ~var1 & var2 & ~var3 & var4 & var5;
    assign op13 =  ~var1 & var2 & var3 & ~var4 & ~var5;
    assign op14 =  ~var1 & var2 & var3 & ~var4 & var5;
    assign op15 =  ~var1 & var2 & var3 & var4 & ~var5;
    assign op16 = ~var1 & var2 & var3 & var4 & var5;
    assign op17 =  var1 & ~var2 & ~var3 & ~var4 & ~var5;
    assign op18 =  var1 & ~var2 & ~var3 & ~var4 & var5;
    assign op19 =  var1 & ~var2 & ~var3 & var4 & ~var5;
    assign op20 =  var1 & ~var2 & ~var3 & var4 & var5;
    assign op21 =  var1 & ~var2 & var3 & ~var4 & ~var5;
    assign op22 =  var1 & ~var2 & var3 & ~var4 & var5;

endmodule

module Hamming_decoder(A, B, var1, var2, var3, var4, var5, op1, op2, op3, op4, op5, op6, op7, op8, op9, op10, op11, op12, op13, op14, op15, op16, op17, op18, op19, op20, op21, op22);
	input[21:1] A;
	output[15:0] B;
	output var1, var2, var3, var4, var5;
	
	// Calculating parity bits for even parity property
	xor p1(var1, A[1], A[3], A[5], A[7], A[9], A[11], A[13], A[15], A[17], A[19], A[21]);
   xor p2(var2, A[2], A[3], A[6], A[7], A[10], A[11], A[14], A[15], A[18], A[19]);
   xor p4(var3, A[4], A[5], A[6], A[7], A[12], A[13], A[14], A[15], A[20], A[21]);
   xor p8(var4, A[8], A[9], A[10], A[11], A[12], A[13], A[14], A[15]);
   xor p16(var5, A[16], A[17], A[18], A[19], A[20], A[21]);
	// Parity bits calculation completed
	

   output op1, op2, op3, op4, op5, op6, op7, op8, op9, op10, op11, op12, op13, op14, op15, op16, op17, op18, op19, op20, op21, op22;

   // Using utility module to find the error location
   // op1 is high when there is no error
   decoder_ham d1(var5,var4,var3,var2,var1,op1, op2, op3, op4, op5, op6, op7, op8, op9, op10, op11, op12, op13, op14, op15, op16, op17, op18, op19, op20, op21, op22);
	// error position calculated
	// Copying message bits into the output cable with appropriate xoring to remove error
	xor alpha1(B[0], op4, A[3]);
	xor alpha2(B[1], op5, A[4]);
	xor alpha3(B[2], op7, A[6]);
   xor alpha4(B[3], op8, A[7]);
   xor alpha5(B[4], op10, A[9]);
	xor alpha6(B[5], op11, A[10]);
	xor alpha7(B[6], op12, A[11]);
	xor alpha8(B[7], op13, A[12]);
	xor alpha9(B[8], op14, A[13]);
	xor alpha10(B[9], op15, A[14]);
	xor alpha11(B[10], op16, A[15]);
	xor alpha12(B[11], op18, A[17]);
	xor alpha13(B[12], op19, A[18]);
	xor alpha14(B[13], op20, A[19]);
	xor alpha15(B[14], op21, A[20]);
	xor alpha16(B[15], op22, A[21]);
   // Output cable completely specified 
	
endmodule
