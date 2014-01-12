PImage LoadingScreenPong;
PVector ballloc;
PVector ballvel;
int ballr=15;
PVector pad1loc;
int move = 2;
int padWidth = 10;
int padHeight = 60;
PVector pad2loc;
boolean INTROPONG;
int IntroPazeTime;
PVector locLoadBar;
PVector locLoadBar2;
int LoadBarH;
float LoadBarW;
float LoadBar2W;
int LoadBar2H;

void setup () {
  size(550, 500);
  ballloc= new PVector(width/2, height/2);
  ballvel= new PVector(2, 2.5);
  pad1loc= new PVector(30, height/2);
  pad2loc= new PVector(width-30, height/2); 
  LoadingScreenPong = loadImage("LoadingScreenPong.png");
  LoadBarH = 20;
  LoadBarW = 300;
  LoadBar2W = 0;
  LoadBar2H = LoadBarH;
  locLoadBar = new PVector((width/2), (height/2)-160);
  locLoadBar2 = new PVector((width/2), (height/2)-160);
  INTROPONG = true;
}

void intropong() {
  if (INTROPONG) {
    if (millis() < 10000) {
      background(LoadingScreenPong);
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
      IntroPazeTime = millis()+4000;
      INTROPONG = false;
    }
  }
}


void draw() {
  intropong();
  if (!INTROPONG) {
    fill(255);
    background (12, 242, 167);
    ellipse (ballloc.x, ballloc.y, ballr, ballr);
    rect(pad1loc.x, pad1loc.y, padWidth, padHeight);
    rect(pad2loc.x, pad2loc.y, padWidth, padHeight);
    ballloc.add(ballvel); 
    if (ballloc.x+ballr/2 >width || ballloc.x-ballr/2<0) {
      ballvel.x*=-1;
    }
    if (ballloc.y+ballr/2>height) {
      ballvel.y*=-1;
    }
    if (ballloc.y-ballr/2<0) {
      ballvel.y=-ballvel.y;
    }
    if (keyPressed == true && key == 'w' && pad1loc.y>0) {
      pad1loc.y-=2.5;
    }
    if (keyPressed == true && key == 's' && pad1loc.y+padHeight<height) {
      pad1loc.y+=2.5;
    }
    if (keyPressed == true && key == 'i' && pad2loc.y>0) {
      pad2loc.y-=2.5;
    }
    if (keyPressed == true && key == 'k' && pad2loc.y+padHeight<height) {
      pad2loc.y+=2.5;
    }
    if (ballloc.dist(pad1loc) < padWidth + ballr/2) {
      ballvel.x*=-1;
    }
    if (ballloc.dist(pad2loc)< padWidth + ballr/2) {
      ballvel.x*=-1;
    }
  }
}

