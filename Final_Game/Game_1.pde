class ShootingGallery {
  PVector TargetLoc;
  PVector TargetVel;
  int Target;
  PImage = duck;
  PImage = notduck;
  PVector = ShooterLoc;
  PImage = shooter;
  PVector = BulletLoc;
  PVector = BulletVel;
  PImage = bullet;

  ShootingGallery() {
    TargetLoc = new PVector (0, height*.25);
    TargetVel = new PVector (3, 0);
    Target = 50;
    loadImage = 
    loadImage =
    ShooterLoc = new PVector (width/2, height - 100);
    loadImage =
    Shooter = 100
    BulletLoc = new PVector (width/2. height -100);
    BulletVel = new PVector (0, 3);
    loadImage =
  }

  void displayTarget() {
    image(duck, TargetLoc.x, Targetloc.y, Target, Target);
    image(notduck, TargetLoc.x, TargetLoc.y, Target, Target);
  }

  void moveTarget() {
    if (ShootingGallery == true) {
      TargetLoc.add(TargetVel);
      if (TargetLoc.x > width-Target || TargetLoc.x <0) {
        TargetLoc.mult(100);
        TargetVel.set(0, 0);
      }
    }
  }

  void displayShooter () {
    image(shooter, ShooterLoc.x, ShooterLoc.y, Shooter, Shooter);
  }

  void displayBullet () {
    if mousePressed {
      image(bullet, BulletLoc.x, BulletLoc.y, Bullet, Bullet);
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

