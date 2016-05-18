String dispVal = "0";
String compVal = "";
String compVal2 = "";
float compValI = 0;
float compValI2 = 0;
float result = 0;
String opValue;
boolean firstNum;


Button[] numButtons = new Button[10];
Button[] opButtons = new Button[11];
Button[] spButtons = new Button[1];


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
  opButtons[5] = new Button(155, 407).asOperator("=", 60, 30);
  opButtons[6] = new Button(35, 450).asOperator("^2", 55, 25);
  opButtons[7] = new Button(115, 450).asOperator("Sqrt", 55, 25);
  opButtons[8] = new Button(155, 175).asOperator("(-)", 55, 25);
  opButtons[9] = new Button(195, 450).asOperator("^", 55, 25);
  opButtons[10] = new Button(275, 450).asOperator("sin", 55, 25);

  spButtons[0] = new Button(85, 347).asSpecial(".", 45, 45);


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
  for (int i=0; i<spButtons.length; i++) {
    spButtons[i].display();
    spButtons[i].over(mouseX, mouseY);
  }

  updateDisplay();
}


void performCalc() {
  compValI = float(compVal);
  compValI2 = float(compVal2);

  if (opValue == "+") {
    result = compValI + compValI2;
    dispVal = str(result);
  } 
  if (firstNum) {
    compVal = dispVal;
  } else {
    compVal = dispVal;
    compVal2 = "";
  }
  if (opValue == "-") {
    result = compValI - compValI2;
    dispVal = str(result);
  } 
  if (firstNum) {
    compVal = dispVal;
  } else {
    compVal = dispVal;
    compVal2 = "";
  }
  if (opValue == "*") {
    result = compValI * compValI2;
    dispVal = str(result);
  } 
  if (firstNum) {
    compVal = dispVal;
  } else {
    compVal = dispVal;
    compVal2 = "";
  }
  if (opValue == "/") {
    result = compValI / compValI2;
    dispVal = str(result);
  } 
  if (firstNum) {
    compVal = dispVal;
  } else {
    compVal = dispVal;
    compVal2 = "";
  }
  if (opValue == "^2") {
    result = compValI * compValI;
    dispVal = str(result);
  } 
  if (firstNum) {
    compVal = dispVal;
  } else {
    compVal = dispVal;
    compVal2 = "";
  }
  if (opValue == "Sqrt") {
    result = sqrt(compValI);
    dispVal = str(result);
  } 
  if (firstNum) {
    compVal = dispVal;
  } else {
    compVal = dispVal;
    compVal2 = "";
  }
  if (opValue == "(-)") {
    if (firstNum==true) {
      compValI = compValI * -1;
      dispVal = str(compValI);
    } else {
      compValI2 = compValI2 * -1;
      dispVal = str(compValI2);
    } 
    if (firstNum) {
      compVal = dispVal;
    } else {
      compVal = dispVal;
      compVal2 = "";
    }
  }
  if (opValue == "^") {
    result = pow(compValI, compValI2);
    dispVal = str(result);
  } 
  if (firstNum) {
    compVal = dispVal;
  } else {
    compVal = dispVal;
    compVal2 = "";
  }
  if (opValue == "sin") {
    result = sin(compValI);
    dispVal = str(result);
  } 
  if (firstNum) {
    compVal = dispVal;
  } else {
    compVal = dispVal;
    compVal2 = "";
  }
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
        opValue = "C";
        compVal = "";
        compVal2 = "";
        compValI = 0;
        compValI2 = 0;
        result = 0;
        firstNum = true;
      } else if (opButtons[i].opVal == "=") {
        // Perform calculation
        firstNum = false;
        performCalc();
      } else if (opButtons[i].opVal == "+") {
        if (result !=0) {
          opValue = "+";
          compVal2 = "";
          firstNum = false;
          dispVal = "+";
        } else {
          opValue = "+";
          firstNum = false;
          dispVal = "+";
        }
      } else if (opButtons[i].opVal == "-") {
        if (result !=0) {
          opValue = "-";
          compVal2 = "";
          firstNum = false;
          dispVal = "-";
        } else {
          opValue = "-";
          firstNum = false;
          dispVal = "-";
        }
      } else if (opButtons[i].opVal == "*") {
        if (result !=0) {
          opValue = "*";
          compVal2 = "";
          firstNum = false;
          dispVal = "*";
        } else {
          opValue = "*";
          firstNum = false;
          dispVal = "*";
        }
      } else if (opButtons[i].opVal == "/") {
        if (result !=0) {
          opValue = "/";
          compVal2 = "";
          firstNum = false;
          dispVal = "/";
        } else {
          opValue = "/";
          firstNum = false;
          dispVal = "/";
        }
      } else if (opButtons[i].opVal == "^2") {
        if (result !=0) {
          opValue = "^2";
          compVal2 = "";
          firstNum = false;
          dispVal = "^2";
        } else {
          opValue = "^2";
          firstNum = false;
          dispVal = "^2";
        }
      } else if (opButtons[i].opVal == "Sqrt") {
        if (result !=0) {
          opValue = "Sqrt";
          compVal2 = "";
          firstNum = false;
          dispVal = "Sqrt";
        } else {
          opValue = "Sqrt";
          firstNum = false;
          dispVal = "Sqrt";
        }
      } else if (opButtons[i].opVal == "^") {
        if (result !=0) {
          opValue = "^";
          compVal2 = "";
          firstNum = false;
          dispVal = "^";
        } else {
          opValue = "^";
          firstNum = false;
          dispVal = "^";
        }
      } else if (opButtons[i].opVal == "sin") {
        if (result !=0) {
          opValue = "sin";
          compVal2 = "";
          firstNum = false;
          dispVal = "sin";
        } else {
          opValue = "sin";
          firstNum = false;
          dispVal = "sin";
        }
      } else if (opButtons[i].opVal == "(-)") {
        opValue = "(-)";
        performCalc();
      }
    }
  }
  for (int i=0; i<spButtons.length; i++) {
    Button iSpButton = spButtons[i];
    iSpButton.over(mouseX, mouseY);
    if (iSpButton.overBox) {
      if (iSpButton.spVal == ".") {
        if (iSpButton.overBox && firstNum == true) {
          compVal += iSpButton.spVal;
          dispVal = compVal;
        } else if (iSpButton.overBox && firstNum == false) {
          compVal2 += iSpButton.spVal;
          dispVal = compVal2;
        }
      }
    }
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