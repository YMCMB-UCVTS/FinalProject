ArrayList<Duck> ducks = new ArrayList<Duck>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();

PImage ShooterBackground;
PImage LoadingScreenSG; //loading screen image
PVector NewTargetLoc;
PVector TargetLoc;
PVector TargetVel;
int time;
int Target;
int number;
int BulletTime;
int startgame;
boolean INTROSG;
int IntroSGTime;
ShootingGallery s;
Timer timer;
LoadBar loadbar;

void ShootingGallerySetup() {
  size(550, 500);
  NewTargetLoc = new PVector (110, height*.57);
  s = new ShootingGallery();
  ShooterBackground = loadImage("ShooterBackground.png");
  LoadingScreenSG = loadImage("LoadingScreenSG.jpg");
  Target = 80;
  ducks.add(new Duck());
  bullets.add(new Bullet());
  time = millis() + 500;
  BulletTime = 0;
  timer = new Timer();
  loadbar = new LoadBar();
  INTROSG = true;
}

void ShootingGallery() {
  frameRate(60);
  introsg();
  if (!INTROSG) {
    background(ShooterBackground);
    timer.display();
    for (int i = ducks.size() - 1; i>0; i--) { 
      Duck d = ducks.get(i);
      d.displayTarget();
      d.moveTarget();
      if (d.TargetLoc.x > width-135) {
        ducks.remove(i);
      }
      for (int u = bullets.size() - 1; u > 0; u--) { 
        if (d.checkBullet(bullets.get(u))) {
          if (ducks.get(i).grey == true) {
            score ++;
          }
          else {
            timer.startgame-=5000;
          }
          ducks.remove(i);
        }
      }
    }
    if (millis() > time) {
      ducks.add(new Duck());
      time+=1500;
    }
    s.displayWaves();
    for (int u = bullets.size() - 1; u > 0; u--) { 
      Bullet b = bullets.get(u);
      b.displayBullet();
      if (b.BulletLoc.y < 0) {
        bullets.remove(u);
      }
    }
    s.displayShooter();
    s.displayScore();
    if (BulletTime - millis() > 0) {
      fill(255);
      textSize(24);
      text("Wait....", width-100, 100);
    }
    else {
      fill(255);
      textSize(24);
      text("RELOADED", width-100, 100);
    }
    if (score == 30) {
      win = true;
    }
    if (timer.startgame - millis() == 0) {
      lose = true;
    }
  }
}

void introsg() { //loading screen function
  if (INTROSG) {
    if (millis() < introgametime) { //timer set at 10 seconds 
      background(LoadingScreenSG); //displays loading screen image and loading bar that fills up 
      loadbar.displayBar();
    }
    else { //establishes conditions for game to run
    player.close();
      player = minim.loadFile("SGMusic.mp3");
      player.loop();
      IntroSGTime = millis()+4000;
      INTROSG = false;
    }
  }
}


boolean Shoot() {
  if (BulletTime - millis() > 0) {
    return false;
  }
  else {
    BulletTime = millis() + 3000;
    return true;
  }
}

