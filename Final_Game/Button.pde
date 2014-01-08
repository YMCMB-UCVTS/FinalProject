class Button {

  PVector loc;
  int s;

  Button(int x, int y) {
    loc = new PVector((width/2) - x, (height/2)- y);
    s = 40;
  }

  void display() {
    rect(loc.x, loc.y, s, s);
  }

  void mousePressed(Game1 g1, Game2 g2, Game3 g3, Game4 g4) {
    if (mouseX>loc.x&&mouseX<loc.x+s&&mouseY>loc.y&&mouseY<loc.y+s) {
      run = !run;
    }
  }
}

