import processing.video.*;

Movie        videoComp,videoComp2;
PShader      vhs, vhs_glitch, vhs_wobble, binaryGlitch, sobel, ascii, bloom;

int          filterState         = 0;
int          numberOfFilters     = 7;
String       currentFilter;

//STUFF
boolean      skip = false;

String[] lines;

int move =0;


//void  keyPressed() {
//  if ((key == 'a') || (key == 'A')) {
//    skip = true;
//  }
//}

void shadersettings(){
  


  //LOAD IN SHADERS
  vhs = loadShader("vhs2.glsl");
  vhs.set("iResolution", float(width), float(height));
  vhs_glitch = loadShader("vhs_glitch.glsl");
  vhs_glitch.set("iResolution", float(width), float(height));
  vhs_wobble = loadShader("vhs_wobble.glsl");
  vhs_wobble.set("iResolution", float(width), float(height));
  binaryGlitch = loadShader("binaryGlitch.glsl");
  binaryGlitch.set("iResolution", float(width), float(height));
  sobel = loadShader("sobel.glsl");
  sobel.set("iResolution", float(width), float(height));
  ascii = loadShader("ascii.glsl");
  ascii.set("iResolution", float(width), float(height));
  bloom = loadShader("bloomHDR.glsl");
  bloom.set("iResolution", float(width), float(height));
  
   
  
}

void shaderdraw(){
  
   if (skip == true) {
    filterState++;
    if (filterState > numberOfFilters) {
      filterState = 0;
    }
    skip         = false;
  }

  //SHADER SETTINGS
  vhs.set("iGlobalTime", millis() / 1000.0);
  vhs_glitch.set("iGlobalTime", millis() / 1000.0);
  vhs_wobble.set("iGlobalTime", millis() / 1000.0);
  bloom.set("iGlobalTime", millis() / 1000.0);

  //DRAW THE LAYERS
  image(videoComp, 0, 0, width, height);
  //image(videoComp2, 0, 0, width, height);
  filterLayer();

  //READOUT
  surface.setTitle("FPS " + nf(int(frameRate), 2) + " || filterState " + currentFilter);
  
}

void moviePlay(){
  if(screens==1){
     videoComp = new Movie(this, "test2.mp4");
  videoComp.loop();
  }
  
  if (screens==2){
    videoComp.stop();
     videoComp = new Movie(this, "corridor1.mp4");
  videoComp.loop();
    
  }
   if (screens==3){
    videoComp.stop();
  //   videoComp = new Movie(this, "corridor1.mp4");
  //videoComp.play();
    
  }
  
  
}

int DISPLAY_MODE = 3;
  
  public void keyReleased(){
    if(key >= '0' && key <= '8'){
      DISPLAY_MODE = key - '0';
    }
   
     if(key == 'z'){
       screens= (screens +1)%3;
       //videoComp.stop();
       moviePlay();
     }
      //screens= (screens +1)%3;
  
  //println(screens);
  }
