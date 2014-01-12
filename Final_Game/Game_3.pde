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
    background(0);
    fill(0, 255, 0);
    ellipse(loc.x, loc.y, d, d);
    rect(locmenuB.x, locmenuB.y, menuBW, menuBH);
  }

  void move() {
    loc.add(vel);
    if (loc.y > height-d || loc.y <0) {
      vel.mult(-1);
    }
  }
}

