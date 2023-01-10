
import ddf.minim.*; 

PImage img, img1, img2, img3, img4, img5,img6,img7,img8,img9;

int lives=8;
int i=0;
int PowerUps=0;

PFont mono;

public static float percentage=0;

public static float tailSize=100;
public static int points=0;

public float xPowerUp=width/2, yPowerUp=height/2;

Minim minim;
AudioPlayer music, WinEffect, LoseEffect;

AudioSample brickEffect, wallEffect, BatEffect, trollLaugh, selectEffect, laserEffect;
// ball position
float xPos;
float yPos;

boolean options=false;

int musicCounter=0;

int effectsCounter=0;

boolean effects = false;

boolean mute=false;

boolean start=false;

boolean isPlaying=false;

boolean pauseCheck=false;


public static boolean pwRUp = false;
ArrayList<Rectangle> lstRect = new ArrayList<Rectangle> ();
public static ArrayList<Ball> balls = new ArrayList<Ball>();
public static ArrayList<LAser> beams = new ArrayList<LAser>();


public static int count = 0;
// is ball in play?
boolean inPlayMode;

//position of rectangles
float xRect=105;
float yRect=200;
boolean hideUI = false;

float Random, Random2;
float xBat;
float xSizeRect = 70;
float ySizeRect = 25;

color cl;
Rectangle r;

public static int ClickMusic=0;
public static int ClickEffects=0;
public static color colorBat;
boolean controls=false;
boolean gameover=false;
boolean pause=false;
public static int colorOption = 1;
public static boolean powerups=true;
public static int counter=0;
public static int xSizeBat=100;
Ball b, b1, b2, b3, bP;
int s,m,milli=0;
public int menuSelector = 0;

public boolean[] menuOpen;

void setup() {
 

  colorBat = color(30, 60, 90);
  mono = loadFont("AlienEncounters-35.vlw");
  textFont(mono);
  frameRate(60);
  loadSoundEffects();
  img = loadImage("originalPallet.PNG");
  img1 = loadImage("allGreen.PNG");
  img2 = loadImage("originalPallet.PNG");
  img3 = loadImage("livesLeft.png");
  img4 = loadImage("livesLost.png");
  img5 = loadImage("randomColors.PNG");
  img6 = loadImage("blueBeam.png");
  img7 = loadImage("redBeam.png");
  img8 = loadImage("greenBeam.png");
  img9 = loadImage("lightblueBeam.png");

  size(1200, 700);//w:width*0.625, h:height-
  menuOpen = new boolean[4];
  menuOpen[0]=false;
  menuOpen[1]=false;
  menuOpen[2]=false;
  menuOpen[3]=false;

  smooth();

  musicCounter=2;
}


