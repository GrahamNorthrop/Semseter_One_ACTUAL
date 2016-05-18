float a=600,b=600,spd=0,x=0,y=0;
boolean hit=false;
void setup() {
  size(1500,900);
}

void draw() {
  background(0,255,0);
  if (hit==false)
  {
  zoog(x,y);
  if (x>mouseX)
  {
    x-=spd+5;
  }
  else
  {
    x+=spd+5;
  }
  if (y>mouseY)
  {
    y-=spd+5;
  }
  else
  {
    y+=spd+5;
  }
  }
  blackHole();
  if (hit==false)
  {
  spd+=.01;
  }
  text(spd,10,10);
}


void zoog(float x, float y) {
  rectMode(CENTER);
  
  //Body
  stroke(0);
  fill(#00F2E0);
  rect(x,y,20,100);
  
  //head
  stroke(0);
  fill(#C500F2);
  ellipse(x,y-30,60,60);
  
  //eyes
  fill(0);
  ellipse(x-19,y-30,16,32);
  ellipse(x+19,y-30,16,32);
  
  //legs
  stroke(0);
  line(x-10,y+50,x-20,y+60);
  line(x+10,y+50,x+20,y+60);
  
  //arms
  stroke(0);
  line(x-10,y+10,x-20,y+40);
  line(x+10,y+10,x+20,y+40);
}
  
  void blackHole(){
    
    
    ellipse(a,b,80,80);
    
    
//    if (keyPressed == true)
//    {
//      if (key == 'w')
//      {
//        b-=spd;
//      }
//    }
//    if (keyPressed == true)
//    {
//     if (key == 's')
//      {
//        b+=spd;
//      }
//    }
//    if (keyPressed == true)
//    {
//      
//      if (key == 'a')
//      {
//        a-=spd;
//      }
//    }
//    if (keyPressed == true)
//    {
//      if (key == 'd')
//      {
//        a+=spd;
//      }
//    }
    if (a<mouseX)
    {
      a+=spd;
    }
    if (a>mouseX)
    {
      a-=spd;
    }
    if (b<mouseY)
    {
      b+=spd;
    }
    if (b>mouseY)
    {
      b-=spd;
    }

    if (x > a-35 && x < a+35 && y > b-35 && y < b+35)
    {
      hit=true;
    }
    
  }

