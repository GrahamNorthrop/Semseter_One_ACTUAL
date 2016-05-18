class Lines {
  float xpos;
  float ypos;
  float strokeW;
  float lineLength;
  Lines(float tempX, float tempY, float tempStroke, float tempLength) {
    xpos=tempX;
    ypos=tempY;
    strokeW=tempStroke;
    lineLength=tempLength;
  }
  void display() {
    strokeW = random(1, 7.5);
    lineLength = random(1, 60);
    stroke(random(255), random(255), random(255));
    if (xpos > width || xpos < 0 || ypos > height || ypos < 0) {
      xpos = random(width);
      ypos = random(height);
    } else {
      float a=random(100);
      if (a>75) {
        strokeWeight(strokeW);
        moveDown(xpos, ypos, lineLength);
      } else if (a>50) {
        strokeWeight(strokeW);
        moveLeft(xpos, ypos, lineLength);
      } else if (a>25) {
        strokeWeight(strokeW);
        moveUp(xpos, ypos, lineLength);
      } else {
        strokeWeight(strokeW);
        moveRight(xpos, ypos, lineLength);
      }
    }
  }


  void moveRight(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX+i, startY);
      xpos = startX + i;
      ypos = startY;
    }
  }


  void moveLeft(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX-i, startY);
      xpos = startX - i;
      ypos = startY;
    }
  }

  void moveUp(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX, startY+i);
      xpos = startX;
      ypos = startY + i;
    }
  }

  void moveDown(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX, startY-i);
      xpos = startX;
      ypos = startY - i;
    }
  }
}