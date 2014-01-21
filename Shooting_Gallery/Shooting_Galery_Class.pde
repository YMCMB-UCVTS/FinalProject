class ShootingGallery {
  PImage waves;
  PVector WavesLoc;
  int WavesW;
  int WavesH;
  PVector ShooterLoc;
  PImage shooter;
  int Shooter;

  ShootingGallery() {
    ShooterLoc = new PVector (width/2, height - 50);
    shooter = loadImage("Shooter.png");
    waves = loadImage("Waves.png");
    WavesLoc = new PVector (width/2, height/2);
    WavesW = 390;
    WavesH = 50;
    Shooter = 100;
  }

  void displayWaves() {
    imageMode(CENTER);
    image(waves, WavesLoc.x, WavesLoc.y+60, WavesW, WavesH);
    image(waves, WavesLoc.x, WavesLoc.y+200, WavesW, WavesH);
  }

  void displayShooter () {
    image(shooter, ShooterLoc.x, ShooterLoc.y, Shooter, Shooter);
  }
}

