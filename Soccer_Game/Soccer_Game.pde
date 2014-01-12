import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer player;

PVector locGoal;
PVector locGoalie;
PVector locBall;
PVector velGoalie;
PVector velBall;
PVector locLoadBar;
PVector locLoadBar2;
PVector acc;
PImage Goal;
PImage Ball;
PImage Field;
PImage GoalieUp;
PImage GoalieDown;
PImage SoccerLoadingScreen;
boolean INTROSOCCER;
float NegAccB;
int d;
int speed;
int IntroSoccerTime;
int LoadBarH;
float LoadBarW;
float LoadBar2W;
int LoadBar2H;
boolean goalieup;
boolean goaliedown;

void setup () {
  Field = loadImage("Field.png");
  size(Field.width, Field.height);
  GoalieUp = loadImage("goalie up.png");
  GoalieDown = loadImage("goalie down.png");
  Goal = loadImage("goal.png");
  Ball = loadImage("ball.png");
  SoccerLoadingScreen = loadImage("Soccer Loading Screen.png");
  locGoal = new PVector(20, 35);
  locGoalie = new PVector(100, 175);
  LoadBarH = 20;
  LoadBarW = 300;
  LoadBar2W = 0;
  LoadBar2H = LoadBarH;
  locLoadBar = new PVector((width/2), (height/2)-120);
  locLoadBar2 = new PVector((width/2), (height/2)-120);
  d = 35;
  locBall = new PVector ((Field.width/2)-(d/2), (Field.height/2)-(d/2));
  velGoalie =new PVector(0, 1);
  speed = 5;
  velBall = new PVector (0, 0);
  NegAccB = .1;
  acc = new PVector (0, 0);
  INTROSOCCER = true;
  goalieup = false;
  goaliedown = false;
  minim = new Minim(this);
  player = minim.loadFile("LoadScreenSoccerMusic.mp3"); 
  player.play();
}

void introsoccer() {
  if (INTROSOCCER) {
    if (millis() < 10000) {
      background(SoccerLoadingScreen);
      textAlign(CENTER);
      fill(255, 0, 0);
      textSize(30);
      text("Loading. . .", locLoadBar.x+10, locLoadBar.y - 30);
      fill(0);
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
      IntroSoccerTime = millis()+4000;
      INTROSOCCER = false;
      player.close();
      player = minim.loadFile("SoccerGameMusic.mp3");
      player.play();
      player.loop();
    }
  }
}


void draw() {
  introsoccer();
  if (!INTROSOCCER) {
    background(Field);
    image(Goal, locGoal.x, locGoal.y, 70, height/1.27);
    image(Ball, locBall.x, locBall.y, d, d);
    image(GoalieUp, locGoalie.x, locGoalie.y, 70, 100);
    locBall.add(velBall);
    velBall.sub(acc);
    locGoalie.add(velGoalie);
    if (locGoalie.y+200 > height) {
      goalieup = true;
      if (goalieup == true) {
        image(GoalieUp, locGoalie.x, locGoalie.y, 70, 100);
        velGoalie.y*=-1;
      }
    }
    if (locGoalie.y-120 < 0) {
      goaliedown = true;
      if (goaliedown == true) {
        image(GoalieDown, locGoalie.x, locGoalie.y, 70, 100);
        velGoalie.y*=-1;
      }
    }
  }
}

void keyPressed() {
  if (key=='a') {
    velBall.x=-speed;
    acc.x=-NegAccB;
    acc.y= 0;
    velBall.y=0;
  }
  if (key=='d') {
    velBall.x=speed;
    acc.x=NegAccB;
    acc.y=0;
    velBall.y=0;
  }
  if (key=='w') {
    velBall.y=-speed;
    acc.y=-NegAccB;
    acc.x=0;
    velBall.x=0;
  }
  if (key=='s') {
    velBall.y=speed;
    acc.y=NegAccB;
    acc.x=0;
    velBall.x=0;
  }
}

void stop() { 
  player.close();
  minim.stop();
  super.stop();
}

