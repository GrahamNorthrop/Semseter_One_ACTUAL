//Graham Northrop
//Collision Detection
//Setup Runs Once
//Declaring global variables
int xspeed, yspeed;
int xpos, ypos, wdth, ht;
void setup() {
  size(displayWidth, displayHeight);
  background(0);
  xspeed = 0;
  yspeed = 10;
  wdth = 20;
  ht = 20;
  //doubled wdth and ht to double size of ball
  noStroke();
  xpos = width/2;
  ypos = height/2;
  frameRate(30); //speed halved
}

//Draw is a loop
void draw() {
//background(255);
//made it a comment to show ball path
  fill(255);
  ellipse(xpos+50, ypos, wdth, ht);
  ellipse(xpos, ypos, wdth, ht);
  //created second ball by adding ellipse
  xpos += xspeed;
  ypos += yspeed;
  if (xpos >= width-wdth/2 || xpos <= wdth/2){
    xspeed *= -1;
  }
  if (ypos >= height-ht/2 || ypos <= ht/2){
    yspeed = yspeed * -1;
  }
  println(frameCount);
}

//Formatiing error: the second "if" was to far indented

