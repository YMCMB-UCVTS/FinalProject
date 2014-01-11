PVector locGoal;
PVector locGoalie;
PVector locBall;
PVector velGoalie;
PVector velBall;
PVector acc;
float NegAccB;
int d;
int speed;
PImage Goal;
PImage Ball;
PImage Field;
PImage Goalie;


void setup () {
  Field = loadImage("Field.png");
  Goalie = loadImage("goalie.png");
  size(Field.width, Field.height);
  Goal = loadImage("goal.png");
  Ball = loadImage("ball.png");
  locGoal = new PVector(20, 113);
  locGoalie = new PVector(100,175);
  locBall = new PVector (100, 100);
  velGoalie =new PVector(0, 1);
  speed = 10;
  velBall = new PVector (0, 0);
  NegAccB = .1;
  acc = new PVector (0,0);
  d = 50;
}

void draw() {
  background(Field);
  image(Goal, locGoal.x, locGoal.y, 70, height/1.70);
  image(Ball, locBall.x, locBall.y, d, d);
  image(Goalie,locGoalie.x, locGoalie.y, 60, 75);
  locBall.add(velBall);
  velBall.sub(acc);
  locGoalie.add(velGoalie);
  if (locGoalie.y+200>height) {
    velGoalie.y*=-1;
  }
  if (locGoalie.y<0) {
    velGoalie.y*=-1;
  }
}

void keyPressed() {
  if (key=='a') {
    velBall.x=-speed;
    acc.x=-NegAccB;
    acc.y= 0;
    velBall.y=0;
  }
  if (key=='d') {
    velBall.x=speed;
    acc.x=NegAccB;
    acc.y=0;
    velBall.y=0;
  }
  if (key=='w') {
    velBall.y=-speed;
    acc.y=-NegAccB;
    acc.x=0;
    velBall.x=0;
  }
  if (key=='s') {
    velBall.y=speed;
    acc.y=NegAccB;
    acc.x=0;
    velBall.x=0;
  }
}
