int screenSizeX, screenSizeY;
PVector position, velocity;

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
    if(keyPressed){
      if (key == 'a' || key == 'A'){
        fill(51, 222, 58);
         stroke(51, 222, 58);
      }
      else{
        fill(255, 8, 12);
        stroke(255, 8, 12);
      }
      }
  }
  strokeWeight(5);
  line(position.x+13, position.y, position.x+13, position.y-90);
  ellipseMode(CENTER);
  ellipse(position.x, position.y, 22, 22);
  position.add(velocity);
  
}


  