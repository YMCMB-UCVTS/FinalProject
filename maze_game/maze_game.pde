Elephant e;

PImage mazeLevel1; 
PImage mazeLevel2;
PImage mazeLevel3;
boolean endScreen = false; 
PImage winScreenimage;
boolean winScreen = false; 
int x; 
PImage LoadingScreenMaze;
boolean INTROMAZE;
int IntroMazeTime;
/*PVector locLoadBar;
 PVector locLoadBar2;
 int LoadBarH;
 float LoadBarW;
 float LoadBar2W;
 int LoadBar2H; */

void setup() {
  size(550, 500);
  mazeLevel1 = loadImage ("maze.png");
  mazeLevel2 = loadImage ("elephant.png");
  mazeLevel3 = loadImage ("lion.png");
  LoadingScreenMaze = loadImage("LoadingScreenMaze.png");
  winScreenimage = loadImage ("winScreen.jpg");
  /*LoadBarH = 20;
   LoadBarW = 300;
   LoadBar2W = 0;
   LoadBar2H = LoadBarH;
   locLoadBar = new PVector((width/2), (height/2)-160);
   locLoadBar2 = new PVector((width/2), (height/2)-160);*/
  INTROMAZE = true;
}

void intromaze() {
  if (INTROMAZE) {
    if (millis() < 10000) {
      background(LoadingScreenMaze);
      textAlign(CENTER);
      fill(255, 0, 0);
      textSize(30);
      /*text("Loading. . .", locLoadBar.x+10, locLoadBar.y - 30);
       text("Start with mouse outside of screen!", width/2, 469); 
       fill(255);
       rectMode(CENTER);
       rect(locLoadBar.x, locLoadBar.y, LoadBarW, LoadBarH);
       fill(255, 0, 0);
       rectMode(CORNER);
       rect(locLoadBar2.x-(LoadBarW/2), locLoadBar2.y-(LoadBarH/2), LoadBar2W, LoadBar2H);
       LoadBar2W+=0.8;
       if (LoadBar2W == LoadBarW) {
       LoadBar2W-=0.8;
       } */
    }
    else {
      IntroMazeTime = millis()+4000;
      INTROMAZE = false;
    }
  }
}

void draw() {
  intromaze();
  if (!INTROMAZE) { 
    if (x == 0) {
      background (mazeLevel1);          //intial background is maze level 1
      e.display();
      e.move();
      fill (0);      
      text ("Get to the teal box", width/2, 35);
      fill (133, 161, 84);                                                                           //exact color of the wall 
      noStroke(); 
      rect (520, 277, 22, 50);                                                                       //rectangle that is the same color of wall in maze 1 that prevents cheating
      fill (84, 160, 141); 
      stroke(2);
      rect (475, 285, 30, 80);        //coordinates of the teal box
      if ( get (mouseX, mouseY) == color(133, 161, 84)) {                                               //when you hit maze levels in level 1 (green)
        endScreen = true;                                                                            //game over screen
      }
      if (get (mouseX, mouseY) == color (84, 160, 141)) {                                           //getting to the teal box increases the value of x
        x++;
      }
    }
    if (x==1) {                                                                                //since intial value of x is 0, getting to teal box gets to 1, bringing you to level 2
      background (mazeLevel2);
      fill (0);
      text("Get to the lavender box", width/2, 469);
      fill (128, 128, 255);                                                                               //lavender box
      rect ( 120, 0, 80, 30);
      if  (get (mouseX, mouseY) == color (84, 160, 141)) {
      }
    }
    if (get (mouseX, mouseY) == color (128, 128, 255)) {                                               //getting to the lavender box increases the value of x
      x++;
    }
    if (x == 2) {                                                                               //increasing the value of x, x equals 2, bringing you to maze level 3
      background (mazeLevel3);
      fill (0);
      rect (430, 425, 74, 50);                                                                               //black square
    }
    if (get(mouseX, mouseY) == color (0)) {
      winScreen = true;                                                                             //when you get to black box, winScreen equals true
    }
    if (get (mouseX, mouseY) == color (212, 153, 9)) {                                                     //when you touch the walls of the third maze, game over
      endScreen = true;
    }
    if (endScreen == true) {                                                                         //effects of endScreen equaling true below
      background (0);
      fill(255);
      textSize(50);
      textAlign(CENTER);
      text("Game Over", width/2, height/2);
    }
  }
  if (winScreen == true) {
    background (winScreenimage);                                                                              //loads new background image when winScreen boolean is true
    textSize(50);
    textAlign(CENTER);
    text("YOU WON!", width/2, height/2);                                                                         //text loads when winScreen boolean is true
  }
  if (get (mouseX, mouseY) == color (46, 108, 164)) {                                                         //when you hit maze walls in level 2 (blue)
    endScreen = true;                                                                                          //...game over
  }                                                                                    //"puts image on mouse"
}

