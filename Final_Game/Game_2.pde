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
    background(0);
    fill(55, 0, 100);
    ellipse(loc.x, loc.y, d, d);
    rect(locmenuB.x, locmenuB.y, menuBW, menuBH);
  }

  void move() {
    loc.add(vel);
    if (loc.x > width-d || loc.x <0) {
      vel.mult(-1);
    }
  }
}

