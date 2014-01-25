class Timer{

  int startgame;

  Timer(){
  startgame = millis() + 1800000; 
  }
  
  void display(){
  text((startgame - millis())/1000, width - 100, 100);
  }
}
