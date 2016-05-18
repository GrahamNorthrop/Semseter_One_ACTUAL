int x, y;

void setup() {
  size(400, 400);
  frameRate(10);
  // Set start coords
  x = 0;
  y = 0;
  strokeWeight(3);
}

void draw() {
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      if (x>width) {
        x=width;
      }
      moveRight(1);
    } else if (keyCode == DOWN) {
      if (y>height) {
        y=height;
      }
      moveDown(1);
    } else if (keyCode == UP) {
      if (y<0) {
        y=0;
      }
      moveUp(1);
    } else if (keyCode == LEFT) {
      if (x<0) {
        x=0;}
        moveLeft(1 );
      }
    }
  }


void mouseClicked() {
  saveFrame("Etch-A-Sketch_#######.png");
}



// Method to draw right line
void moveRight(int  rep) {
  for (int r=0; r<rep*10; r++) { //<>//
    point(x+r, y);
  }
  x=x+(10*rep);
}

void moveLeft(int rep) {
  for (int l=0; l<rep*10; l++) {
    point(x-l, y);
  }
  x=x-(10*rep);
}

void moveDown(int rep) {
  for (int u=0; u<rep*10; u++) {
    point(x, y+u);
  }
  y=y+(10*rep);
}

void moveUp(int rep) {
  for (int d=0; d<rep*10; d++) {
    point(x, y-d);
  }
  y=y-(10*rep);
}  