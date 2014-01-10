PImage mazeLevel1;

void setup(){
  size(550,550);
  mazeLevel1 = loadImage ("maze.png");
}

void draw() {
  background (#FFFFFF);
  image (mazeLevel1,0,0);
}


