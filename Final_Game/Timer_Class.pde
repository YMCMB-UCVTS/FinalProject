class Timer{

  int startgame;

  Timer(){
  startgame = millis() + 190000; 
  }
  
  void display(){
  text((startgame - millis())/1000, 100, 100);
  }
}
