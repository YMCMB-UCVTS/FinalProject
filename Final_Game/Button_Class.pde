class Button {

  PVector loc;
  int rectw;
  int recth;
  PImage Button;

  Button(int x, int y, String name) {
    loc = new PVector((width/2) - x, (height/2)+ y);
    rectw = 100;
    recth = 100;
    Button = loadImage(name);
  }

  void display(int x, int y) {
    imageMode(CORNER);
    image(Button, loc.x, loc.y, rectw + x, recth + y);
  }

  boolean selected() {
    if (mousePressed && mouseX>loc.x && mouseX<loc.x+rectw && mouseY>loc.y && mouseY<loc.y+recth) {
      return true;
    }
    else {
      return false;
    }
  }
}

