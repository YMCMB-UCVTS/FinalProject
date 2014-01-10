PVector ballloc;
PVector ballvel;
int ballr=15;
PVector pad1loc;
int move = 2;
int padWidth = 10;
int padHeight = 60;
PVector pad2loc;
void setup () {
  size(500,500);
  ballloc= new PVector(width/2,height/2);
  ballvel= new PVector(2,2.5);
  pad1loc= new PVector(0,height/2);
  pad2loc= new PVector(width-padWidth,height/2);
  
  
}

void draw() {
 background (12,242,167);
 ellipse (ballloc.x, ballloc.y, ballr, ballr);
 rect(pad1loc.x, pad1loc.y, padWidth, padHeight);
 rect(pad2loc.x, pad2loc.y, padWidth, padHeight);
 ballloc.add(ballvel); 
  if(ballloc.x+ballr/2>width){
    ballvel.x*=-1;
  }
  if (ballloc.x-ballr/2<0) {
    ballvel.x*=-1;
  }
  if (ballloc.y+ballr/2>height) {
    ballvel.y*=-1;
  }
  if (ballloc.y-ballr/2<0) {
    ballvel.y=-ballvel.y;
  }
  if (keyPressed == true && key == 'w' && pad1loc.y>0){
      pad1loc.y-=2.5;
  }
  if (keyPressed == true && key == 's' && pad1loc.y+padHeight<height){
      pad1loc.y+=2.5;
  }
  if (keyPressed == true && key == 'i' && pad2loc.y>0){
      pad2loc.y-=2.5;
  }
  if (keyPressed == true && key == 'k' && pad2loc.y+padHeight<height){
      pad2loc.y+=2.5;
  }
}


