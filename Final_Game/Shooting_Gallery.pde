ArrayList<Duck> ducks = new ArrayList<Duck>();  //an arrayList to keep a constant flow of targets
ArrayList<Bullet> bullets = new ArrayList<Bullet>(); //an arrayList to allow multiple bullets to be shot easily

PImage ShooterBackground; //background image
PImage LoadingScreenSG; //loading screen image
PVector TargetLoc; //target's original location
PVector TargetVel; //target's velocity
int time; //variable used to time the game
int Target; //variable of target
int number; //variable that will allow the ducks to cycle (yellow to grey to andy)
int BulletTime; //variable used to time the reload for the bullet
boolean INTROSG;
int IntroSGTime;
ShootingGallery s; //declaring class of ShootingGallery
Timer timer; //declaring class of timer
LoadBar loadbar;

void ShootingGallerySetup() {
  s = new ShootingGallery(); //initializes new ShootingGallery class
  ShooterBackground = loadImage("ShooterBackground.png"); //loads background image
  LoadingScreenSG = loadImage("LoadingScreenSG.jpg"); //loads loadingscreen image
  Target = 80; //sets size of target
  ducks.add(new Duck()); //adds a new duck to the arrayList
  bullets.add(new Bullet()); //adds new bullet to the arrayList
  time = millis() + 500; //gives a value for the variable time
  BulletTime = 0; //gives a value for the variable BulletTime
  timer = new Timer(); // initializes new timer class
  loadbar = new LoadBar();
  INTROSG = true;
}

void ShootingGallery() {
  frameRate(60);
  introsg();
  if (!INTROSG) {
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
        if (d.checkBullet(bullets.get(u))) { //allows for if the bullet touches the duck, both will be removed
          if (ducks.get(i).grey == true) { //grey duck will appear
            score ++; //score increases
          }
          else {
            timer.startgame-=5000; //if you hit a grey duck, time decreases by 5 seconds
          }
          ducks.remove(i); //remove duck
        }
      }
    }
    if (millis() > time) { //if the milliseconds are greater than the variable time
      ducks.add(new Duck()); //add a new duck
      time+=1500; //increae time by 1500
    }
    s.displayWaves();  //use the premade function displayWaves
    for (int u = bullets.size() - 1; u > 0; u--) { //for statement fo the bullet arrayList
      Bullet b = bullets.get(u); //gets a bullet
      b.displayBullet(); //displays the bullet
      if (b.BulletLoc.y < 0) { //if the bullet's location is less than zero
        bullets.remove(u); //remove it
      }
    }
    s.displayShooter(); //use the premade function displayShooter
    s.displayScore(); //use the premade function displayScore
    if (BulletTime - millis() > 0) { //if the bulletTime is greater than the milliseconds
      fill(255); //fill font
      textSize(24); //sets text size
      text("Wait....", width-100, 100); //screen says "Wait...."
    }
    else { //if the bulletTime is not greater than the milliseconds
      fill(255); //fill font
      textSize(24); //font size
      text("RELOADED", width-100, 100); //screen says "RELOADED"
    }
    if (score == 30) {
      win = true;
    }
    if (timer.startgame - millis() <= 0) {
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


boolean Shoot() { //creating boolean for shoot
  if (BulletTime - millis() > 0) { //three seconds have not passed and the boolean shoot is false
    return false;
  }
  else {
    BulletTime = millis() + 3000; //three seconds have passed and you can shoot a bullet
    return true;
  }
}

