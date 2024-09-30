* Design Hamming code Logic
  
  1. Hamming Encoder Module
     
  - input : 16bit data (A[16:1])
  - output : 21bit encoded data (B[1:21])
  - Calculate 5 parity bits using Hamming code for the input 16-bit data, and output the encoded data with a total of 
    21 bits, including the parity bits. The positions of the parity bits are the 1st, 2nd, 4th, 8th, and 16th bits

  2. Hamming Decoder Module

  - input : 21bit encoded data (A[21:1])
  - output : restored 16bit data (B[15:0])
  - Inspect the parity of the input 21-bit data to find the location of any errors, and, if necessary, correct the 
    corresponding bit to restore the original 16-bit data.


![image](https://github.com/user-attachments/assets/46351e63-337e-4d30-84a9-502c3c408072)
![image](https://github.com/user-attachments/assets/2c1252e5-b954-43b6-b64e-1dfea0b85e20)
