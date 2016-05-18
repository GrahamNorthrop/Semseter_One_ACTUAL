//Create instance of Button
Button btn1 = new Button(50, 50, 100, 100);
Button btn2 = new Button(200, 50, 100, 100);
Button btn3 = new Button(350, 50, 100, 100);

void setup() {
  size(600,600);
}

void draw() {
  background(0,255,0);
  btn1.display();
  btn2.display();
  btn3.display();
}  


void mousePressed() {
  btn1.clickButton();
  btn2.clickButton();
  btn3.clickButton();
}