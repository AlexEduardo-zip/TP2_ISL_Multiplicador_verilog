`timescale 1ns / 1ps

module mbs(
  clock,
  start,
  multiplicando, 
  multiplicador, 
  produto, 
	);

// Saidas
  	output[15:0] produto;

// Entradas
	input start;
	input clock;
  input [7:0] multiplicando;
  input [7:0] multiplicador;

// Registradores de referencia
  	reg [15:0] produto_reg;
  	reg [15:0] multiplicando_reg;
  	reg [15:0] multiplicador_reg;

assign produto = produto_reg;

integer i, j;  

always @(posedge clock)
begin
	begin
		case(start)
			1'b0: begin
              //
              	produto_reg = 0;
				multiplicando_reg = 0;
				multiplicador_reg = 0; 
              //
				multiplicando_reg = multiplicando;
				multiplicador_reg = multiplicador;
				produto_reg = 0; 
			end
			
			1'b1: begin
				if(multiplicador_reg[0]==1)
				begin
					produto_reg = produto_reg + multiplicando_reg;
				end
				multiplicando_reg = multiplicando_reg<<1;
				multiplicador_reg = multiplicador_reg>>1;				
			end
		endcase
	end
end
  
endmodule