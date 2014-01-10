class Game4 {
  PVector loc;
  PVector vel;
  int d;

  Game4() {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, -3);
    d = 50;
  }

  void display() {
    background(0);
    fill(0, 0, 255);
    ellipse(loc.x, loc.y, d, d);
  }

  void move() {
    loc.add(vel);
    if (loc.y > height-d || loc.y <0) {
      vel.mult(-1);
    }
  }
}
