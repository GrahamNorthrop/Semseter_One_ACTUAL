class Button {
  boolean isNum;
  boolean isSp;
  float numVal;
  String opVal;
  String spVal;
  float x;
  float y;
  int boxSize;
  int buttonW;
  int buttonH;
  boolean overBox;

  Button(float x, float y) {
    this.x = x;
    this.y = y;
  }

  Button asNumber(float tempNumVal, int tempW, int tempH) {
    isNum = true;
    numVal = tempNumVal;
    buttonW = tempW;
    buttonH = tempH;
    return this;
  }

  Button asOperator(String tempOpVal, int tempW, int tempH) {
    opVal = tempOpVal;
    buttonW = tempW;
    buttonH = tempH;
    return this;
  }

  void display() {
    if (isNum) {
      if (overBox) {
        fill(255, 0, 0);
      } else {
        fill(#7FF57E);
      }
      stroke(0);
      strokeWeight(1.5);
      rect(x, y, buttonW+8, buttonH-20, 17.5);
      fill(0);
      textSize(24);
      text(int(numVal), x+20, y+21.5);
    } else if (isSp) {
      fill(133);
      stroke(0);
      strokeWeight(2);
      rect(x, y, boxSize, boxSize, 20);
      fill(0);
      textSize(24);
      text(spVal, x+15, y+30);
    } else {
      if (overBox) {
        fill(#E264FF);
      } else {
        fill(#647DFF);
      }
      stroke(0);
      strokeWeight(1.5);
      ellipseMode(CENTER);
      ellipse(x, y, buttonW-3, buttonH+4);
      fill(0);
      textSize(17);
      textMode(CENTER);
      if (opVal=="Clear")
      {
        text(opVal, x-21, y+6);
      } else if (opVal=="*")
      {
        text(opVal, x-4, y+8);
      } else 
      { 
        text(opVal, x-8, y+6);
      }
    }
  }



  void over(int xpos, int ypos) {
    overBox = xpos > x && xpos < x+buttonW && ypos > y && ypos < y+buttonH;
  }
}