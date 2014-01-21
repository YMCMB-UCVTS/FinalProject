class Bullet {

  PVector BulletLoc;
  PVector BulletVel;
  int Bullet;
  boolean go;

  Bullet() {
    BulletLoc = new PVector (width/2, height -100);  
    BulletVel = new PVector (0, -10);
    Bullet = 20;
    go = false;
  }

  void displayBullet() {
    if (go) {
      fill(150);
      ellipse(BulletLoc.x, BulletLoc.y, Bullet, Bullet);
      BulletLoc.add(BulletVel);
    }
  }

  void moveBullet() {
    if (key =='w') {
      go = true;
    }
    if (mousePressed) {
      go=false;
      if (go==false) {
        BulletVel.set(0, 0);
      }
    }
  }

  void catchBullet(Duck moveTarget) {     
    if (BulletLoc.y < TargetLoc.y+80) {
      BulletVel.set(0, -10);
      BulletLoc.set(width/2, height -100);
    }
  }
}

