class Duck {
  PVector TargetLoc = new PVector (110, height*.57);
  PVector  TargetVel = new PVector (2, 0);
  int Target = 80;
  PImage duck;

  Duck() {
    duck = loadImage("Duck.png");
  }

  void displayTarget() {
    image(duck, TargetLoc.x, TargetLoc.y, Target, Target);
  }

  void moveTarget() {
    TargetLoc.add(TargetVel);
  }
}

