// Mountains.pde

int loopFrames = 960; // 4-second loop (60fps * 4)
boolean saveVideo = false;
float frameCountLooped = 1;
float loopProgress=0;
float totalProgress=0;
float loopProgressRadians=0;

float mountainOffset=100;
float mountainPoint=100;

final short NUM = 7;
PVector[] vectors = new PVector[NUM];
float opac=0;
int randomInt;

color col1 = color(21, 23, 39, 3);
//color col2=color(221,160,221);
color col2 = color(0, 0, 255);
color col3 = color(73, 249, 173, 3);
int col1R = 0;
int col1B = 94;
int col1G = 39;
int col3R = 73;
int col3B = 255;
int col3G = 173;
Gradients gradient;
int videoScale = 30;
int cols, rows;

ArrayList < Mountain > mountainArr;

void setup() {
    //fullScreen();
    size(1640, 900,P2D);
    colorMode(RGB);
    strokeWeight(4);
    background(0);
    stroke(255);
    noFill();

    gradient = new Gradients();
    cols = width / videoScale;
    rows = height / videoScale;

    mountainArr = new ArrayList <Mountain> ();
    mountainArr.add(new Mountain(300,100));

  }

  void draw() {
    //For a backgorund Gradient
    // float x = getSinScale(300, 40, 600);
    // col3B = int(x);
    // // stroke(0,255);
    //
    // float colRedSin = getSinScale(60, 20, 600);
    //
    // col1R = int(colRedSin);
    // col3 = color(col3R, col3G, col3B, 100);
    // col1 = color(col1R, col1G, col1B, 100);


    updateLoopRecording();
    for (Mountain mount: mountainArr) {
        mount.display();
        mount.vertexScale(.3,.09);
    }
    addRandom();

  }


  void addRandom()
  {
    if(frameCount%980==979)
    {
    for (int i = mountainArr.size() - 1; i >= 0; i--)
    {
        Mountain mount = mountainArr.get(i);
        int randy2=randyBoi();
        // mountainArr.remove(random(0,mountainArr.size()));
        background(0);
        mountainArr.remove(i);
        // mountainArr.add(new Mountain(random(-100,600),randy2));
        mountainArr.add(new Mountain(300,100));

      }
    }
  }

  int randyBoi()
  {
    float randy= floor(random(0,3));
    if(randy==0)
    {
      randomInt=0;
    }

    else if(randy==1)
    {
      randomInt=400;
    }

    else if(randy==2)
    {
      randomInt=200;
    }
    return randomInt;
  }


float changeOpacityOT()
{
  float opacity = map(frameCount % 1000, 0, 1000, 150, 0);
  return opacity;
}


float getSinScale(float high, float low, float period) {
    float amplitude = high - low;
    float x = (amplitude - low) + (amplitude - high) * cos(TWO_PI * frameCount / period);
    x = abs(x);
    return x;
}



  void updateLoopRecording() {
    // start/stop recording, and progress
    // if(frameCount == loopFrames - 1)
    // {
    //     recording=true;
    // }
    // if(frameCount == loopFrames * 2) recording=false;
    // if(recording)
    // {
    //   saveFrame("output/loop1_###.png");
    // }
    // create a looped framecount & normalized progress
    frameCountLooped = frameCount % loopFrames;
    loopProgress = frameCountLooped / loopFrames;
    totalProgress = loopProgress * NUM;
    loopProgressRadians = loopProgress * TWO_PI;

  }
