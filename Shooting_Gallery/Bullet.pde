class Bullet {

  PVector BulletLoc;
  PVector BulletVel;
  int Bullet;

  Bullet() {
    BulletLoc = new PVector (width/2, height -100);  
    BulletVel = new PVector (0, -10);
    Bullet = 20;
  }

  void displayBullet() {
    fill(150);
    ellipse(BulletLoc.x, BulletLoc.y, Bullet, Bullet);
    BulletLoc.add(BulletVel);
  }
}

