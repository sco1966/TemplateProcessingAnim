

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
  frameRate(60);
  background(0);


  bloomsettings();
  shadersettings();
  lines = loadStrings("linesz2.txt");
  smooth(16);

  xx=0;

  
    bloomsettings();
  shadersettings();
   lines = loadStrings("lines.txt");
  smooth(16);

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


    drawsetting();

    move++;
    if (move >= lines.length-1) {
      move=0;
    }





    break;

  case 2:            
    shaderdraw();


    drawsetting();  
    break;

  default:
    println("default...");  
    break;
  }
}

void keyPressed() {
if ((key == 'a') || (key == 'A')) {
    skip = true;
  }
}

void mousePressed() {
  start = !start;
}

void movieEvent(Movie m) {
  m.read();
}
