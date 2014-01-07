class Button {

  boolean run;
  PVector loc;
  int s;

  Button(int x, int y) {
    loc = new PVector((width/2) - x, (height/2)- y);
    s = 40;
    run = true;
  }

  void display() {
    rect(loc.x, loc.y, s, s);
  }

  void mousePressed() {
    if (mouseX>loc.x&&mouseX<loc.x+s&&mouseY>loc.y&&mouseY<loc.y+s) {
      run = !run;
    }
  }
}

