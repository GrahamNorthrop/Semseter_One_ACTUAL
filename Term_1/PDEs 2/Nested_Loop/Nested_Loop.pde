//Graham Northrop
void setup() {
  size(200, 200);
}

void draw() {
  for (int i=0; i<=width; i+=10) {
    for (int a=0; a<=height; a+=10) {
      fill(random(222));
      rectMode(CENTER);
      rect(i, a, 10, 10);
     
    }
  }
}
