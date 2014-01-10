PVector locG;
PVector locGoal;
PVector loc;
PVector velG;
PVector vel;
PVector acc;
float NegAccB;
int d;
int speed=10;
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
  vel = new PVector (speed, speed);
  NegAccB = .1;
  acc = new PVector (0,0);
  d = 50;
}

void draw() {
  background(Field);
  image(goal, locG.x, locG.y, 150, height/1.55);
  image(ball, loc.x, loc.y, d, d);
  image(goalie,locGoal.x, locGoal.y,150, 200);
  loc.add(vel);
  vel.sub(acc);
  locGoal.add(velG);
  if (locGoal.y+200>height) {
    velG.y*=-1;
  }
  if (locGoal.y<0) {
    velG.y*=-1;
  }
}
void keyPressed() {
  if (key=='a') {
    vel.x=-speed;
    acc.x=-NegAccB;
    acc.y= 0;
    vel.y=0;
  }
  if (key=='d') {
    vel.x=speed;
    acc.x=NegAccB;
    acc.y=0;
    vel.y=0;
  }
  if (key=='w') {
    vel.y=-speed;
    acc.y=-NegAccB;
    acc.x=0;
    vel.x=0;
  }
  if (key=='s') {
    vel.y=speed;
    acc.y=NegAccB;
    acc.x=0;
    vel.x=0;
  }
}












