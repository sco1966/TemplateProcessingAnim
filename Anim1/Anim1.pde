

boolean start=true;

PImage images,images2;
int currentTweet;

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
 //size(1000, 1000, P3D);
 fullScreen(P3D);
 frameRate(120);
  background(0);


}



void draw()
{

 //   pushStyle();
 //rectMode(CORNER);
 fill(0,0,0,10);
  rect(0,0,width,height);
 // popStyle();

 pushStyle();
pushMatrix();
if(frameCount%3 == 0){
  build();


}
popMatrix();
popStyle();

motion = (motion + 0.01)%6.28;

 //println(motion);

  //delay(speed);
  //println(counter);
}




void mousePressed(){

start = !start;
}
