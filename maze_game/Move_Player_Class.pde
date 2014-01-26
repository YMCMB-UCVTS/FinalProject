class Elephant {
  PImage Elephant;
  int ElephantS;
  PVector ElephantLoc;
  PVector ElephantVel;
  PVector ElephantAcc;

  Elephant(int x, int y) {
    Elephant = loadImage ("Object.png");
    ElephantS = 30;
    ElephantLoc = new PVector(x, y);
    ElephantVel = new PVector(0, 0);
    ElephantAcc = new PVector(0, 0);
  }

  void display() {
    imageMode(CENTER);
    image(Elephant, ElephantLoc.x, ElephantLoc.y, ElephantS, ElephantS);
  }

  void move() {
    ElephantLoc.add(ElephantVel);
    if (keyPressed && key == CODED) {
      if (keyCode == LEFT) {
        ElephantVel = new PVector(-1, 0);
      }
      if (keyCode == UP) {
        ElephantVel = new PVector(0, -1);
      }
      if (keyCode == RIGHT) {
        ElephantVel = new PVector(1, 0);
      }
      if (keyCode == DOWN) {
        ElephantVel = new PVector(0, 1);
      }
    }
  }

  void checkElephant() {
    if (get(int(ElephantLoc.x), int(ElephantLoc.y + (ElephantS/2))) == color(84, 160, 141) || get(int(ElephantLoc.x), int(ElephantLoc.y- (ElephantS/2))) == color(84, 160, 141) || get(int(ElephantLoc.x+ (ElephantS/2)), int(ElephantLoc.y)) == color(84, 160, 141) || get(int(ElephantLoc.x - (ElephantS/2)), int(ElephantLoc.y)) == color(84, 160, 141)) {                                           //getting to the teal box increases the value of x
      level++;
    }
    if (get(int(ElephantLoc.x), int(ElephantLoc.y + (ElephantS/2))) == color(128, 128, 255) || get(int(ElephantLoc.x), int(ElephantLoc.y- (ElephantS/2))) == color(128, 128, 255) || get(int(ElephantLoc.x+ (ElephantS/2)), int(ElephantLoc.y)) == color(128, 128, 255) || get(int(ElephantLoc.x - (ElephantS/2)), int(ElephantLoc.y)) == color(128, 128, 255)) {                                              //getting to the lavender box increases the value of x
      level++;
    }
    if (get(int(ElephantLoc.x), int(ElephantLoc.y + (ElephantS/2))) == color(0) || get(int(ElephantLoc.x), int(ElephantLoc.y- (ElephantS/2))) == color(0) || get(int(ElephantLoc.x+ (ElephantS/2)), int(ElephantLoc.y)) == color(0) || get(int(ElephantLoc.x - (ElephantS/2)), int(ElephantLoc.y)) == color(0)) {
      winScreen = true;                                                                             //when you get to black box, winScreen equals true
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
