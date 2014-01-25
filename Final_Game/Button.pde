class Button {

  PVector loc;
  int rectw;
  int recth;

  Button(int x, int y) {
    loc = new PVector((width/2) - x, (height/2)+ y);
    rectw = 80;
    recth = 80;
  }

  void display(int x, int y) {
    rect(loc.x, loc.y, rectw + x, recth + y);
  }

  boolean selected() {
    if (mousePressed && mouseX>loc.x && mouseX<loc.x+rectw && mouseY>loc.y && mouseY<loc.y+recth) {
      timer = new Timer();
      return true;
    }
    else {
      return false;
    }
  }
}

