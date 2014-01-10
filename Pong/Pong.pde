PVector ballloc;
PVector ballvel;
int ballr=15;
PVector pad1loc;
int move = 2;
int padWidth = 10;
int padHeight = 50;
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
}
/*if (b+40>height) {
  b=-bSpeed;
}
if (b-40<0) {
  b=-bSpeed;

rect (c,d,20,40);
d+=dSpeed;

if (d+40>height) {
  d=-dSpeed;
}
}

void keyPressed(){*/

