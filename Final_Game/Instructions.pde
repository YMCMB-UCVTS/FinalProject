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
    text("Pong Game : \n 2-player game. \n Player 1 controls left paddle with W and S. \n Player 2 controls right with I and K. \n Press Space to begin point. First to 7 wins. Good luck!", loc.x, loc.y + 230);
    text("Soccer Game : \n Press the Spacebar to shoot. \n Dont let the goalie catch the ball 3 times or it's game over.\n If you get 10 you move on to the next level. Score 20 and you win! \n Good luck!", loc.x, loc.y + 350);
  }

  void returntomainmenubutton() {
    rect(locmenuB.x, locmenuB.y, menuBW, menuBH);
  }
}

