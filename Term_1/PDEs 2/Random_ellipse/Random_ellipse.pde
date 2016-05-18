void setup() {
  size(1000,1000);
  background(0,0,255);
}


void draw() {
  fill(random(150,255),random(20,50),random(20,50));
  ellipse(mouseX,mouseY,random(20,50),random(20,50));
  //background(0,0,255);
  
}
