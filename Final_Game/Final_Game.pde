import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer player;

Button b1, b2, b3, b4, b5;
Instructions text;

PImage intro;
boolean INTRO;
boolean game1;
boolean game2;
boolean game3;
boolean game4;
boolean instructions;
boolean win;
boolean lose;
boolean menuB;
PVector locmenuB;
int menuBH;
int menuBW;
int introTime;
int mainmenux, mainmenuy;
int score;
int level;
int StartMiniGame;
boolean Mainmenugoaway;
PImage WinScreen;
PImage LoseScreen;

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
  b1 = new Button(140, -20, "SGButton.png");
  b2 = new Button(-40, -20, "MazeButton.png");
  b3 = new Button(140, 120, "PongButton.png");
  b4 = new Button(-40, 120, "SoccerButton.png");
  b5 = new Button(103, -125, "Instructions.png");
  text = new Instructions();
  Mainmenugoaway = false;
  win = false;
  lose = false;
  WinScreen = loadImage("Winner.png");
  LoseScreen = loadImage("Loser.png");
}


void menu() {
  if (!INTRO && Mainmenugoaway == false) {
    background(0);
    b1.display(0, 0);
    b2.display(0, 0);
    b3.display(0, 0);
    b4.display(0, 0);
    b5.display(100, -20);
    mainmenutext();
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
      player.loop();
    }
  }
}

void draw() {
  background(0);
  intro();
  menu();
  choosegame();
  win();
  lose();
  println(lose);
}

void stop() { 
  player.close();
  minim.stop();
  super.stop();
}


void mousePressed() {
  if (mouseX > locmenuB.x && mouseX < locmenuB.x + menuBW  && mouseY > locmenuB.y && mouseY < locmenuB.y + menuBH) {
    if (win == true || lose == true || instructions == true) {
      menuB = true;
      Mainmenugoaway = false;
      game1 = false;
      game2 = false;
      game3 = false;
      game4 = false;
      instructions = false;
      win = false;
      lose = false;
      player.close();
      player = minim.loadFile("All That Matters.mp3");
      player.loop();
    }
  }
  if (Mainmenugoaway == false && INTRO == false) {
    if (b1.selected()) {
      Mainmenugoaway = true;
      game1 = true;
      StartMiniGame = millis() + 10000;
      ShootingGallerySetup();
      game2 = false;
      game3 = false;
      game4 = false;
      instructions = false;
    }
    if (b2.selected()) {
      Mainmenugoaway = true;
      game2 = true;
      StartMiniGame = millis() + 10000;
      MazeSetup();
      game1 = false;
      game3 = false;
      game4 = false;
      instructions = false;
    }
    if (b3.selected()) {
      Mainmenugoaway = true;
      game3 = true;
      StartMiniGame = millis() + 10000;
      PongSetup();
      game1 = false;
      game2 = false;
      game4 = false;
      instructions = false;
    }
    if (b4.selected()) {
      Mainmenugoaway = true;
      game4 = true;
      StartMiniGame = millis() + 10000;
      player.close();
      player = minim.loadFile("LoadScreenSoccerMusic.mp3");
      player.loop();
      SoccerSetup();
      game1 = false;
      game2 = false;
      game3 = false;
      instructions = false;
    }
    if (b5.selected()) {
      Mainmenugoaway = true;
      instructions = true;
      game1 = false;
      game2 = false;
      game3 = false;
      game4 = false;
    }
  }
}


void choosegame() {
  if (game1 == true) {
    lose = false;
    win = false;
    ShootingGallery();
  }
  if (game2 == true) {
    lose = false;
    win = false;
    Maze();
  }
  if (game3 == true) {
    lose = false;
    win = false;
    Pong();
  }
  if (game4 == true) {
    lose = false;
    win = false;
    Soccer();
  }
  if (instructions == true) {
    lose = false;
    win = false;
    text.display();
    text.returntomainmenubutton();
  }
}

void mainmenutext() {
  fill(255);
  textAlign(CENTER);
  text("Shooting Gallery", width/2-90, height/2-30);
  text("Maze Craze", width/2+90, height/2-30);
  text("Pong", width/2-90, height/2+105);
  text("Soccer Shootout", width/2+90, height/2+105);
  frameRate(7);
  fill(random(255), random(255), random(255));
  textSize(64);
  text("Main Menu", mainmenux, mainmenuy - 165);
  textSize(16);
  fill(255);
  text("Choose What You Want To Play", mainmenux, mainmenuy - 125);
}


void keyPressed() {
  if (game1 == true) {
    if (key == ' ') {
      if (Shoot()) {
        bullets.add(new Bullet());
      }
    }
  }
  if (game4 == true) {
    if (key==' ') {
      velBall.x=-speed;
      acc.x=-NegAccB;
      acc.y= 0;
      velBall.y=0;
    }
  }
}

/*This keyPressed function allows the player to control
 when the ball moves toward the goal, using the spacebar key*/

void win() {
  if (win == true) {
    background(WinScreen);
    text.returntomainmenubutton();
  }
}

void lose() {
  if (lose == true) {
    background(LoseScreen);
    text.returntomainmenubutton();
  }
}

