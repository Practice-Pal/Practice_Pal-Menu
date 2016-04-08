public class PlayMode
{

  PVector[] position; //array contains positions of all notes
  PVector velocity; //moves notes left across the screen
  
  PImage alto_clef, time_signature; //images loaded
    
  int totalLength; //total pixel length of song, used to determine where to put notes
  int numBars; //number of measures/bar lines needed
  int[] barPosition; //stores x-coordinates of bar lines
  
  boolean[] correct;
  boolean[] in;
  
  Song song; //song loaded
  Note[] songInfo; //note information for song
  
  
  public void setup(String filename)
  {
    //sets screen size
    screenSizeX = 1600;
    screenSizeY = 900;
    surface.setSize(screenSizeX, screenSizeY);
    
    //white background
    background(255);
    
    //loads images
    alto_clef= loadImage("alto clef.jpg");
    alto_clef.resize(90,130);
    time_signature = loadImage("4-4-basic-time-signature.jpg");
   
    //loads song from textfile
    song = new Song(filename);
    song.createSong();
    songInfo = song.getSong();
    
    //determines initial positions of all notes
    position = new PVector[songInfo.length];
    velocity = new PVector(-5, 0);
    
    correct = new boolean[songInfo.length];
    in = new boolean[songInfo.length];
    
    //1600 pixels before first note
    totalLength = 1600;
    
    //position vector of first note
    position[0] = new PVector(1600, screenSizeY/2 - 15*(songInfo[0].getPitchNum() - 1));
    
    //determines initial position vectors of all notes
    for(int i = 1; i < songInfo.length; i++){
      totalLength += songInfo[i-1].getLength();
      position[i] = new PVector(totalLength, screenSizeY/2 - 15*(songInfo[i].getPitchNum() - 1));
    }
    
    //determines number of bar lines needed
    numBars = floor(totalLength/500);
    barPosition = new int[numBars+4];
    
    //determines initialp ositions of all bar lines
    for(int i = 0; i < barPosition.length; i++){
      barPosition[i] = 50+500*i;
    }
    
   
  }
  
  public void draw()
  {
    strokeWeight(1);
    background(255);
    rectMode(CENTER);
    
    
    //loads images 
    imageMode(CENTER);
    image(alto_clef,100,screenSizeY/2);
    image(time_signature,200,screenSizeY/2);
 
    fill(0);
    stroke(0);
    
    strokeWeight(3);
    

    //draws notes if on the screen to speed up program
    for(int i = 0; i < songInfo.length; i++){
      if(position[i].x >= 0 || position[i].x <= 1700){
        songInfo[i].drawNote(position[i].x, position[i].y);
      }
      position[i].add(velocity);
    }
    
      //draws bar lines
    for(int i = 0; i < barPosition.length; i++){
      line(barPosition[i], screenSizeY/2-60, barPosition[i], screenSizeY/2+60);  
      barPosition[i] += velocity.x;
    }
    
    //draws staff
    strokeWeight(1);
    fill(0);
    for(int i = 0; i < 5; i++){
      rect(screenSizeX/2, screenSizeY/2-60+30*i, screenSizeX+100, 2);
    }
    
     fill(177, 177, 177, 100);
    stroke(177);
    rect(400, screenSizeY/2, 100, 200); 
    
  }
  
}