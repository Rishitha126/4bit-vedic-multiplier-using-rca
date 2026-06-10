module vedic4_tb; 
    // Inputs 
    reg [3:0] a; 
    reg [3:0] b; 
    // Output 
    wire [7:0] s; 
    // Variables for testing 
    integer i, j; 
    integer error_count = 0; 
    // Instantiate the Unit Under Test (UUT) 
    vedic4 uut ( 
        .a(a), 
        .b(b), 
        .s(s) 
    ); 
    initial begin 
        // Initialize inputs 
        a = 0; 
        b = 0; 
        $display("Starting Exhaustive Test for 4x4 Vedic Multiplier..."); 
        $display("--------------------------------------------------"); 
        // Test all possible input combinations (0 to 15) 
        for (i = 0; i < 16; i = i + 1) begin 
            for (j = 0; j < 16; j = j + 1) begin    
                a = i; 
                b = j; 
                #10; // Wait for output to stabilize 
                // Self-checking condition 
                if (s !== (i * j)) begin 
                    $display("ERROR: %d * %d = %d (Expected %d)", i, j, s, i*j); 
                    error_count = error_count + 1; 
                end 
            end 
        end 
        // Final result display 
        if (error_count == 0) begin 
            $display("SUCCESS: All 256 combinations passed!"); 
        end else begin 
            $display("FAILURE: %d errors found.", error_count); 
        end 
        $finish; // End simulation 
    end 
endmodule