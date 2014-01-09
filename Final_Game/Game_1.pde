class Game1 {
  PVector loc;
  PVector vel;
  int d;

  Game1() {
    loc = new PVector(width/2, height/2);
    vel = new PVector(3, 0);
    d = 50;
  }

  void display() {
    fill(255, 0, 0);
    ellipse(loc.x, loc.y, d, d);
  }

  void move() {
    loc.add(vel);
    if (loc.x > width-d || loc.x <0) {
      vel.mult(-1);
    }
  }
}