void mousePressed() {
  if (inPlayMode) {
  } 

  if (inPlayMode==false&&lives<7&&options==false&&(mouseY>=259&&mouseY<=300&&mouseX>=410&&mouseX<=1000)) {

    inPlayMode=true;
  }
  if (inPlayMode==false&&lives==7&&options==false&&(mouseY>=331&&mouseY<=380&&mouseX>=200&&mouseX<=460)||(mouseY>=331&&mouseY<=380&&mouseX>=510&&mouseX<=780)||(mouseY>=360&&mouseY<=380&&mouseX>=840&&mouseX<=1110)) {

    start=true;
  }
  if (inPlayMode==false&&lives==7&&start==true&&options==false&&(mouseY>=331&&mouseY<=380&&mouseX>=200&&mouseX<=460)) {
    start=false;
    inPlayMode=true;
    colorOption=1;
    Restart();
  }
  if (inPlayMode==false&&lives==7&&start==true&&options==false&&(mouseY>=331&&mouseY<=380&&mouseX>=510&&mouseX<=780) ) {
    start=false;
    inPlayMode=true;
    colorOption=2;
    Restart();
  }
  if (inPlayMode==false&&lives==7&&start==true&&options==false&&(mouseY>=360&&mouseY<=380&&mouseX>=840&&mouseX<=1110) ) {
    start=false;
    inPlayMode=true;
    colorOption=3;
    Restart();
  }
  if (inPlayMode==false&&options==false&&(mouseY>=559&&mouseY<=600&&mouseX>=600&&mouseX<=690)) {

    System.exit(0);
  }
  if (inPlayMode==false&&controls==false&&lives<=7&&(mouseY>=459&&mouseY<=500&&mouseX>=550&&mouseX<=750)) {

    Controls();
    controls=true;
  }
  if (inPlayMode==false&&options==false&&lives<7&&(mouseY>=359&&mouseY<=400&&mouseX>=550&&mouseX<=750)) {

    options();
    options=true;
  }
  if (inPlayMode==false&&options==true&&lives<=7&&(mouseY>=550&&mouseY<=600&&mouseX>=400&&mouseX<=910)) {

    options=false;
  }
  if (inPlayMode==false&&start==true&&lives<=7&&(mouseY>=550&&mouseY<=600&&mouseX>=400&&mouseX<=910)) {

    start=false;
  }
  if (inPlayMode==false&&controls==true&&lives<=7&&((mouseX>width/2-200&&mouseX<width/2+220)&&(mouseY<height-10)&&(mouseY>height-30)) ) {

    controls=false;
  }
  if (inPlayMode==false&&options==true&&musicCounter==0&&lives<=7&&(mouseY>=305&&mouseY<=355&&mouseX>=400&&mouseX<=600)) {

    mute=true;
  }

  if (inPlayMode==false&&options==true&&musicCounter==1&&lives<=7&&(mouseY>=305&&mouseY<=355&&mouseX>=400&&mouseX<=600)) {

    mute=false;
  }
  if (inPlayMode==false&&options==true&&PowerUps==1&&lives<=7&&(mouseY>=450&&mouseY<=500&&mouseX>=400&&mouseX<740)) {

    powerups=true;
  }

  if (inPlayMode==false&&options==true&&PowerUps==0&&lives<=7&&(mouseY>=450&&mouseY<=500&&mouseX>=400&&mouseX<740)) {

    powerups=false;
  }
  if (inPlayMode==false&&options==true&&effectsCounter==0&&lives<=7&&(mouseY>=150&&mouseY<=200&&mouseX>=400&&mouseX<740)) {


    effects=true;
  }
  if (inPlayMode==false&&options==true&&effectsCounter==1&&lives<=7&&(mouseY>=150&&mouseY<=200&&mouseX>=400&&mouseX<740)) {


    effects=false;
  }
}



void keyPressed() {
  if ((key == ' ')) {
    gameover=false;
    if (pauseCheck==true) {
      pauseCheck=false;
   //   music.play();
    }
    if (lives==0) {
      LoseEffect.close();
    }
  }

  if ((key == 's')) {
    saveFrame("Breakout-######.png");
  }
  if (key==ESC) {
    if (counter==1340||lives==0) {
      System.exit(0);
    }
    if (gameover==false) {
      key=0;
      fill(190, 0, 0);
      text ("Game Paused", width/2-100, height/2);
      pauseCheck=true;
      if (mute==false) {
        music.pause();
      } else {
      }
    }
  }

  if (key == 'r') {
    music.rewind();
    tailSize=100;

    Restart();
    ResetGame();
  }
  if (key== 'q') {
    System.exit(0);
  }

  if (key =='b') {
    addBall();
  }
  if (key=='m') {
    if (mute==false&&ClickMusic%2==0) {
      mute=true;
      music.pause();
      text("Music:Off", 450, height/2+20);
    }
    if (mute==true&&ClickMusic%2==1) {
      mute=false;
      music.rewind();
      music.play();
      text("Music:On", 450, height/2+20);
    }

    ClickMusic++;
  }

  if (key=='e') {
    if (effects==false&&ClickEffects%2==0) {
      effects=true;
      text("Effects:Off", 450, height/2+20);
    }
    if (effects==true&&ClickEffects%2==1) {
      effects=false;
      text("Effects:On", 450, height/2+20);
    }

    ClickEffects++;
  }
  if (key=='p') {

    xSizeBat=xSizeBat+20;
  }

  if (key=='1') {

    colorOption=1;
      ResetGame();
    Restart();
  }
  if (key=='2') {

    colorOption=2;
    ResetGame();
    Restart();
  }
  
   if (key=='3') {

    colorOption=3;
    ResetGame();
    Restart();
  }
    if (key == CODED) {

  if (keyCode ==DOWN) {
    menuSelector--;
    if (menuSelector ==-1) {
      menuSelector = 3;
  }
    println(""+menuSelector);
  }
  

  if (keyCode ==UP) {
    menuSelector++;
    if (menuSelector ==4) {
      menuSelector = 0;
  }
  //println(""+menuSelector);
  }
    }
    
    if (key == ENTER) {
    menuOpen[menuSelector] = true;
      println(""+menuOpen[menuSelector]);

    }
  }
