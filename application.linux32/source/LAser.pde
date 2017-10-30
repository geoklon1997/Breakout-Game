class LAser {
  float x;
  float y;
  float vx, vy;
  boolean destroyed=false;
  PImage[] lasers = {img6, img7, img8, img9};
  int laserChoice = 0;
  LAser(int a) {

    x=a;
    y=670;
    vx=0;
    vy=-9;
  }

  void drawLaser() {


    noStroke();
    fill(200, 0, 0);
    image(lasers[laserChoice], x, y, 8, 10);
  }

  void laserRandomChoice() {
    laserChoice = (int)random(0, 4);
  }

  void moveLaser() 
  {

    stroke(0);
    x = x + vx;
    y = y + vy;
  }

  void CheckCollisionWithBricks( Rectangle r) 
  {

    //if (((x>=r.x+15)&&(x<=r.x+55))&&(y<=r.y+5)&&(y>=r.y)) {
    //  r.ResizeRect();

    //  counter=counter+1;
    //  x=-200;

    //}

    //if (((x>=r.x-5)&&(x<=r.x+35))&&(y>=r.y)&&(y<=r.y+10)) {

    //  r.ResizeRect();

    //  counter=counter+1;
    // x=-200;
    //}

    if (((y>=r.y-5)&&(y<=r.y+5))&&(x>=r.x)&&(x<=r.x+40)) {
      r.ResizeRect();
      laserEffect.trigger();
      counter=counter+1;
      x=-200;
    }

    //if (((y>=r.y+15)&&(y<=r.y+5))&&(x>=r.x)&&(x<=r.x+40)) {
    // r.ResizeRect();
    //  counter=counter+1;
    //   x=-200;
    //  }
  }

  void CheckLaserPosition() {

    if (y<65) {

      x=-200;
      destroyed=true;
    }
  }

  boolean destroy() {


    return destroyed;
  }
}