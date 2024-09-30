module tb_Hamming_decoder;
    reg[16:1] input_message;    // Input to the encoder module
    wire[21:1] encoded_message; // Output from the encoder module, the encoded bit stream
    wire[16:1] decoded_message; // Output from the decoder module, the decoded bit stream
    reg[21:1] enc_message;      // Bit Stream formed after inserting the error by flipping one bit of encoded message
    reg[21:1] enc_message_2;    // Reverse of enc_message that goes as input to decoder
    
    reg[1:21] error = 21'b000000000000000000001;
    wire var1, var2, var3, var4, var5, op1, op2, op3, op4, op5, op6, op7, op8, op9, op10, op11, op12, op13, op14, op15, op16, op17, op18, op19, op20, op21, op22;
    encoder enc_mod(input_message, encoded_message);
        
    
    Hamming_decoder dec_mod(enc_message_2, decoded_message, var1, var2, var3, var4, var5, op1, op2, op3, op4, op5, op6, op7, op8, op9, op10, op11, op12, op13, op14, op15, op16, op17, op18, op19, op20, op21, op22);
    always begin
        #20 input_message = 16'b1100101000111011;   // Initialising the input message ==Change this for different Messages==
        #20 assign enc_message = encoded_message ^ error;   // Error Introduction
        // Reversing enc_message and saving it in enc_message_2
        enc_message_2[1]=enc_message[21];
        enc_message_2[2]=enc_message[20];
        enc_message_2[3]=enc_message[19];
        enc_message_2[4]=enc_message[18];
        enc_message_2[5]=enc_message[17];
        enc_message_2[6]=enc_message[16];
        enc_message_2[7]=enc_message[15];
        enc_message_2[8]=enc_message[14];
        enc_message_2[9]=enc_message[13];
        enc_message_2[10]=enc_message[12];
        enc_message_2[11]=enc_message[11];
        enc_message_2[12]=enc_message[10];
        enc_message_2[13]=enc_message[9];
        enc_message_2[14]=enc_message[8];
        enc_message_2[15]=enc_message[7];
        enc_message_2[16]=enc_message[6];
        enc_message_2[17]=enc_message[5];
        enc_message_2[18]=enc_message[4];
        enc_message_2[19]=enc_message[3];
        enc_message_2[20]=enc_message[2];
        enc_message_2[21]=enc_message[1];
        //reversing completed
        #10 error = error<<1;
    end
	 
	 initial #1200 $finish;
endmodule
