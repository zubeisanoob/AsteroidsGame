class SmallAsteroid extends Asteroid {
    SmallAsteroid(double x_, double y_) {
        super();
        myCenterX = x_;
        myCenterY = y_;
        myXspeed = (Math.random() * 8) - 4; // x speed velocity
        myYspeed = (Math.random() * 8) - 4; // y speed velocity
        myColor = color(0, 255, 0);
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
    public double getX() {
        return myCenterX;
    }

    public double getY() {
        return myCenterY;
    }
    
}