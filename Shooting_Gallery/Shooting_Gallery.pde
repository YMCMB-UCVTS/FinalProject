ArrayList<Duck> ducks = new ArrayList<Duck>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();

PImage ShooterBackground;
PVector NewTargetLoc;
PVector TargetLoc;
PVector TargetVel;
int time;
int Target;
int score;
ShootingGallery s;

void setup() {
  size(550, 500);
  NewTargetLoc = new PVector (110, height*.57);
  s = new ShootingGallery();
  ShooterBackground = loadImage("ShooterBackground.png");
  Target = 80;
  ducks.add(new Duck());
  bullets.add(new Bullet());
  time = 0;
}

void draw() {
  background(ShooterBackground);
  for (int i = ducks.size() - 1; i>0; i--) { 
    Duck d = ducks.get(i);
    d.displayTarget();
    d.moveTarget();
    if (d.TargetLoc.x > width-135) {
      ducks.remove(i);
    }
    for (int u = bullets.size() - 1; u > 0; u--) { 
      if (d.checkBullet(bullets.get(u))) {
        ducks.remove(i);
        score ++;
      }
    }
  }
  if (millis() > time) {
    ducks.add(new Duck());
    time+=2000;
  }
  s.displayWaves();
  for (int u = bullets.size() - 1; u > 0; u--) { 
    Bullet b = bullets.get(u);
    b.moveBullet();
    b.displayBullet();
    if (b.BulletLoc.y < 0) {
      bullets.remove(u);
    }
  }
  s.displayShooter();
  s.displayScore();
}

void keyPressed()
{
  if (key == 'w') {
    bullets.add(new Bullet());
  }
}

