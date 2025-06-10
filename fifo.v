module fifo(
    input wire clk,
    input wire rstn,
    input wire wr_en,
    input wire rd_en,
    input wire [7:0] data_in,
    output reg [7:0] data_out,
    output full,
    output empty
);

reg [7:0] fila_fifo [0:3]; 

reg [1:0] wr_pointer; 
reg [1:0] rd_pointer; 


assign full  = (((wr_pointer + 1) == rd_pointer) || (wr_pointer == 3 && rd_pointer == 0));
assign empty = (wr_pointer == rd_pointer);

always @(posedge clk, negedge rstn) begin
    if(~rstn)begin
        wr_pointer <= 0;
    end
    else begin
        if (~full && wr_en) begin
            fila_fifo[wr_pointer] <= data_in;

            wr_pointer <= wr_pointer + 1;
        end
    end
end

always @(posedge clk, negedge rstn) begin
    if(~rstn)begin
        rd_pointer <= 0;
    end
    else begin
        if (~empty && rd_en) begin
            data_out <= fila_fifo[rd_pointer];

            rd_pointer <= rd_pointer + 1;
        end
    end
end

endmodule

