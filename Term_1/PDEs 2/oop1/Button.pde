//Class Name
class Button {
  //Class Variables
  boolean button;
  int x, y, w, h;

  //Class Constructor
  Button(int tempX, int tempY, int tempW, int tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    button = false;
  }

  //Class Attributes
  void display() {
    if (button) {
      fill(255, 0, 0);
      text("Button ON: " + str(button), x, y-10);
      fill(0);
      rect(x, y, w, h);
    } else if (!button) {
      fill(255, 0, 0);
      text("Button ON: " + str(button), x, y-10);
      fill(#AA00F5);
      rect(x, y, w, h);
    }
  }

  //Class Behavior
  void clickButton() {
    if (mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h) {
      button = !button;
    }
  }
}