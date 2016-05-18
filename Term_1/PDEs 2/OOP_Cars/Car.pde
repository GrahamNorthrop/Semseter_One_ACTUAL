class Car {
  color c;
  float x;
  float y;
  float speed;
  float left;

  Car(color tempC, float tempX, float tempY, float tempSpeed) {
    c = color(tempC);
    x = tempX;
    y = tempY;
    speed = tempSpeed;
    left = random(2);
  }

  void display() {
    fill(c);
    rect(x, y, 30, 10);
    fill(0);
    ellipse(x+30, y+10, 4, 4);
    ellipse(x, y+10, 4, 4);
    line(x+25,y-3,x+25,y);
  }

  void drive() {
    if (left <=1) {
      x += speed;
      if (x > width) {
        x = 0;
      }
    } else {
      x -= speed;
      if (x < 0) {
        x = width;
      }
    }
  }
}