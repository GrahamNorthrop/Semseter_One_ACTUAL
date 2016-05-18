void setup() {
  size(900,400);
}

void draw() {
  background(55);
  fill(255);
  textSize(30);
  text("Historic Computer Systems",250,50);
  stroke(225);
  strokeWeight(5);
  line(75,225,825,225);
  strokeWeight(3);
  line(130,280,235,225);
  strokeWeight(3);
  line(95,100,220,225);
  histEvent("ENIAC: 1946","The first electronic general-purpose computer.\n It was Turing-complete, digital, and capable of being \nreprogrammed to solve a large class of numerical problems.",100,100,100,40);
  textSize(10);
  histEvent("Manchester 'Baby'","The world's first stored-program computer.\n It was built at the Victoria University of Manchester by Frederic C. Williams, \nTom Kilburn, and Geoff Tootill, and ran its first program on\n 21 June 1948.",120,310,100,40);
  //histEvent("Cool",300,300,100,40);
}

void histEvent(String bText, String dText, int x, int y, int w, int h) {
  rectMode(CENTER);
  noStroke();
  fill(0,255,0);
  //rect(x,y,w+40,h+20,15);  
  fill(255,0,0);
  textSize(20);
  text(bText,x-58,y-8);
  if (mouseX>=x && mouseX<=x+w && mouseY>=y-35 && mouseY<=y+h) {
    fill(0,255,0);
    textSize(10);
    text(dText, x-90,y+20);
  }
  
}
