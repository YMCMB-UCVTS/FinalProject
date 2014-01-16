class ShootingGallery {
  PImage waves;
  PVector WavesLoc;
  int WavesW;
  int WavesH;
  PVector ShooterLoc;
  PImage shooter;
  int Shooter;
  PVector BulletLoc;
  PVector BulletVel;
  int Bullet;
  boolean go = false;

  ShootingGallery() {
    ShooterLoc = new PVector (width/2, height - 50);
    shooter = loadImage("Shooter.png");
    waves = loadImage("Waves.png");
    WavesLoc = new PVector (width/2, height/2);
    WavesW = 390;
    WavesH = 50;
    Shooter = 100;
    BulletLoc = new PVector (width/2, height -100);
    BulletVel = new PVector (0, -20);
    Bullet = 20;
  }

  void displayWaves() {
    imageMode(CENTER);
    image(waves, WavesLoc.x, WavesLoc.y+60, WavesW, WavesH);
    image(waves, WavesLoc.x, WavesLoc.y+200, WavesW, WavesH);
  }

  void displayShooter () {
    image(shooter, ShooterLoc.x, ShooterLoc.y, Shooter, Shooter);
  }

  void displayBullet() {
    if (go) {
      fill(150);
      ellipse(BulletLoc.x, BulletLoc.y, Bullet, Bullet);
      BulletLoc.add(BulletVel);
    }
  }

  void moveBullet() {
    if (mousePressed) {
      go=true;
    }
  }
    void mouseReleased() {
      go=false;
      if(go==false){
       BulletVel.set(0,0);
      }
    }

    void OutOfBounds() {
      if (BulletLoc.y<0) {
        BulletLoc.set(width/2, height -100);
      }
    }
  }

