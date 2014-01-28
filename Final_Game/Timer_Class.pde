class Timer{//timer class for games

  int startgame; //declare variable

  Timer(){
  startgame = millis() + 190000; //start game with three minutes
  }
  
  void display(){//displays timer
  text((startgame - millis())/1000, 100, 100); //text counting down time left in game
  }
}
