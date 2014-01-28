import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*; //this imports a music library

Minim minim;
AudioPlayer player; //these will allow to intialize the music

Button b1, b2, b3, b4, b5; // declare button class so it can be used in the actual code
Instructions text; // declare the instructions class so it can be used in the actual code

PImage intro; //declare PImage for the intro image
PImage WinScreen; //declare PImage for the winningscreen image
PImage LoseScreen; //declare PImage for the losing screen image
boolean INTRO; //declare booleans that will help decide if the intro screen is done or not so the main menu screen can display
boolean game1; //declare booleans that will help for the games to run when the buttons are clicked
boolean game2; //declare booleans that will help for the games to run when the buttons are clicked
boolean game3; //declare booleans that will help for the games to run when the buttons are clicked
boolean game4; //declare booleans that will help for the games to run when the buttons are clicked
boolean instructions; //declare booleans that will help for the games to run when the buttons are clicked
boolean win; //declare booleans that will help to know that the game has been won
boolean lose; //declare booleans that will help to know that the game has been lost
boolean Mainmenugoaway; //declare booleans that will help to remove the main menu if one of the buttons are clicked
PVector locmenuB; //declare Pvector for the location of the return to main menu button
PVector INTROIMAGELOC; //declare Pvector for the location of the intro image
PVector INTROIMAGEVEL; //declare Pvector for the velocity of the intro image
int menuBH; //declare variable for the height of the return to main menu button
int menuBW; //declare variable for the width of the return to main menu button
int introTime; //declare variable for the time it will take for the intro to display
int mainmenux; //declare variable for the x location of the main menu text
int mainmenuy; //declare variable for the y location of the main menu text
int score; //declare variable for the score
int level; //declare variable for the level
int StartMiniGame; //declare variable so that time will reset for each mini game
int introgametime; //declare variable so that time will reset for each mini game's loading screen

void setup() {
  size(550, 500); //size of the display screen
  intro = loadImage("Intro.JPG"); //introduction image
  INTRO = true; //the boolean is true so that the intro is displayed initially
  game1 = false; //the boolean is false so that the game is not displayed initially
  game2 = false; //the boolean is false so that the game is not displayed initially
  game3 = false; //the boolean is false so that the game is not displayed initially
  game4 = false; //the boolean is false so that the game is not displayed initially
  instructions = false; //the boolean is false so that the instructions is not displayed initially
  menuBW = 80; //intialize value
  menuBH = 40; //intialize value
  locmenuB = new PVector(width-(menuBW+20), menuBH + 30); //intialize value
  mainmenux = width/2; //intialize value
  mainmenuy = height/2; //intialize value
  minim = new Minim(this); //initializes for music
  player = minim.loadFile("Intro.mp3"); //loads the music file
  player.play();  //plays the music
  b1 = new Button(140, -20, "SGButton.png"); //initializes class and displays it
  b2 = new Button(-40, -20, "MazeButton.png"); //initializes class and displays it
  b3 = new Button(140, 120, "PongButton.png"); //initializes class and displays it
  b4 = new Button(-40, 120, "SoccerButton.png"); //initializes class and displays it
  b5 = new Button(103, -125, "Instructions.png"); //initializes class and displays it
  text = new Instructions(); //initializes class and displays it
  Mainmenugoaway = false; //the boolean is false so that the main menu is displayed initially
  win = false; //the boolean is false so that the winning screen is not displayed initially
  lose = false; //the boolean is false so that the losing screen is not displayed initially
  WinScreen = loadImage("Winner.png"); //loads the winning screen image
  LoseScreen = loadImage("Loser.png");  //loads the losing screen image
  INTROIMAGELOC = new PVector(-200, height/2); //intialize value
  INTROIMAGEVEL = new PVector(1, 0); //intialize value
}


void menu() { //menu function
  if (!INTRO && Mainmenugoaway == false) { //when intro is false and mainmenugoaway is false this will happen
    background(0); //background color is black
    b1.display(0, 0); //button is displayed
    b2.display(0, 0); //button is displayed
    b3.display(0, 0); //button is displayed
    b4.display(0, 0); //button is displayed
    b5.display(100, -20); //button is displayed
    mainmenutext(); //function is displayed
  }
}

