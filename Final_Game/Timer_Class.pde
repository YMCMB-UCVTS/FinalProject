class Timer{

  int startgame;

  Timer(){
  startgame = millis() + 1810000; 
  }
  
  void display(){
  text((startgame - millis())/1000, 100, 100);
  }
}
