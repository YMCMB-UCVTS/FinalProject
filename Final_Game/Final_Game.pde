import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer player;

Button b1, b2, b3, b4, b5;
ShootingGallery g1;
Game2 g2;
Game3 g3;
Game4 g4;
Instructions text;

PImage intro;
PImage ShooterBackground;
boolean INTRO;
boolean game1;
boolean game2;
boolean game3;
boolean game4;
boolean instructions;
boolean menuB;
PVector locmenuB;
int menuBH;
int menuBW;
int introTime;
int s;
int mainmenux, mainmenuy;
PVector locLoadBar;
PVector locLoadBar2;
int LoadBarH;
float LoadBarW;
float LoadBar2W;
int LoadBar2H;

void setup() {
  size(550, 500);
  intro = loadImage("Intro.jpeg");
  ShooterBackground = loadImage("ShooterBackground.png");
  INTRO = true;
  game1 = false;
  game2 = false;
  game3 = false;
  game4 = false;
  instructions = false;
  menuB = false;
  menuBW = 50;
  menuBH = 30;
  locmenuB = new PVector(width-(menuBW+20), menuBH + 30);
  mainmenux = width/2;
  mainmenuy = height/2;
  minim = new Minim(this);
  player = minim.loadFile("PYD.mp3"); 
  player.play(); 
  b1 = new Button(120, 0);
  b2 = new Button(-20, 0);
  b3 = new Button(120, 120);
  b4 = new Button(-20, 120);
  b5 = new Button(80, -70);
  g1 = new ShootingGallery();
  g2 = new Game2();
  g3 = new Game3();
  g4 = new Game4();
  text = new Instructions();
  LoadBarH = 20;
  LoadBarW = 300;
  LoadBar2W = 0;
  LoadBar2H = LoadBarH;
  locLoadBar = new PVector((width/2), (height/2)-160);
  locLoadBar2 = new PVector((width/2), (height/2)-160);
}


void menu() {
  if (!INTRO) {
    background(0);
    b1.display(0, 0);
    b2.display(0, 0);
    b3.display(0, 0);
    b4.display(0, 0);
    b5.display(60, -40);
    mainmenutext();
    if (b1.selected()) {
      game1 = true;
      game2 = false;
      game3 = false;
      game4 = false;
      instructions = false;
    }
    if (b2.selected()) {
      game2 = true;
      game1 = false;
      game3 = false;
      game4 = false;
      instructions = false;
    }
    if (b3.selected()) {
      game3 = true;
      game1 = false;
      game2 = false;
      game4 = false;
      instructions = false;
    }
    if (b4.selected()) {
      game4 = true;
      game1 = false;
      game2 = false;
      game3 = false;
      instructions = false;
    }
    if (b5.selected()) {
      instructions = true;
      game1 = false;
      game2 = false;
      game3 = false;
      game4 = false;
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
      player.loop();
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


void mousePressed() {
  if (mouseX > locmenuB.x && mouseX < locmenuB.x + menuBW  && mouseY > locmenuB.y && mouseY < locmenuB.y + menuBH) {
    menuB = true;
    game1 = false;
    game2 = false;
    game3 = false;
    game4 = false;
    instructions = false;
    player.close();
    player = minim.loadFile("All That Matters.mp3");
    player.play();
    player.loop();
  }
}

void choosegame() {
  if (game1 == true) {
    background(ShooterBackground);
    g1.displayTarget();
    g1.moveTarget();
    g1.displayShooter();
    g1.displayBullet();
    g1.moveBullet();
    g1.CheckContact();
  }
  if (game2 == true) {
    g2.intromaze();
    g2.display();
  }
  if (game3 == true) {
    BlackBox.init(this);
    g3.intropong();
    g3.display();
  }
  if (game4 == true) {
    g4.introsoccer();
    g4.display();
    g4.catchBall();
    g4.catchGoal();
    g4.OutOfBounds();
    g4.levels();
    player.close();
    minim = new Minim(this);
    player = minim.loadFile("LoadScreenSoccerMusic.mp3"); 
    player.play();
  }
  if (instructions == true) {
    text.display();
  }
}

void mainmenutext() {
  fill(0);
  textAlign(CENTER);
  text("INSTRUCTIONS", width/2-10, height/2 - 45);
  text("Game 1", width/2-80, height/2+40);
  text("Game 2", width/2+60, height/2+40);
  text("Game 3", width/2-80, height/2+160);
  text("Game 4", width/2+60, height/2+160);
  frameRate(7);
  fill(random(255), random(255), random(255));
  textSize(64);
  text("Main Menu", mainmenux, mainmenuy - 145);
  textSize(16);
  fill(255);
  text("Choose What You Want To Play", mainmenux, mainmenuy - 105);
}

