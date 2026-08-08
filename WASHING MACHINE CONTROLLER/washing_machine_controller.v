module washing_machine_controller (
    input  clk,
    input  reset,
    input  start,

    output reg wash,
    output reg rinse,
    output reg spin,
    output reg done
);

    // State definitions
    parameter IDLE  = 3'b000;
    parameter WASH  = 3'b001;
    parameter RINSE = 3'b010;
    parameter SPIN  = 3'b011;
    parameter DONE  = 3'b100;

    reg [2:0] state;
    reg [2:0] next_state;

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Next-state logic
    always @(*) begin

        case (state)

            IDLE: begin
                if (start)
                    next_state = WASH;
                else
                    next_state = IDLE;
            end

            WASH: begin
                next_state = RINSE;
            end

            RINSE: begin
                next_state = SPIN;
            end

            SPIN: begin
                next_state = DONE;
            end

            DONE: begin
                next_state = IDLE;
            end

            default: begin
                next_state = IDLE;
            end

        endcase

    end

    // Output logic
    always @(*) begin

        // Default outputs
        wash  = 1'b0;
        rinse = 1'b0;
        spin  = 1'b0;
        done  = 1'b0;

        case (state)

            IDLE: begin
                wash  = 1'b0;
                rinse = 1'b0;
                spin  = 1'b0;
                done  = 1'b0;
            end

            WASH: begin
                wash = 1'b1;
            end

            RINSE: begin
                rinse = 1'b1;
            end

            SPIN: begin
                spin = 1'b1;
            end

            DONE: begin
                done = 1'b1;
            end

            default: begin
                wash  = 1'b0;
                rinse = 1'b0;
                spin  = 1'b0;
                done  = 1'b0;
            end

        endcase

    end

endmodule