class Elephant {
  PImage Elephant;
  int ElephantSize;

  Elephant() {
    Elephant = loadImage ("Object.png");
    ElephantSize = 30;
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
}

