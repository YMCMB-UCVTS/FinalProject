PImage mazeLevel1;
boolean endScreen = false; 
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
  LoadingScreenMaze = loadImage("LoadingScreenMaze.png");
  LoadBarH = 20;
  LoadBarW = 300;
  LoadBar2W = 0;
  LoadBar2H = LoadBarH;
  locLoadBar = new PVector((width/2), (height/2)-160);
  locLoadBar2 = new PVector((width/2), (height/2)-160);
  INTROMAZE = false;
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
 // intromaze();
  if (!INTROMAZE) {
    background (mazeLevel1);
    if ( get (mouseX, mouseY) == color(133, 161, 84)) {
      endScreen = true;
    }
    if (endScreen == true) {
      background (0);
      textSize(50);
      textAlign(CENTER);
      text("Game Over", width/2, height/2); 
    }
  }
}

