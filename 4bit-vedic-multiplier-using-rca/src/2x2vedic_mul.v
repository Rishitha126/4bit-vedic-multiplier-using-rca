module vedic_2x2( 
    input [1:0] a, 
    input [1:0] b, 
    output [3:0] s 
); 
    wire w1, w2, w3; 
    // Partial product generation 
    assign s[0] = a[0] & b[0]; 
    assign w1   = a[1] & b[0]; 
    assign w2   = a[0] & b[1]; 
    assign w3   = a[1] & b[1]; 
    // First Half Adder 
    wire ha1_sum, ha1_carry; 
    assign ha1_sum   = w1 ^ w2; 
    assign ha1_carry = w1 & w2; 
    assign s[1] = ha1_sum; 
    // Second Half Adder 
    wire ha2_sum, ha2_carry; 
    assign ha2_sum   = w3 ^ ha1_carry; 
    assign ha2_carry = w3 & ha1_carry; 
    assign s[2] = ha2_sum; 
    assign s[3] = ha2_carry; 
endmodule