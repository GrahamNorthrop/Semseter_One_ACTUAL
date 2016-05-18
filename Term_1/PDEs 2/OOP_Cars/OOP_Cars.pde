Car[] myCars = new Car[30];
Car myCar1;


void setup() {
  size(700, 700);
  myCar1 = new Car(#FF0829, random(width), random(height), random(30));


  for (int i=0; i<myCars.length; i++) {
    myCars[i] = new Car(#FF0829, random(width), random(height), random(30));
  }
}

void draw() {
  background(255);
  myCar1.display();
  myCar1.drive();


  for (int i=0; i<myCars.length; i++) {
    myCars[i].display();
    myCars[i].drive();
  }
}