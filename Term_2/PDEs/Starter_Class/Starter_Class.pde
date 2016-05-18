Ship[] myShip = new Ship[30];
Ship myShip1;


void setup() {
  size(700, 700);
  myShip1 = new Ship(#FF0829, random(width), random(height), random(30));


  for (int i=0; i<myShip.length; i++) {
    myShip[i] = new Ship(#FF0829, random(width), random(height), random(30));
  }
}

void draw() {
  background(255);
  myShip1.display();
  myShip1.fly();


  for (int i=0; i<myShip.length; i++) {
    myShip[i].display();
    myShip[i].fly();
  }
}