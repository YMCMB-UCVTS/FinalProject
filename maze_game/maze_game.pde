PImage mazeLevel1;

void setup(){
  size(550,500);
  mazeLevel1 = loadImage ("maze.png");
}

void draw() {
  background (mazeLevel1);
  if( get (mouseX, mouseY) == color(133,161,84)){
    background (0);
  }
}


