//Original Code from Generative Design
// https://www.openprocessing.org/sketch/60943

import controlP5.*;

ControlP5 cp5;
// grid definition horizontal
int uCount = 50;
int uCount2 = 40;
//30
//63
//64
float uMin = -3;
float uMin2 = 9.19;
//0
//84
//9.19
float uMax = 72.79;
float uMax2 = 56.39;
//5
//55.20
//56.39

// grid definition vertical
int vCount = 40;
int vCount2 = 85;
//30
//84
//85
float vMin = 2.39;
float vMin2 = -11.20;
//-1
//4.4
//-11.20
float vMax = 3.75;
float vMax2 = 18.30;
//1
//0.00
//18.30

int loopFrames = 960; // 4-second loop (60fps * 4)
boolean saveVideo = false;
float frameCountLooped = 1;
float loopProgress=0;
float loopProgressRadians=0;

boolean recording=false;

// view rotation
int offsetX = 0, offsetY = 0, clickX = 0, clickY = 0;
float rotationX = 1, rotationY = 0.3, targetRotationX = 0, targetRotationY = 0, clickRotationX, clickRotationY;


void setup() {
  size(1260, 900, P3D);
  cp5 = new ControlP5(this);


    // cp5.addSlider("uCount").setPosition(25,50).setRange(0,100).setSize(200,20);
    // cp5.addSlider("uMin").setPosition(25,75).setRange(-20,20).setSize(200,20);
    // cp5.addSlider("uMax").setPosition(25,100).setRange(0,80).setSize(200,20);
    //
    // cp5.addSlider("vCount").setPosition(25,125).setRange(0,100).setSize(200,20);
    // cp5.addSlider("vMin").setPosition(25,150).setRange(-20,20).setSize(200,20);
    // cp5.addSlider("vMax").setPosition(25,175).setRange(0,30).setSize(200,20);

}


void draw() {
  updateLoopRecording();

  background(0);
  fill(255);
  strokeWeight(.01);


  pushMatrix();
  setView();

  scale(70);


  // draw mesh
  // scale(sin(loopProgressRadians));

  for (float iv = vCount-1; iv >= 0; iv--) {
    beginShape(QUAD_STRIP);
    for (float iu = 0; iu <= uCount; iu++) {
      float u = map(iu, 0, uCount, uMin, uMax);
      float v = map(iv, 0, vCount, vMin, vMax);

      float u2=map(iu, 0, uCount2, uMin2, uMax2);
      float v2=map(iv, 0, vCount2, vMin2, vMax2);

      float x = 0.75*v;
      float y = sin(u)*v;
      float z = cos(u)*cos(v);

      float x2 = 0.75*v2;
      float y2 = sin(u2)*v2;
      float z2 = cos(u2)*cos(v2);

      x=lerp(x,x2,abs(sin(loopProgressRadians)));
      y=lerp(y,y2,abs(sin(loopProgressRadians)));
      z=lerp(z,z2,abs(sin(loopProgressRadians)));

      // x=lerp(x,x2,loopProgressRadians);
      // y=lerp(y,y2,loopProgressRadians);
      // z=lerp(z,z2,loopProgressRadians);

      vertex(x+cos(frameCount*.01), y+cos(frameCount*.01), z);

      v = map(iv+1, 0, vCount, vMin, vMax);
      x = 0.75*v;
      y = sin(u)*v;
      z = cos(u)*cos(v);

      v2 = map(iv+1, 0, vCount2, vMin2, vMax2);
      x2 = 0.75*v2;
      y2 = sin(u2)*v2;
      z2 = cos(u2)*cos(v2);

      x=lerp(x,x2,abs(sin(loopProgressRadians)));
      y=lerp(y,y2,abs(sin(loopProgressRadians)));
      z=lerp(z,z2,abs(sin(loopProgressRadians)));

      // x=lerp(x,x2,loopProgressRadians);
      // y=lerp(y,y2,loopProgressRadians);
      // z=lerp(z,z2,loopProgressRadians);

      vertex(x+sin(frameCount*.01), y+sin(frameCount*.01), z);
      // println(abs(sin(loopProgressRadians)));

    }
    endShape();
  }
    popMatrix();

}


void updateLoopRecording() {
  // start/stop recording, and progress
  // if(frameCount == loopFrames - 1)
  // {
  //     recording=true;
  //     if(frameCount == loopFrames * 2) recording=false;
  //
  //
  // }
  //
  // if(recording)
  // {
  //   saveFrame("output/loop1_###.png");
  //
  // }

  //
  // if()
  // {
  //   recording=!recording;
  // }

  // create a looped framecount & normalized progress
  frameCountLooped = frameCount % loopFrames;
  loopProgress = frameCountLooped / loopFrames;
  loopProgressRadians = loopProgress * TWO_PI;

  // println(frameCountLooped, loopFrames, loopProgress);

}


void keyPressed(){

  // if(key=='r'|| key=='R')
  // {
  //  recording=!recording;
  // }

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
