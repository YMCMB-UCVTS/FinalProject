Elephant object;

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
PVector ElephantLoc;

void setup() {
  size(550, 500);
  mazeLevel1 = loadImage ("maze.png");
  mazeLevel2 = loadImage ("elephant.png");
  mazeLevel3 = loadImage ("lion.png");
  LoadingScreenMaze = loadImage("LoadingScreenMaze.png");
  winScreenimage = loadImage ("winScreen.jpg");
  ElephantLoc = new PVector(width/2, height/2);
  INTROMAZE = true;
}

void intromaze() {
  if (INTROMAZE) {
    if (millis() < 4000) {
      background(LoadingScreenMaze);
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
      object.display();
      object.move();
      fill (0);      
      text ("Get to the teal box", width/2, 35);
      fill (133, 161, 84);                                                                           //exact color of the wall 
      noStroke(); 
      rect (520, 277, 22, 50);                                                                       //rectangle that is the same color of wall in maze 1 that prevents cheating
      fill (84, 160, 141); 
      stroke(2);
      rect (475, 285, 30, 80);        //coordinates of the teal box
      if ( get (ElephantLoc.x, ElephantLoc.y) == color(133, 161, 84)) {                                               //when you hit maze levels in level 1 (green)
        endScreen = true;                                                                            //game over screen
      }
      if (get (ElephantLoc.x, ElephantLoc.y) == color (84, 160, 141)) {                                           //getting to the teal box increases the value of x
        x++;
      }
    }
    if (x==1) {                                                                                //since intial value of x is 0, getting to teal box gets to 1, bringing you to level 2
      background (mazeLevel2);
      fill (0);
      text("Get to the lavender box", width/2, 469);
      fill (128, 128, 255);                                                                               //lavender box
      rect ( 120, 0, 80, 30);
      if  (get (ElephantLoc.x, ElephantLoc.y) == color (84, 160, 141)) {
      }
    }
    if (get (ElephantLoc.x, ElephantLoc.y) == color (128, 128, 255)) {                                               //getting to the lavender box increases the value of x
      x++;
    }
    if (x == 2) {                                                                               //increasing the value of x, x equals 2, bringing you to maze level 3
      background (mazeLevel3);
      fill (0);
      rect (430, 425, 74, 50);                                                                               //black square
    }
    if (get(ElephantLoc.x, ElephantLoc.y) == color (0)) {
      winScreen = true;                                                                             //when you get to black box, winScreen equals true
    }
    if (get (ElephantLoc.x, ElephantLoc.y) == color (212, 153, 9)) {                                                     //when you touch the walls of the third maze, game over
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
  if (get (ElephantLoc.x, ElephantLoc.y) == color (46, 108, 164)) {                                                         //when you hit maze walls in level 2 (blue)
    endScreen = true;                                                                                          //...game over
  }                                                                                    //"puts image on mouse"
}

