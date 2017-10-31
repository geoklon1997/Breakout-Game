import java.util.*;
public LinkedList<PointXY> trail;
int maxTrailLength = 4;

class Ball
{
  PImage img;
  float x;
  float y;
  float vx, vy;
  color colour;
  float xsize;
  float ysize;

  Ball()
  {
  y=random(450,510);
  x=random(500, 1200);
  vx = -5;
  vy = -5;
  colour = color (190,0,0);
  xsize =7;
  ysize=7;
 // img = loadImage("ball.png");
  }


  void drawBall() {
    

    fill(0);
    stroke(0,0,0);
    strokeWeight(6);
    
    fill(colour);

  
      noStroke();

     ellipse(x, y, xsize,ysize);
    line(x,y,x,y+5);
    
  }
  void moveBall() 
  {

    stroke(0);
    x = x + vx;
    y = y + vy;
   
  }


  void CheckCollisionWithBricks( Rectangle r) 
  {

    if (((x>=r.x+15)&&(x<=r.x+55))&&(y<=r.y+5)&&(y>=r.y)) {
      r.ResizeRect();
       reColor();
      counter=counter+1;
      
      vy=-vy;
      //shakeScreen();
      Breakout_3.points++;
      Breakout_3.tailSize =  Breakout_3.tailSize-0.14;
      reSize();

    }

    if (((x>=r.x-5)&&(x<=r.x+35))&&(y>=r.y)&&(y<=r.y+10)) {

      r.ResizeRect();
      reColor();
     
      counter=counter+1;
     vy=-vy;
       //shakeScreen();
      Breakout_3.points++;
      Breakout_3.tailSize =  Breakout_3.tailSize-0.14;
      reSize();

  }

    if (((y>=r.y-5)&&(y<=r.y+5))&&(x>=r.x)&&(x<=r.x+40)) {
      r.ResizeRect();
      reColor();
       
      counter=counter+1;
      vy=-vy;
   //shakeScreen();
            Breakout_3.points++;
      reSize();

      Breakout_3.tailSize =  Breakout_3.tailSize-0.14;
    }

    if (((y>=r.y+15)&&(y<=r.y+5))&&(x>=r.x)&&(x<=r.x+40)) {
    
      r.ResizeRect();
     reColor();
      counter=counter+1;
      vy=-vy;
        //shakeScreen();
            Breakout_3.points++;

      Breakout_3.tailSize =  Breakout_3.tailSize-0.14;
      reSize();

    }
  }


  void CheckCollisionWithWall() 
  {
    if (x-5<8||x+5>width-8) {
       reColor();
            reSize();

      vx = -vx;
    if (effects!=true&&y-5<750) {
     //shakeScreen();
    }
    }
    if (y-5<60) {
      vy = -vy;
       reColor();
             reSize();

   if (effects!=true) {
      selectEffect.trigger();
     //shakeScreen();
   }
    }
  }
  
  
void CheckCollisionWithBat() 
  {

  if ((y==680)&&((x>=mouseX-Breakout_3.xSizeBat/2)&&(x<mouseX))) {
     reColor();
      reSize();

     Random = random(0,255);
  if (effects!=true) {
     // wallEffect.trigger();
  }
     colorBat = color (random(0,255),random(0,255),random(0,255));
     
    vy= -vy;
    vx=-5;
     //shakeScreen();
      reSize();

  }
  else if ((y==680)&&((x<=mouseX+Breakout_3.xSizeBat/2))&&(x>mouseX)) {
     reColor();
      reSize();

     Random = random(0,255);
  if (effects!=true) {
     // wallEffect.trigger();
  }
     colorBat = color (random(0,255),random(0,255),random(0,255));
     
    vy= -vy;
    vx=5;
    //shakeScreen();
      reSize();

  }

  
}

  void CheckBallPosition() {
  
  if (y==760) {
    
 Breakout_3.count--;
  
}
}

  public void reColor() {
    colour = color (random(0,255),random(0,255),random(0,255));
  }
  public void MovePowerUp(float x,float y) {
    
   ellipse(x,y,10,10);
   y=y+2;
  }
  
  public void reSize() {
    xsize = random (7,10);
    ysize = random (7,10);  
}
 
public void changeSpeed() {
  vx = random (vx-0.2,vx+0.2);
  vy = random (vx-0.2,vx+0.2);

}

public color returnColor() {
  return colour;
}

public void shakeScreen() {
   if (effects==true) {
       PImage screenImage = get();
      imageMode(CORNER);
      image(screenImage,15,15);
      }
}
}