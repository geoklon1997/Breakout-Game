class Rectangle {
  int thick=0;
  float x, y, w, h;
  color col;
  int hitPoints;
  Rectangle(float xarg, float yarg, float warg, float harg, color carg) {
    x=xarg;
    y=yarg;
    w=warg;
    h=harg;
    col = carg;
    hitPoints = int(random(1,3));
  }



  void draw() {
    thick = rectangleThickness.returnThickness();
    fill(col);
    
    stroke(255);
    strokeWeight(0);
    rect(x, y, w, h);
    
    
    
  }

  void ResizeRect() {
    
    float RRect=random(0, 1);
    if (hitPoints>0) {
      
     hitPoints--;
     reColor();
    }else {
    // if (effects!=true) {
      brickEffect.trigger();
  //  } 
    x=-10;
    y=-10;
    w =0;
    h =0;
    }
  }
  public void reColor() {
    col = color (random(0, 255), random(0, 255), random(0, 255));
  }
}