void keyReleased() {
  if (key== 'l') {
   addLaser();
  }
}


void addLaser() {
   LAser l = new LAser(mouseX+8);
    LAser l1 = new LAser(mouseX-8);
    l.laserRandomChoice();
    l1.laserRandomChoice();
    beams.add(l);
    beams.add(l1);
}

void addBall() {
  Ball b= new Ball();
balls.add(b);
count++;
}


void ResetGame() {
 count =0;
  balls.clear();
  addBall();
  //addBall();
  //addBall();
  //addBall();

}

void GameOver() {
  if (lives==0) {
    //music.close();

   // LoseEffect.play();
    background(0, 0, 0);
    textSize(50);
    fill(255, 0, 0);
    text("Ahahaha.You lost", 400, 200);
    text("Press q to exit, or space to start a new Game", 65, 650);

    Restart();
     gameover=false;
    //if (pauseCheck==true) {
      pauseCheck=false;
   //   music.play();
 //   }
    textSize(30);
    text("What is the matter bro/sis?", 120, 300);
    text("Are you mad?", 250, 360);
    fill(255, 0, 0);
    //image(img, 510, 250, 300, 340);
    tailSize=100;
  }

  if ((lives==0)&&(counter>lstRect.size()-10)) {
   // music.close();

   // LoseEffect.play();
    background(0, 0, 0);
    textSize(50);
    fill(255, 0, 0);
    text("Ahahaha.You lost", 400, 200);
    text("Press q to exit, or space to start a new Game", 65, 650);
    fill(0);
    textSize(30);
    text("What is the matter bro/sis?", 120, 300);
    text("Are you mad?", 250, 360);
    text("Successfull troll is successfull", 80, 420);
    fill(255, 0, 0);
    tailSize=100;
    // image(img, 510, 250, 300, 340);
  }
  if (lives>0&&counter!=20*58&&counter!=0) {
    background(0);
    textSize(50);
    fill(255, 0, 0);
    text("Lives left: ",width/2-120, 200);
    for (int i=0; i<lives; i++) {

      image(img3,500 + 22* i, 260, 20, 20);
    }
    for (int i=0; i<7-lives; i++) {

      image(img4, 500 + 22* 6-22*i, 260, 20, 20);
    }
    text("Press space to continue playing", 250, 650);
  } else if (counter==0)
  {
    gameover=false;
    if (pauseCheck==true) {
      pauseCheck=false;
   //   music.play();
    }
    if (lives==0) {
      LoseEffect.close();
    }
    }
    
  if (counter==lstRect.size()&&counter!=0) {

    
   victoryDraw();
  }
}

void victoryDraw() {
 // music.pause();
   // WinEffect.play();
    fill(0, 200, 0);
    stroke(0, 255, 0);
    strokeWeight(3);
    line(15, 60, width-20, 60);
    line(15, 60, 10, height);
    line(width-20, 60, width-20, height);
    stroke(255);
    strokeWeight(2);

    tailSize=100;

    textSize(48);
    fill(255, 0, 0);
    text("Congratulations!You managed to Breakout", 20, 200);
text("Press q to exit", 450, 650);
}

void drawWall() {

  percentage = counter/(20*29);

  fill(0, 200, 0);
  stroke(0, 255, 0);
  strokeWeight(3);
  line(15, 60, width-20, 60);
  line(15, 60, 10, height);
  line(width-20, 60, width-20, height);
  // line(width/2-350, 0, width/2-350, 60);

if (hideUI==false) {
  textSize(20);
  fill(0, 250, 0);
  text("Lives left : ", width/2, 55);
  text("Balls left : "+count, width/2-300, 55);
  text("Level Progress : ", width/2-520, 25);
 
  stroke(0,250,0);
  noFill();
  rect(width/2-320,10,290,20);
  fill(250,0,0);
  rect(width/2-320,10,counter/2,20);
   fill(255);
    textSize(15);

  text(" " +int(round( counter/5.8 * 100.0f ) / 100.0f)+" % completed ", width/2-310, 25);
    textSize(20);

  for (int i=0; i<lives; i++) {

    image(img3, width/2+170 + 22* i, 35, 20, 20);
  }
  for (int i=0; i<7-lives; i++) {

    image(img4, width/2+170 + 22* 6-22*i, 35, 20, 20);
  }
  fill(250, 0, 0);
  if (mute==false) {
    text("Music: On", width/2+420, 55);
  }
  if (mute==true) {

    text("Music: Off", width/2+420, 55);
  }
  if (effects==false) {
    text("Effects: On", width/2-520, 55);
  }
  if (effects==true) {

    text("Effects: Off", width/2-520, 55);
  }
  stroke(0);
  strokeWeight(3);
}
}

