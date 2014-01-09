class Game3 {
  PVector loc;
  PVector vel;
  int d;

  Game3() {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 3);
    d = 50;
  }

  void display() {
    fill(0, 255, 0);
    ellipse(loc.x, loc.y, d, d);
  }

  void move() {
    if (game3 == true) {
      loc.add(vel);
      if (loc.y > height-d || loc.y <0) {
        vel.mult(-1);
      }
    }
  }
}
