class Elephant {
  PImage Elephant;
  int ElephantSize;
  PVector ElephantLoc;

  Elephant(int x, int y) {
    Elephant = loadImage ("Object.png");
    ElephantSize = 30;
    ElephantLoc = new PVector(x, y);
  }

  void display() {
    imageMode(CENTER);
    image(Elephant, ElephantLoc.x, ElephantLoc.y, ElephantSize, ElephantSize);
  }

  void move() {
    if (keyPressed && key == CODED) {
      if (keyCode == LEFT) {
        ElephantLoc.x--;
      }
      if (keyCode == UP) {
        ElephantLoc.y--;
      }
      if (keyCode == RIGHT) {
        ElephantLoc.x++;
      }
      if (keyCode == DOWN) {
        ElephantLoc.y++;
      }
    }
  }

  void checkElephant() {
    if (get (int(ElephantLoc.x), int(ElephantLoc.y)) == color (84, 160, 141)) {                                           //getting to the teal box increases the value of x
      level++;
    }
    if (get (int(ElephantLoc.x), int(ElephantLoc.y)) == color (128, 128, 255)) {                                               //getting to the lavender box increases the value of x
      level++;
    }
    if (get(int(ElephantLoc.x), int(ElephantLoc.y)) == color (0)) {
      winScreen = true;                                                                             //when you get to black box, winScreen equals true
    }
    if (get (int(ElephantLoc.x), int(ElephantLoc.y)) == color (212, 153, 9)) {                                                     //when you touch the walls of the third maze, game over
      endScreen = true;
    }
    if (get (int(ElephantLoc.x), int(ElephantLoc.y)) == color (46, 108, 164)) {                                                         //when you hit maze walls in level 2 (blue)
      endScreen = true;                                                                                          //...game over
    }
    if (get (int(ElephantLoc.x), int(ElephantLoc.y)) == color(133, 161, 84)) {                                               //when you hit maze levels in level 1 (green)
      endScreen = true;                                                                            //game over screen
    }
  }
}

