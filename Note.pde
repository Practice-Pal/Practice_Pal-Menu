String[] data;
  
String pitch;
int pitchNum;
  
int noteValue;
int noteLength;

class Note
{

  
  Note (String[] info) //reads in string[] from Song class containing pitch and duration info
  {
    data = info;
    pitch = data[0];
    noteValue = Integer.parseInt(data[1]);
  }
  
  //turns letter of pitch into int representing position away from middle C (1)
  void determinePitch()
  {
    switch((pitch.toLowerCase().charAt(0))){
      case 'c':
        pitchNum = 1;
        break;
      case 'd':
        pitchNum = 2;
        break;
      case 'e':
        pitchNum = 3;
        break;
      case 'f':
        pitchNum = 4;
        break;
      case 'g':
        pitchNum = 5;
        break;
      case 'a':
        pitchNum = 6;
        break;
      case 'b':
        pitchNum = 7;
        break;
    }
  }
  
  void determineLength()
  {
    noteLength = 500/noteValue;
  }
  
  void drawNote(float xPos, float yPos)
  {
    ellipseMode(CENTER);
    
    switch(noteValue){
      case 1: //whole note
        strokeWeight(7);
        fill(255);
        ellipseMode(CENTER);
        ellipse(xPos, yPos, 45, 30);
        break;
        
      case 2: //half note
        strokeWeight(5);
        fill(255);
        ellipseMode(CENTER);
        ellipse(xPos, yPos, 45, 30);
        line(xPos, yPos, xPos, yPos+30);
        break;
       
      case 4: //quarter note
        strokeWeight(5);
        fill(0);
        ellipseMode(CENTER);
        ellipse(xPos, yPos, 45, 30);
        line(xPos, yPos, xPos, yPos+30);
        break;
    }
  }
  
  int getPitchNum(){
    return pitchNum;
  }
  
  int getLengthNum()
  {
    return noteLength;
  }
}