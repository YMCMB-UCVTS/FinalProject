/*This where the variables, images, PVectors, and booleans
 are intialized*/
PVector locGoal; 
PVector locGoalie;
PVector locBall;
PVector velGoalie;
PVector velBall;
PVector acc;
PImage Goal;
PImage Ball;
PImage Field;
PImage Goalie;
PImage SoccerLoadingScreen;
boolean INTROSOCCER;
float NegAccB;
int d;
int speed;
int IntroSoccerTime;
boolean setLevel;
int lives;


/*This block of code is where all the 
 varaibles that are intialized are given a value*/
void SoccerSetup() {
  Field = loadImage("Field.png");
  Goalie = loadImage("goalie.png");
  Goal = loadImage("goal.png");
  Ball = loadImage("ball.png");
  SoccerLoadingScreen = loadImage("Soccer Loading Screen.png");
  locGoal = new PVector(20, 35);
  locGoalie = new PVector(100, 175);
  d = 35;
  locBall = new PVector ((width/2)-(d/2), (height/2)-(d/2));
  velGoalie =new PVector(0, 4);
  speed = 10;
  lives = 3;
  level = 1;
  velBall = new PVector (0, 10);
  NegAccB = .1;
  acc = new PVector (0, 0);
  INTROSOCCER = true;
  setLevel = true;
}


/*This function is where the other functions that were created
 are placed. This allows all the functions to run*/
void Soccer() {
  imageMode(CORNER);
  frameRate(60);
  introsoccer();
  catchBall();
  catchGoal();
  OutOfBounds();
  StartGame();
  /*This part changes the diffculty of the game. When the score
   is greatrer than a certain number, setLevel changes from true
   to false*/
  if (setLevel==true) {
    Bounce();
  }
  else {
    locGoalie.add(velGoalie);
    BounceLEVELTWO();
  }   
  if (score >= 10) {
    setLevel=false;
  }
  if (score ==20){
  win = true;
  }
  if(lives == 0){
  lose = true;
  }
}


/*void introsoccer is a function that runs in the beginning 
 of the program. it is controlled by a boolean called INTROSOCCER,
 and when this boolean is true, a loading screen will display on
 the screen until it becomes false*/
void introsoccer() {
  if (INTROSOCCER) {
    if (millis() < 10000) {
      background(SoccerLoadingScreen);
    }
    else {
      IntroSoccerTime = millis()+4000;
      INTROSOCCER = false;
      player.close();
      player = minim.loadFile("SoccerGameMusic.mp3");
      player.loop();
    }
  }
}

/*This function is what happens when INTROSOCCER is false.
 The game is able to be played now.
 */
void StartGame() {
  if (!INTROSOCCER) {
    background(Field);
    image(Goal, locGoal.x, locGoal.y, 70, height/1.27);
    image(Ball, locBall.x, locBall.y, d, d);
    image(Goalie, locGoalie.x, locGoalie.y, 70, 100);
    locBall.add(velBall);
    velBall.sub(acc);
    textSize(24);
    fill(255, 0, 0);
    text("Score: " + score, width/2 +30, 100);
    text("Lives: " + lives, width/1.3, 100);
    locGoalie.add(velGoalie);
    text(255, 0, 0);
    textSize(30);
    text("Level: " + level, width/2+80, height/2); 
    if (score == 10) {
      level = 2;
      text("Level: " + level, width/2+80, height/2);
    }   
    if (locGoalie.y+200 > height) {
      velGoalie.y*=-1;
    }
  }
  if (locGoalie.y-120 < 0) {
    velGoalie.y*=-1;
  }
}


/*This function allows the ball and goalie to interact.
 When they do, the ball's location, velocity and acceleration
 resets back to its original location and lives go down*/
void catchBall() {     
  if (locBall.x<locGoalie.x+70 && locBall.y>locGoalie.y && locBall.y<locGoalie.y+80) {
    velBall.set(0, 10);
    acc.set(0, 0);
    locBall.set((Field.width/2)-(d/2), (Field.height/2)-(d/2));
    lives--;
  }
}


/*This function allows the ball and goal to interact.
 When they do, the ball's location, velocity and acceleration
 resets back to its original location and score goes up*/
void catchGoal() {
  if (locBall.x<locGoal.x+25 && locBall.y>locGoal.y+60 && locBall.y<locGoal.y+height/1.37) {
    velBall.set(0, 10);
    acc.set(0, 0);
    score++;
    locBall.set((Field.width/2)-(d/2), (Field.height/2)-(d/2));
  }
}


/*This function occurs when the ball's x location is
 less than 0, and the ball goes off the screen.
 When it does, the ball's location, velocity, and acceleraction
 resets back to its original location and lives go down*/
void OutOfBounds() {
  if (locBall.x+35<0) {   
    velBall.set(0, 10);
    acc.set(0, 0);
    locBall.set((Field.width/2)-(d/2), (Field.height/2)-(d/2));
    lives--;
  }
}

/*This function allows the ball to move up and down in the y
 dircetion to resemble a ball bouncing. the velocity of the ball
 changes when it reaches a certian hieght, changing its direction.
 This function runs when setLevel is true*/
void Bounce() {
  if (locBall.y<100) {
    velBall.y*=-1;
  }
  if (locBall.y>375) {
    velBall.y*=-1;
  }
}

/*THis function allows the ball to move up and down in the y
 dircetion as well the velocity of the ball changes when it 
 reaches a certian hieght which is much wider than in the 
 function bounce, changing its direction.This function runs 
 when setLevel is false*/
void BounceLEVELTWO() {
  lives = 5;
  if (locBall.y<50) {
    velBall.y*=-1;
  }
  if (locBall.y>430) {
    velBall.y*=-1;
  }
}