void NewGame() {

  if (controls==false) {
    if (options==false) {
      if (lives==7) {
        Restart();
        music.play();
        background(0, 0, 0);
        textSize(30);
        fill(255, 0, 0);
        text("Select one of the following modes for a new Game", 220, 300);
        fill(255, 0, 0);


        if (mouseY>=559&&mouseY<=600&&mouseX>=600&&mouseX<=690) {
          fill(255, 255, 0);
        }
        text("Exit", 600, 600);
        fill(255, 255, 0);
        text("Breakout", 540, 180);
        fill(255);
        textSize(20);
        if (mouseY>=360&&mouseY<=380&&mouseX>=200&&mouseX<=473) {
          fill(0, 0, 255);
        }
        text("Original 4 color bricks", 200, 380);
        image(img, 280, 400, 100, 70);
        stroke(0, 255, 0);
        strokeWeight(2);
        line(180, 350, 180, 480);
        line(490, 350, 490, 480);
        line(820, 350, 820, 480);
        line(1130, 350, 1130, 480);

        fill(255);

        if (mouseY>=360&&mouseY<=380&&mouseX>=510&&mouseX<=793) {
          fill(0, 0, 255);
        }
        text("All green colored bricks", 510, 380);
        image(img1, 600, 400, 100, 70);
        fill(255);

        if (mouseY>=360&&mouseY<=380&&mouseX>=840&&mouseX<=1110) {
          fill(0, 0, 255);
        }
        text("Randomly colored bricks", 840, 380);
        image(img5, 930, 400, 100, 70);
      }
      if (lives<7) {

        background(0, 0, 0);
        textSize(50);
        fill(255, 0, 0);
        if ((mouseY>=259&&mouseY<=300&&mouseX>=410&&mouseX<=1000)||menuSelector==3) {
          fill(255, 255, 0);
        }
        text("Click to continue playing", 400, 300);
        fill(255, 0, 0);
        if ((mouseY>=359&&mouseY<=400&&mouseX>=550&&mouseX<=750)||menuSelector==2) {
          fill(255, 255, 0);
        }
        text("Options", 550, 400);
        fill(255, 0, 0);
        if ((mouseY>=459&&mouseY<=500&&mouseX>=550&&mouseX<=760)||menuSelector==1) {
          fill(255, 255, 0);
        }
        text("Controls", 550, 500);
        fill(255, 0, 0);
        if ((mouseY>=559&&mouseY<=600&&mouseX>=600&&mouseX<=690)||menuSelector==0) {
          fill(255, 255, 0);
        }

        text("Exit", 600, 600);
        fill(255, 255, 0);
        text("Breakout", 540, 180);
      }
    } else {
      options();
    }
  } else {
    Controls();
  }
}

void options() {


  background(0);
  fill(255, 0, 0);
  textSize(50);
  if (mouseY>=305&&mouseY<=355&&mouseX>=400&&mouseX<560) {
    fill(255, 255, 0);
  }
  text("Music: ", 400, 350);
  fill(255, 0, 0);
  if (mouseY>=150&&mouseY<=200&&mouseX>=400&&mouseX<740) {
    fill(255, 255, 0);
  }
  text("Sound Effects: ", 400, 200);
  fill(255, 0, 0);
  if (mouseY>=550&&mouseY<=600&&mouseX>=400&&mouseX<=910) {
    fill(255, 255, 0);
  }
  text("Return to main menu", 400, 600);

  fill(255, 0, 0);
  if (mouseY>=450&&mouseY<=500&&mouseX>=400&&mouseX<740) {
    fill(255, 255, 0);
  }
  text("Power-ups: ", 400, 500);
  checkMute(mute);

  checkEffects(effects);

  checkPowerUps(powerups);
}



