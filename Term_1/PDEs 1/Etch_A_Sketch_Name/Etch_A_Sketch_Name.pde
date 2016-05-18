int x, y;

void setup() {
  size(400,400);
  frameRate(10);
  // Set start coords
  x = 0;
  y = 0;
}

void draw() {
  fill(255);
  drawName();
  noLoop();
}

// Algorithm for your first name
void drawName() {
  moveRight(5);
  moveUp(0);
  moveLeft(0);
  moveDown(25);
}

// Method to draw right line
void moveRight(int  rep) {
  for(int r=0;r<rep*10;r++){
    point(x+r,y);
  }
  x=x+(10*rep);
}

void moveLeft(int rep) {
  for(int l=0;l<rep*10;l++){
    point(x-l,y);
  }
  x=x-(10*rep);
}

void moveDown(int rep) {
  for(int u=0;u<rep*10;u++){
    point(x,y+u);
  }
  y=y+(10*rep);
}

void moveUp(int rep) {
  for(int d=0;d<rep*10;d++){
    point(x,y-d);
  }
  y=y-(10*rep);
}  

