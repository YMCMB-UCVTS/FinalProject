class Elephant {
  PImage Elephant;
  int ElephantS;
  PVector ElephantLoc;
  PVector ElephantVel;
  PVector ElephantAcc; //declare variables for the elephant (mover)

  Elephant(int x, int y) {
    Elephant = loadImage ("Object.png");
    ElephantS = 20;
    ElephantLoc = new PVector(x, y);
    ElephantVel = new PVector(0, 0);
    ElephantAcc = new PVector(0, 0); //intialize the values for the variables
  }

  void display() {
    imageMode(CENTER);
    image(Elephant, ElephantLoc.x, ElephantLoc.y, ElephantS, ElephantS);//the image (elephant is displayed)
  }

  void move() { //this function allows for the elephant (mover) to be moved
    ElephantVel.add(ElephantAcc); // velocity is added to acceleration
    ElephantLoc.add(ElephantVel); // location is added to velocity
    if (keyPressed && key == CODED) { //this allows for the elephant's (mover's) movements to be controlled by the arrow keys
      if (keyCode == LEFT) {
        ElephantAcc = new PVector(-.01, 0);
        ElephantVel.y = 0;
      }
      if (keyCode == UP) {
        ElephantAcc = new PVector(0, -.01);
        ElephantVel.x = 0;
      }
      if (keyCode == RIGHT) {
        ElephantAcc = new PVector(.01, 0);
        ElephantVel.y = 0;
      }
      if (keyCode == DOWN) {
        ElephantAcc = new PVector(0, .01);
        ElephantVel.x = 0;
      }
    }
  }

  void checkElephant() { // this function allows foe the game to be won or lost. if the elephant touches the maze, you lose. if the elephant touches the boxes made, you advance to the next level OR if it is the final one, the game is won.
    if (get(int(ElephantLoc.x), int(ElephantLoc.y + (ElephantS/2))) == color(84, 160, 141) || get(int(ElephantLoc.x), int(ElephantLoc.y- (ElephantS/2))) == color(84, 160, 141) || get(int(ElephantLoc.x+ (ElephantS/2)), int(ElephantLoc.y)) == color(84, 160, 141) || get(int(ElephantLoc.x - (ElephantS/2)), int(ElephantLoc.y)) == color(84, 160, 141)) {                                           //getting to the teal box increases the value of x
      level++;
    }
    if (get(int(ElephantLoc.x), int(ElephantLoc.y + (ElephantS/2))) == color(128, 128, 255) || get(int(ElephantLoc.x), int(ElephantLoc.y- (ElephantS/2))) == color(128, 128, 255) || get(int(ElephantLoc.x+ (ElephantS/2)), int(ElephantLoc.y)) == color(128, 128, 255) || get(int(ElephantLoc.x - (ElephantS/2)), int(ElephantLoc.y)) == color(128, 128, 255)) {                                              //getting to the lavender box increases the value of x
      level++;
    }
    if (get(int(ElephantLoc.x), int(ElephantLoc.y + (ElephantS/2))) == color(0) || get(int(ElephantLoc.x), int(ElephantLoc.y- (ElephantS/2))) == color(0) || get(int(ElephantLoc.x+ (ElephantS/2)), int(ElephantLoc.y)) == color(0) || get(int(ElephantLoc.x - (ElephantS/2)), int(ElephantLoc.y)) == color(0)) {
      winScreen = true;      //when you get to black box, winScreen equals true
  }
    if (get(int(ElephantLoc.x), int(ElephantLoc.y + (ElephantS/2))) == color(212, 153, 9) || get(int(ElephantLoc.x), int(ElephantLoc.y- (ElephantS/2))) == color(212, 153, 9) || get(int(ElephantLoc.x+ (ElephantS/2)), int(ElephantLoc.y)) == color(212, 153, 9) || get(int(ElephantLoc.x - (ElephantS/2)), int(ElephantLoc.y)) == color(212, 153, 9)) {                                                     //when you touch the walls of the third maze, game over
      endScreen = true;
    }
    if (get(int(ElephantLoc.x), int(ElephantLoc.y + (ElephantS/2))) == color(46, 108, 164) || get(int(ElephantLoc.x), int(ElephantLoc.y- (ElephantS/2))) == color(46, 108, 164) || get(int(ElephantLoc.x+ (ElephantS/2)), int(ElephantLoc.y)) == color(46, 108, 164) || get(int(ElephantLoc.x - (ElephantS/2)), int(ElephantLoc.y)) == color(46, 108, 164)) {                                                        //when you hit maze walls in level 2 (blue)
      endScreen = true;                                                                                          //...game over
    }
    if (get(int(ElephantLoc.x), int(ElephantLoc.y + (ElephantS/2))) == color(133, 161, 84) || get(int(ElephantLoc.x), int(ElephantLoc.y- (ElephantS/2))) == color(133, 161, 84) || get(int(ElephantLoc.x+ (ElephantS/2)), int(ElephantLoc.y)) == color(133, 161, 84) || get(int(ElephantLoc.x - (ElephantS/2)), int(ElephantLoc.y)) == color(133, 161, 84)) {                                               //when you hit maze levels in level 1 (green)
      endScreen = true;                                                                            //game over screen
    }
  }
}

