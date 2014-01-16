
ShootingGallery g1;

ArrayList<Duck> objects = new ArrayList<Duck>();

PImage ShooterBackground;
PVector NewTargetLoc;
PVector TargetLoc;
PVector TargetVel;
int Target;

void setup() {
  size(550, 500);
  NewTargetLoc = new PVector (110, height*.57);
  g1 = new ShootingGallery();
  ShooterBackground = loadImage("ShooterBackground.png");
  objects.add(new Duck());
  TargetLoc = new PVector (110, height*.57);
  TargetVel = new PVector (3, 0);
  Target = 80;
}

void draw() {
  background(ShooterBackground);
  g1.displayWaves();
  g1.displayShooter();
  g1.displayBullet();
  g1.CheckContact();
  g1.moveBullet();
  for (int i = objects.size()-1; i>=0; i--) {
    Duck d = objects.get(i);
    d.displayTarget();
    d.moveTarget();
    d.Cycle();
  }
}