void draw() {

  if (pauseCheck==false) {

    if (pause==false) {

     // if (counter<20*29) {

        if (gameover==false) {


          if (inPlayMode) {


            if (((mouseX>40)&&(mouseX<width-40))||(pause==true)||(mouseY>height)) {

              if (music.isPlaying()==false) {
                music.rewind();
              }
              if (mute==false) {
                music.play();
              }
              fill(0, 0, 0,60);
              rect(0, 0, width, height);

              drawWall(); //draws the wall
       


              CheckPwrUp();

              CheckPwrUpCollision(xPowerUp, yPowerUp);

              updateTimer();
              for (Ball b : balls) {

                b.CheckBallPosition();

                b.moveBall();  //moves ball

                b.CheckCollisionWithWall(); //checks that there is no collision with the walls

                b.CheckCollisionWithBat();

                b.drawBall();
              }

              for (LAser l : beams) {


                l.moveLaser();  //moves ball

                l.drawLaser();

                l.CheckLaserPosition();
              }

              if (music.isPlaying()==false) {
                music.rewind();
              }



              noStroke();

              fill(colorBat);

              rect(mouseX-50, 680, xSizeBat, 20);  //draws the green rectangle that will be used as the bat
             

              for (Rectangle r : lstRect) {

                r.draw();
                for (Ball b : balls) {
                  b.CheckCollisionWithBricks(r);
                }
                for (LAser l : beams) {
                  l.CheckCollisionWithBricks(r);
                }
              }
              
              if (counter==20*29) {
                balls.clear();

        addBricks();
        beams.clear();
        hideUI = true;
                        //victoryDraw();

         

         
      

      for (LAser l : beams) {


                l.moveLaser();  //moves ball

                l.drawLaser();

                l.CheckLaserPosition();
          }
   
    }

              if (s%20==0&&milli==0) {
                addBall();
                addLaser();
              }
            } else {
              fill(190, 0, 0);
              text ("Game Paused", width/2-100, height/2);
            }
          } else {

            NewGame();
          }

          if (count==0) {


            lives=lives-1;
            GameOver();
            ResetGame();
            inPlayMode=false;
            gameover=true;
          }

          if (lives==0) {
            GameOver();      
            lives=8;
          }
        }
    
    } else {

      options();
    }
  }
}



public void checkMute(boolean mute) {

  if (mute==false) {
    fill(0, 255, 0);
    text("ON", 630, 350);
    fill(255);
    text("OFF", 720, 350);
    musicCounter=0;
  }

  if (mute==true) {
    fill(255, 0, 0); 
    text("OFF", 720, 350);
    fill(255);
    text("ON", 630, 350);
    music.pause();
    musicCounter=1;
  }
}

public void checkEffects(boolean effects) {

  if (effects==false) {
    fill(0, 255, 0);
    text("ON", 830, 200);
    fill(255);
    text("OFF", 920, 200);
    effectsCounter=0;
  }

  if (effects==true) {
    fill(255, 0, 0); 
    text("OFF", 920, 200);
    fill(255);
    text("ON", 830, 200);
    effectsCounter=1;
  }
}

public void addBricks() {
   lstRect.clear();
  for (int b=0; b<20; b++) {
    for (int i=0; i<29; i++) {
      strokeWeight(3);

      lstRect.add(new Rectangle (17+40*i, 100+10*b, 40, 10, color(selectRectColor(b, colorOption))));
    }
  }
}

public void Restart() {

  counter=0;
  lives=7;
  s=0;
  m=0;
  milli=0;
 addBricks();
}

int selectRectColor(int b, int colorOption) {

  if (colorOption==1) {
    if (b>=15&&b<=19) {
      cl = color(250, 250, 0);
    }

    if (b>=10&&b<=14) {
      cl = color(0, 250, 0);
    }

    if (b>=5&&b<=9) {
      cl = color(250, 180, 0);
    }
    if (b>=0&&b<=4) {
      cl = color(240, 0, 0);
    }
  }
  if (colorOption==2) {

    cl = color ( 0, 250, 0);
  }
  if (colorOption==3) {
    cl = color (random(random(0, 255), random(0, 255)), random(random(0, 255), random(0, 255)), random(random(0, 255), random(0, 255)));
  }
  return cl;
}

