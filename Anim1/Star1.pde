void petal() {
      
      pushMatrix();
      for(int i=0;i<6;i++){
        translate(0,-(i*10));
      for (int j=-countPetal; j<countPetal; j++){
        //float r1 =TWO_PI*(countPetal*0.5);
        float r2 = TWO_PI/countPetal;
        float m1 = map(j,0,countPetal,30,40);
         noFill();
         
             float time = millis()*0.001666666666;
    
      
      float r = map(sin((time+i)*0.0111111), -1, 1, 0, 255);
     
    float g = map(sin(time+22.5*0.0111111), -1, 1, 0, 255);
    //float g = map(sin((time+22.5)>>1), -1, 1, 0, 255);
   
     //float b = map(sin((time+45+i)*0.0111111), -1, 1, 0, 255);
     float b = 33;

    
   //println(b);
        stroke(r,g,b);
        if(j<0){
        
 strokeWeight(1);
//pushMatrix();
          rotate(r2*0.5);
         // translate(2,-8);
            translate(2,-(i*2));
           
            
               line(3,3,20-(i*2),20-(i*2));
          
   
        }else{
   
           strokeWeight(1);
            rotate(r2);
          translate(0,-j,-zpos);
  
      }
  
      if(countPetal<=10){
       // point(10,10,20-(i*2));
      }else{
        if(i==4){
        
               point(3,3,0);
        }
        //stroke(0);
          //line(3,3,20-(i*2),20-(i*2));
         
 
      }
      }
      }
      popMatrix();
    }
    
    void petal2() {
      
      pushMatrix();
      for(int i=0;i<6;i++){
        translate(0,-(i*10));
      for (int j=-countPetal; j<countPetal; j++){
        //float r1 =TWO_PI*(countPetal*0.5);
        float r2 = TWO_PI/countPetal;
        float m1 = map(j,0,countPetal,30,40);
         noFill();
         
             float time = millis()*0.001666666666;
    
      
      float r = map(sin(time+i*0.011111111111111), -1, 1, 0, 255);
     // println(r);
    float g = map(sin(time+22.5*0.011111111111111), -1, 1, 0, 255);
     float b = map(sin(time+45+i*0.011111111111111), -1, 1, 0, 255);
    
  
        stroke(r,g,b);
        if(j<0){
        
 strokeWeight(1);
//pushMatrix();
          rotate(r2*0.5);
         translate(2,-8);
            //translate(2,-(i*2));
          
              // line(3,3,20-(i*2),20-(i*2));
        
   
        }else{
   
           strokeWeight(1);
            rotate(r2);
          translate(0,-j,-zpos);
  
      }
  
      if(countPetal<=10){
       // point(10,10,20-(i*2));
      }else{
        if(i==4){
          //rotate(r2*0.5);
          //translate(2,-8);
          stroke(i*2,255,frameCount%255);
               point(3,3,0);
        }
        //stroke(0);
          //line(3,3,20-(i*2),20-(i*2));
         
 
      }
      }
      }
      popMatrix();
    }

void build(){


       translate(width/2,height/2);
      
      pushMatrix();
         
       for (int i=0; i<count; i++) {
      float x = TWO_PI/count;
      rotate(rotatez);
      if(start){
      petal();}else{
        petal2();
      }

      rotatez+=x;
    }
    popMatrix();
      if(rotatez>=6.28){
        rotatez=0;
      }
      
   
       z = sin(motion);
       //println(z);
    
     if(start){
        ypos =map(z,-1,1,6,10);
       countPetal = 50;
       tranz =map(z,-1,1,1,0.1);
        zpos = map(z,-1,1,-5,0);
     }else{
       ypos =map(z,-1,1,-13,18);
       countPetal = 20;
       zpos = map(z,-1,1,-5,10);
        tranz =map(z,-1,1,3,0.01);
     }
     

}
