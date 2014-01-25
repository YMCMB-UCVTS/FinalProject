class Elephant {
  PVector ElephantLoc;
  PImage Elephant;
  int ElephantSize;

  Elephant() {
    ElephantLoc = new PVector(width/2, height/2);
    Elephant = loadImage ("for mouse.png");
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

