`timescale 1ns / 1ps


module mbs_tb;
	
	// Entradas
  	reg clock;
  	reg start;
  	reg [7:0] multiplicando;
  	reg [7:0] multiplicador;
	

	// Saidas
  	wire [15:0] produto;
  	wire finish;

	// Instanciando teste de unidade (UUT)
	mbs uut (
		.produto(produto), 
		.multiplicando(multiplicando), 
		.multiplicador(multiplicador), 
		.clock(clock), 
		.start(start)
	);

   
	initial
	begin
	forever 
		#50 clock= ~clock;
	end
	
	initial begin
      
      $dumpfile("dump.vcd"); $dumpvars;
      $display("dump carregado");
		// Inicializando entradas
		multiplicando = 0;
		multiplicador = 0;
		clock = 0;
		start = 0;

		#100;
        
		// Setando valores do test
      	multiplicando = 'd42;
		multiplicador = 'd13;
		start = 0;
		#200
		start = 1;
		#800 //tempo necessario para fazer o maximo de iterações no case
      	
      	// Exibe resultado da multiplicação
      	$display("%d x %d = %d",multiplicando, multiplicador, produto);
        $finish;
	end
      
endmodule