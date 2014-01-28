class Instructions {//class for instructions

    PVector loc;

  Instructions() {
    loc = new PVector(width/2, 0);
  }

  void display() {//displays the instructions (text) on how to play each game)
    background(0);
    fill(255);
    textAlign(CENTER);
    textSize(24);
    text("INTRUCTIONS:", loc.x, loc.y + 35);
    textSize(14);
    fill(255, 0, 0);
    text("Shooter Gallery : \n Shoot the Ducks! You have three minutes!\n Yellow = +1 point; Grey = -5 seconds \n The shooter takes 3 seconds to reload\n Good Luck!", loc.x, loc.y + 60); 
    fill(0, 100, 255);
    text("Maze Craze : \n Use your arrow keys get through the maze. \n Be careful, if your icon touches the walls of the maze, it’s game over.\n Make your way through each of the three levels, and you’ll be the winner! \n You have three minutes! ", loc.x, loc.y + 170);
    fill(255);
    text("Pong Game : \n 2-player game. \n Player 1 controls left paddle with W and S. \n Player 2 controls right with I and K. \n Press Space to begin point. First to 7 wins. Good luck!", loc.x, loc.y + 285);
    fill(0, 255, 0);
    text("Soccer Shootout : \n Press the Spacebar to shoot. \n Dont let the goalie catch the ball 3 times or it's game over.\n If you get 10 you move on to the next level. Score 20 and you win! \n Good luck!", loc.x, loc.y + 400);
  }

  void returntomainmenubutton() {//this is the function that displays the button to return back to the main menu
    fill(255);
    rect(locmenuB.x, locmenuB.y, menuBW, menuBH);
    textAlign(CENTER);
    fill(0);
    text("Return to \n Main Menu", locmenuB.x+menuBW/2, locmenuB.y+menuBH/2.6);
  }
}

