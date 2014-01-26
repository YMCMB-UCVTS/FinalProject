class LoadBar {

  PVector locLoadBar;
  PVector locLoadBar2;
  int LoadBarH;
  float LoadBarW;
  float LoadBar2W;
  int LoadBar2H;

  LoadBar() {
    LoadBarH = 20;
    LoadBarW = 300;
    LoadBar2W = 0;
    LoadBar2H = LoadBarH;
    locLoadBar = new PVector((width/2), (height/2)-120);
    locLoadBar2 = new PVector((width/2), (height/2)-120);
  }
  
  void display() {
    textAlign(CENTER);
    fill(255, 0, 0);
    textSize(30);
    text("Loading. . .", locLoadBar.x+10, locLoadBar.y - 30);
    fill(0);
    rectMode(CENTER);
    rect(locLoadBar.x, locLoadBar.y, LoadBarW, LoadBarH);
    fill(255, 0, 0);
    rectMode(CORNER);
    rect(locLoadBar2.x-(LoadBarW/2), locLoadBar2.y-(LoadBarH/2), LoadBar2W, LoadBar2H);
    LoadBar2W+=0.8;
    if (LoadBar2W == LoadBarW) {
      LoadBar2W-=0.8;
    }
  }
}

