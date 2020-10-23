// CloudLerp.pde

import KinectPV2.*;
import org.openkinect.freenect.*;
import org.openkinect.processing.*;
import controlP5.*;
KinectPV2 kinect;

// Angle for rotation
//float a = 0;

// We'll use a lookup table so that we don't have to repeat the math over and over
int[] depthArray;
public static int KWIDTH=512;
public static int KHEIGHT=424;
int maxD = 1100; // 4.5mx
int minD = 400;  //  50cm
int sinOffset=60;
int r=0;
int g=50;
int b=158;
float sinSpeed=.05;
int skip=2;

float xLerp=400;
float x2=0;
float y2=0;
float yLerp=100;

float lerperX, lerperY;

int loopFrames = 480; // 4-second loop (60fps * 4)
boolean saveVideo = false;
float frameCountLooped = 1;
float loopProgress=0;
float loopProgressRadians=0;

// view rotation
int offsetX = 0, offsetY = 0, clickX = 0, clickY = 0;
float rotationX = 1, rotationY = 0.3, targetRotationX = 0, targetRotationY = 0, clickRotationX, clickRotationY;

Boolean lines,triangles,fan,quad;

ControlP5 cp5;
PImage imgTex;



void setup() {
  size(1920, 1080, P3D);
  kinect = new KinectPV2(this);
  //Start up methods go here
  kinect.enableDepthImg(true);
  kinect.enablePointCloud(true);

  kinect.init();

  pushMatrix();
  cp5 = new ControlP5(this);
  cp5.addSlider("sinOffset").setPosition(25,50).setRange(0,400).setSize(200,20);
  cp5.addSlider("r").setPosition(25,75).setRange(0,255).setSize(200,20);
  cp5.addSlider("g").setPosition(25,100).setRange(0,255).setSize(200,20);
  cp5.addSlider("b").setPosition(25,125).setRange(0,255).setSize(200,20);
  cp5.addSlider("sinSpeed").setPosition(25,150).setRange(0.001,0.1).setSize(200,20);
  cp5.addSlider("skip").setPosition(25,175).setRange(1,40).setSize(200,20);
  popMatrix();

  int buffSize= kinect.getDepthImage().height*kinect.getDepthImage().width;
  depthArray= new int [buffSize];
  lines=true;

  imgTex = loadImage("glitch.jpg");
}


void draw()
{
  background(0);
  //setView();
  //scale(.5);

  updateLoopRecording();
  //int [] depth = kinect.getRawDepthData();
  //pushMatrix();
  update();
  //pushMatrix();
  //scale(3);
  //image(kinect.getDepthImage()  , 0, 0);
  //popMatrix();
  ////image(kinect.getPointCloudDepthImage(), 512, 0);
  //int tester=getDepthAt(100, 100);
  //println(tester);



  drawPointCloud(skip, 50, 3, 400, 1100, 0, 0, KHEIGHT, KWIDTH);
  //popMatrix();
}


void update()
{
  int [] depth16Array=kinect.getRawDepthData();
  //println(depth16Array);
  if (depthArray != null && depth16Array !=null)
  {
    for (int i=0; i< depth16Array.length; i++)
    {
      depthArray[i]=(int)depth16Array[i];
      //println(depthArray[i]);
    }
  }
}

int getDepthAt(int x, int y)
{
  int offset=x+y*KWIDTH;
  if (offset >= depthArray.length)
  {
    return 0;
  } else
  {
    return depthArray[offset];
  }
}


