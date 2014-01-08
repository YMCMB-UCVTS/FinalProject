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

  void mousePressed() {
    if (mouseX>loc.x&&mouseX<loc.x+s&&mouseY>loc.y&&mouseY<loc.y+s) {
      game1 = !game1;
      game2 = !game2;
      game3 = !game3;
      game4 = !game4;
    }
  }

  void chooseGame1(Game1 g1) {
    if (game1 == true && game2 == false && game3 == false && game4 == false) {
      g1.display();
      g1.move();
    }
  }
  void chooseGame2(Game2 g2) {
    if (game2 == true && game1 == false && game3 == false && game4 == false) {
      g2.display();
      g2.move();
    }
  }
  void chooseGame3(Game3 g3) {
    if (game3 == true && game1 == false && game2 == false && game3 == false) {
      g3.display();
      g3.move();
    }
  }
  void chooseGame4(Game4 g4) {
    if (game4 == true && game1 == false && game2 == false && game3 == false) {
      g4.display();
      g4.move();
    }
  }
}

