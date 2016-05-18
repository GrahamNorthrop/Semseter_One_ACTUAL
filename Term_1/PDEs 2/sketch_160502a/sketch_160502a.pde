Background b = new Background(0,100,100);
Spawner s=new Spawner();
ArrayList <Block> blocks = new ArrayList();
boolean release=false,pressed=false,pr=false,keyReleased;
MakeBlocks m = new MakeBlocks();
Block b2= new Block(10,640,1,1,150);
float cameraX=0,camerY=0,p=0,level=13,levelEnd=-500;
void setup()
{
  size(1000,700);
  frameRate(30);
  
}


void draw()
{
  textSize(11);
  b.display();
  //if (frameCount==1)
  //m.retrive(str(level));
  s.display();
  doStuff();
  released();
}

void released()
{
  if (mousePressed==false)
  {
    p=0;
  }
  else
  {
    if (p==0)
    pressed=true;
    else
    pressed=false;
    p=1;
  }
  release=false;
  keyReleased=false;
}

void mouseReleased()
{
  release=true;
  p=0;
}

void keyReleased()
{
  keyReleased=true;
}




float worldX(float x)
{
  x-=cameraX;
  return x;
}

float toWorldX(float x)
{
  x+=cameraX;
  return x;
}
Button button= new Button(900,650,"Submit as Level");
class Background
{
  float r,g,b,rh,gh,bh,rc,gc,bc;
  Background(float r1, float g1, float b1)
  {
    r=r1;
    g=g1;
    b=b1;
    rh=r;
    bh=b;
    gh=g;
    rc=r;
    gc=g;
    bc=b;
  }
  void display()
  {
    if ((r>rc+1 || r<rc-1) || (g>gc+1 || g<gc-1) || (b>bc+1 || b<bc-1))
    {
      float rd=(rc-rh)/120,gd=(gc-gh)/120,bd=(bc-bh)/120;
      r+=rd;g+=gd;b+=bd;
    }
    else
    {
      rh=r;
      gh=g;
      bh=b;
    }
    int a=0;
    float rdec=r/(height/2),gdec=g/(height/2),bdec=b/(height/2);
    float r1=0,g1=0,b1=0;
    strokeWeight(2);
    while (a<height)
    {
      stroke(r1,g1,b1);
      line(0,a,width,a);
      a+=2;
      r1+=rdec;
      g1+=gdec;
      b1+=bdec;
    }
    strokeWeight(1);
  }
  void modulate(float r2,float g2,float b2)
  {
    rh=r;gh=g;bh=b;
    rc=r2;gc=g2;bc=b2;
  }
  
}
boolean d;
Dialogue dialogue = new Dialogue("Type the level number");
void doStuff()
{
  button.display();
  if (button.selected==true)
  {
    d=true;
    dialogue.close=false;
  }
  if (d==true)
  {
    if (dialogue.close==false)
    dialogue.display();
  }
}class Block
{
  float x,y,left,top,right,bottom,w,h,trans=0,overCount=0;
  float offsetX=0,offsetY=0;
  int w2=0,h2=0;
  boolean over=false,special=false,selected=false,kinda=false,fall=true;
  Block(float x1,float y1,float w1,float h1,boolean override)
  {
    if (override==true)
    {
      x=x1;
      y=y1;
      w=w1;
      h=h1;
      left=x;
      top=y;
      right=x+w;
      bottom=y+h;
    }
  }
  Block(float x1, float y1, int w1, int h1)
  {
    x=x1;
    y=y1;
    w2=w1;
    h2=h1;
    w=w1*50;
    h=h1*50;
    left=x;
    top=y;
    right=x+w;
    bottom=y+h;
  }
  Block(float x1, float y1,boolean fall1, int w1, int h1)
  {
    fall=fall1;
    x=x1;
    y=y1;
    w2=w1;
    h2=h1;
    w=w1*50;
    h=h1*50;
    left=x;
    top=y;
    right=x+w;
    bottom=y+h;
  }
  Block(boolean kinda1,float x1, float y1, int w1, int h1)
  {
    x=x1;
    y=y1;
    w2=w1;
    h2=h1;
    w=w1*50;
    h=h1*50;
    left=x;
    top=y;
    right=x+w;
    bottom=y+h;
    kinda=kinda1;
  }
  Block(float x1, float y1, int w1, int h1,float trans1)
  {
    x=x1;
    y=y1;
    w=w1*50;
    h=h1*50;
    w2=w1;
    h2=h1;
    left=x;
    top=y;
    right=x+w;
    bottom=y+h;
    trans=trans1;
    special=true;
  }
  void display()
  {
    left=x;
    top=y;
    right=x+w;
    bottom=y+h;
    if (special==false)
    {
    if (toWorldX(mouseX)>left && toWorldX(mouseX)<right && mouseY>top && mouseY<bottom)
    {
      over=true;
    }
    else
    {
      if (selected==false)
      over=false;
    }
    }
    else
    {
    if (mouseX>left && mouseX<right && mouseY>top && mouseY<bottom)
    {
      over=true;
    }
    else
    {
      if (selected==false)
      over=false;
    }
    }
    
    if (over==true)
    overCount++;
    else
    overCount=0;
    if (special==true && selected==true && (offsetX!=0 || offsetY!=0) && over==true)
    {
      x=mouseX-offsetX;
      y=mouseY-offsetY;
      while (toWorldX(x) % 10 !=0)
      {
        x++;
      }
      while (y % 10 !=0)
      {
        y++;
      }
    }
    //////////////////////DRAWING OF BLOCK////////////////
    if (trans==0)
    fill(0);
    else
    fill(0,trans);
    noStroke();
    if (special==false && kinda==false)
    rect(worldX(x)+1,y+1,w-2,h-2);
    else
    rect(x+1,y+1,w-2,h-2);
    noFill();
    if (trans==0)
    stroke(0,0,255);
    else
    stroke(0,0,255,trans);
    if (special==false && kinda==false)
    rect(worldX(x),y,w,h);
    else
    rect(x,y,w,h);
    stroke(0,0,255,100-trans);
    if (special==false && kinda==false)
    rect(worldX(x)-1,y-1,w+2,h+2);
    else
    rect(x-1,y-1,w+2,h+2);
    
    
    //for block select
    
    //special block gets special stuff
    if (special==true)
    {
      if (mousePressed==true && offsetX==0 && offsetY==0 && over==true)
      {
        if (special==false)
        offsetX=toWorldX(mouseX)-x;
        else if(special==true)
        offsetX=(mouseX)-x;
        offsetY=mouseY-y;
        selected=true;
      }
      else if (mousePressed==false || release==true)
      {
        offsetX=0;
        offsetY=0;
        selected=false;
      }
    }
    //no selecting when not pressed
    if (release==true)
    {
      selected=false;
    }
  }
  
  
}class Button
{
  float x,y,w,h;
  String text="";
  boolean over,press,selected;
  Button(float x1,float y1,String text1)
  {
    x=x1;
    y=y1;
    text=text1;
    
    h=20;
  }
  void display()
  {
    w=textWidth(text)+8;
    if (mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h)
    over=true;
    else
    over=false;
    if (over==true && pressed==true)
    {
      press=true;
      selected=true;
      pressed=false;
    }
    else
    press=false;
    if(release==true)
    selected=false;
    stroke(0,200,200);
    if (over==true)
    fill(100);
    else
    fill(150);
    rect(x,y,w,h,4);
    fill(0);
    text(text,x+4,y+h-5);
  }
   
}int last=0;
Button butt = new Button(443,350+15,"Submit as this level");
Button b3 = new Button(20,20,"X");
Button b1 =new Button(400,20,"<");
Button b4 = new Button(600,20,">");
class Dialogue
{
  String text,path="Level",end=".txt";
  float w;
  int level,t=0;
  float speed=4.3;
  boolean close=true;
  Dialogue(String text1)
  {
    text=text1;
  }
  void display()
  {
    butt.display();
    b3.display();
    b1.display();
    b4.display();
    if (b1.press==true)
    {
      speed-=.1;
    }
    if (b4.press==true)
    {
      speed+=.1;
    }
    fill(255);
    text(speed,490,33);
    if (b3.press==true)
    {
      close=true;
    }
    if (butt.press==true)
    {
      if (level<=30 && level>=1)
      {
        fill(255,0,0);
        textSize(30);
        text("Submitting as level "+level , width/2-200 , 500);
        textSize(11);
        String path="level",end=".txt",temp="";
        PrintWriter output;
        temp=path+str(level)+end;
        output = createWriter(temp);
        output.println("0,230,1,1");
        output.println("S"+speed);
        float maxX=0;
        for (int p=0;p<blocks.size();p++)
        {
          Block t = blocks.get(p);
          if (t.x>maxX)
          maxX=t.x;
          output.println(t.x + "," + t.y + "," +t.w2 + "," +t.h2);
        }
        output.println("E"+maxX);
        output.flush();
        output.close();
        close=true;
      }
      else
      {
        level=0;
        t=1;
      }
    }
    if (t>0)
    t++;
    if (t>0 && t<60)
    {
      
      fill(255,0,0);
      textSize(30);
      text("Enter a number between 1 and 30!!" , width/2-200 , 500);
      textSize(11);
    }
    else if (t>=60)
    {
      
      t=0;
    }
    String temp=text+"  " +level;
    w=textWidth(temp)+8;
    noStroke();
    fill(0,100);
    rect(0,0,width,height);
    fill(150);
    rect(width/2-w/2,height/2,w,14,4);
    fill(255);
    text(temp,width/2-w/2+4,height/2+10);
    int a=0;
    if (keyReleased==true)
    {
      if (key!=BACKSPACE && key!=CODED)
      {
      String k = str(key);
      a=int(k);
      last=a;
      level=level*10+a;
      }
      if (key==BACKSPACE)
      {
        level-=last;
        level/=10;
      }
    }
    
  }
}class MakeBlocks
{
  BufferedReader br;
  String base = "level",end=".txt",path="";
  int level;
  MakeBlocks()
  {
    
  }
  void retrive(String level1)
  {
    if (level!=int(level1))
    {
      level=int(level1);
      path=base+str(level)+end;
      br= createReader(path);
      String line=" ";
      while (line!=null)
      {
        try
        {
          line=br.readLine();
        }
        catch (IOException e)
        {
          line=null;
        }
        if (line==null)
        {
          //line=null;
        }
        else
        {
         if (line.charAt(0)=='E')
         {
           String line1=line.substring(0);
           levelEnd=float(line1);
         }
         else if (line.charAt(0)=='S')
         {
         }
         else
         {
           String coord[] = split(line,",");
           Block temp = new Block(float(coord[0]),float(coord[1]),int(coord[2]),int(coord[3]));
           blocks.add(temp);
         }
        }
      }
      
    }
  }
  
}int count=5;
class Spawner
{
  Block b1 = new Block(true,10,640,1,1);
  Spawner()
  {
  }
  void display()
  {
    noStroke();
    fill(0);
    rect(0,height-70,width,height-70);
    b1.display();
    b2.display();
    stroke(255);
    line(0,height-70,width,height-70);
    line(70,height-70,70,height);
    //do stuff special scanner I dare you
    //move view
    
    //triangle 1
    noStroke();
    if (mouseX>width-50 && mouseX<width-20 && mouseY>height/2-40 && mouseY<height/2+40)
    fill(125,200);
    else
    fill(150);
    triangle(width-50,height/2-40,width-50,height/2+40,width-20,height/2);
    if (mouseX>width-50 && mouseX<width-20 && mouseY>height/2-40 && mouseY<height/2+40 && mousePressed==true && b2.selected==false)
    {
      cameraX+=count;
      count++;
    }
    ///triangle 2
    if (mouseX<50 && mouseX>20 && mouseY>height/2-40 && mouseY<height/2+40)
    fill(125,200);
    else
    fill(150);
    triangle(50,height/2-40,50,height/2+40,20,height/2);
    if (mouseX<50 && mouseX>20 && mouseY>height/2-40 && mouseY<height/2+40 && mousePressed==true && b2.selected==false && cameraX>0)
    {
      cameraX-=count;
      count++;
    }
    if (release==true)
    {
      count=5;
    }
    int a=0;
    while (a<blocks.size())
    {
      Block temp= blocks.get(a);
      temp.display();
      if (temp.over==true && pressed==true)
      {
        pressed=false;
        b2.x=worldX(temp.x);
        b2.y=temp.y;
        b2.selected=true;
        blocks.remove(a);
      }
      a++;
    }
    if (b2.selected==true)
    {
      int b=0;
      while (b<blocks.size())
      {
        Block temp= blocks.get(b);
        //making lines to help out alignment
        if (abs(worldX(temp.x)-b2.x)<=400)
        {
          stroke(250,250,0,50);
          if (temp.y==b2.y)
          line(worldX(temp.left)+temp.w/2,temp.top+temp.h/2,b2.left+temp.w/2,b2.top+temp.h/2);
          if (temp.x==b2.x)
          line(worldX(temp.left)+temp.w/2,temp.top+temp.h/2,b2.left+temp.w/2,b2.top+temp.h/2);
        }
        b++;
      }
    }
    if (b2.x!=10 && b2.y!=640 && release==true)
    {
      int c=0;
      while (c<blocks.size())
      {
        Block temp = blocks.get(c);
        if (b2.bottom<=height-70 && toWorldX(b2.x)==temp.right && b2.y== temp.y && b2.h==temp.h)
        {
         Block t= new Block(temp.x,temp.y,int(temp.w2+1),int(temp.h2));
         blocks.add(t);
         blocks.remove(c);
         b2.x=10;
         b2.y=640;
        }
        else if (toWorldX(b2.right)==temp.x && b2.y==temp.y && b2.h==temp.h)
        {
         Block t= new Block(toWorldX(b2.x),temp.y,int(temp.w2+1),int(temp.h2));
         blocks.add(t);
         blocks.remove(c);
         b2.x=10;
         b2.y=640;
        }
        else if (b2.top==temp.bottom && toWorldX(b2.x)==temp.x && b2.w==temp.w )
        {
         Block t= new Block(temp.x,temp.y,int(temp.w2),int(temp.h2+1));
         blocks.add(t);
         blocks.remove(c);
         b2.x=10;
         b2.y=640;
        }
        else if (b2.bottom==temp.top && toWorldX(b2.x)==temp.x && b2.w==temp.w)
        {
         Block t= new Block(temp.x,b2.y,int(temp.w2),int(temp.h2+1));
         blocks.add(t);
         blocks.remove(c);
         b2.x=10;
         b2.y=640;
        }
        c++;
      }
      if (b2.bottom<=height-70)
      {
        Block temp = new Block(toWorldX(b2.x),b2.y,int(b2.w2),int(b2.h2));
        blocks.add(temp);
        b2.x=10;
        b2.y=640;
      }
      else
      {
        b2.x=10;
        b2.y=640;
      }
    }
    
  }
}