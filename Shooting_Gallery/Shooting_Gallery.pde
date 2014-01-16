Duck[] d = new Duck[1];

PImage ShooterBackground;
PVector NewTargetLoc;
PVector TargetLoc;
PVector TargetVel;
int time;
int Target;
//int index=1;
ShootingGallery s;

void setup() {
  size(550, 500);
  NewTargetLoc = new PVector (110, height*.57);
  for (int i = 0; i < d.length; i++) {
    d[i] = new Duck();
  }
  s = new ShootingGallery();
  ShooterBackground = loadImage("ShooterBackground.png");
  Target = 80;
}

void draw() {
  background(ShooterBackground);
  for (int i=0; i< d.length; i++) { 
    d[i].displayTarget();
    d[i].moveTarget();
  }
  // index++;
  if(millis() > time)
  {
  d = (Duck[]) append(d, new Duck());
  time+=3000;
  }
  s.displayWaves();
  s.displayShooter();
  s.displayBullet();
  s.OutOfBounds();
  
  s.moveBullet();
}

