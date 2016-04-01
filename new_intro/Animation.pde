// Class for animating a sequence of GIFs
boolean isfacingRight = true;  //whether the stickman is facing right
boolean isWalking = false;  //whether the stickman is walking
boolean isfacingrightCurve1 = false;  //whether the stickman is on the curve or the flat ground, the right bottom side two curves
boolean isfacingleftCurve = false;  //the left side two curves
boolean isfacingrightCurve2 = false;  //the right top side two curves
boolean iscurveUpr1 = false; //whether the stickman is walking upcurve or below curve on right bottom side of the screen
boolean iscurveUpl = false; //whether the stickman is walking upcurve or below curve on left side of the screen
boolean iscurveUpr2 = false; // whether the stickman is walking upcurve or below curve on right top side of the screen
float walkingSpeed = 16;  //default 12
String upordown;

class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 4) + ".gif";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos, walking_width, walking_height);
  }
  
  int getWidth() {
    return images[0].width;
  }
  int getHeight() {
    return images[0].height;
  }
}

void walking(){
  imageMode(CENTER);
  //determine the direction
  if (keyPressed == true){
    if (key == CODED){
      if (keyCode == RIGHT){
        isfacingRight = true;
        isWalking = true;
      }
      if (keyCode == LEFT){
        isfacingRight = false;
        isWalking = true;
      }
    }
  }
  else {
    isWalking = false;
  }
  
  
  
  //BOOLEANS!!!
  //right bottom curve determine
  if (walking_x > tsx3 && walking_x < tsx4 && walking_y > button2_y && walking_y < height){
    isfacingrightCurve1 = true;
  }
  else {
    isfacingrightCurve1 = false;
  }
  //left curve determine
  if (walking_x < tsx2 && walking_x > tsx1 && walking_y > button1_y && walking_y < button3_y){
    isfacingleftCurve = true;
  }
  else{
    isfacingleftCurve = false;
  }
  //right top curve determine
  if(walking_x > tsx3 && walking_x < tsx4 && walking_y >0 && walking_y < button2_y){
    isfacingrightCurve2 = true;
  }
  else{
    isfacingrightCurve2 = false;
  }
  
  
  
  //if the stickman is walking up right bottom
  if (walking_x > buttonUD1_x - buttonUD1_width/2 && walking_x < buttonUD1_x + buttonUD1_width/2 && walking_y + walkingRF.getHeight() > tsy4 && walking_y + walkingRF.getHeight() < tsy1){
    if (keyPressed == true){
      if (keyCode == UP){
        iscurveUpr1 = true;
        fill (255,255,255);
        text("UP", buttonUD1_x - 100, buttonUD1_y - 100);
      }
      if (keyCode == DOWN){
        iscurveUpr1 = false; 
        fill (255,255,255);
        text("DOWN", buttonUD1_x - 100, buttonUD1_y - 100);
      }
    }
  }
  //if the stickman is walking up left side
  if (walking_x > buttonUD2_x - buttonUD2_width/2 && walking_x < buttonUD2_x + buttonUD2_width/2 && walking_y + walkingRF.getHeight() > tsy7 && walking_y + walkingRF.getHeight() < tsy1){
    if (keyPressed == true){
      if (keyCode == UP){
        iscurveUpl = true;
        fill (255,255,255);
        text("UP", buttonUD2_x, buttonUD2_y - 100);
      }
      if (keyCode == DOWN){
        iscurveUpl = false; 
        fill (255,255,255);
        text("DOWN", buttonUD2_x, buttonUD2_y - 100);
      }
    }
  }
  //if the stickman is walking up right top
  if (walking_x > buttonUD3_x - buttonUD3_width/2 && walking_x < buttonUD3_x + buttonUD3_width/3 && walking_y + walkingRF.getHeight() > 0 && walking_y + walkingRF.getHeight() < tsy4){
    if (keyPressed == true){
      if (keyCode == UP){
        iscurveUpr2 = true;
        fill (255,255,255);
        text("UP", buttonUD3_x, buttonUD3_y - 100);
      }
      if (keyCode == DOWN){
        iscurveUpr2 = false; 
        fill (255,255,255);
        text("DOWN", buttonUD3_x, buttonUD3_y - 100);
      }
    }
  }
  
  //execute walking
  if (isWalking == true){
    //mid flat ground walking
    if (isfacingRight == true){
      walking_x += walkingSpeed;
      walkingRF.display(walking_x, walking_y);
    }
    if(isfacingRight ==  false){
      walking_x -= walkingSpeed;
      walkingLF.display(walking_x, walking_y);
    }
    
    //right bottom side two curve
    //first right curve walking
    if (isfacingrightCurve1 == true && isfacingRight == true && iscurveUpr1 == false){
      walking_y -= walkingSpeed*(tsy1 - tsy2)/(tsx4 - tsx3);
    }
    if(isfacingrightCurve1 == true && isfacingRight == false && iscurveUpr1 == false){
      walking_y += walkingSpeed*(tsy1 - tsy2)/(tsx4 - tsx3);
    }
    if(isfacingrightCurve1 == true && isfacingRight == true && iscurveUpr1 == true){
      walking_y += walkingSpeed*(tsy1 - tsy2)/(tsx4 - tsx3);
    }
    if(isfacingrightCurve1 == true && isfacingRight == false && iscurveUpr1 == true){
      walking_y -= walkingSpeed*(tsy1 - tsy2)/(tsx4 - tsx3);
    }
    
    //left side two curves
    //left curve walking
    if(isfacingleftCurve == true && isfacingRight == false && iscurveUpl == false){
      walking_y -= walkingSpeed*(tsy3 - tsy4)/(tsx2 - tsx1);
    }
    if(isfacingleftCurve == true && isfacingRight == true && iscurveUpl == false){
      walking_y += walkingSpeed*(tsy3 - tsy4)/(tsx2 - tsx1);
    }
    if(isfacingleftCurve == true && isfacingRight == true && iscurveUpl == true){
      walking_y -= walkingSpeed*(tsy4 - tsy5)/(tsx2 - tsx1);
    }
    if(isfacingleftCurve == true && isfacingRight == false && iscurveUpl == true){
      walking_y += walkingSpeed*(tsy4 - tsy5)/(tsx2 - tsx1);
    }
    
    //right top two curves
    //right curve walking
    if (isfacingrightCurve2 == true && isfacingRight == true && iscurveUpr2 == false){
      walking_y -= walkingSpeed*(tsy5 - tsy6)/(tsx4 - tsx3);
    }
    if(isfacingrightCurve2 == true && isfacingRight == false && iscurveUpr2 == false){
      walking_y += walkingSpeed*(tsy5 - tsy6)/(tsx4 - tsx3);
    }
    if(isfacingrightCurve2 == true && isfacingRight == true && iscurveUpr2 == true){
      walking_y += walkingSpeed*(tsy5 - tsy6)/(tsx4 - tsx3);
    }
    if(isfacingrightCurve2 == true && isfacingRight == false && iscurveUpr2 == true){
      walking_y -= walkingSpeed*(tsy5 - tsy6)/(tsx4 - tsx3);
    }
    
    //walking to the left top will transfer to the left bottom
    if(walking_x < 0 && walking_y > 0 && walking_y < tsy5){
      walking_y = tsy1 - walkingRF.getHeight()/2;
      walking_x = 0;
      //boolean all reset
      isfacingRight = true;
      isfacingrightCurve1 = false;
      isfacingleftCurve = false;
      isfacingrightCurve2 = false;
      iscurveUpr1 = false;
      iscurveUpl = false;
      iscurveUpr2 = false;
      /*println(isfacingrightCurve1);
      println(isfacingleftCurve);
      println(isfacingrightCurve2);
      println(iscurveUpr1);
      println(iscurveUpl);
      println(iscurveUpr2);*/
    }
    //walking to the left bottom will transfer to the left top
    if(walking_x < 0 && walking_y > tsy3 && walking_y < height){
      walking_y = tsy7 - walkingRF.getHeight()/2;
      walking_x = 0;
      isfacingRight = true;
      //boolean all reset
      isfacingrightCurve1 = false;
      isfacingleftCurve = false;
      isfacingrightCurve2 = false;
      iscurveUpr1 = true;
      iscurveUpl = true;
      iscurveUpr2 = true;
    }
  }
  //standing image
  //if the stickman is not walking then show standing image at that position
  else if(isfacingRight == true){
    image(standingRF,walking_x,walking_y, walking_width, walking_height);
    }
    else {
      image(standingLF,walking_x,walking_y, walking_width, walking_height);
    }
}

