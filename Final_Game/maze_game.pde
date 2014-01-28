Elephant first, second, third;
Timer timer2;
LoadBar loadbar2; //declare the class that will be used (elephant) so it can be displayed in the game

PImage mazeLevel1; 
PImage mazeLevel2;
PImage mazeLevel3;
boolean endScreen = false; 
boolean winScreen = false; 
PImage LoadingScreenMaze;
boolean INTROMAZE;
int IntroMazeTime; //declare PImages, booleans, and variables

void MazeSetup() { //initialize a variable for everything
  mazeLevel1 = loadImage ("maze.png");
  mazeLevel2 = loadImage ("elephant.png");
  mazeLevel3 = loadImage ("lion.png");
  LoadingScreenMaze = loadImage("LoadingScreenMaze.png"); //images are loaded for their respective PImage
  INTROMAZE = true;
  first = new Elephant(23, 319);
  second = new Elephant(486, 442);
  third = new Elephant(86, 52);
  timer2 = new Timer();
  loadbar2 = new LoadBar(); //intializing classes
}

void intromaze() {
  if (INTROMAZE) { //this is the intro for the maze with the loading bar being displayed. this happens only when INTROMAZE is true
    if (millis() < introgametime) {
      background(LoadingScreenMaze);
      loadbar2.displayBar();
    }
    else { // when INTROMAZE is false, this will happen.
      player.close();
      player = minim.loadFile("MazeMusic.mp3");
      player.loop(); //previous music stops, new music is loaded, and then it plays.
      IntroMazeTime = millis()+4000; //seconds are added
      INTROMAZE = false; // INTROMAZE is false so now the game will run
    }
  }
}

void Maze() { //game will run
  frameRate(60);
  intromaze();
  if (!INTROMAZE) { //now that INTROMAZE is false, the game can run after the loading screen
    if (level == 0) {
      background (mazeLevel1);    //intial background is maze level 1
      fill (0);      
      text ("Get to the teal box", width/2, 35);
      fill (133, 161, 84);     //exact color of the wall 
      noStroke(); 
      rect (520, 277, 22, 50);      //rectangle that is the same color of wall in maze 1 that prevents cheating
      fill (84, 160, 141); 
      stroke(2);
      rect (475, 285, 30, 80);   //coordinates of the teal box
      first.checkElephant();
      first.display();
      first.move();
    }
    if (level==1) {            //since intial value of level is 0, getting to teal box gets to 1, bringing you to level 2
      background (mazeLevel2);
      noStroke();
      fill(46, 108, 164);
      rect(500, 400, 25, 70);  //prevents cheating
      fill (0);
      text("Get to the lavender box", width/2, 480);
      fill (128, 128, 255);        //lavender box
      rect ( 120, 0, 80, 30);
      second.checkElephant();
      second.display();
      second.move();
    }
    if (level == 2) {       //increasing the value of level, level equals 2, bringing you to maze level 3
      background (mazeLevel3);
      noStroke();
      fill(212, 153, 9);
      rect(50, 0, 25, 70);   //prevents cheating
      rect(100, 0, 25, 70);      //prevents cheating
      fill (0);
      rect (430, 425, 74, 50);    //black square
      third.checkElephant();  
      third.display();
      third.move();
    }
    if (endScreen == true || timer2.startgame - millis() <= 0) {  //effects of endScreen equaling true below
      level = 0; //resets the level so it can be played again
      first.ElephantAcc.set(0, 0);
      first.ElephantVel.set(0, 0);
      second.ElephantAcc.set(0, 0);
      second.ElephantVel.set(0, 0);
      third.ElephantAcc.set(0, 0);
      third.ElephantVel.set(0, 0); //elephant will stop moving
      lose = true; //lose is true so the losing screen will appear
      endScreen = false;
    }
    fill(0);
    textSize(30);
    timer2.display();
    if (winScreen == true) {
      level = 0; //resets the level so it can be played again
      first.ElephantAcc.set(0, 0);
      first.ElephantVel.set(0, 0);
      second.ElephantAcc.set(0, 0);
      second.ElephantVel.set(0, 0);
      third.ElephantAcc.set(0, 0);
      third.ElephantVel.set(0, 0); //elephant will stop moving
      win = true; //win is true so the winning screen will appear
      winScreen = false;
    }
  }
}

