import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer player;

Button b1, b2, b3, b4;
Game1 g1;
Game2 g2;
Game3 g3;
Game4 g4;

PImage intro;
boolean start;
boolean gameover;
boolean win;
boolean pause;
boolean music;
boolean INTRO;
int introTime;
int mainmenux, mainmenuy;

void setup() {
  size(550, 550);
  intro = loadImage("Intro.jpeg");
  start = false;
  gameover = false;
  win = false;
  pause = true;
  music = false;
  INTRO = true;
  mainmenux = width/2;
  mainmenuy = height/2;
  minim = new Minim(this);
  player = minim.loadFile("PYD.mp3"); 
  player.play(); 
  //loc = new PVector((width/2) - x, (height/2)- y);
  b1 = new Button(30, 0);
  b2 = new Button(-30, 0);
  b3 = new Button(30, -60);
  b4 = new Button(-30, -60);
}

void menu() {
  if (!INTRO)
  {
    background(0);
    frameRate(7);
    fill(random(255), random(255), random(255));
    textAlign(CENTER);
    textSize(64);
    text("Main Menu", mainmenux, mainmenuy - 145);
    textSize(16);
    fill(255);
    text("Choose What You Want To Play", mainmenux, mainmenuy - 105);
    b1.display();
    b2.display();
    b3.display();
    b4.display();
  }
}

void intro() {
  if (INTRO) {
    if (millis() < 8000) {
      imageMode(CENTER);
      image(intro, width/2, height/2, 150, 150);
    }
    else {
      introTime = millis()+4000;
      INTRO = false;
      player.close();
      player = minim.loadFile("All That Matters.mp3");
      player.play();
    }
  }
}

void draw() {
  background(0);
  intro();
  menu();
}

void stop() { 
  player.close();
  minim.stop();
  super.stop();
}

