class Timer{//timer class for games

  int startgame;

  Timer(){
  startgame = millis() + 190000; 
  }
  
  void display(){//displays timer
  text((startgame - millis())/1000, 100, 100);
  }
}
