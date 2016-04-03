int screenSizeX, screenSizeY;
PVector[] position;
PVector velocity;
PImage alto_clef, time_signature;
Song piece;
int totalLength;

void setup()
{
  screenSizeX = 1600;
  screenSizeY = 900;
  surface.setSize(screenSizeX, screenSizeY);
  
  background(255);
  
  alto_clef= loadImage("alto clef.jpg");
  alto_clef.resize(90,130);
  time_signature = loadImage("4-4-basic-time-signature.jpg");
  
  piece = new Song("TwinkleTwinkle.txt");
  piece.createSong();
  
  position = new PVector[piece.data.length];
 
  totalLength = 0;
  for(int i = 0; i < piece.data.length; i++){
    position[i] = new PVector(1600+totalLength, screenSizeY/2+15*(piece.getPitch(i)-1));
    totalLength += piece.getLength(i);
    
  }
  velocity = new PVector(-0.9, 0);
  
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
  
  for(int i = 0; i < piece.data.length; i++)
  {
    piece.song[i].drawNote(position[i].x, position[i].y);
    position[i].x += (velocity.x);
    position[i].y += (velocity.y);
  }
}