module clock_d #(tp=10); //tp is time period
	
	int duty;  //duty cycle
  	bit clk;
	int ton;   //on period of clk
	int toff;  //off period of clk

  	always
      begin       
        duty = $urandom_range(10,80); //randomize duty in range 10 to 80
        
        ton = (duty*tp)/100;          //ton calculated from duty cycle
        toff = (tp-ton);              //toff calculated
        
        $display("duty = %0d",duty);
        $display("ton = %0d",ton);
        $display("toff = %0d",toff);
        
        #ton; clk = 1'b0;
        #toff; clk = 1'b1;
      end
endmodule

 
module cloc;		
    
  clock_d #(.tp(10)) cd();           //parameter time period can be changed
	initial
      begin
        $dumpfile("dump.vcd");
    	$dumpvars();
        #200; $finish();
      end

endmodule
