float xx =0;
public void s_start(PGraphics pg){
//4pg.background(0);

pg.lights();
 
   xx+=1;

  pg.translate(width / 2, height / 2,-mouseX);
  pg.rotateY(map(xx, 0, 20, 0, PI));
  //pg.rotateZ(map(int(lines[move]), 0, height, 0, -PI));
  //pg.noStroke();
  pg.noFill();
  pg.stroke(255, 255, 255);
  //pg.fill(255, 255, 255);
  pg.translate(0, -40, 0);
  drawCylinder(pg,10, 180, 20, 16);
  
  

  pg.translate(0,50,0);
 pg. rotateX(PI);
  drawCylinder(pg,10, 180, 20, 16); 
// Draw a mix between a cylinder and a cone
  //drawCylinder(70, 70, 120, 64); // Draw a cylinder
  //drawCylinder(0, 180, 200, 4); // Draw a pyramid
 
}

void drawCylinder(PGraphics pg,float topRadius, float bottomRadius, float tall, int sides) {
  float angle = 0;
  float angleIncrement = TWO_PI / sides;
  pg.beginShape(QUAD_STRIP);
  for (int i = 0; i < sides + 1; ++i) {
     if(i==15){
        pg.stroke(234,23,23);
        
      }else {pg.stroke(255);};
    pg.vertex(topRadius*cos(angle), 0, topRadius*sin(angle));
    pg.vertex(bottomRadius*cos(angle), tall, bottomRadius*sin(angle));
    angle += angleIncrement;
  }
  pg.endShape();
  
  // If it is not a cone, draw the circular top cap
  if (topRadius != 0) {
    angle = 0;
    pg.beginShape(TRIANGLE_FAN);
    
    // Center point
    pg.vertex(0, 0, 0);
    for (int i = 0; i < sides + 1; i++) {
     
      pg.vertex(topRadius * cos(angle), 0, topRadius * sin(angle));
      angle += angleIncrement;
    }
    pg.endShape();
  }

  // If it is not a cone, draw the circular bottom cap
  if (bottomRadius != 0) {
    angle = 0;
    pg.beginShape(TRIANGLE_FAN);

    // Center point
    pg.vertex(0, tall, 0);
    for (int i = 0; i < sides + 1; i++) {
      pg.vertex(bottomRadius * cos(angle), tall, bottomRadius * sin(angle));
      angle += angleIncrement;
    }
    pg.endShape();
  }
}
