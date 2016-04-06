class Select_Music_Screen {
  PImage first;
  
    void setup(){
      
    first = loadImage("blue_button.png");
    first.resize(600,200);
    size(1600,900);
    
    }
    void draw(){
      display();
    }
  void display() { 
    background(255);
    textSize(100);
    stroke(0);
    fill(0);
    text("Select Song", width/3, 100);
    image(first, width/3, height/3);
    image(first, width/3, height*2/3);
      textSize(50);
      stroke(0);
    //fill(153, width, 100); 
      text("Song 1", width*7/16, height*7/16);
      text("Song 2", width*7/16,height*25/32);
      
      mouseOver();
  }
  void mouseOver() { 
    if (mouseX<=width-100 && mouseX>=100) {
      if (mouseY>height/2 && mouseY<=height*3/4) {
        image(first, width/3, height*2/3, 600, 250);
      text("Song 2", width*7/16,height*25/32);
        
      } 
      if (mouseY<height/2&& mouseY>=height/4) {
      image(first, width/3, height/3, 600, 250);
         text("Song 1", width*7/16, height*7/16);
       
      }
    }
     
    } 
}