void drawPointCloud(int pixelSkip, float alpha, float scale, float depthClose, float depthFar, int top, int left, int bottom, int right)
{
  pushMatrix();
  float curZ;
  float scaleFactor=scale;
  noStroke();

   //if(frameCountLooped == loopFrames - 1)
   //{
   //  yLerp=randyBoi();
   //  println(yLerp);
   //}


   texture(imgTex);
   textureMode(NORMAL);

  for (int x= left; x<right; x+=pixelSkip)
  {
    for (int y= top; y<bottom; y+=pixelSkip)
    {
      curZ=getDepthAt(x, y);
      if (curZ > depthClose && curZ< depthFar)
      {
        fill(r,g+60*sin(frameCount*sinSpeed),b, 127+80*sin(frameCount*sinSpeed));
        //noFill();
        stroke(r, g+60*sin(frameCount*sinSpeed), b, 127+80*sin(frameCount*sinSpeed));


      float gridX = x * spacing;
      float gridY = y * spacing;
      // float gridZ = noise(gridX * noiseZoom, gridY * noiseZoom);
      float gridU = x / gridCells;
      float gridV = y / gridCells;
      float gridRightX = (x+1) * spacing;
      float gridRightY = gridY;
      // float gridRightZ = noise(gridRightX * noiseZoom, gridRightY * noiseZoom);
      float gridRightU = (x+1) / gridCells;
      float gridRightV = y / gridCells;
      float gridDownRightX = (x+1) * spacing;
      float gridDownRightY = (y+1) * spacing;
      // float gridDownRightZ = noise(gridDownRightX * noiseZoom, gridDownRightY * noiseZoom);
      float gridDownRightU = (x+1) / gridCells;
      float gridDownRightV = (y+1) / gridCells;
      float gridDownX = gridX;
      float gridDownY = (y+1) * spacing;
      // float gridDownZ = noise(gridDownX * noiseZoom, gridDownY * noiseZoom);
      float gridDownU = x / gridCells;
      float gridDownV = (y+1) / gridCells;

        //stroke(255,alpha*255f);
        strokeWeight(2);
        pushMatrix();
        int beginner=LINES;
        if(lines==true)
        {
           beginner=LINES;
        }
        else if(triangles==true)
        {
          //println("HERE2");
           beginner=TRIANGLES;
        }

        else if(fan==true)
        {
          //println("HERE2");
           beginner=TRIANGLE_FAN;
        }

        else if(quad==true)
        {
          //println("HERE2");
           beginner=QUAD_STRIP;
        }


      //z=lerp(z,z2,abs(sin(loopProgressRadians)));
      //vertex(x+cos(frameCount*.01), y+cos(frameCount*.01), z);

        beginShape(beginner);
        translate(x*scaleFactor, y*scaleFactor, scaleFactor*curZ/40f);
        //println(curZ);
        float curZ2=map(curZ,400,1100,0,-400);

        //float curz2= noise(X,Y);

        lerperX=lerp(xLerp,x2,abs(sin(loopProgressRadians)));
        lerperY=lerp(yLerp,y2,abs(sin(loopProgressRadians)));

        vertex(gridX, gridY, curZ2 , gridU, gridV);
        vertex(gridRightX, gridRightY, curZ2 , gridRightU, gridRightV);
        vertex(gridDownRightX, gridDownRightY, curZ2 , gridDownRightU, gridDownRightV);

        // triangle #2
        vertex(gridX, gridY, curZ2, gridU, gridV);
        vertex(gridDownRightX, gridDownRightY, curZ2 , gridDownRightU, gridDownRightV);
        vertex(gridDownX, gridDownY, curZ2 , gridDownU, gridDownV);




        //println(lerperX, lerperY,abs(sin(loopProgressRadians)) );
        // vertex(lerperX,lerperY,curZ2+lerperX);
        // vertex(5,-5,curZ2);

        //println(curZ2);
        //vertex(0+sinOffset*sin(frameCount*sinSpeed), 0,curZ2);
        //vertex(5, 10,curZ2);
        //vertex(10+sinOffset*sin(frameCount*sinSpeed), 0,curZ2);
        //vertex(15+sinOffset*cos(frameCount*sinSpeed), 10,curZ2);

        //vertex(20, 0+sinOffset*sin(frameCount*sinSpeed),curZ2);
        //vertex(25+sinOffset*cos(frameCount*sinSpeed), 10,curZ2);
        //vertex(30, 0+sinOffset*sin(frameCount*.05),curZ2);
        //vertex(35+sinOffset*sin(frameCount*.05), 10,curZ2);



        //vertex(0+sinOffset*sin(frameCount*sinSpeed), 0);
        //vertex(5, 10);
        //vertex(10+sinOffset*sin(frameCount*sinSpeed), 0);
        //vertex(15+sinOffset*cos(frameCount*sinSpeed), 10);

        //vertex(20, 0+sinOffset*sin(frameCount*sinSpeed));
        //vertex(25+sinOffset*cos(frameCount*sinSpeed), 10);
        //vertex(30, 0+sinOffset*sin(frameCount*.05));
        //vertex(35+sinOffset*sin(frameCount*.05), 10);

        //point(0,0);
        //rect(0,0,5,5);
        endShape();
        popMatrix();
      }
      //else
      //{
      //  fill(255, 0, 0, alpha*255f);
      //}
    }
  }
  popMatrix();
}

void updateLoopRecording() {
  // start/stop recording, and progress
  // if(frameCount == loopFrames - 1)
  // {
  //     recording=true;
  //
  // }
  // if(frameCount == loopFrames * 2) recording=false;
  //
  // if(recording)
  // {
  //   saveFrame("output/loop1_###.png");
  //
  // }

  // create a looped framecount & normalized progress
  frameCountLooped = frameCount % loopFrames;
  loopProgress = frameCountLooped / loopFrames;
  loopProgressRadians = loopProgress * TWO_PI;

}

  float randyBoi()
  {
    float randy= floor(random(0,3));
    float returner=0;
    if(randy==0)
    {
      returner=-200;
    }

    else if(randy==1)
    {
      returner=100;
    }

    else if(randy==2)
    {
      returner=400;
    }
    return returner;
  }

void mousePressed(){
  clickX = mouseX;
  clickY = mouseY;
  clickRotationX = rotationX;
  clickRotationY = rotationY;
}

void setView() {
  //pushMatrix();
  //translate(width*0.5,height*0.5);
  //rotateY(loopProgressRadians);

  if (mousePressed) {
    offsetX = mouseX-clickX;
    offsetY = mouseY-clickY;
    targetRotationX = clickRotationX + offsetX/float(width) * TWO_PI;
    targetRotationY = min(max(clickRotationY + offsetY/float(height) * TWO_PI, -HALF_PI), HALF_PI);
    rotationX += (targetRotationX-rotationX)*0.25;
    rotationY += (targetRotationY-rotationY)*0.25;
  }
  //popMatrix();
  rotateX(-rotationY);
  rotateY(rotationX);

}

void keyPressed() {
  if (key == '1') {
    //minD += 100;
    //println("Change min: "+minD);
    lines=true;
    triangles=false;
    fan=false;
    quad=false;
  }

  if (key == '2') {
    //minD -= 100;
    //println("here");
    lines=false;
    triangles=true;
    fan=false;
    quad=false;
  }

  if (key == '3') {
    //maxD += 100;
    //println("Change max: "+maxD);
    lines=false;
    triangles=false;
    fan=true;
    quad=false;
  }

  if (key == '4') {
    //maxD -=100;
    //println("Change max: "+maxD);
     lines=false;
    triangles=false;
    fan=false;
    quad=true;
  }
}
