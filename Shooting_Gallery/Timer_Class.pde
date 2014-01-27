class Timer{ //creating a timer

  Timer(){ 
  startgame = millis() + 1800000; //start game with three minutes
  }
  
  void display(){ 
  text((startgame - millis())/1000, 100, 100); //text counting down time left in game
  }
}
