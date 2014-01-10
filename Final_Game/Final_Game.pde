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
boolean run;
boolean game1;
boolean game2;
boolean game3;
boolean game4;
int introTime;
int s;
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
  run = true;
  game1 = false;
  game2 = false;
  game3 = false;
  game4 = false;
  mainmenux = width/2;
  mainmenuy = height/2;
  minim = new Minim(this);
  player = minim.loadFile("PYD.mp3"); 
  player.play(); 
  b1 = new Button(70, 0);
  b2 = new Button(-70, 0);
  b3 = new Button(70, -120);
  b4 = new Button(-70, -120);
  g1 = new Game1();
  g2 = new Game2();
  g3 = new Game3();
  g4 = new Game4();
}

void menu() {
  if (!INTRO) {
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
    if (b1.selected()) {
      game1 = true;
      game2 = false;
      game3 = false;
      game4 = false;
    }
    if (b2.selected()) {
      game2 = true;
      game1 = false;
      game3 = false;
      game4 = false;
    }
    if (b3.selected()) {
      game3 = true;
      game1 = false;
      game2 = false;
      game4 = false;
    }
    if (b4.selected()) {
      game4 = true;
      game1 = false;
      game2 = false;
      game3 = false;
    }
    choosegame();
  }
}

void intro() {
  if (INTRO) {
    if (millis() < 3000) {
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

void choosegame() {
  if (game1 == true) {
    g1.display();
    g1.move();
  }
  if (game2 == true) {
    g2.display();
    g2.move();
  }
  if (game3 == true) {
    g3.display();
    g3.move();
  }
  if (game4 == true) {
    g4.display();
    g4.move();
  }
}

