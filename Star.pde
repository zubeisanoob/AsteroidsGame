class Star
{
  int myX, myY; // star x and y position
  int myCol; // color variable
  int mySz; // size variable
  Star() {
    myX = (int)(Math.random() * width); // place star x position anywhere within width of screen
    myY = (int)(Math.random() * height); // place star y position anywhere within width of screen
    myCol = color((int)(Math.random() * 255), (int)(Math.random() * 255), (int)(Math.random() * 255)); // setting color to a random RGB value
    mySz = (int)(Math.random() * 5); // set size of star (theoretically distance) anywhere between 0 and 15
  }

  // public method to draw the star
  public void show() {
    stroke(myCol); // change exterior color of star
    fill(myCol); // changes color of star
    ellipse((float)myX, (float)myY, (float)mySz, (float)mySz); // draw star with ellipse
  }
}
