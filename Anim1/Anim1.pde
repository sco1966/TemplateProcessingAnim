

boolean start=true;

PImage images, images2;

int screens = 0;
String url2="";
String url3="";

int speed;
float z =0;
//star

float rotatez=0;
float rotatez2=0;
int count= 8;
int countPetal=4;
float tranz =1;
float tranz2=1;
float zpos =10;
float ypos =0;
boolean record;

float motion =0;

void setup()
{
  size(1000, 1000, P3D);
  //fullScreen(P3D);
  frameRate(120);
  background(0);
}



void draw()
{



  switch(screens) {

  case 0: 
    fill(0, 0, 0, 10);
    rect(0, 0, width, height);

    pushStyle();
    pushMatrix();
    if (frameCount%3 == 0) {
      build();
    }
    popMatrix();
    popStyle();

    motion = (motion + 0.01)%6.28; 
    break;

  case 1: 
 
     println("work in here...."); 
    break;

  case 2:             // Default executes if the case labels
    println("then here....");   // don't match the switch parameter
    break;
  }
}

void keyPressed() {
  screens= (screens +1)%3;
  
  println(screens);
}

void mousePressed(){
  start = !start; 
  
}
