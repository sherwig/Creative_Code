// Original Code https://www.openprocessing.org/sketch/60945
import processing.sound.*;
// grid definition horizontal
int uCount = 60;
float uMin = -20;
float uMax = 20;

// grid definition vertical
int vCount = 60;
float vMin = -20;
float vMax = 20;
float s;

// view rotation
int offsetX = 0, offsetY = 0, clickX = 0, clickY = 0;
float rotationX = 0, rotationY = -1.1, targetRotationX = 0, targetRotationY = -1.1, clickRotationX, clickRotationY;



SoundFile file;



void setup() {
  size(800, 800, P3D);
  file = new SoundFile(this, "60bpm.mp3");
  file.play();
  file.loop();
}


void draw() {


  background(0);
  fill(255);

  // fill(0,0,114);
  strokeWeight(.1);

  setView();

  scale(25);

  s=second();

  // draw mesh
  for (float iv = 0; iv < vCount; iv++) {
    beginShape(TRIANGLE_STRIP);
    for (float iu = 0; iu <= uCount; iu++) {
      float u = map(iu, 0, uCount, uMin, uMax);
      float v = map(iv, 0, vCount, vMin, vMax);

      float x = u;
      float y = v;
      float z = cos(sqrt(u*u*1.2 + v*v));
      // vertex(x+(sin(tan(cos(frameCount*.02)))), y+sin(pow(4,sin(frameCount*.02))), z+sin(pow(cos(frameCount*.02),2)));

      if (s<=10)
      {
        file.rate(1);
        vertex(x+sin(frameCount*.02), y, z);

      }

      else if(s>10 &&s<=20)
      {
        file.rate(1.2);
        vertex(x+cos(frameCount*.02), y+sin(frameCount*.02), z);

      }
      else if(s>20 &&s<=30)
      {
        file.rate(1.4);
        vertex(x+(sin(frameCount*.02)*sin(frameCount*.02)), y+sin(frameCount*.02), z+sin(pow(cos(frameCount*.02),2)));
      }

      else if(s>30 &&s<=40)
      {
        file.rate(1.6);
        vertex(x+cos(frameCount*.02), y+sin(frameCount*.02), z+sin(frameCount*.02));

      }

      else if(s>40 &&s<=50)
      {
        file.rate(1.8);
        vertex(x+(sin(tan(cos(frameCount*.02)))), y+sin(pow(4,sin(frameCount*.02))), z+sin(pow(cos(frameCount*.02),2)));

      }

      else
      {
        file.rate(2);
        vertex(x+sin(frameCount*.02), y+sin(frameCount*.01), z+tan(frameCount*.01));
      }
      // vertex(x+sin(frameCount*.02), y+sin(frameCount*.01), z+sin(frameCount*.01));


      v = map(iv+1, 0, vCount, vMin, vMax);
      y = v;
      z = cos(sqrt(u*u*1.2 + v*v));

      // vertex(x+(sin(tan(cos(frameCount*.04)))), y+sin(pow(4,sin(frameCount*.04))), z+sin(pow(cos(frameCount*.04),2)));

      if (s<=10)
      {
        vertex(x+cos(frameCount*.02), y, z);

      }
      else if(s>10 &&s<=20)
      {
        vertex(x+cos(frameCount*.02), y+cos(frameCount*.02), z);

      }

      else if(s>20 &&s<=30)
      {
      vertex(x+(sin(frameCount*.04)*sin(frameCount*.04)), y+cos(frameCount*.02), z+sin(pow(cos(frameCount*.04),2)));

      }

      else if(s>30 &&s<=40)
      {
        vertex(x+cos(frameCount*.02), y+cos(frameCount*.02), z+cos(frameCount*.02));

      }

      else if(s>30 &&s<=50)
      {
      vertex(x+(sin(tan(cos(frameCount*.04)))), y+sin(pow(4,sin(frameCount*.04))), z+sin(pow(cos(frameCount*.04),2)));

      }

      else
      {

        vertex(x+cos(frameCount*.02), y+cos(frameCount*.01), z+tan(frameCount*.01));
      }

      // vertex(x+cos(frameCount*.01), y+cos(frameCount*.01), z+cos(frameCount*.01));

    }
    endShape();
  }
}



void mousePressed(){
  clickX = mouseX;
  clickY = mouseY;
  clickRotationX = rotationX;
  clickRotationY = rotationY;
}



void setView() {
  translate(width*0.5,height*0.5);

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
