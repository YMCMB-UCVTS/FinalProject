class ShootingGallery {
  PVector TargetLoc;
  PVector TargetVel;
  int Target;
  PImage duck;
  PImage notduck;
  PVector ShooterLoc;
  PImage shooter;
  int Shooter;
  PVector BulletLoc;
  PVector BulletVel;
  int Bullet;

  ShootingGallery() {
    TargetLoc = new PVector (0, height*.25);
    TargetVel = new PVector (3, 0);
    Target = 50;
    duck = loadImage("Duck.png");
    notduck = loadImage("NotDuck.png");
    ShooterLoc = new PVector (width/2, height - 100);
    shooter = loadImage("Shooter.png");
    Shooter = 100;
    BulletLoc = new PVector (width/2, height -100);
    BulletVel = new PVector (0, 3);
    Bullet = 40;
  }

  void displayTarget() {
    image(duck, TargetLoc.x, TargetLoc.y +150, Target, Target);
    image(notduck, TargetLoc.x, TargetLoc.y, Target, Target);
  }

  void moveTarget() {
    TargetLoc.add(TargetVel);
    if (TargetLoc.x > width-Target || TargetLoc.x <0) {
      TargetLoc.mult(100);
      TargetVel.set(0, 0);
    }
  }

  void displayShooter () {
    image(shooter, ShooterLoc.x, ShooterLoc.y, Shooter, Shooter);
  }

  void displayBullet () {
    if (mousePressed) {
      fill(150);
      ellipse(BulletLoc.x, BulletLoc.y, Bullet + 80, Bullet);
    }
  }

  void moveBullet () {
    if (mousePressed) {
      BulletLoc.add(BulletVel);
    }
  }

  void CheckContact () {
  }
}

