String dispVal = "0";
String compVal = "";
String compVal2 = "";
float compValI = 0;
float compValI2 = 0;
float result = 0;
char opValue;
boolean firstNum;


Button[] numButtons = new Button[10];
Button[] opButtons = new Button[6];
//Button[] spButtons = new Button[1];


void setup() {
  size(325, 475);
  background(80);
  frameRate(60);
  fill(0, 255, 0);
  strokeWeight(1);
  stroke(200);
  rect(5, 6, 314, 65, 10);

  numButtons[0] = new Button(165, 347).asNumber(0, 45, 45);
  numButtons[1] = new Button(245, 347).asNumber(1, 45, 45);
  numButtons[2] = new Button(10, 285).asNumber(2, 45, 45);
  numButtons[3] = new Button(85, 285).asNumber(3, 45, 45);
  numButtons[4] = new Button(165, 285).asNumber(4, 45, 45);
  numButtons[5] = new Button(245, 285).asNumber(5, 45, 45);
  numButtons[6] = new Button(10, 215).asNumber(6, 45, 45);
  numButtons[7] = new Button(85, 215).asNumber(7, 45, 45);
  numButtons[8] = new Button(165, 215).asNumber(8, 45, 45);
  numButtons[9] = new Button(245, 215).asNumber(9, 45, 45);

  opButtons[0] = new Button(35, 125).asOperator("+", 50, 20);
  opButtons[1] = new Button(115, 125).asOperator("-", 50, 20);
  opButtons[2] = new Button(195, 125).asOperator("*", 50, 20);
  opButtons[3] = new Button(275, 125).asOperator("/", 50, 20);
  opButtons[4] = new Button(37, 355).asOperator("Clear", 60, 30);
  opButtons[5] = new Button(150, 395).asOperator("=", 60, 30);


  firstNum = true;
}

void draw() {
  //background(0,255,0);
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].over(mouseX, mouseY);
  }
  //display operators
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].over(mouseX, mouseY);
  }

  updateDisplay();
}


void performCalc() {
  compValI = float(compVal);
  compValI2 = float(compVal2);

  if (opValue == '+') {
    result = compValI + compValI2;
    dispVal = str(result);
  } 
  if (firstNum) {
    compVal = dispVal;
  } else {
    compVal = dispVal;
    compVal2 = "";
  }
  if (opValue == '-') {
    result = compValI - compValI2;
    dispVal = str(result);
  } 
  if (firstNum) {
    compVal = dispVal;
  } else {
    compVal = dispVal;
    compVal2 = "";
  }
  if (opValue == '*') {
    result = compValI * compValI2;
    dispVal = str(result);
  } 
  if (firstNum) {
    compVal = dispVal;
  } else {
    compVal = dispVal;
    compVal2 = "";
  }
  if (opValue == '/') {
    result = compValI / compValI2;
    dispVal = str(result);
  } 
  if (firstNum) {
    compVal = dispVal;
  } else {
    compVal = dispVal;
    compVal2 = "";
  }
}

void updateDisplay() {
  fill(0, 255, 0);
  strokeWeight(0);
  rect(6.5, 7.5, 311, 63, 7);
  fill(0);
  textSize(25);
  text(dispVal, 20, 37);
}

void mousePressed() {
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].over(mouseX, mouseY);
    if (numButtons[i].overBox) {
      if (firstNum) {
        compVal += int(numButtons[i].numVal);
        dispVal = compVal;
      } else {
        compVal2 += int(numButtons[i].numVal);
        dispVal = compVal2;
      }
    }
  }


  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].over(mouseX, mouseY);
    if (opButtons[i].overBox) {
      if (opButtons[i].opVal == "Clear") {
        dispVal = "0";
        opValue = 'C';
        compVal = "";
        compVal2 = "";
        compValI = 0;
        compValI2 = 0;
        result = 0;
        firstNum = true;
      } else if (opButtons[i].opVal == "=") {
        // Perform calculation
        firstNum = true;
        performCalc();
      } else if (opButtons[i].opVal == "+") {
        if (result !=0) {
          opValue = '+';
          compVal2 = "";
          firstNum = false;
          dispVal = "+";
        } else {
          opValue = '+';
          firstNum = false;
          dispVal = "+";
        }
      } else if (opButtons[i].opVal == "-") {
        if (result !=0) {
          opValue = '-';
          compVal2 = "";
          firstNum = false;
          dispVal = "-";
        } else {
          opValue = '-';
          firstNum = false;
          dispVal = "-";
        }
      } else if (opButtons[i].opVal == "*") {
        if (result !=0) {
          opValue = '*';
          compVal2 = "";
          firstNum = false;
          dispVal = "*";
        } else {
          opValue = '*';
          firstNum = false;
          dispVal = "*";
        }
      } else if (opButtons[i].opVal == "/") {
        if (result !=0) {
          opValue = '/';
          compVal2 = "";
          firstNum = false;
          dispVal = "/";
        } else {
          opValue = '/';
          firstNum = false;
          dispVal = "/";
        }
      }
    }
  }
}