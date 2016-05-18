//Graham Northrop

void setup() {
  size(1000,1000);
}

void draw() {
  background(128);
  drawGrid();
}

void drawGrid(){
  for(int i=100;i<=width;i=i+100) {
  line(0,i,width,i);  
  line(i,0,i,height);
  text(i,10,i-2);
  text(i,i-30,15);
  }
}
