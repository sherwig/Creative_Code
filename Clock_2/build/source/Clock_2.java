import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.pdf.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Clock_2 extends PApplet {



// number of grid points horizontal
int xCount = 7;
// number of grid points vertical
int yCount = 5;

// view rotation
int offsetX = 0, offsetY = 0, clickX = 0, clickY = 0;
float rotationX = 0, rotationY = 0, targetRotationX = 0, targetRotationY = 0, clickRotationX, clickRotationY;

// image output
boolean savePDF = false;


public void setup() {
  
}


public void draw() {

  background(255);
  fill(255);
  strokeWeight(.5f);

  setView();

  scale(40);

  // Draw mesh
  for (int y = 0; y < yCount; y++) {
    beginShape(QUAD_STRIP);
    for (int x = 0; x <= xCount; x++) {

      float z = sin(x);

      vertex(x, y, z);
      vertex(x, y+1, z);
    }
    endShape();
  }

  // image output
  if(savePDF == true) {
    endRaw();
    savePDF = false;
  }
}



public void keyPressed(){
  if(key=='p' || key=='P') savePDF = true;
}


public void mousePressed(){
  clickX = mouseX;
  clickY = mouseY;
  clickRotationX = rotationX;
  clickRotationY = rotationY;
}



public void setView() {
  translate(width*0.2f,height*0.2f);

  if (mousePressed) {
    offsetX = mouseX-clickX;
    offsetY = mouseY-clickY;
    targetRotationX = clickRotationX + offsetX/PApplet.parseFloat(width) * TWO_PI;
    targetRotationY = min(max(clickRotationY + offsetY/PApplet.parseFloat(height) * TWO_PI, -HALF_PI), HALF_PI);
    rotationX += (targetRotationX-rotationX)*0.25f;
    rotationY += (targetRotationY-rotationY)*0.25f;
  }
  rotateX(-rotationY);
  rotateY(rotationX);
}
  public void settings() {  size(800, 800, P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Clock_2" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
