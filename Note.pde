private class Note
{
  private String pitch; //letter form of note passed in
  private int pitchNum; //note converted into a representative int
  
  private int noteValue; //int representatinon of note value. 16 = sixteenth note, 8 = eighth note, etc...
  private int drawLength; //int representation of note length, how far away from next note in pixels note will be
  
  private int yPos;
  
  //constructor
  Note(String[] info)
  {
    pitch = info[0];
    noteValue = Integer.parseInt(info[1]);
    
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
  
  //converts length of note into pixel distance
  void determineLength() 
  {
    drawLength = 500/noteValue;
  }
  
  //returns int pitchNum
  int getPitchNum()
  {
    //System.out.println(pitchNum);
    return pitchNum;
  }
  
  
  int getLength()
  {
    //System.out.println(drawLength);
    return drawLength;
  }
  
  void drawNote(float xPos, float yPos)
  {
    
    ellipseMode(CENTER);
    
    switch(noteValue){
      case 1: //whole note
        strokeWeight(7);
        fill(255);
        ellipseMode(CENTER);
        ellipse(xPos, yPos, 40, 25);
        break;
        
      case 2: //half note
        strokeWeight(5);
        fill(255);
        ellipseMode(CENTER);
        ellipse(xPos, yPos, 40, 25);
        line(xPos+22.5, yPos, xPos+20, yPos-90);
        break;
       
      case 4: //quarter note
        strokeWeight(5);
        fill(0);
        ellipseMode(CENTER);
        ellipse(xPos, yPos, 40, 25);
        line(xPos+22.5, yPos, xPos+20, yPos-90);
        break;
    }
  }
  
  /*
  //returns string pitch
  String getPitch()
  {
    return pitch; 
  }
  
    
  //returns int noteValue
  int getNoteValue()
  {
    return noteValue; 
  }
  */
}