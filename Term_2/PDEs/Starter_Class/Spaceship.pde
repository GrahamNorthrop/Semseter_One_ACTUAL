class Ship {
  color c;
  float x;
  float y;
  float speed;
  float left;

  Ship(color tempC, float tempX, float tempY, float tempSpeed) {
    c = color(tempC);
    x = tempX;
    y = tempY;
    speed = tempSpeed;
    left = random(2);
  }

  void display() {
    fill(c);
    ellipse(x, y, 30, 10);
    fill(0);
    strokeWeight(2);
    line(x-15, y+2, x-20, y+4);
    line(x-15, y-2, x-20, y-4);
  }

  void fly() {
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