//open door action change game state
void openDoor(){
  //open door of credits
  if (walking_x > door1_x && walking_x < door1_x + door1_width*2 && walking_y > tsy7 && walking_y < tsy5){
    if (keyPressed == true){
      if (keyCode == UP){
        //gamestate = credits
        textFont(titleFont, button1_height/1.25);
        text("Credits", walking_x, walking_y);
        door1_open = true;
      }
    }
  }
  else{
    door1_open = false;
  }
  if(door1_width >= doorOpen_width && door1_open == true){
    door1_width -= 2;
  }
  if(door1_width <= doorClose_width && door1_open == false){
    door1_width += 2;
  }
  
  //open door of option
  if (walking_x > door2_x && walking_x < door2_x + door2_width*2 && walking_y > tsy5 && walking_y < tsy3){
    if (keyPressed == true){
      if (keyCode == UP){
        //open door of option
        //gamestate = option
        textFont(titleFont, button1_height/1.25);
        text("Option", walking_x, walking_y);
        door2_open = true;
      }
    }
  }
  else{
    door2_open = false;
  }
  if(door2_width >= doorOpen_width && door2_open == true){
    door2_width -= 2;
  }
  if(door2_width <= doorClose_width && door2_open == false){
    door2_width += 2;
  }
  
  //open door of start
  if (walking_x > door3_x && walking_x < door3_x + door3_width*2 && walking_y > tsy3 && walking_y < tsy1){
    if (keyPressed == true){
      if (keyCode == UP){
        //open door of start
        //gamestate = start
        textFont(titleFont, button1_height/1.25);
        text("Start", walking_x, walking_y);
        door3_open = true;
      }
    } 
  }
  else{
    door3_open = false;
  }
  if(door3_width >= doorOpen_width && door3_open == true){
    door3_width -= 2;
  }
  if(door3_width <= doorClose_width && door3_open == false){
    door3_width += 2;
  }
}