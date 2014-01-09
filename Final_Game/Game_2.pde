class Game2 {
  PVector loc;
  PVector vel;
  int d;

  Game2() {
    loc = new PVector(width/2, height/2);
    vel = new PVector(-3, 0);
    d = 50;
  }

  void display() {
    fill(55, 0, 100);
    ellipse(loc.x, loc.y, d, d);
  }

  void move() {
    if (game2 == true) {
      loc.add(vel);
      if (loc.x > width-d || loc.x <0) {
        vel.mult(-1);
      }
    }
  }
}
