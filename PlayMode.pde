int screenSizeX, screenSizeY;

PVector[] position;
PVector velocity;

PImage alto_clef, time_signature;

int totalLength;
int numBars;
int[] barPosition;

Song song;
Note[] songInfo;



public void setup()
{
  screenSizeX = 1600;
  screenSizeY = 900;
  surface.setSize(screenSizeX, screenSizeY);
  
  background(255);
  
  alto_clef= loadImage("alto clef.jpg");
  alto_clef.resize(90,130);
  time_signature = loadImage("4-4-basic-time-signature.jpg");
  song = new Song("Honeybee.txt");
  song.createSong();
  
  songInfo = song.getSong();
  
  position = new PVector[songInfo.length];
  velocity = new PVector(-5, 0);
  
  totalLength = 1600;
  
  position[0] = new PVector(1600, screenSizeY/2 - 15*(songInfo[0].getPitchNum() - 1));
  
  for(int i = 1; i < songInfo.length; i++){
    totalLength += songInfo[i-1].getLength();
    position[i] = new PVector(totalLength, screenSizeY/2 - 15*(songInfo[i].getPitchNum() - 1));
  }
  
  numBars = ceil(totalLength/500);
  barPosition = new int[numBars];
  
  for(int i = 0; i < numBars; i++){
    barPosition[i] = 1550+500*i;
  }
  
 
}

public void draw()
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
  
  strokeWeight(3);

  for(int i = 0; i < numBars; i++){
    line(barPosition[i], screenSizeY/2-60, barPosition[i], screenSizeY/2+60);  
    barPosition[i] += velocity.x;
  }

  for(int i = 0; i < songInfo.length; i++){
    songInfo[i].drawNote(position[i].x, position[i].y);
    position[i].add(velocity);
  }
  
  strokeWeight(1);
  fill(0);
  for(int i = 0; i < 5; i++){
    rect(screenSizeX/2, screenSizeY/2-60+30*i, screenSizeX+100, 2);
  }
}