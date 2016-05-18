void setup() {}

void settings(){
  size(200,200);
}

void draw() {
  background(255);
  line(0,100,width,100);
  ellipse(mouseX,100,3,3);
  fill(0);
  text("F = " + mouseX + "     C = " + tempConverter(mouseX),50,50);
}

float tempConverter(float f) {
  float c = (f-32)*(5.0/9.0);
  return c;
}