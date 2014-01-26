ArrayList<Duck> ducks = new ArrayList<Duck>();  //an arrayList to keep a constant flow of targets
ArrayList<Bullet> bullets = new ArrayList<Bullet>(); //an arrayList to allow multiple bullets to be shot easily

PImage ShooterBackground; //background image
PVector NewTargetLoc; //Location of target after it is hit
PVector TargetLoc; //target's original location
PVector TargetVel; //target's velocity
int time; //variable used to time the game
int Target; //variable of target
int score; //variable used to keep score
int number; //??
int BulletTime; //variable used to help control the time the bullet flies
int startgame; //variable used to know when the game has begun
ShootingGallery s; //declaring class of ShootingGallery
Timer timer; //declaring class of timer

void setup() {
  size(550, 500); //display size
  NewTargetLoc = new PVector (110, height*.57); //sets coordinates for the NewTargetLoc PVector
  s = new ShootingGallery(); //initializes new ShootingGallery class
  ShooterBackground = loadImage("ShooterBackground.png"); //loads background image
  Target = 80; //sets size of target
  ducks.add(new Duck()); //adds a new duck to the arrayList
  bullets.add(new Bullet()); //adds new bullet to the arrayList
  time = 0; //gives a value for the variable time
  BulletTime = 0; //gives a value for the variable BulletTime
  timer = new Timer(); // initializes new timer class
}

void draw() {
  background(ShooterBackground); //sets background to previously loaded image
  timer.display(); //uses display funtion in the timer class
  for (int i = ducks.size() - 1; i>0; i--) {  //for statment for the ducks arrayList
    Duck d = ducks.get(i); //gets duck from the arrayList
    d.displayTarget(); //uses the display function in the duck class to show the target
    d.moveTarget(); //uses the move funtion in the duck calss to move the target
    if (d.TargetLoc.x > width-135) { //if the target goes a certain distance, it is removed
      ducks.remove(i);
    }
    for (int u = bullets.size() - 1; u > 0; u--) { //for statement for the bullet arrayList
      if (d.checkBullet(bullets.get(u))) { //??
        if (ducks.get(i).grey == true) { //??
          score ++; //score increases
        }
        else {
          startgame-=20000;  //??
        }
        ducks.remove(i); //remove duck
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
}

void keyPressed() {
  if (key == ' ') {
    if (Shoot()) {
      bullets.add(new Bullet());
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

