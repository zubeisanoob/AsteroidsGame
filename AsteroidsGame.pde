Spaceship bob; // declaring an instance of the spaceship object
Star [] stars; // declaring an array of instances of the star object
ArrayList <Asteroid> asteroids; // declare an arraylist with asteroid class
ArrayList <SmallAsteroid> smallAsteroids;
ArrayList <Bullet> bullets;

public void setup()
{
  stars = new Star[100]; // setting # of stars in screen
  bob = new Spaceship(); // initializing bob as a new spaceship
  asteroids = new ArrayList <Asteroid>();
  bullets = new ArrayList <Bullet>();
  smallAsteroids = new ArrayList <SmallAsteroid>();
  // initialize arraylist with instances of Asteroid (5 asteroids)
  for (int i = 0; i < 5; i++) {
    asteroids.add(new Asteroid());
  }
  // looping through each position in the stars array and initializing it to an instance of a star object
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  size(500, 500); // size of viewport
}

public void draw()
{
  
  background(0);
  if (asteroids.size() == 0 && smallAsteroids.size() == 0) {
    textSize(30);
    text("You won!", width/2 - 50, height/2);
    bob.changeXspeed(0);
    bob.changeYspeed(0);
  }
  // loops through stars and evokes show method to draw the stars
  for (int i = 0; i < stars.length; i++) {
    stars[i].show();
  }
  // moves bob based on its current velocity using the move method
  bob.move();
  // draws bob with the show method
  bob.show();
  // move then show each asteroid

  // render asteroids and destroy if it makes contact with space ship, then add two more small asteroids
  for (int i = 0; i < asteroids.size(); i++) {
    if (dist((float)bob.getX(), (float)bob.getY(), (float)asteroids.get(i).getX(), (float)asteroids.get(i).getY()) < 20) {
      smallAsteroids.add(new SmallAsteroid(asteroids.get(i).getX(), asteroids.get(i).getY()));
      smallAsteroids.add(new SmallAsteroid(asteroids.get(i).getX(), asteroids.get(i).getY()));
      asteroids.remove(i);
    } else {
      asteroids.get(i).move();
      asteroids.get(i).show();
    }
  }

  // if space ship hits small asteroid destroy it, otherwise move and render it
  for (int i = 0; i < smallAsteroids.size(); i++) {
    smallAsteroids.get(i).move();
    if (dist((float)bob.getX(), (float)bob.getY(), (float)smallAsteroids.get(i).getX(), (float)smallAsteroids.get(i).getY()) < 20) {
      smallAsteroids.remove(i);
    } else {
      smallAsteroids.get(i).show();
    }
  }

  // move and draw bullets
  for (int i = 0; i < bullets.size(); i++) {
    if (bullets.get(i).getIsOut() == true) {
      bullets.remove(i);
    } else {
      boolean passed = false;
      bullets.get(i).move();
      bullets.get(i).show();
      if (bullets.size() > 0 && asteroids.size() > 0 ) {
        for (int a = 0; a < asteroids.size(); a++) {
          // destroy asteroid if hit by laser
          if (dist((float)bullets.get(i).getX(), (float)bullets.get(i).getY(), (float)asteroids.get(a).getX(), (float)asteroids.get(a).getY()) < 20) {
            smallAsteroids.add(new SmallAsteroid(asteroids.get(i).getX(), asteroids.get(i).getY()));
            smallAsteroids.add(new SmallAsteroid(asteroids.get(i).getX(), asteroids.get(i).getY()));
            asteroids.remove(a);
            bullets.remove(i);
            passed = true;
          }
        }
      }
      if (smallAsteroids.size() > 0 && passed == false) {
        for (int s = 0; s < smallAsteroids.size(); s++) {
          if (dist((float)bullets.get(i).getX(), (float)bullets.get(i).getY(), (float)(smallAsteroids.get(s).getX()), (float)(smallAsteroids.get(s).getY())) < 20) {
            smallAsteroids.remove(s);
            bullets.remove(i);
            passed = true;
          }
        }
      }
    }
  }
  textSize(15);
  color(0, 0, 0);
  text("myCenterX:" + String.valueOf((int)(bob.getX())), 10, 20);
  text("myCenterY:" + String.valueOf((int)(bob.getY())), 10, 40); 
  text("myPointDirection:" + String.valueOf((int)(bob.getPointDirection())), 10, 60); 
  text("myXspeed:" + String.valueOf((int)(bob.getXspeed())), 10, 80); 
  text("myYspeed:" + String.valueOf((int)(bob.getYspeed())), 10, 100);
  
  // display spaceship values with text
  
}


public void keyPressed() {
  // whenever a key is pressed the velocity of the spaceship will increase by a certain amount
  // 87 = W; 65 = D; 68 = D; 32 = Space; 69 = E;
  // D = rotate right; W = increase velocity; A = rotate left; E = hyperspace; Space = shoot;
  if (keyCode == 68) {
    bob.turn(8);
  }
  if (keyCode == 65) {
    bob.turn(-8);
  }
  if (keyCode == 87) {
    bob.accelerate(.2);
  }
  if (keyCode == 83) {
    bob.changeXspeed(0);
    bob.changeYspeed(0);
  }
  if (keyCode == 69) {
    // uses the setter functions to set new random location for the space and change it's direction
    bob.changeX((int)(Math.random() * width));
    bob.changeY((int)(Math.random() * height));
    bob.changeDirection((int)(Math.random() * 360));
    bob.changeXspeed(0);
    bob.changeYspeed(0);
  }
  if (keyCode == 32) {
    bullets.add(new Bullet(bob));
  }
}
