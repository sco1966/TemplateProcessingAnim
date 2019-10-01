

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
  size(1280, 720, P3D);
  //fullScreen(P3D);
  frameRate(120);
  background(0);
  
    bloomsettings();
  shadersettings();
   lines = loadStrings("linesz.txt");
  smooth(16);
  //blendMode(EXCLUSION);
  //colorMode(HSB, 360, 100, 100, 100);
xx=0;
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
shaderdraw();
  //NEXT FILTER EVERY TIME YOU PRESS A
 

 // rect(144,0,200,1000);
  drawsetting();
  
  move++;
 if(move >= lines.length-1){
    move=0;
  }
    break;

  case 2:            
    println("then here....");   
    break;
    
      default:
    println("default...");  
    break;
  }
}

void keyPressed() {
  //screens= (screens +1)%3;
  
  //println(screens);
}

void mousePressed(){
  start = !start; 
  
}

void movieEvent(Movie m) {
  m.read();
}
