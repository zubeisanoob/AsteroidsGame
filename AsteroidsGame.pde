Spaceship bob; // declaring an instance of the spaceship object
Star [] stars; // declaring an array of instances of the star object
ArrayList <Asteroid> asteroids; // declare an arraylist with asteroid class
public void setup()
{
  stars = new Star[100]; // setting # of stars in screen
  bob = new Spaceship(); // initializing bob as a new spaceship
  asteroids = new ArrayList <Asteroid>();
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
  // loops through stars and evokes show method to draw the stars
  for (int i = 0; i < stars.length; i++) {
    stars[i].show();
  }
  // moves bob based on its current velocity using the move method
  bob.move();
  // draws bob with the show method
  bob.show();
  // move then show each asteroid
  for (int i = 0; i < 5; i++) {
    asteroids.get(i).move();
    asteroids.get(i).show();
  }
  // display spaceship values with text
  textSize(15);
  text("myCenterX:" + String.valueOf((int)(bob.myCenterX)), 10, 20);
  text("myCenterY:" + String.valueOf((int)(bob.myCenterY)), 10, 40); 
  text("myPointDirection:" + String.valueOf((int)(bob.myPointDirection)), 10, 60); 
  text("myXspeed:" + String.valueOf((int)(bob.myXspeed)), 10, 80); 
  text("myYspeed:" + String.valueOf((int)(bob.myYspeed)), 10, 100);
}

public void keyPressed() {
  // whenever a key is pressed the velocity of the spaceship will increase by a certain amount
  // 87 = W; 65 = D; 68 = D; 32 = Space; 69 = E;
  // D = rotate right; W = increase velocity; A = rotate left; E = hyperspace; Space = shoot;
  if (keyCode == 68) {
    bob.turn(4);
  }
  if (keyCode == 65) {
    bob.turn(-4);
  }
  if (keyCode == 87) {
    bob.accelerate(.1);
  }
  if (keyCode == 69) {
    // uses the setter functions to set new random location for the space and change it's direction
    bob.changeX((int)(Math.random() * width));
    bob.changeY((int)(Math.random() * height));
    bob.changeDirection((int)(Math.random() * 360));
    bob.changeXspeed(0);
    bob.changeYspeed(0);
  }
  /*
  if (keyCode == 32) {
    bob.shoot();
  }
  */
  // testing purposes | ignore
  System.out.println(keyCode);
}
