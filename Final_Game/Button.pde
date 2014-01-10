class Button {

  PVector loc;

  Button(int x, int y) {
    loc = new PVector((width/2) - x, (height/2)- y);
    s = 80;
  }

  void display() {
    rect(loc.x, loc.y, s, s);
  }

  boolean selected() {
    if (mousePressed && mouseX>loc.x&&mouseX<loc.x+s&&mouseY>loc.y&&mouseY<loc.y+s) {
      return true;
    }
    else {
      return false;
    }
  }
}

