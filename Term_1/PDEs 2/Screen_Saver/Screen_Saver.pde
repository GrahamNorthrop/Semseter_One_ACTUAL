Lines[] myLines = new Lines[10];


void setup() {
  size(displayWidth, displayHeight);
  background(random(2, 50));
  for (int i=0; i<myLines.length; i++) {
    myLines[i] = new Lines(random(width), random(height), random(1, 5), random(1, 20));
  }
}

void draw() {
  for (int i=0; i<myLines.length; i++) {
    Lines iLines = myLines[i];
    iLines.display();
  }

  if (frameCount>=575) {
    background(0);
    frameCount=0;
  }
}