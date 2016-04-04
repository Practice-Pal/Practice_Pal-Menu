PImage musicNote; //image of music note
PFont titleFont, optionFont, optionHeadFont, optionTextFont; //font of title, font of options, font of header of options, font of text of options
int screenSizeX, screenSizeY, stage; //length of screen, height of screen, stage number
color colorOptionTextFalse, colorOptionTextTrue; //color of options if not moused over, color of options if moused over
color colorBackButton; //color of back button
color lines; //color of music lines
color colorOptionHead, colorOptionText; //color of option head and text

Select_Music_Screen music_select;
Moving_Sheet_Music notesscrolling;

void setup()
{

  //sets size of screen
  screenSizeX = 1600; 
  screenSizeY = 900;
  surface.setSize(screenSizeX, screenSizeY); 
  
  background(255); //sets color of background
  
  titleFont = loadFont("SegoeUI-LightItalic-200.vlw"); 
  optionFont = loadFont("SegoeUI-Light-40.vlw"); 
  optionHeadFont = loadFont("SegoeUI-Light-60.vlw"); 
  optionTextFont = loadFont("SegoeUI-Light-30.vlw"); 
  musicNote = loadImage("music Note Title Screen.png");
  
  colorOptionTextFalse = color(49, 44, 44);
  colorOptionTextTrue = color(201, 201, 201);
  lines = color(188, 175, 175);
  colorOptionHead = color(52, 45, 45);
  colorOptionText = color(70, 65, 65);
  colorBackButton = color(251);
  
  music_select = new Select_Music_Screen();
  notesscrolling = new Moving_Sheet_Music();
  
  stage = 1;
}


void draw()
{
  
  if (stage == 1){ //goes to main menu
    menu();
  }
  else if (stage == 3){ //goes to about screen
    about();
  }
  else if(stage == 4)
  {
    highscores();
  }
  else if(stage == 5)
  {
    options();
  }
  else if(stage ==6)
  {
    play();
  }
  else if(stage ==7)
  {
    notesscrolling.setup();
    notesscrolling.draw();
    backButton();
  }
    
}


//main menu screen
void menu()
{
  background(255);
  strokeWeight(1);
  textAlign(CENTER); //creates PracticePal title
  fill(0);
  stroke(0);
  textFont(titleFont);
  text("PracticePal", 925, 400);
  
  rectMode(CENTER);
 
 //creates lines
  for(int i = 0; i < 5; i++){
     fill(lines);
     stroke(lines);
     rect(screenSizeX/2, screenSizeY/2+60*i, screenSizeX, 5);
     
     if(i != 4){
       fill(255);
       stroke(255);
       rect(screenSizeX/2, screenSizeY/2+30+60*i, screenSizeX, 50);
     }
  }
    
  menuUpdate(); 
  
  image(musicNote, -150, screenSizeY/2-400, 800,800); 
 
  textAlign(LEFT);
  fill(colorOptionTextFalse);
  stroke(colorOptionTextFalse);
  textFont(optionFont);
  text("PLAY", 550, 495);
  text("ABOUT", 550, 555);
  text("HIGH SCORES", 550, 615);
  text("OPTIONS", 550, 675);

}


//moves to new screen when mouse is clicked
void mouseClicked()
{
  if (stage == 1){
    if(overAbout())
      stage = 3;
  }
  if(stage == 1){
    if(overHighScores())
    stage = 4;
  }
  if(stage == 1){
    if(overOptions())
    stage = 5;
  }
  if(stage ==1){
    if(overPlay())
    stage = 6;
  }
  if(stage==6){
    if(overSong1())
    stage = 7;
  }
  
  if(stage != 1){
    if (overBack(screenSizeX-25, screenSizeY-25, 100))
      stage = 1;
  }
}


