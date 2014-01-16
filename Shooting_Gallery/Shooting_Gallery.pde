ShootingGallery g1;

PImage ShooterBackground;

void setup() {
  size(550, 500);
  g1 = new ShootingGallery();
  ShooterBackground = loadImage("ShooterBackground.png");
}

void draw() {
  background(ShooterBackground);
  g1.displayTarget();
  g1.moveTarget();
  g1.displayWaves();
  g1.displayShooter();
  g1.displayBullet();
  g1.CheckContact();
  g1.moveBullet();
  g1.Cycle();
}

