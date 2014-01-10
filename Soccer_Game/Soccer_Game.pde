PVector locG;
PVector locGoal;
PVector loc;
PVector velG;
PVector vel;
PVector acc;
PVector negG;
int d;
PImage goal;
PImage ball;
PImage Field;
PImage goalie;


void setup () {
  Field = loadImage("Field.jpg");
  goalie = loadImage("goalie.png");
  size(Field.width, Field.height);
  goal = loadImage("goal.png");
  ball = loadImage("ball.png");
  locG = new PVector(20, 175);
  locGoal = new PVector(150,175);
  loc = new PVector (100, 100);
  velG =new PVector(0, 1);
  vel = new PVector (1, 1);
  acc = new PVector (.1,.1);
  negG = new PVector(0, -1);
  d = 50;
}

void draw() {
  background(Field);
  image(goal, locG.x, locG.y, 150, height/1.55);
  image(ball, loc.x, loc.y, d, d);
  image(goalie,locGoal.x, locGoal.y,150, 200);
  loc.add(vel);
  vel.add(acc);
  locGoal.add(velG);
  if (locG.y>height) {
    locG.add(velG);
  }
  if (locG.y<0) {
    velG.add(negG);
  }
}
void keyPressed() {
  if (key=='a') {
    vel.x=-1;
    vel.y=0;
  }
  if (key=='d') {
    vel.x=1;
    vel.y=0;
  }
  if (key=='w') {
    vel.y=-1;
    vel.x=0;
  }
  if (key=='s') {
    vel.y=1;
    vel.x=0;
  }
}












