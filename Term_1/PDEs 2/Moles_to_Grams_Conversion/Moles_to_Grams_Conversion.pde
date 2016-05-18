void setup() {}

void settings() {
  size(displayWidth/2,displayHeight/2);
}

void draw() {
  background(220);
  textSize(13);
  fill(0,0,255);
  text("Created by Graham Northrop",7,13);
  textSize(30);
  fill(255,0,255);
  text("INCHES TO CENTIMETERS CONVERSION",(width/2)-250,50);
  strokeWeight(4);
  line(0,150,width,150);
  fill(255,0,0);
  ellipse(mouseX,150,7,7);
  textSize(20);
  text("Inches = " + mouseX + "     Centimeters = " + inchConvert(mouseX),100,200);
}

float inchConvert(float i) {
  float c = i*2.54;
  return c;
}