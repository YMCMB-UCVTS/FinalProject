class Duck { //creating class for duck
  PVector TargetLoc; //PVector for the location of the target
  PVector  TargetVel; //PVector for the velocity of the target
  int Target ; //variable for the target
  PImage duck; //declaring image for the target
  boolean grey; //true/false statement for grey
  boolean andy; //true/false statement for andy

    Duck() {
    TargetLoc = new PVector (110, height*.57); //ets a location for the target
    TargetVel = new PVector (2, 0); //sets a velocity for the target
    Target = 80; //sets a size for the target
    number = int(random(1, 3)); //selects a random number between 1-3
    grey = false; //sets grey to be false
    andy = false; //sets andy to be false
    if (number == 1) { //if the variable number is equal to one
      grey = true; //grey is true
    }
    if (score == 29) { //if the variable score is equal to 29
      number = 3; //the variable number is equal to three
      if (number == 3) { //the the variable number is equal to three
        andy = true; //the boolean andy is true
      }
    }
    duck = loadImage("Duck"+number+".png"); //load image for the target depending on the number
  }

  void displayTarget() { //create funtion to display the target
    image(duck, TargetLoc.x, TargetLoc.y, Target, Target); //loads image and puts it in location
  }

  void moveTarget() { //function to move the target
    TargetLoc.add(TargetVel); //adds velocity PVector to location PVector
    if (score>=15) { //if the score is greater than or equal to 5
      TargetVel = new PVector(3.8, 0); //new velocity PVector
    }
  }

  boolean checkBullet(Bullet b) {  //creats boolean to check contact
    if (TargetLoc.dist(b.BulletLoc) < Target/8 + b.Bullet/2) { //if the distance between the location of the target and the location of the bullet is less than the sum of their radii
      return true; //it is true
    }
    else { //otherwise
      return false; //it is false
    }
  }
}

