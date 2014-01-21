PImage mazeLevel1;
PImage mazeLevel2;
PImage mazeLevel3;
boolean endScreen = false; 
PImage winScreenimage;
boolean winScreen = false;
PImage circusElephant; 
int x; 
PImage LoadingScreenMaze;
boolean INTROMAZE;
int IntroMazeTime;
PVector locLoadBar;
PVector locLoadBar2;
int LoadBarH;
float LoadBarW;
float LoadBar2W;
int LoadBar2H;

void setup() {
  size(550, 500);
  mazeLevel1 = loadImage ("maze.png");
  mazeLevel2 = loadImage ("elephant.png");
  mazeLevel3 = loadImage ("lion.png");
  LoadingScreenMaze = loadImage("LoadingScreenMaze.png");
  winScreenimage = loadImage ("winScreen.jpg");
  circusElephant = loadImage ("for mouse.png");
  LoadBarH = 20;
  LoadBarW = 300;
  LoadBar2W = 0;
  LoadBar2H = LoadBarH;
  locLoadBar = new PVector((width/2), (height/2)-160);
  locLoadBar2 = new PVector((width/2), (height/2)-160);
  INTROMAZE = true;
}

void intromaze() {
  if (INTROMAZE) {
    if (millis() < 10000) {
      background(LoadingScreenMaze);
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
      LoadBar2W+=0.8;
      if (LoadBar2W == LoadBarW) {
        LoadBar2W-=0.8;
      }
    }
    else {
      IntroMazeTime = millis()+4000;
      INTROMAZE = false;
    }
  }
}

void draw() {
  
  intromaze();
  if (!INTROMAZE) { 
    if (x == 0) {
      background (mazeLevel1);
      fill (133, 161, 84);
      noStroke();
      rect (520,277,22, 50); 
      fill (84, 160, 141); 
      stroke(2);
      rect (475, 285, 35, 80); //coordinates of the teal box
      if ( get (mouseX, mouseY) == color(133, 161, 84)) { //when you hit maze levels in level 1 (green)
        endScreen = true;
      }
      if (get (mouseX, mouseY) == color (84, 160, 141)) { //teal box
        x++;
      }
    }
    if (x==1) {
      background (mazeLevel2);
      fill (128, 128, 255); //lavender box
      rect ( 120, 0, 80, 30);
      if  (get (mouseX, mouseY) == color (84, 160, 141)) {
      }
    }
    if (get (mouseX, mouseY) == color (128, 128, 255)) {
      x++;
    }
    if (x == 2) {
      background (mazeLevel3);
      fill (0);
      rect (430, 425, 74, 50);
    }
    if (get(mouseX, mouseY) == color (0)) {
      winScreen = true;
    }
    if (get (mouseX, mouseY) == color (212, 153, 9)) {
      endScreen = true;
    }
    if (endScreen == true) {
      background (0);
      fill(255);
      textSize(50);
      textAlign(CENTER);
      text("Game Over", width/2, height/2);
    }
  }
  if (winScreen == true) {
    background (winScreenimage);
    textSize(50);
    textAlign(CENTER);
    text("YOU WON!", width/2, height/2);
    //Brandon was here
  }
  if (get (mouseX, mouseY) == color (46, 108, 164)) { //when you hit maze walls in level 2 (blue)
    endScreen = true;
  }
  imageMode(CENTER);
  image(circusElephant,mouseX,mouseY); 
}

