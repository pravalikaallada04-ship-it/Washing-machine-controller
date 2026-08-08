`timescale 1ns/1ps

module washing_machine_controller_tb;

    reg clk;
    reg reset;
    reg start;

    wire wash;
    wire rinse;
    wire spin;
    wire done;

    // Instantiate the design
    washing_machine_controller uut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .wash(wash),
        .rinse(rinse),
        .spin(spin),
        .done(done)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin

        $display("---------------------------------------------");
        $display(" Washing Machine Controller Simulation");
        $display("---------------------------------------------");
        $display("Time | Reset Start | Wash Rinse Spin Done");
        $display("---------------------------------------------");

        // Reset
        reset = 1;
        start = 0;

        #10;

        // Release reset
        reset = 0;

        // Start washing machine
        start = 1;

        #10;

        // Remove start signal
        start = 0;

        #10;
        #10;
        #10;
        #10;

        $display("---------------------------------------------");
        $display("Simulation Completed Successfully.");
        $display("---------------------------------------------");

        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("%4t |   %b     %b   |   %b     %b     %b    %b",
                 $time, reset, start, wash, rinse, spin, done);
    end

endmodule