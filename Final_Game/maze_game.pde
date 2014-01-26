Elephant first, second, third;

PImage mazeLevel1; 
PImage mazeLevel2;
PImage mazeLevel3;
boolean endScreen = false; 
PImage winScreenimage;
boolean winScreen = false; 
PImage LoadingScreenMaze;
boolean INTROMAZE;
int IntroMazeTime;
Timer timer2;

void MazeSetup() {
  size(550, 500);
  mazeLevel1 = loadImage ("maze.png");
  mazeLevel2 = loadImage ("elephant.png");
  mazeLevel3 = loadImage ("lion.png");
  LoadingScreenMaze = loadImage("LoadingScreenMaze.png");
  winScreenimage = loadImage ("winScreen.jpg");
  INTROMAZE = true;
  first = new Elephant(23, 319);
  second = new Elephant(486, 442);
  third = new Elephant(86, 52);
  timer2 = new Timer();
}

void intromaze() {
  if (INTROMAZE) {
    if (millis() < 10000) {
      background(LoadingScreenMaze);
    }
    else {
      IntroMazeTime = millis()+4000;
      INTROMAZE = false;
    }
  }
}

void Maze() {
  frameRate(60);
  intromaze();
  if (!INTROMAZE) { 
    if (level == 0) {
      background (mazeLevel1);                                                                      //intial background is maze level 1
      fill (0);      
      text ("Get to the teal box", width/2, 35);
      fill (133, 161, 84);                                                                           //exact color of the wall 
      noStroke(); 
      rect (520, 277, 22, 50);                                                                       //rectangle that is the same color of wall in maze 1 that prevents cheating
      fill (84, 160, 141); 
      stroke(2);
      rect (475, 285, 30, 80);                                                                          //coordinates of the teal box
      first.checkElephant();
      first.display();
      first.move();
    }
    if (level==1) {                                                                                //since intial value of x is 0, getting to teal box gets to 1, bringing you to level 2
      background (mazeLevel2);
      noStroke();
      fill(46, 108, 164);
      rect(500, 400, 25, 70);                                                               //prevents cheating
      fill (0);
      text("Get to the lavender box", width/2, 469);
      fill (128, 128, 255);                                                                               //lavender box
      rect ( 120, 0, 80, 30);
      second.checkElephant();
      second.display();
      second.move();
    }
    if (level == 2) {                                                                               //increasing the value of x, x equals 2, bringing you to maze level 3
      background (mazeLevel3);
      noStroke();
      fill(212, 153, 9);
      rect(50, 0, 25, 70);                                                                       //prevents cheating
      rect(100, 0, 25, 70);                                                                                //prevents cheating
      fill (0);
      rect (430, 425, 74, 50);                                                                      //black square
      third.checkElephant();  
      third.display();
      third.move();
    }
    if (endScreen == true || timer2.startgame - millis() == 0) {                                                                         //effects of endScreen equaling true below
      lose = true;
    }
    fill(0);
    textSize(30);
    timer2.display();
    if (winScreen == true) {
      win = true;
    }
  }
}

