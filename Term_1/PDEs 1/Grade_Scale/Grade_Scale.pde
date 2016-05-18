void setup() {
  size(200, 200);
}

void draw() {
  background(255);
  stroke(0);
  strokeWeight(2);
  line(0,150,width,150);
  stroke(255,0,0);
  strokeWeight(5);
  point(mouseX,150);
  displayGrade(mouseX/2);
}

void displayGrade(float grade) {
  fill(0);
  if (grade>=94) {
    text("Assign letter grade A. " + grade,20,50);
  } else if (grade<94 && grade>=89) {
    text("Assign letter grade A-. " + grade,20,50);
  } else if (grade<89 && grade>=87) {
    text("Assign letter grade B+. " + grade,20,50);
  } else if (grade<87 && grade>=83) {
    text("Assign letter grade B. " + grade,20,50);
  } else if (grade<83 && grade>=80) {
    text("Assign letter grade B-. " + grade,20,50);
  } else if (grade<80 && grade>=77) {
    text("Assign letter grade C+. " + grade,20,50);
  } else if (grade<77 && grade>=73) {
    text("Assign letter grade C. " + grade,20,50);
  } else if (grade<73 && grade>=70) {
    text("Assign letter grade C-. " + grade,20,50);
  } else if (grade<70 && grade>=67) {
    text("Assign letter grade D+. " + grade,20,50);
  } else if (grade<67 && grade>=63) {
    text("Assign letter grade D. " + grade,20,50);
  } else if (grade<63 && grade>=60) {
    text("Assign letter grade D-. " + grade,20,50);
  } else { //Catch-all
    text("Assign letter grade F. " + grade,20,50);
  }
}

