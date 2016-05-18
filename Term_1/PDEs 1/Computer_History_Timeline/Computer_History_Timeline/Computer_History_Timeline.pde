void setup() {
  size(950,450);
}

void draw() {
  background(55);
  fill(255);
  textSize(30);
  text("Historic Computer Systems",250,50);
  stroke(225);
  strokeWeight(5);
  line(75,225,875,225);
  strokeWeight(3);
  line(150,280,255,225);
  strokeWeight(3);
  line(95,100,200,225);
  line(285,100,350,225);
  line(320,320,420,225);
  line(440,125,490,225);
  line(505,290,565,225);
  line(670,100,740,225);
  line(705,290,800,225);
  histEvent("ENIAC: 1946","The first electronic general-purpose computer.\n It was Turing-complete, digital, and capable of being \nreprogrammed to solve a large class of numerical problems.",100,100,100,40);
  histEvent("Manchester 'Baby': 1948","The world's first stored-program computer.\n It was built at the Victoria University of \nManchester by Frederic C. Williams, \nTom Kilburn, and Geoff Tootill, and ran\n its first program on 21 June 1948.",88,310,100,40);
  histEvent("Manchester Mark 1: 1949"," It is especially historically significant \nbecause of its pioneering inclusion of index\n registers, an innovation which made it easier\n for a program to read sequentially \nthrough an array of words in memory.",250,100,100,40);
  histEvent("EDSAC: 1949","It calculated a table of squares and a\n list of prime numbers.The EDSAC also served as\n the basis for the first commercially \napplied computer.",300,350,100,40);
  histEvent("Ferranti Mark 1: 1951","It was based on the Manchester Mark 1.\n The main improvements over the Manchester Mark 1 were\n in the size of the primary storage, secondary \nstorage, a faster multiplier, and additional instructions.",450,125,100,40);
  histEvent("LEO I: 1951","It ran the world's first regular routine\n office computer job. On 17 November 1951,\n the J. Lyons company began weekly \noperation of a bakery valuations job on the \nLEO (Lyons Electronic Office). This was the first \nbusiness application to go live on a stored \nprogram computer.",515,320,100,40);
  histEvent("UNIVAC I: 1951","UNIVAC was the first mass produced computer. \nIt used 5,200 vacuum tubes and consumed 125 kW of power. \nIts primary storage was serial-access mercury delay \nlines capable of storing 1,000 words of 11decimal \ndigits plus sign",680,100,100,40);
  histEvent("IBM 650: 1954","It was a smaller and more affordable computer \nthat proved very popular. The IBM 650 weighed over 900 kg, \nthe attached power supply weighed around 1350 kg \nand both were held in separate cabinets. It cost \nUS$500,000 ($4.39 million as of 2015)",705,320,100,40);
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
    text(dText, x-80,y+20);
  }
  
}
