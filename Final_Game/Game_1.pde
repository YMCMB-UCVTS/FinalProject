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
  boolean go = false;

  ShootingGallery() {
    TargetLoc = new PVector (0, height*.50);
    TargetVel = new PVector (3, 0);
    Target = 50;
    duck = loadImage("Duck.png");
    notduck = loadImage("NotDuck.png");
    ShooterLoc = new PVector (width/2, height - 50);
    shooter = loadImage("Shooter.png");
    Shooter = 100;
    BulletLoc = new PVector (width/2, height -100);
    BulletVel = new PVector (0, -20);
    Bullet = 20;
  }

  void displayTarget() {
    image(duck, TargetLoc.x - 150, TargetLoc.y, Target, Target);
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

  void displayBullet() {
    if (go) {
      fill(150);
      ellipse(BulletLoc.x, BulletLoc.y, Bullet, Bullet);
    }
  }

  void moveBullet() {
    if (go){
      BulletLoc.add(BulletVel);
    }
  }

  void CheckContact() {
    if (BulletLoc.dist(TargetLoc) < Bullet/2 + Target/2) {
      BulletVel.set(0, 0);
      BulletLoc.y = height*-2;
      TargetLoc.y = height*-2;
    }
  }
}

