class Timer{

  Timer(){
  startgame = millis() + 1800000; 
  }
  
  void display(){
  text((startgame - millis())/1000, 100, 100);
  }
}
