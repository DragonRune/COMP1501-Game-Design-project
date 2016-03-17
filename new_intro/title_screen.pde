void button1Paint()
{
  stroke(255,255,255);
  strokeWeight(2);
  fill(0);
  rect(button1_x, button1_y, button1_width, button1_height, 7);
  fill(255, 255, 255);
  textFont(titleFont, button1_height/1.25);
  text("Credits", button1_x, button1_y);
}

void button2Paint()
{
  stroke(255,255,255);
  strokeWeight(2);
  fill(0);
  rect(button2_x, button2_y, button2_width, button2_height, 7);
  fill(255, 255, 255);
  textFont(titleFont, button2_height/1.25);
  text("Options", button2_x, button2_y);
}

void button3Paint()
{
  stroke(255,255,255);
  strokeWeight(2);
  fill(0);
  rect(button3_x, button3_y, button3_width, button3_height, 7);
  fill(255, 255, 255);
  textFont(titleFont, button3_height/1.25);
  text("Start", button3_x, button3_y);
}

void buttonUDPaint()
{
  stroke(255,255,255);
  strokeWeight(2);
  fill(0);
  rect(buttonUD1_x, buttonUD1_y, buttonUD1_width, buttonUD1_height, 7);
  rect(buttonUD2_x, buttonUD2_y, buttonUD2_width, buttonUD2_height, 7);
}

void roadPaint()
{
  stroke(126);
  strokeWeight(3);
  
  /*[OLD CODE] NOT USE
  //starts left flat line
  line(0, button3_y + button3_height/2 + button1_height*2, button3_x - button3_width/2, button3_y + button3_height/2 + button1_height*2);
  //starts mid flat line
  line(button3_x - button3_width/2, button3_y + button3_height/2 + button1_height*2, button3_x + button3_width/2, button3_y + button3_height/2 + button1_height*2);
  //starts right curved line
  line(button3_x + button3_width/2, button3_y + button3_height/2 + button1_height*2, width - button1_height*2, button2_y + (button3_y - button2_y)/2 + button1_height*2);
  //starts right flat line
  line(width - button1_height*2, button2_y + (button3_y - button2_y)/2 + button1_height*2, width, button2_y + (button3_y - button2_y)/2 + button1_height*2);
  
  
  //options right curved line
  line(width - button1_height*2, button2_y + (button3_y - button2_y)/2 + button1_height*2, button2_x + button2_width/2, button2_y + button2_height/2 + button1_height*2);
  //options mid flat line
  line(button2_x + button2_width/2, button2_y + button2_height/2 + button1_height*2, button2_x - button2_width/2, button2_y + button2_height/2 + button1_height*2);
  //options left curved line
  line(button2_x - button2_width/2, button2_y + button2_height/2 + button1_height*2, button1_height*2, button1_y + (button2_y - button1_y)/2 + button1_height*2.5);
  //options left flat line
  line(button1_height*2, button1_y + (button2_y - button1_y)/2 + button1_height*2.5, 0, button1_y + (button2_y - button1_y)/2 + button1_height*2.5);
  
  //credits left curved line
  line(button1_height*2, button1_y + (button2_y - button1_y)/2 + button1_height*2.5, button1_x - button1_width/2, button1_y + button1_height/2 + button1_height*2);
  //credits mid flat line
  line(button1_x - button1_width/2, button1_y + button1_height/2 + button1_height*2, button1_x + button1_width/2, button1_y + button1_height/2 + button1_height*2);
  //credits right curved line
  line(button1_x + button1_width/2, button1_y + button1_height/2 + button1_height*2, width - button1_height*2, button1_y - (button2_y - button1_y)/2 + button1_height*2);
  //credits right flat line
  line(width - button1_height*2, button1_y - (button2_y - button1_y)/2 + button1_height*2, width, button1_y - (button2_y - button1_y)/2 + button1_height*2);
  
  //title right curved line
  line(width - button1_height*2, button1_y - (button2_y - button1_y)/2 + button1_height*2, button1_x + button1_width/2, button1_y + button1_height/2 - button1_height*1.6);
  //title mid flat line
  line(button1_x + button1_width/2, button1_y + button1_height/2 - button1_height*1.6, button1_x - button1_width/2, button1_y + button1_height/2 - button1_height*1.6);
  //title left flat line
  line(button1_x - button1_width/2, button1_y + button1_height/2 - button1_height*1.6, 0, button1_y + button1_height/2 - button1_height*1.6);
  */
  
  //road paint
  //starts left flat line
  line(0,tsy1,tsx2, tsy1);
  //starts mid flat line
  line(tsx2, tsy1, tsx3, tsy1);
  //starts right curved line
  line(tsx3,tsy1, tsx4, tsy2);
  //starts right flat line
  line(tsx4, tsy2, width, tsy2);
  
  //options right curved line
  line(tsx4, tsy2, tsx3, tsy3);
  //options mid flat line
  line(tsx3, tsy3, tsx2, tsy3);
  //options left curved line
  line(tsx2, tsy3, tsx1, tsy4);
  //options left flat line
  line(tsx1, tsy4, 0, tsy4);
  
  //credits left curved line
  line(tsx1, tsy4, tsx2, tsy5);
  //credits mid flat line
  line(tsx2, tsy5, tsx3, tsy5);
  //credits right curved line
  line(tsx3, tsy5, tsx4, tsy6);
  //credits right flat line
  line(tsx4, tsy6, width, tsy6);
  
  //title right curved line
  line(tsx4, tsy6, tsx3, tsy7);
  //title mid flat line
  line(tsx3, tsy7, tsx2, tsy7);
  //title left flat line
  line(tsx2, tsy7, 0, tsy7);
  
  //starts bottom rect
  stroke(255,255,255);
  strokeWeight(2);
  fill(0);
  rect(button3_x, button3_y + (button3_height*2.5 + button3_height/2)/2, button3_width - button3_width/10, button3_height*2);
  //options bottom rect
  rect(button2_x, button2_y + (button2_height*2.5 + button2_height/2)/2, button2_width - button2_width/10, button2_height*2);
  //credits bottom rect
  rect(button1_x, button1_y + (button1_height*2.5 + button1_height/2)/2, button1_width - button1_width/10, button1_height*2);
  
}