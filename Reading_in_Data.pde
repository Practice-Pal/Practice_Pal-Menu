class Reading_In_Data {

String[] data;
String[] notes;
void setup()
{
  size(1600, 900);
  data = loadStrings("Notes.txt");
  notes = split(data[0], ' ');
  for(int i = 0; i<5; i++){
    System.out.println(notes[i]);
  }
  
  System.out.println();
  
  for(int i = 0; i < 5; i++){
    System.out.println(notes[i] + notes[i] + notes[i] + notes[i]);
  }
}

void draw()
{

}
}