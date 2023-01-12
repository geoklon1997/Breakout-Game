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
boolean stopMoving = false;

Ball()
{
  y=random(450, 510); 
  x=random(500, 700);
  vx = int(random(-3,-7));
  vy = -int(random(-3,-7));
  colour = color (190, 0, 0);
  xsize =int(random(4, 7));
  ysize=int(random(4, 7));
  // img = loadImage("ball.png");
}

public  void setupNewBall() {
}


void drawBall() {


  //fill(0);
    //stroke(0,0,0);
  //strokeWeight(1);

  fill(colour);
  stroke(100);
  ellipse(x, y, xsize, ysize);
  line(x, y, x, y+2);
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
    if (r.h==0) {
      counter=counter+1;
      Breakout_3.points++;
    } else {
      selectEffect.trigger();
    }

    vy=-vy;
    shakeScreen();
      Breakout_3.tailSize =  Breakout_3.tailSize-0.14;
    reSize();
    
     if (((x>=r.x-5)&&(x<=r.x+35))&&(y>=r.y)&&(y<=r.y+10)) {

    r.ResizeRect();
    reColor();

    if (r.h==0) {
      counter=counter+1;
      Breakout_3.points++;
    } else {
      selectEffect.trigger();
    }
    vy=-vy;
    shakeScreen();
    reSize();
     }
     
     
     if (((y>=r.y-5)&&(y<=r.y+5))&&(x>=r.x)&&(x<=r.x+40)) {
    r.ResizeRect();
    reColor();

    if (r.h==0) {
      counter=counter+1;
      Breakout_3.points++;
    } else {
      selectEffect.trigger();
    }
    vy=-vy;
    shakeScreen();
    reSize();
  }

  if (((y>=r.y+15)&&(y<=r.y+5))&&(x>=r.x)&&(x<=r.x+40)) {

    r.ResizeRect();
    reColor();
    if (r.h==0) {
      counter=counter+1;
      Breakout_3.points++;
    } else {
      selectEffect.trigger();
    }
    vy=-vy;
    shakeScreen();
    reSize();

  }
}
}

  void CheckCollisionWithWall()
  {
  if (x-xsize<8||x+xsize>width-8) {
    reColor();
    reSize();
    //if (vx >0)
  //  {
  //    vx = int(random(-3,-7));
  
   // }
  // else {
      
  //     vx = int(random(3,7));
  //  }
  vx = -vx;
    
  }
  if (y-ysize<60) {
    
     if (vy >0)
    {
      vy = int(random(-3,-7));
    }
    else {
      
       vy = int(random(3,7));
    }
   // vx = int(random(3,7));
    reColor();
    reSize();

  //  if (effects!=true) {
      selectEffect.trigger();
   // }
  }
}




void CheckCollisionWithBat() 
{
  if ((y>=680)&&(y<=682.0)) {


    if ((x>=mouseX-Breakout_3.xSizeBat/2)&&(x<=mouseX)) {
    
     reColor();
    reSize();

    Random = random(0, 255);
    
   //   if (effects == true) {
       wallEffect.trigger();
  //  }
    colorBat = color (random(0, 255), random(0, 255), random(0, 255));

    vy= -int (random(3,7));
    
      shakeScreen();
    reSize();
      vx=-int(random(3,7));
      

    } 
    else if ((x<mouseX+Breakout_3.xSizeBat/2)&&(x>=mouseX)) {
    reColor();
    reSize();

    Random = random(0, 255);
    
    // if (effects==true) {
         wallEffect.trigger();
     // }
      colorBat = color (random(0, 255), random(0, 255), random(0, 255));

      vy= -int (random(3,7));
      
       shakeScreen();
      reSize();

        vx = int (random(3,7));
      }
      
  
    }
  }
  
   void CheckBallPosition() {
     
       if (y>760 && stopMoving==false) {

        Breakout_3.count--;
  
        stopMoving = true;
      }
    }

    public void reColor() {
      colour = color (random(0, 255), random(0, 255), random(0, 255));
    }
    public void MovePowerUp(float x, float y) {

      ellipse(x, y, 10, 10);
      y=y+2;
    }


    public void reSize() {
 xsize = int(random(3, 12));
      ysize = int(random(3,12));
    
    }
    
     public void changeSpeed() {
      vx = random (vx-0.2, vx+0.2);
      vy = random (vx-0.2, vx+0.2);
      
     }
       public color returnColor() {
      return colour;
    }

    public void shakeScreen() {
 //     if (effects==true) {
        PImage screenImage = get();
        imageMode(CORNER);
        image(screenImage, 3,3);
 //     }
    }
  }
