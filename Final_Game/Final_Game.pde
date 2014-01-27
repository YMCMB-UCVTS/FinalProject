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
int introgametime;

void setup() {
  size(550, 500);
  intro = loadImage("Intro.jpeg"); //introdcution image
  ShooterBackground = loadImage("ShooterBackground.png");
  INTRO = true; //initial conditions
  game1 = false;
  game2 = false;
  game3 = false;
  game4 = false;
  instructions = false;
  menuB = false;
  menuBW = 80;
  menuBH = 40;
  locmenuB = new PVector(width-(menuBW+20), menuBH + 30);
  mainmenux = width/2;
  mainmenuy = height/2;
  minim = new Minim(this);
  player = minim.loadFile("Intro.mp3"); 
  player.play(); 
  b1 = new Button(140, -20, "SGButton.png"); //buttons for each game
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
  if (!INTRO && Mainmenugoaway == false) { //conditions for main menu screen
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
  if (INTRO) { //introduction to game
    if (millis() < 5000) { //5 second timer
      imageMode(CENTER);
      image(intro, width/2, height/2, 150, 150);
    }
    else { //if not intro, main menu screen
      introTime = millis()+4000;
      INTRO = false;
      player.close();
      player = minim.loadFile("MainMenuMusic.mp3");
      player.loop();
    }
  }
}

void draw() {
  background(0);
  intro(); //intro function
  menu(); //main menu function
  choosegame(); //function for selecting each game
  win(); //function for win conditions
  lose(); //function for lose conditions
}

void stop() { 
  player.close();//music stops playing
  minim.stop(); //plays one song and stops other
  super.stop(); //stops all music
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
      player.close();\
      player = minim.loadFile("MainMenuMusic.mp3");
      player.loop();//loops music playing
    }
  }
  if (Mainmenugoaway == false && INTRO == false) { //choosing the button for each game
    if (b1.selected()) { //shooting gallery button pressed
      introgametime = millis() + 10000; //intro timer begins
      Mainmenugoaway = true; //main menu disappears
      game1 = true; //shooting gallery appears
      StartMiniGame = millis() + 10000;
      ShootingGallerySetup();
      game2 = false; //all other booleans become false when one is true
      game3 = false;
      game4 = false;
      instructions = false;
    }
    if (b2.selected()) { //maze button pressed
      introgametime = millis() + 10000; //intro timer begins
      Mainmenugoaway = true; //main menu disappears
      game2 = true; //maze appears
      StartMiniGame = millis() + 10000;
      MazeSetup();
      game1 = false;
      game3 = false;
      game4 = false;
      instructions = false;
    }
    if (b3.selected()) { //pong button pressed
      introgametime = millis() + 10000; //intro timer begins
      Mainmenugoaway = true; //main menu disappears
      game3 = true; //pong appears
      StartMiniGame = millis() + 10000;
      PongSetup();
      game1 = false;
      game2 = false;
      game4 = false;
      instructions = false;
    }
    if (b4.selected()) { //soccer button pressed
      introgametime = millis() + 10000; //intro timer begins
      Mainmenugoaway = true; //main menu disappears
      game4 = true; //soccer appears
      StartMiniGame = millis() + 10000;
      player.close();//stops music playing before
      player = minim.loadFile("LoadScreenSoccerMusic.mp3");
      player.loop(); 
      SoccerSetup();
      game1 = false;
      game2 = false;
      game3 = false;
      instructions = false;
    }
    if (b5.selected()) { //instructions button pressed
      Mainmenugoaway = true; //main menu disappears
      instructions = true; //instructions appear
      game1 = false;
      game2 = false;
      game3 = false;
      game4 = false;
    }
  }
}


void choosegame() { //when each game is selected, in playing state, not lose or win screens
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

void mainmenutext() { //text in each button and on menu
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

void win() { //win conditions 
  if (win == true) { //specifically for pong
    if (game3 == true) {
      if (score1 == 7) {
        background(WinScreen);
        text("PLAYER 1 WINS!", width/2, height/2);
        textSize(14);
        text.returntomainmenubutton();
        player.close();
        player = minim.loadFile("WinningMusic.mp3");
        player.loop();
      }
      if (score2 == 7) {
        background(WinScreen);
        text("PLAYER 2 WINS!", width/2, height/2);
        textSize(14);
        text.returntomainmenubutton();
        player.close();
        player = minim.loadFile("WinningMusic.mp3");
        player.loop();
      }
    }
    else { //all other games
      background(WinScreen);
      textSize(14);
      text.returntomainmenubutton();
      player.close();
      player = minim.loadFile("WinningMusic.mp3");
      player.loop();
    }
  }
}

void lose() { //lose function, what occurs when player fails game
  if (lose == true) { 
    background(LoseScreen); //losescreen backround appears
    textSize(14);
    text.returntomainmenubutton();
    player.close();
    player = minim.loadFile("GameOverMusic.mp3"); //losing music
    player.loop();
  }
}

