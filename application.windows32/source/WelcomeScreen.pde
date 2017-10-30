public class WelcomeScreen {
  
public void startingScreen() {
  
  
  background(0);
  fill(255, 0, 0);
  textSize(30);
  text("Before we begin...",width/2-30,100);
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
  text("Start the game", 400, 600);

  fill(255, 0, 0);
  if (mouseY>=450&&mouseY<=500&&mouseX>=400&&mouseX<740) {
    fill(255, 255, 0);
  }
  text("Power-ups: ", 400, 500);
  
}

}