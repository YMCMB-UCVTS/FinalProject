class Duck {
  PVector TargetLoc;
  PVector  TargetVel;
  int Target ;
  PImage duck;

  Duck() {
    TargetLoc = new PVector (110, height*.57);
    TargetVel = new PVector (2, 0);
    Target = 80;
    duck = loadImage("Duck.png");
  }

  void displayTarget() {
    image(duck, TargetLoc.x, TargetLoc.y, Target, Target);
  }

  void moveTarget() {
    TargetLoc.add(TargetVel);
    if (score>=5) {
      TargetVel = new PVector(3.8, 0);
    }
  }

  boolean checkBullet(Bullet b) {
    if (TargetLoc.dist(b.BulletLoc) < Target/8 + b.Bullet/2) {
      return true;
    }
    else {
      return false;
    }
  }
}

