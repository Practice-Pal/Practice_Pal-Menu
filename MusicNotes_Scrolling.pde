class Moving_Sheet_Music

{

int screenSizeX, screenSizeY;
PVector position, velocity;
PImage alto_clef, time_signature;

void setup()
{
  screenSizeX = 1600;
  screenSizeY = 900;
  surface.setSize(screenSizeX, screenSizeY);
  
  background(255);
  
  position = new PVector(screenSizeX, screenSizeY/2+15);
  velocity = new PVector(-0.9, 0);
  
  alto_clef= loadImage("alto clef.jpg");
  alto_clef.resize(90,130);
  time_signature = loadImage("4-4-basic-time-signature.jpg");
  
}

void draw()
{
  strokeWeight(1);
  background(255);
  rectMode(CENTER);
  
  image(alto_clef,100,screenSizeY*3/7);
  image(time_signature,200,screenSizeY*3/7);
  fill(177);
  stroke(177);
  rect(400, screenSizeY/2, 5, 200);//the line?
  
  fill(0);
  stroke(0);
  
  for(int i = 0; i < 5; i++){
    rect(screenSizeX/2, screenSizeY/2-2*30+30*i, screenSizeX+100, 5);
  }
  
  if(position.x <= 400){
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
  //quarter note: middle A
  strokeWeight(5);
  line(position.x+13, position.y, position.x+13, position.y-90);
  ellipseMode(CENTER);
  ellipse(position.x, position.y, 22, 22);
  position.add(velocity);


 //whole note:middle A
strokeWeight(7);
fill(255);
ellipseMode(CENTER);
ellipse(position.x+200,position.y,26,22);
position.add(velocity);

//whole note: middle b
strokeWeight(7);
fill(255);
ellipseMode(CENTER);
ellipse(position.x+400,position.y-16,26,22);
position.add(velocity);

//whole note: c
strokeWeight(7);
fill(255);
ellipseMode(CENTER);
ellipse(position.x+600,position.y-32,26,22);
position.add(velocity);

//whole note: d
strokeWeight(7);
fill(255);
ellipseMode(CENTER);
ellipse(position.x+800,position.y-48,26,22);
position.add(velocity);

//whole note: e
strokeWeight(7);
fill(255);
ellipseMode(CENTER);
ellipse(position.x+1000,position.y-62,26,22);
position.add(velocity);

//whole note: f
strokeWeight(7);
fill(255);
ellipseMode(CENTER);
ellipse(position.x+1200,position.y-75,26,22);
position.add(velocity);
}
}