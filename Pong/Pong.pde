//establishes variables for pong game
PImage PongBackground;
PImage LoadingScreenPong; //loading screen image
PVector ballloc; 
PVector ballvel; 
int ballr=15;
PVector pad1loc;
int padWidth = 10; //width of paddles
int padHeight = 60; //height of paddles
PVector pad2loc;
boolean INTROPONG;
int IntroPazeTime;
PVector locLoadBar;
PVector locLoadBar2;
int LoadBarH;
float LoadBarW;
float LoadBar2W;
int LoadBar2H;
float padSpeed = 2.5; //how fast the paddles move up and down
int score1 = 0; //initial starting scores
int score2 = 0;
int scoreSize = 70;
boolean ballmove;
PVector ballacc;

void setup () {
  size(550, 500);
  BlackBox.init(this); //initializes Paras Jha's BlackBox Program, which allows for multiple keys to be pressed simultaneously
  ballloc= new PVector(width/2, height/2); //location and speed of ball
  ballvel= new PVector(random(2, 3), random(2, 3));
  ballacc = new PVector(.001, .001); //acceleration of the ball
  pad1loc= new PVector(0, height/2); //location of paddles on each side
  pad2loc= new PVector(width, height/2); 
  PongBackground = loadImage("PongBackground.png");
  LoadingScreenPong = loadImage("LoadingScreenPong.png");
  LoadBarH = 20; //dimensions of loading bar on load screen
  LoadBarW = 300;
  LoadBar2W = 0;
  LoadBar2H = LoadBarH;
  locLoadBar = new PVector((width/2), (height/2)-160); //location of load bar
  locLoadBar2 = new PVector((width/2), (height/2)-160);
  INTROPONG = true; //determines what state game is in, load screen or actually playing
  ballmove = false; //determines the conditions for the ball to move
}

void intropong() { //loading screen function
  if (INTROPONG) {
    if (millis() < 10000) { //timer set at 10 seconds 
      background(LoadingScreenPong); //displays loading screen image and loading bar that fills up 
      textAlign(CENTER);
      fill(255, 0, 0);
      textSize(30);
      text("Loading. . .", locLoadBar.x+10, locLoadBar.y - 30);
      fill(255);
      rectMode(CENTER);
      rect(locLoadBar.x, locLoadBar.y, LoadBarW, LoadBarH);
      fill(255, 0, 0);
      rectMode(CORNER);
      rect(locLoadBar2.x-(LoadBarW/2), locLoadBar2.y-(LoadBarH/2), LoadBar2W, LoadBar2H);
      LoadBar2W+=0.8; //loading bar moves along screen
      if (LoadBar2W == LoadBarW) {
        LoadBar2W-=0.8;
      }
    }
    else { //establishes conditions for game to run
      IntroPazeTime = millis()+4000;
      INTROPONG = false;
    }
  }
}


void draw() {
  intropong();
  if (!INTROPONG) {
    if (keyPressed == true && key == ' ') { //spacebar must be pressed for ball to move to start each point
      ballmove = true;
    }
    background (PongBackground);
    fill(255);
    textAlign(CENTER);
    textSize(scoreSize);
    text(score1, width/2-55, 85); //text for scores
    text(score2, width/2+50, 85);
    ellipse (ballloc.x, ballloc.y, ballr, ballr); //creates ball
    pad1loc.y = constrain(pad1loc.y, 0, height - padHeight); //keeps paddles from going above or below screen
    pad2loc.y = constrain(pad2loc.y, 0, height - padHeight); 
    rect(pad1loc.x, pad1loc.y, padWidth, padHeight); //creates left paddle
    rect(pad2loc.x-padWidth, pad2loc.y, padWidth, padHeight); //creates right paddle
    if (ballmove == true) {
      ballloc.add(ballvel); //when the space bar is pressed, the ball will move with the designated speed
      ballvel.add(ballacc);
    } 
    if (ballloc.x+ballr/2 >width) { //if the ball goes past the right side of the screen
      ballmove = false; //stops moving
      ballloc.set(width/2, height/2); //returns to center of the screen
      ballvel.set(random(2, 3), random(2, 3));
      ballacc.set(.001, .001);
      score1+=1; //player 1 receives a point
    }
    if (ballloc.x-ballr/2<0) { //if the ball goes past the left side of the screen
      ballmove = false; //stops moving
      ballloc.set(width/2, height/2); //returns to center of the screen 
      ballvel.set(random(2, 3), random(2, 3));
      ballacc.set(.001, .001);
      score2+=1; //player 2 receives a point
    }
    if (ballloc.y+ballr/2>height) { //ball bounces off bottom of screen
      ballvel.y*=-1; 
      ballacc.y*=-1;
    }
    if (ballloc.y-ballr/2<0) { //ball bounces off top of screen
      ballvel.y*=-1;
      ballacc.y*=-1;
    }
    //all the different keypressed combinations for controlling the paddles
    //Paras Jha's blackbox program must be downloaded into the sketch for multiple keypressed
    //left paddle is controlled using W and S; right is controlled by I and K
    if (BlackBox.isKeyDown(BlackBox.VK_W) && BlackBox.isKeyDown(BlackBox.VK_I)) {
      pad1loc.y-=padSpeed;
      pad2loc.y -= padSpeed;
    }
    else if (BlackBox.isKeyDown(BlackBox.VK_S) && BlackBox.isKeyDown(BlackBox.VK_K)) {
      pad1loc.y+=padSpeed;
      pad2loc.y+=padSpeed;
    }
    else if (BlackBox.isKeyDown(BlackBox.VK_W) && BlackBox.isKeyDown(BlackBox.VK_K)) {
      pad1loc.y-=padSpeed;
      pad2loc.y+=padSpeed;
    }
    else if (BlackBox.isKeyDown(BlackBox.VK_S) && BlackBox.isKeyDown(BlackBox.VK_I)) {
      pad1loc.y+=padSpeed;
      pad2loc.y-=padSpeed;
    }
    else if (keyPressed == true && key == 'w') {
      pad1loc.y-=padSpeed;
    }
    else if (keyPressed == true && key == 's' ) {
      pad1loc.y+=padSpeed;
    }
    else if (keyPressed == true && key == 'i') {
      pad2loc.y-=padSpeed;
    }
    else if (keyPressed == true && key == 'k') {
      pad2loc.y+=padSpeed;
    }
    if (ballloc.x-ballr/2<pad1loc.x+padWidth && ballloc.y-ballr/2 > pad1loc.y && ballloc.y+ballr/2 < pad1loc.y + padHeight) {
      ballvel.x*=-1; //ball bounces off left paddle
      ballacc.x*=-1;
    }
    if (ballloc.x+ballr/2>pad2loc.x-padWidth && ballloc.y-ballr/2 > pad2loc.y && ballloc.y+ballr/2 < pad2loc.y + padHeight) {
      ballvel.x*=-1; //ball bounces off right paddle
      ballacc.x*=-1;
    }
  }
}

