module vedic4( 
    input  [3:0] a, 
    input  [3:0] b, 
    output [7:0] s 
); 
    wire [3:0] m0, m1, m2, m3; 
    wire [3:0] add1_out, add2_out, add3_out; 
    wire c1, c2, c3; 
    // 2×2 Vedic Multiplier Blocks 
    vedic_2x2 MUL0 (a[1:0], b[1:0], m0); // Lower × Lower 
    vedic_2x2 MUL1 (a[3:2], b[1:0], m1); // Upper × Lower 
    vedic_2x2 MUL2 (a[1:0], b[3:2], m2); // Lower × Upper 
    vedic_2x2 MUL3 (a[3:2], b[3:2], m3); // Upper × Upper 
    // Stage 1 Addition 
    rca_4bit ADDER1 ( 
        .a(m1), 
        .b({2'b00, m0[3:2]}), 
        .cin(1'b0), 
        .sum(add1_out), 
        .cout(c1) 
    ); 
    // Stage 2 Addition 
    rca_4bit ADDER2 ( 
        .a(add1_out), 
        .b(m2), 
        .cin(1'b0), 
        .sum(add2_out), 
        .cout(c2) 
    ); 
    // Stage 3 Addition 
    rca_4bit ADDER3 ( 
        .a(m3), 
        .b({(c1 | c2), add2_out[3:2]}), 
        .cin(1'b0), 
        .sum(add3_out), 
        .cout(c3) 
    ); 
    // Final Output Assignment 
    assign s[0] = m0[0]; 
    assign s[1] = m0[1]; 
    assign s[2] = add2_out[0]; 
    assign s[3] = add2_out[1]; 
    assign s[4] = add3_out[0]; 
    assign s[5] = add3_out[1]; 
    assign s[6] = add3_out[2]; 
    assign s[7] = add3_out[3]; 
endmodule