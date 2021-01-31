`timescale 1 ps/ 1 ps
module counter_vlg_tst();

// test vector input registers
reg clk;
reg enable;
reg reset;
wire PS2_CLK;
wire PS2_DAT;
// wires                                               
wire [2:0]  LEDR;
wire [6:0] HEX0;
wire [6:0] HEX1;
wire [6:0] HEX2;
wire [6:0] HEX3;

// assign statements (if any)       
 ps2 U1(.iSTART(enable),  //press the button for transmitting instrucions to device;
           .iRST_n(reset),  //global reset signal;
           .iCLK_50(clk),  //clock source;
           .PS2_CLK(PS2_CLK), //ps2_clock signal inout;
           .PS2_DAT(PS2_DAT), //ps2_data  signal inout;
           .oLEFBUT(LEDR[0]),  //left button press display;
           .oRIGBUT(LEDR[1]),  //right button press display;
           .oMIDBUT(LEDR[2]),  //middle button press display;
           .oX_MOV1(HEX0),  //lower SEG of mouse displacement display for X axis.
           .oX_MOV2(HEX1),  //higher SEG of mouse displacement display for X axis.
           .oY_MOV1(HEX2),  //lower SEG of mouse displacement display for Y axis.
           .oY_MOV2(HEX3));
                   


initial                                                
begin                                                  
  clk = 0;
  enable = 0;
  reset = 0;    
  PS2_CLK = 0;
  PS2_DAT = 0;
  $display("Running testbench");                       
end                                                    

always 
  #5  clk =  ! clk;                                                    
 
endmodule

event reset_trigger; //объявление событий
event reset_done_trigger; 

//блок формирования Reset
initial begin 
 forever begin //бесконечный цикл 
  @ (reset_trigger); //ждем события reset_trigger
  @ (negedge clk); //ждем negedge clk
  reset = 1;    //сброс
  @ (negedge clk); 
  reset = 0; 
  -> reset_done_trigger; //сигналим что reset выполнен
  end 
end

//Ход симуляции
initial  
  begin: TEST_CASE 
  //#10  -> reset_trigger;  //делаем ресет с задержкой 10
  //@ (reset_done_trigger); //ждем сигнал reset_done_trigger
  @ (negedge clk);      
        enable = 1; //разрешаем счет 
  repeat (10) begin  //цикл на 10 повторений
    @ (negedge clk); //ждем negedge clk
  end 
  enable = 0; //запрещаем счет
end

endmodule