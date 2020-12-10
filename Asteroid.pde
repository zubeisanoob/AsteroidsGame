class Asteroid extends Floater {
  Asteroid() {
    myCenterX = width/2; // starting x position of the spaceship (middle of x axis)
    myCenterY = height/2; // starting x position of the spaceship (middle of y axis)
    myXspeed = 0.0; // x speed velocity
    myYspeed = 0.0; // y speed velocity
    myPointDirection = 0; // angle of spaceship direction
    myColor = color(255); // color of spaceship (default white)
    corners = 8; // # of corners of spaceship (defines xCorners and yCorners length)
    xCorners = new int[corners]; // stores x locations of all points of spaceship
    yCorners = new int[corners]; // stores y locations of all points of spaceship
    // xCorners
    xCorners[0] = (int)(Math.random() * 3) - 1;
    xCorners[1] = (int)(Math.random() * 4) + 6;
    xCorners[2] = (int)(Math.random() * 4) + 8;
    xCorners[3] = (int)(Math.random() * 4) + 6;
    xCorners[4] = (int)(Math.random() * 3) - 1;
    xCorners[5] = (int)(Math.random() * 4) - 6;
    xCorners[6] = (int)(Math.random() * 4) - 8;
    xCorners[7] = (int)(Math.random() * 4) - 6;
    // yCorners
    yCorners[0] = (int)(Math.random() * 4) + 8;
    yCorners[1] = (int)(Math.random() * 4) + 6;
    yCorners[2] = (int)(Math.random() * 3) - 1;
    yCorners[3] = (int)(Math.random() * 4) - 6;
    yCorners[4] = (int)(Math.random() * 4) - 8;
    yCorners[5] = (int)(Math.random() * 4) - 6;
    yCorners[6] = (int)(Math.random() * 3) - 1;
    yCorners[7] = (int)(Math.random() * 4) + 6;
  }

  public void show ()  //Draws the floater at the current position
  {
    fill(myColor);
    stroke(255, 0 ,0);    

    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()
    float dRadians = (float)(myPointDirection*(Math.PI/180));

    //rotate so that the polygon will be drawn in the correct direction
    rotate((float)(dRadians));

    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex((float)xCorners[nI], (float)yCorners[nI]);
    }
    endShape(CLOSE);

    //"unrotate" and "untranslate" in reverse order
    rotate((float)(-1*dRadians));
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }
}
