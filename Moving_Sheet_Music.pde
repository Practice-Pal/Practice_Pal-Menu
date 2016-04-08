int screenSizeX, screenSizeY;
PVector position, velocity;
boolean correct, in;

void setup()
{
  screenSizeX = 1600;
  screenSizeY = 900;
  surface.setSize(screenSizeX, screenSizeY);
  
  background(255);
  
  position = new PVector(screenSizeX, screenSizeY/2+15);
  velocity = new PVector(-5, 0);
  
}

void draw()
{
  strokeWeight(1);
  background(255);
  rectMode(CENTER);
  
  fill(177);
  stroke(177);
  rect(200, screenSizeY/2, 5, 200);
  
  fill(0);
  stroke(0);
  
  for(int i = 0; i < 5; i++){
    rect(screenSizeX/2, screenSizeY/2-2*30+30*i, screenSizeX+100, 5);
  }
  
  if(position.x <= 200){
    in = true;
    if(keyPressed){
      if (key == 'a' || key == 'A'){
        correct = true;
      }
      else{
        correct = false;
      }
    }
  }
  
  if(in){
     if(correct){
       fill(28, 255, 0);
       stroke(28, 255, 0);
     }
    else
    {
      fill(255, 0, 0);
      stroke(255, 0, 0);
    }
  }
 
  strokeWeight(5);
  line(position.x+13, position.y, position.x+13, position.y-90);
  ellipseMode(CENTER);
  ellipse(position.x, position.y, 22, 22);
  position.add(velocity);
  
}