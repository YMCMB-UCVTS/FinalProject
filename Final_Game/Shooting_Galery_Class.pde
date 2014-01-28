class ShootingGallery { //creates a class for the shooting gallery
  PImage waves; //declares the image waves
  PVector WavesLoc; //PVector for the location of waves
  int WavesW; //waves width
  int WavesH; //waves height
  PVector ShooterLoc; //PVector for the location of the shooter
  PImage shooter; //declares the image for the shooter
  int Shooter; //variable for the size of the shooter

    ShootingGallery() {
    ShooterLoc = new PVector (width/2, height - 50); //sets location for the shooter location
    shooter = loadImage("Shooter.png"); //loads image for the shooter
    waves = loadImage("Waves.png"); //loads image for the waves
    WavesLoc = new PVector (width/2, height/2); //sets location for the waves
    WavesW = 390; //sets width for the waves
    WavesH = 50; //sets height for the waves
    Shooter = 100; //sets size for the shooter
    score = 0; //the variable score is equal to zero
  }

  void displayWaves() { //function for displaying the waves
    imageMode(CENTER); //setting imageMode to center
    image(waves, WavesLoc.x, WavesLoc.y+60, WavesW, WavesH); //load image of the waves with one location
    image(waves, WavesLoc.x, WavesLoc.y+200, WavesW, WavesH); //load image of the waves at another location
  }

  void displayScore() { //function to display the score
    textAlign(CENTER); //sets text alignment to center
    fill(255, 0, 0); //fill color for text
    textSize(32); //text size
    text("Score: " + score, width-100, 70); //text shows the score
  }

  void displayShooter () { //funcion to display the shooter
    image(shooter, ShooterLoc.x, ShooterLoc.y, Shooter, Shooter); //loads image and places it in set location
  }
}