void intro() { //intro function
  if (INTRO) { //introduction to game
    if (millis() < 15000) { //15 second timer
      textAlign(CENTER); //text alignment is the center
      textSize(30); //the text size
      text("A BANG BANG PRODUCTION", INTROIMAGELOC.x, INTROIMAGELOC.y + 200); //the text is displayed
      imageMode(CENTER); //the image alignment is the center
      image(intro, INTROIMAGELOC.x, INTROIMAGELOC.y, 400, 300); //intro image will be displayed
      INTROIMAGELOC.add(INTROIMAGEVEL); //this allows for the intro image to move because velocity is added to the location of the intro image
      if (INTROIMAGELOC.x == width/2) { //if the intro image has reached the center then...
        INTROIMAGEVEL.set(0, 0); //the intro image will stop moving
      }
    }
    else { //if not intro, main menu screen
      introTime = millis()+4000; //the intro time is added by four seconds
      INTRO = false; //boolean is false so the intro screen is no longer displayed
      player.close(); //stop the intro music
      player = minim.loadFile("MainMenuMusic.mp3"); //load the main menu music
      player.loop(); //play and loop the main menu music
    }
  }
}

void draw() {
  background(0); //color of the background for the main menu
  intro(); //intro function
  menu(); //main menu function
  choosegame(); //function for selecting each game
  win(); //function for win conditions
  lose(); //function for lose conditions
}

void stop() { //function that allows music to stop playing
  player.close();//music stops playing
  minim.stop(); //plays one song and stops other
  super.stop(); //stops all music
}


void mousePressed() { //function that makes something happen if the mouse is clicked (this is for the return to main menu button)
  if (mouseX > locmenuB.x && mouseX < locmenuB.x + menuBW  && mouseY > locmenuB.y && mouseY < locmenuB.y + menuBH) { //when the button is clicked then... 
    if (win == true || lose == true || instructions == true) { //if one of these is true then...
      Mainmenugoaway = false; //boolean is false so the main menu will appear
      game1 = false; //boolean is false so the game is no longer playing and the player is returned to the main menu
      game2 = false; //boolean is false so the game is no longer playing and the player is returned to the main menu
      game3 = false; //boolean is false so the game is no longer playing and the player is returned to the main menu
      game4 = false; //boolean is false so the game is no longer playing and the player is returned to the main menu
      instructions = false; //boolean is false so the instructions is no longer displaying and the player is returned to the main menu
      win = false; //boolean is false so that the winning screen is no longer displaying and the player is returned to the main menu
      lose = false;  //boolean is false so that the losing screen is no longer displaying and the player is returned to the main menu
      player.close();// stops the music that was playing before
      player = minim.loadFile("MainMenuMusic.mp3"); //loads the main menu music again
      player.loop();//loops music playing
    }
  }
  if (Mainmenugoaway == false && INTRO == false) { //choosing the button for each game
    if (b1.selected()) { //shooting gallery button pressed
      introgametime = millis() + 10000; //intro timer begins
      Mainmenugoaway = true; //main menu disappears
      game1 = true; //shooting gallery appears
      StartMiniGame = millis() + 10000; //add 10 seconds to the game (allowing for the loadbar to work)
      ShootingGallerySetup(); //function for the setup of the shooting gallery game
      game2 = false; //all other booleans become false when one is true
      game3 = false; //all other booleans become false when one is true
      game4 = false; //all other booleans become false when one is true
      instructions = false; //all other booleans become false when one is true
    }
    if (b2.selected()) { //maze button pressed
      introgametime = millis() + 10000; //intro timer begins
      Mainmenugoaway = true; //main menu disappears
      game2 = true; //maze appears
      StartMiniGame = millis() + 10000; //add 10 seconds to the game (allowing for the loadbar to work)
      MazeSetup(); //function for the setup of the maze game
      game1 = false; //all other booleans become false when one is true
      game3 = false; //all other booleans become false when one is true
      game4 = false; //all other booleans become false when one is true
      instructions = false; //all other booleans become false when one is true
    }
    if (b3.selected()) { //pong button pressed
      introgametime = millis() + 10000; //intro timer begins
      Mainmenugoaway = true; //main menu disappears
      game3 = true; //pong appears
      StartMiniGame = millis() + 10000; //add 10 seconds to the game (allowing for the loadbar to work)
      PongSetup(); //function for the setup of the pong game
      game1 = false; //all other booleans become false when one is true
      game2 = false; //all other booleans become false when one is true
      game4 = false; //all other booleans become false when one is true
      instructions = false; //all other booleans become false when one is true
    }
    if (b4.selected()) { //soccer button pressed
      introgametime = millis() + 10000; //intro timer begins
      Mainmenugoaway = true; //main menu disappears
      game4 = true; //soccer appears
      StartMiniGame = millis() + 10000; //add 10 seconds to the game (allowing for the loadbar to work)
      player.close();//stops music playing before
      player = minim.loadFile("LoadScreenSoccerMusic.mp3"); //load the music for the loading screen for soccer
      player.loop(); //play and loop the music//
      SoccerSetup(); //function for the setup of the soccer game
      game1 = false; //all other booleans become false when one is true
      game2 = false; //all other booleans become false when one is true
      game3 = false; //all other booleans become false when one is true
      instructions = false; //all other booleans become false when one is true
    }
    if (b5.selected()) { //instructions button pressed
      Mainmenugoaway = true; //main menu disappears
      instructions = true; //instructions appear
      game1 = false; //all other booleans become false when one is true
      game2 = false; //all other booleans become false when one is true
      game3 = false; //all other booleans become false when one is true
      game4 = false; //all other booleans become false when one is true
    }
  }
}


