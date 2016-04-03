class Song
{
  String[] data;
  Note[] song;
  
  Song (String filename)
  {
    data = loadStrings(filename);
  }
  
  void createSong()
  {
    for(int i = 0; i < data.length; i++){
      song = new Note[data.length];
      song[i] = new Note(split(data[i], "\t"));
      song[i].determinePitch();
      song[i].determineLength();
    }

  }
  
  int getPitch(int i)
  {
    return song[i].getPitchNum();
  }
  
  int getLength(int i)
  {
    return song[i].getLengthNum();
  }
}