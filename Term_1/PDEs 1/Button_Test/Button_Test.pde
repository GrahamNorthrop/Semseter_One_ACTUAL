void setup() {
  size(400,400);
}

void draw() {
  button("This",100,100,100,40);
  button("Is",200,200,100,40);
  button("Cool",300,300,100,40);
}

void button(String bText, int x, int y, int w, int h) {
  rectMode(CENTER);
  fill(0);
  rect(x-3,y+3,w,h,15);
  fill(0,255,0);
  rect(x,y,w,h,15);  
  fill(255,0,0);
  textSize(35);
  text(bText,x-37,y+12);
  
}
