`timescale 1ns /100ps
 
module gray_tb;
 
reg clk, nreset, wr;
reg [SIZE-1:0]d;
wire [SIZE-1:0]q;
 
parameter SIZE = 4;
 
//устанавливаем экземпляр тестируемого модуля
gray_cnt gray_cnt_inst(clk, nreset, wr, d, q);
 
//моделируем сигнал тактовой частоты
always
  #10 clk = ~clk;
 
//от начала времени...
 
initial
begin
  clk = 0;
  nreset = 0;
  d = 4'h0;
  wr = 1'b1;
 
//через временной интервал "50" подаем сигнал сброса
  #50 nreset = 0; 
 
//еще через время "4" снимаем сигнал сброса
 
  #4 nreset = 1;
 
//пауза длительностью "50"
  #50; 
 
//ждем фронта тактовой частоты и сразу после нее подаем сигнал записи
  @(posedge clk) 
  #0
    begin
      d = 4'h5;
      wr = 1'b0;
    end
 
//по следующему фронту снимаем сигнал записи
  @(posedge clk)
  #0
    begin
      d = 4'h0;
      wr = 1'b1;
    end
end 
 
//заканчиваем симуляцию в момент времени "400"
initial
begin
  #400 $finish;
end
 
//создаем файл VCD для последующего анализа сигналов
initial
begin
  $dumpfile("out.vcd");
  $dumpvars(0,gray_tb);
end
 
//наблюдаем на некоторыми сигналами системы
//initial 
//$monitor($stime,, clk,, nreset,, d,, wr,, q); 
 
endmodule