void choosegame() { //when each game is selected, in playing state, not lose or win screens
  if (game1 == true) {
    lose = false; //lose is false so the game can restart after playing it once
    win = false; //win is false so the game can restart after playing it once
    ShootingGallery(); //when game 1 is true, the shooting gallery game will work
  }
  if (game2 == true) {
    lose = false; //lose is false so the game can restart after playing it once
    win = false; //win is false so the game can restart after playing it once
    Maze(); //when game 2 is true, the maze game will work
  }
  if (game3 == true) {
    lose = false; //lose is false so the game can restart after playing it once
    win = false; //win is false so the game can restart after playing it once
    Pong(); //when game 3 is true, the pong game will work
  }
  if (game4 == true) {
    lose = false; //lose is false so the game can restart after playing it once
    win = false; //win is false so the game can restart after playing it once
    Soccer(); //when game 4 is true, the soccer game will work
  }
  if (instructions == true) {
    lose = false; //lose is false so the game can restart after playing it once
    win = false; //win is false so the game can restart after playing it once
    text.display(); 
    text.returntomainmenubutton(); //when instructions is true, the text and return to main menu button will display
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
  text("Choose What You Want To Play", mainmenux, mainmenuy - 125); //this is all the text that goes in the main menu screen
}

/*This keyPressed function allows the player to control
 when the bullet or ball (depending on the game) will be shot, using the spacebar key*/
void keyPressed() {
  if (game1 == true) {
    if (key == ' ') { //if the spacebar is pressed
      if (Shoot()) { //if shoot is true
        bullets.add(new Bullet()); //add a new bullet to the array
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
      if (score1 == 7) { //this is the winning screen for player 1 in pong
        background(WinScreen);
        fill(0);
        text("PLAYER 1 WINS!", width/2, height/2);
        textSize(14);
        text.returntomainmenubutton(); //return to main menu button displays
      }
      if (score2 == 7) {
        background(WinScreen);
        fill(0);
        text("PLAYER 2 WINS!", width/2, height/2); //this is the winning screen for player 1 in pong
      }
      else { //universal winning screen for all other games
        background(WinScreen);
        textSize(14);
        text.returntomainmenubutton();  //return to main menu button displays
      }
    }
  }

  void lose() { //lose function, what occurs when player fails game
    if (lose == true) { 
      background(LoseScreen); //losescreen backround appears
      textSize(14);
      text.returntomainmenubutton(); //return to main menu button displays
    }
  }

