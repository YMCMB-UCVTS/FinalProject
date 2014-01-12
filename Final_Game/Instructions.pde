class Instructions {
  
  PVector loc;

  Instructions() {
    loc = new PVector(width/2, 0);
  }

  void display() {
    background(0);
    fill(255);
    textAlign(CENTER);
    textSize(24);
    text("INTRUCTIONS:", loc.x, loc.y + 70);
    textSize(14);
    text("Shooter Game : \n Here will be how to play the Shooter Game.", loc.x, loc.y + 100); 
    text("Maze Game : \n Here will be how to play the Maze Game.", loc.x, loc.y + 150);
    text("Pong Game : \n Here will be how to play the Pong Game.", loc.x, loc.y + 200);
    text("Soccer Game : \n Here will be how to play the Soccer Game.", loc.x, loc.y + 250);
  }
}

