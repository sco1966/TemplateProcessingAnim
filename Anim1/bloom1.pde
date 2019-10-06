import processing.pdf.*;

import com.thomasdiewald.pixelflow.java.DwPixelFlow;
import com.thomasdiewald.pixelflow.java.imageprocessing.filter.DwFilter;
import processing.core.PApplet;
import processing.core.PFont;
import processing.opengl.PGraphics2D;

  boolean saveOneFrame = false;
  
  int viewport_w = 3000;
  int viewport_h = 3000;
  int viewport_x = 230;
  int viewport_y = 0;
  
  DwPixelFlow context;

  DwFilter filter;
  PGraphics3D pg_render;
  
  //PGraphics2D pg_render;
  PGraphics2D pg_render2;
  PGraphics2D pg_luminance;
  PGraphics2D pg_bloom;
  
  PFont font12;

 public void bloomsettings(){
  
    
    context = new DwPixelFlow(this);
    //context.print();
    //context.printGL();
    
    filter = new DwFilter(context);
    
   // pg_render2 = (PGraphics2D) createGraphics(width, height, P2D);
   
    pg_render = (PGraphics3D) createGraphics(width, height, P3D);
    pg_render.smooth(8);
    
    pg_luminance = (PGraphics2D) createGraphics(width, height, P2D);
    pg_luminance.smooth(8);
    
    pg_bloom = (PGraphics2D) createGraphics(width, height, P2D);
    pg_bloom.smooth(0);
    font12 = createFont("Verdana", 32);
      //background(0);
 }
 
 public void drawsetting(){ 
 
   pg_render.beginDraw();
    {
      pg_render.background(0,0);
      pg_render.blendMode(BLEND); // default
      pg_render.rectMode(CENTER);
   
          
          int col =  color(200, 171, 88);
         // pg_render.

      
            pg_render.fill(col);
          
        // pg_render.rect(300, 0, 150, 6000);
         // pg_render.rect(width/4, 0, 150, 6000);
          
            pg_render.fill(245, 119, 24);
 pg_render.rect((width/4), 0, 100, 1666);
  //pushStyle();
  //   pushMatrix();
  pg_render.translate(0,0,int(lines[move]));
  s_start(pg_render);
  //popMatrix();
  //popStyle();
  
     pg_render.stroke(30, 171, 88);
  

    }
    pg_render.endDraw();
    

    
    if(DISPLAY_MODE != 0){
      // luminance pass
      filter.luminance_threshold.param.threshold = 0.0f; // when 0, all colors are used
      filter.luminance_threshold.param.exponent  = 5;
      filter.luminance_threshold.apply(pg_render, pg_luminance);
      
      // bloom pass
      // if the original image is used as source, the previous luminance pass 
      // can just be skipped
      filter.bloom.param.mult   = map(mouseX, 0, width, 0, 10);
      filter.bloom.param.radius = map(mouseY, 0, height, 0, 1);
     
      //filter.bloom.param.mult   = 0.1;
      //filter.bloom.param.radius = 0.3;
      filter.bloom.apply(pg_luminance, pg_bloom, pg_render);
    }


    switch(DISPLAY_MODE){
      case 2: filter.copy.apply(pg_bloom, pg_render); break;
      case 3: filter.copy.apply(pg_luminance, pg_render); break;
      case 4: filter.copy.apply(filter.bloom.gaussianpyramid.tex_blur[0], pg_render); break;
      case 5: filter.copy.apply(filter.bloom.gaussianpyramid.tex_blur[1], pg_render); break;
      case 6: filter.copy.apply(filter.bloom.gaussianpyramid.tex_blur[2], pg_render); break;
      case 7: filter.copy.apply(filter.bloom.gaussianpyramid.tex_blur[3], pg_render); break;
      case 8: filter.copy.apply(filter.bloom.gaussianpyramid.tex_blur[4], pg_render); break;
    }
    
     //blendMode(REPLACE);
    
    image(pg_render, 0, 0);
    


      
  }
  