void stop() {


  minim.stop();
  super.stop();
}


void Controls() {

  background(0);
  fill(0, 200, 0);
  textSize(30);
  text("Controls", width/2-100, 50);
  text("1. Use the mouse, in order to control the paddle.", 300, 150);
  text("2. Press q to exit the game at any time", 300, 250);
  text("3. Press r to restart the game at any time", 300, 350);
  text("4. Press ESC to pause and space to resume", 300, 450);
  text("5. Press m to turn the music on or off at any time", 300, 550);
  text("6. Press e to turn the sound effects on or off at any time", 300, 650);
  if ((mouseX>width/2-200&&mouseX<width/2+220)&&(mouseY<height-10)&&(mouseY>height-30)) {
    fill(200, 200, 0);
  }
  text("Click to return to main menu", width/2-200, height-10);
}


public void checkPowerUps(boolean powerups) {

  if (powerups==true) {
    fill(0, 255, 0);
    text("ON", 730, 500);
    fill(255);
    text("OFF", 820, 500);
    PowerUps=0;
  }

  if (powerups==false) {
    fill(255, 0, 0); 
    text("OFF", 820, 500);
    fill(255);
    text("ON", 730, 500);
    PowerUps=1;
  }
}

void CheckPwrUp() {

  if (pwRUp==true) {

    //bP.x=500;



    // bP.drawBall();
    // bP.moveBall();
    // bP.CheckCollisionWithBat();
  }
}


void CheckPwrUpCollision(float xPowerUp, float yPowerUp) {

  if (yPowerUp>height) {
    pwRUp=false;
  }
  if ((yPowerUp==730)&&((xPowerUp>=mouseX)&&(xPowerUp<mouseX+50))) {
    xSizeBat=xSizeBat+20;
  }

  if ((yPowerUp==730)&&((xPowerUp>=mouseX)&&(xPowerUp>mouseX-50))) {
    xSizeBat=xSizeBat+20;
  }
}

void loadSoundEffects() {
  minim = new Minim(this);

  music = minim.loadFile("Game Music.mp3", 2048);
  brickEffect =minim.loadSample("brick_impact_ground.mp3", 2048);
  wallEffect =minim.loadSample("boing.wav", 2048);
  WinEffect =minim.loadFile("applause-2.mp3", 2048);
  LoseEffect =minim.loadFile("laughter-2.mp3", 2048);
  BatEffect = minim.loadSample("boing.wav", 2048);
  trollLaugh = minim.loadSample("Troll laugh.mp3", 2048);
  selectEffect = minim.loadSample("blop (2).mp3", 2048);
  laserEffect = minim.loadSample("laser.wav", 2048);
}

void updateTimer() {
   textSize(20);
  fill(0, 250, 0);
  if (milli<=59) {
    
 if (m<10&&s<10) {
      text("Time spent: 0" +m + ":0"+s,width/2,20);
    }
    if (m>=10&&s>=10) {
    text("Time spent: " +m + ":"+s,width/2,20);
    }
    if (m<10&&s>=10) {
          text("Time spent: 0" +m + ":"+s,width/2,20);    
    }
    if (m>=10&&s<10) {
          text("Time spent: " +m + ":0"+s,width/2,20);    
    }
    milli++;
  }else {
    
   s++;
   milli=0;
   if (m<10&&s<10) {
      text("Time spent: 0" +m + ":0"+s,width/2,20);
    }
    if (m>=10&&s>=10) {
    text("Time spent: " +m + ":"+s,width/2,20);
    }
    if (m<10&&s>=10) {
          text("Time spent: 0" +m + ":"+s,width/2,20);    
    }
    if (m>=10&&s<10) {
          text("Time spent: " +m + ":0"+s,width/2,20);    
    }

  }
  if (s>=59) {
    
    if (m<10&&s<10) {
      text("Time spent: 0" +m + ":0"+s,width/2,20);
    }
    if (m>=10&&s>=10) {
    text("Time spent: " +m + ":"+s,width/2,20);
    }
    if (m<10&&s>=10) {
          text("Time spent: 0" +m + ":"+s,width/2,20);    
    }
    if (m>=10&&s<10) {
          text("Time spent: " +m + ":0"+s,width/2,20);    
    }
m++;
s=0;
  }
  
}
