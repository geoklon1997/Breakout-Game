class Rectangle {
  int thick=0;
  float x, y, w, h;
  color col;
  Rectangle(float xarg, float yarg, float warg, float harg, color carg) {
    noStroke();
    x=xarg;
    y=yarg;
    w=warg;
    h=harg;
    col = carg;
  }



  void draw() {
    thick = rectangleThickness.returnThickness();
    fill(col);
    rect(x, y, w, h);
  }

  void ResizeRect() {
    if (effects!=true) {
      brickEffect.trigger();
    }
    float RRect=random(0, 1);

    x=-10;
    y=-10;
    w =0;
    h =0;
  }
  public void reColor() {
    col = color (random(0, 255), random(0, 255), random(0, 255));
  }
}