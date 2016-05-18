void setup() {
}

void draw() {
  background(0);
  text(minusOne(mouseX), 10, 20);
  text(numCounter(mouseX), 10, 35);
  text(str(isPositive(mouseX)), 10, 50);
  text(converToPercent(mouseX), 10, 65);
}

int minusOne(int i) {
  int a = i-1;
  return a;
}

int numCounter(int i) {
  int a = i+1;
  return a;
}
boolean isPositive(int i) {
  if (i>=0) {
    return true;
  } else {
    return false;
  }
}

float converToPercent(int i) {
  float num = i*0.01;
  return num;
}