//about screen
void about()
{
  //header on about screen
  background(255);
  textAlign(LEFT);
  fill(colorOptionHead);
  stroke(colorOptionHead);
  textFont(optionHeadFont);
  text("About", 80, 125); 
  
  //line under header
  rectMode(CENTER);
  fill(lines);
  strokeWeight(1);
  stroke(lines);
  rect(screenSizeX/2, 145, screenSizeX-100, 5);
  
  //actual text in about screen
  rectMode(LEFT);
  fill(colorOptionText);
  stroke(colorOptionText);
  textFont(optionTextFont);
  String aboutP1 = "PracticePal is a system designed by musicians, for musicians. By creating a gamified practice environment, we aim to provide an entertaining and enriching music practice experience.";
  String[] credits = {"Emma Chen", "Jordan Coscia", "Clement Ekaputra", "Jenn Gingerich", "Andrew Saba", "Emma Stilwell", " ", "ENGR 0716", "The Art of Making"};
  text(aboutP1, 80, 170, screenSizeX - 160, 300);
  
  for(int i = 0; i < credits.length; i++){
    text(credits[i], 80, 550+35*i);
  }
  
  backButton();

}
//highscore screen
void highscores()
{
  background(255);
textAlign(LEFT);
fill(colorOptionHead);
stroke(colorOptionHead);
textFont(optionHeadFont);
text("High Scores: ", 100,100);

//text for scores
textAlign(RIGHT);
text("Date: ",1500,100);

backButton();

}

void options()
{
  background(255);
  textAlign(LEFT);
  fill(colorOptionHead);
  stroke(colorOptionHead);
  textFont(optionHeadFont);
  text("Options",700, 100);
  
  backButton();
}
void play()

{
  background(255);
  textAlign(LEFT);
  fill(colorOptionHead);
  stroke(colorOptionHead);
  textFont(optionHeadFont);
  music_select.setup();
  music_select.draw();
  music_select.display();
  music_select.mouseOver();
    
  backButton();
}

void backButton()
{
  ellipseMode(CENTER);
  fill(colorBackButton);
  stroke(lines);
  strokeWeight(10);
  int backCenterX = screenSizeX-25, backCenterY = screenSizeY-25;
  ellipse(backCenterX, backCenterY, 200, 200);
  
  optionUpdate(backCenterX, backCenterY, 100);
  
  textAlign(CENTER);
  fill(colorOptionTextFalse);
  stroke(colorOptionTextFalse);
  textFont(optionFont);
  text("Back", screenSizeX-50, screenSizeY-37);

}


//determines and highlights what option is selected on the menu screen
void menuUpdate()
{
  int rectPos = 0;
  if(overPlay())
    rectPos = 1;
  else if (overAbout())
    rectPos = 2;
  else if (overHighScores())
    rectPos = 3;
  else if (overOptions())
    rectPos = 4;
    
  if(rectPos > 0){
    fill(colorOptionTextTrue);
    stroke(colorOptionTextTrue);
    rect(screenSizeX/2, screenSizeY/2+30+60*(rectPos-1), screenSizeX, 50);
  }
}


//turns back button different color if mouse is over back button
void optionUpdate(int backCenterX, int backCenterY, int radius)
{
  if(overBack(backCenterX, backCenterY, radius)){
    fill(colorOptionTextTrue);
    stroke(colorOptionTextTrue);
    ellipse(backCenterX, backCenterY, 2*radius-22.5, 2*radius-22.5);
  }
}
    

//true if mouse is over the play button
boolean overPlay()
{
  if(mouseY >= screenSizeY/2+2.5 && mouseY <= screenSizeY/2+57.5)
    return true;
  else
    return false;
}

//true if mouse is over the about button
boolean overAbout(){
   if(mouseY >= screenSizeY/2+62.5 && mouseY <= screenSizeY/2+117.5)
     return true;
   else
     return false;
}


//true if mouse is over the high scores button
boolean overHighScores()
{
   if(mouseY >= screenSizeY/2+122.5 && mouseY <= screenSizeY/2+177.5)
     return true;
   else
     return false;
}


//true if mouse is over the options button
boolean overOptions()
{
   if(mouseY >= screenSizeY/2+182.5 && mouseY <= screenSizeY/2+237.5)
     return true;
   else
     return false;
}


//true if mouse is over the back button
boolean overBack(int backCenterX, int backCenterY, int radius)
{
  double dist = sqrt(pow(mouseX-backCenterX,2) + pow(mouseY-backCenterY,2));
  if(dist < radius)
    return true;
  else
    return false;
}

//true if the mouse is over the Song 1 button
boolean overSong1()
{
 
  if(mouseX<=width-100 && mouseX>=100 && mouseY<=height/2 && mouseY>=height/4)
    return true;
  else
    return false;
}