class Bullet extends Floater {
    boolean isOut;
    Bullet(Spaceship theShip) {
        corners = 4;
        xCorners = new int[corners];
        yCorners = new int[corners];
        /*
        xCorners[0] = 2;
        xCorners[1] = -2;
        xCorners[2] = -2;
        xCorners[3] = 2;
        yCorners[0] = 4;
        yCorners[1] = 4;
        yCorners[2] = -4;
        yCorners[3] = -4;
        */

        xCorners[0] = 4;
        xCorners[1] = 4;
        xCorners[2] = -4;
        xCorners[3] = -4;
        yCorners[0] = 2;
        yCorners[1] = -2;
        yCorners[2] = -2;
        yCorners[3] = 2;

        myColor = color(255, 0, 0);
        myCenterX = theShip.getX();
        myCenterY = theShip.getY();
        myXspeed = theShip.getXspeed() * 6;
        myYspeed = theShip.getYspeed() * 6;
        myPointDirection = theShip.getPointDirection();
        isOut = false;
    }

    public void move ()   //move the floater in the current direction of travel
    {
    //change the x and y coordinates by myXspeed and myYspeed       
    myCenterX += myXspeed;    
    myCenterY += myYspeed;     

    //wrap around screen    
    if (myCenterX > width)
    {     
      isOut = true;
    }    
    else if (myCenterX<0)
    {
      isOut = true;
    }    
    if(myCenterY >height)
    {    
      isOut = true;
    } 
    
    else if (myCenterY < 0)
    {     
      isOut = true; 
    }   
  }   

    public boolean isOut() {
        boolean truth = false;
        if (myCenterX > width) {     
            truth = true;
        }    
        else if (myCenterX<0) {
            truth = true;
        }    
        if(myCenterY >height) {    
            truth = true;
        } 
        else if (myCenterY < 0) {     
            truth = true;
        }   
        return truth;
    }

    public double getX() {
        return myCenterX;
    }

    public double getY() {
        return myCenterY;
    }

    public boolean getIsOut() {
        return isOut;
    }
}