//button parameter
//button1  "Credits"
float button1_x;
float button1_y;
float button1_width;
float button1_height;
//button2  "Option"
float button2_x;
float button2_y;
float button2_width;
float button2_height;
//button3  "Start"
float button3_x;
float button3_y;
float button3_width;
float button3_height;
//button updown1
float buttonUD1_x;
float buttonUD1_y;
float buttonUD1_width;
float buttonUD1_height;

//road point define
//position of points see the pic in the files "titlescreen points position"
float tsx1;  //title screen x position 1
float tsx2;
float tsx3;
float tsx4;
float tsy1;
float tsy2;
float tsy3;
float tsy4;
float tsy5;
float tsy6;
float tsy7;


//animation position
float walking_x;
float walking_y;

//text font
PFont titleFont;

//animation
Animation walkingRF;
Animation walkingLF;

//image
PImage standingRF;
PImage standingLF;

void setup()
{
  fullScreen();
  frameRate(12);
  noStroke();
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  //button assignments
  //button1  start
  button1_x = width/2;
  button1_y = height/2 - height/4 + height/14;  //height/14 is the detailed adjustment to make sure space at top for game title name
  button1_width = width/5.12;  //500 = width/5.12 = 2560/5.12
  button1_height = height/14.4;  //100 = height/14.4 = 1440/14.4
  //button2  options
  button2_x = width/2;
  button2_y = height/2 + height/14;
  button2_width = width/5.12;
  button2_height = height/14.4;
  //button3  credits
  button3_x = width/2;
  button3_y = height/2 + height/4 + height/14;
  button3_width = width/5.12;
  button3_height = height/14.4;
  //button updown assignment
  //button1
  buttonUD1_x = width - button1_height;
  buttonUD1_y = button2_y + (button3_y - button2_y)/2 + button1_height*2 - button1_height/4;
  buttonUD1_width = button1_height/2;
  buttonUD1_height = button1_height/2;
  
  //road point define
  //position of points see the pic in the files points
  tsx1 = button1_height*2;  //title screen x position 1
  tsx2 = button3_x - button3_width/2;
  tsx3 = button3_x + button3_width/2;
  tsx4 = width - button1_height*2;
  tsy1 = button3_y + button3_height/2 + button1_height*2;
  tsy2 = button2_y + (button3_y - button2_y)/2 + button1_height*2.5;
  tsy3 = button2_y + button2_height/2 + button1_height*2;
  tsy4 = button1_y + (button2_y - button1_y)/2 + button1_height*2.5;
  tsy5 = button1_y + button1_height/2 + button1_height*2;
  tsy6 = button1_y - (button2_y - button1_y)/2 + button1_height*2.5;
  tsy7 = button1_y + button1_height/2 - button1_height*1.6;
  
  //Font assignments
  titleFont = loadFont("titleFont.vlw");
  
  //animation assignments
  walkingRF = new Animation("walkingRF",5);
  walkingLF = new Animation("walkingLF",5);
  walking_x = button3_x;
  walking_y = button3_y + walkingRF.getHeight();
  
  //Image assignments
  standingRF = loadImage("walkingRF0000.gif");  //standing image facing right on flat ground
  standingLF = loadImage("walkingLF0000.gif");  //standing image facing left on flat ground
}

void draw()
{
  background(0);
  button1Paint();
  button2Paint();
  button3Paint();
  buttonUDPaint();
  roadPaint();
  walking();
}