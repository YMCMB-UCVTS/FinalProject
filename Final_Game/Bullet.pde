class Bullet {

  PVector BulletLoc;  //PVector for the location of the bullet
  PVector BulletVel;  //PVector for the velocity of the bullet
  int Bullet; //variable for the bullet

    Bullet() {
    BulletLoc = new PVector (width/2, height -100);  //coordinates for bullet location
    BulletVel = new PVector (0, -10); //velocity for bullet
    Bullet = 20; //size of bullet
  }

  void displayBullet() { //making a function to display the bulllet
    fill(150); //color to fill the bullet
    ellipse(BulletLoc.x, BulletLoc.y, Bullet, Bullet); //creating circle for bullet
    BulletLoc.add(BulletVel); //adding velocity to the location to move the bullet
  }
}

