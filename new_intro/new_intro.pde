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
//button updown1 right bottom side
float buttonUD1_x;
float buttonUD1_y;
float buttonUD1_width;
float buttonUD1_height;
//button updown2 left side
float buttonUD2_x;
float buttonUD2_y;
float buttonUD2_width;
float buttonUD2_height;
//button updown3 right top side
float buttonUD3_x;
float buttonUD3_y;
float buttonUD3_width;
float buttonUD3_height;

//game name position
float gname_x;
float gname_y;
float gname_speed;

//doors position and size
float door1_x;
float door1_y;
float door2_x;
float door2_y;
float door3_x;
float door3_y;
float door_width;
float door_height;

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
float walking_width;
float walking_height;

//text font
PFont titleFont;
PFont gnameFont;

//animation
Animation walkingRF;
Animation walkingLF;

//image
PImage standingRF;
PImage standingLF;
PImage tsdoor;  //title screen door

void setup()
{
  fullScreen();
  frameRate(16);  //default 12
  noStroke();
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  //button assignments
  //button1  credits
  button1_x = width/2;
  button1_y = height/2 - height/4 + height/14;  //height/14 is the detailed adjustment to make sure space at top for game title name
  button1_width = width/5.12;  //500 = width/5.12 = 2560/5.12
  button1_height = height/14.4;  //100 = height/14.4 = 1440/14.4
  //button2  options
  button2_x = width/2;
  button2_y = height/2 + height/14;
  button2_width = width/5.12;
  button2_height = height/14.4;
  //button3  start
  button3_x = width/2;
  button3_y = height/2 + height/4 + height/14;
  button3_width = width/5.12;
  button3_height = height/14.4;
  //button updown assignment
  //button1
  buttonUD1_x = width - button1_height;
  buttonUD1_y = button2_y + (button3_y - button2_y)/2 + button1_height*2.5 - button1_height/4;
  buttonUD1_width = button1_height/2;
  buttonUD1_height = button1_height/2;
  //button2
  buttonUD2_x = button1_height;
  buttonUD2_y = button1_y + (button2_y - button1_y)/2 + button1_height*2.5 - button1_height/4;
  buttonUD2_width = button1_height/2;
  buttonUD2_height = button1_height/2;
  //button3
  buttonUD3_x = width - button1_height;
  buttonUD3_y = button1_y - (button2_y - button1_y)/2 + button1_height*2.5 - button1_height/4;
  buttonUD3_width = button1_height/2;
  buttonUD3_height = button1_height/2;
  
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
  gnameFont = loadFont("gnameFont.vlw");
  
  //Image assignments
  standingRF = loadImage("walkingRF0000.gif");  //standing image facing right on flat ground
  standingLF = loadImage("walkingLF0000.gif");  //standing image facing left on flat ground
  tsdoor = loadImage("door.png");
  
  //door assignments
  door_width = button1_width/6;
  door_height = button1_height*1.5;
  door1_x = button3_x + button3_width/3;
  door1_y = tsy5 - door_height/2;
  door2_x = button2_x;
  door2_y = tsy3 - door_height/2;
  door3_x = button1_x - button1_width/3;
  door3_y = tsy1 - door_height/2;
  
  //animation assignments
  walkingRF = new Animation("walkingRF",5);
  walkingLF = new Animation("walkingLF",5);
  walking_width = walkingRF.getWidth()*(width/2560);
  walking_height = walkingRF.getHeight()*(height/1440);
  walking_x = tsx1;
  walking_y = tsy1 - walking_height/2;
}

void draw()
{
  background(0);
  button1Paint();
  button2Paint();
  button3Paint();
  buttonUDPaint();
  roadPaint();
  doorPaint();
  walking();
}