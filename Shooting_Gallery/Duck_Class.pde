class Duck {

  PImage duck;
  PImage notduck;

  Duck() {
    duck = loadImage("Duck.png");
    notduck = loadImage("NotDuck.png");
  }

  void displayTarget() {
    image(duck, TargetLoc.x+Target+20, TargetLoc.y, Target, Target);
    image(notduck, TargetLoc.x, TargetLoc.y, Target, Target);
  }
  
    void moveTarget() {
    TargetLoc.add(TargetVel);
    if (TargetLoc.x > width-Target || TargetLoc.x <0) {
      TargetLoc.mult(100);
      TargetVel.set(0, 0);
    }
  }

  void Cycle() {
    if ( TargetLoc.x >= 160) {
      image(duck, TargetLoc.x, TargetLoc.y, Target, Target);
    }
    if (TargetLoc.x >= 340) {
      TargetLoc.set(1000, 1000);
    }
  }
}

