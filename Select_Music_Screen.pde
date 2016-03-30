//class Select_Music_Screen {
  PImage first;
  
    void setup(){
    first = loadImage("blue_button.png");
    first.resize(302, 300);
    
    }
  void display() { 
    background(0);
    image(first, width/4, height/2);
    image(first, width*3/4, height/2);
  }
  void mouseOver() { 
    if (mouseY<=height-50 && mouseY>=50) {
      if (mouseX>width/2) {
        image(first, width*3/4, height/2, 400, 400);
       
      } 
      if (mouseX<width/2) {
        image(first, width/4, height/2, 403, 400);
       
      }
    }
    textSize(25);
    fill(175, width, 100); 
      text("Song 1", width*3/4, height/2);
      text("Song 2", width*3/4,height/2);
     
    } 
//}