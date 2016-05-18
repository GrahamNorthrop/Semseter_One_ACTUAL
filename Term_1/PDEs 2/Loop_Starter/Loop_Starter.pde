//Graham Northrop

void setup() {
  size(200,200);
  background(200);
}

void draw() {
  int i=0;
  while(i<=width) {
    line(0,i,width,i);
    i+=20;
  }  
  noLoop();
}
