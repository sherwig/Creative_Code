import processing.pdf.*;

// number of grid points horizontal
int xCount = 24;
// number of grid points vertical
int yCount = 18;

// view rotation
int offsetX = 0, offsetY = 0, clickX = 0, clickY = 0;
float rotationX = 0, rotationY = 0, targetRotationX = 0, targetRotationY = 0, clickRotationX, clickRotationY;

// image output
boolean savePDF = false;


void setup() {
  size(1000, 800, P3D);
}


void draw() {

  background(255);
  fill(255);
  strokeWeight(.2);

  setView();

  scale(40);

  // Draw mesh
  for (int y = 0; y < yCount; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x <= xCount; x++) {

       float z = sin(x);

      // vertex(x*sin(frameCount * 0.01), y, z* tan(frameCount * 0.01));
      // vertex(x*cos(frameCount * 0.01), y+1,  z* tan(frameCount * 0.01));

      vertex(x+sin(frameCount * 0.05), y+sin(frameCount * 0.1), z);
      vertex(x+sin(frameCount * 0.05), (y+1)+cos(frameCount * 0.1),  z);
    }
    endShape();
  }

}



void keyPressed(){
  if(key=='p' || key=='P') savePDF = true;
}


void mousePressed(){
  clickX = mouseX;
  clickY = mouseY;
  clickRotationX = rotationX;
  clickRotationY = rotationY;
}



void setView() {
  // translate(width,height);
  translate(width*0.05,height*0.05);

  if (mousePressed) {
    offsetX = mouseX-clickX;
    offsetY = mouseY-clickY;
    targetRotationX = clickRotationX + offsetX/float(width) * TWO_PI;
    targetRotationY = min(max(clickRotationY + offsetY/float(height) * TWO_PI, -HALF_PI), HALF_PI);
    rotationX += (targetRotationX-rotationX)*0.25;
    rotationY += (targetRotationY-rotationY)*0.25;
  }
  rotateX(-rotationY);
  rotateY(rotationX);
}
