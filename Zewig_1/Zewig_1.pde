import java.util.ArrayList;
import controlP5.*;
ArrayList < Mountain1 > mountainArr;
ArrayList < Mountain2 > mountainArr2;
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
ControlP5 cp5;
int videoScale = 30;
int cols, rows;
float maxOffset = 1.5;
float minOffset = -.8;
float offsetAmountNeg = -50;
float offsetAmountPos = 50;
float time;
PFont myFont;
boolean timeChanger;

void setup() {
    //fullScreen();
    size(1640, 900,P2D);
    colorMode(RGB);
    gradient = new Gradients();
    cp5 = new ControlP5(this);
    cols = width / videoScale;
    rows = height / videoScale;

    time = millis() + 1000;
    //background(0);
    mountainArr = new ArrayList < Mountain1 > ();
    mountainArr2 = new ArrayList < Mountain2 > ();

    //Try Lerping between two points from the first point to the next.
    //When you 

    //mono =loadFont("Fineday-StyleOne.ttf");
    //textFont(mono);
    //text("word", 12, 60);

    //  String[] fontList = PFont.list();
    //printArray(fontList);
    myFont = createFont("Fineday-StyleOne", 200);
    textFont(myFont);
    textAlign(CENTER, CENTER);


    mountainArr2.add(new Mountain2(0, 500, 700, 0));
    // mountainArr2.add(new Mountain2(0,300,300,0));
    //mountainArr2.add(new Mountain2(0,600,300,0));
    //mountainArr2.add(new Mountain2(0,900,300,0));
    //mountainArr2.add(new Mountain2(0,1200,300,0));
    //mountainArr2.add(new Mountain2(0,1500,300,0));


    //mountainArr2.add(new Mountain2(0,0,400,-100));
    //mountainArr2.add(new Mountain2(0,300,400,-100));
    //mountainArr2.add(new Mountain2(0,600,400,-100));
    //mountainArr2.add(new Mountain2(0,900,400,-100));
    //mountainArr2.add(new Mountain2(0,1200,400,-100));
    //mountainArr2.add(new Mountain2(0,1500,400,-100));

    //mountainArr2.add(new Mountain2(0,0,500,-200));
    //mountainArr2.add(new Mountain2(0,300,500,-200));
    //mountainArr2.add(new Mountain2(0,600,500,-200));
    //mountainArr2.add(new Mountain2(0,900,500,-200));
    //mountainArr2.add(new Mountain2(0,1200,500,-200));
    //mountainArr2.add(new Mountain2(0,1500,500,-200));


    //mountainArr2.add(new Mountain2(0,0,0,0));
    //mountainArr2.add(new Mountain2(0,300,0,0));
    //mountainArr2.add(new Mountain2(0,600,0,0));
    //mountainArr2.add(new Mountain2(0,900,0,0));
    //mountainArr2.add(new Mountain2(0,1200,0,0));
    //mountainArr2.add(new Mountain2(0,1500,0,0));

    //mountainArr2.add(new Mountain2(0,0,100,-100));
    //mountainArr2.add(new Mountain2(0,300,100,-100));
    //mountainArr2.add(new Mountain2(0,600,100,-100));
    //mountainArr2.add(new Mountain2(0,900,100,-100));
    //mountainArr2.add(new Mountain2(0,1200,100,-100));
    //mountainArr2.add(new Mountain2(0,1500,100,-100));

    //mountainArr2.add(new Mountain2(0,0,200,-200));
    //mountainArr2.add(new Mountain2(0,300,200,-200));
    //mountainArr2.add(new Mountain2(0,600,200,-200));
    //mountainArr2.add(new Mountain2(0,900,200,-200));
    //mountainArr2.add(new Mountain2(0,1200,200,-200));
    //mountainArr2.add(new Mountain2(0,1500,200,-200));


    //mountainArr2.add(new Mountain2(0,0,600,0));
    //mountainArr2.add(new Mountain2(0,300,600,0));
    //mountainArr2.add(new Mountain2(0,600,600,0));
    //mountainArr2.add(new Mountain2(0,900,600,0));
    //mountainArr2.add(new Mountain2(0,1200,600,0));
    //mountainArr2.add(new Mountain2(0,1500,600,0));


    //mountainArr2.add(new Mountain2(0,0,700,-100));
    //mountainArr2.add(new Mountain2(0,300,700,-100));
    //mountainArr2.add(new Mountain2(0,600,700,-100));
    //mountainArr2.add(new Mountain2(0,900,700,-100));
    //mountainArr2.add(new Mountain2(0,1200,700,-100));
    //mountainArr2.add(new Mountain2(0,1500,700,-100));

    //mountainArr2.add(new Mountain2(0,0,800,-200));
    //mountainArr2.add(new Mountain2(0,300,800,-200));
    //mountainArr2.add(new Mountain2(0,600,800,-200));
    //mountainArr2.add(new Mountain2(0,900,800,-200));
    //mountainArr2.add(new Mountain2(0,1200,800,-200));
    //mountainArr2.add(new Mountain2(0,1500,800,-200));

    //mountainArr2.add(new Mountain2(0,0,900,-200));
    //mountainArr2.add(new Mountain2(0,300,900,-200));
    //mountainArr2.add(new Mountain2(0,600,900,-200));
    //mountainArr2.add(new Mountain2(0,900,900,-200));
    //mountainArr2.add(new Mountain2(0,1200,900,-200));
    //mountainArr2.add(new Mountain2(0,1500,900,-200));

    //mountainArr2.add(new Mountain2(0,0,1000,-200));
    //mountainArr2.add(new Mountain2(0,300,1000,-200));
    //mountainArr2.add(new Mountain2(0,600,1000,-200));
    //mountainArr2.add(new Mountain2(0,900,1000,-200));
    //mountainArr2.add(new Mountain2(0,1200,1000,-200));
    //mountainArr2.add(new Mountain2(0,1500,1000,-200));

    // //mountainArr.add(new Mountain1(0,0,500));
    // mountainArr.add(new Mountain1(0,300,300));
    // //mountainArr.add(new Mountain1(0,300,500));
    // mountainArr.add(new Mountain1(0,0,300));
    //// mountainArr.add(new Mountain1(0,600,500));
    // mountainArr.add(new Mountain1(0,600,300));
    // //mountainArr.add(new Mountain1(0,900,500));
    // mountainArr.add(new Mountain1(0,900,300));

    for (Mountain1 mount: mountainArr) {
        mount.setScale(3);
        mount.setRotation(PI / 2);
        mount.setOpacity(100);
    }

    for (Mountain2 mount: mountainArr2) {
        mount.setScale(4);
        mount.setOpacity(255);
        //mount.setRotation(PI/2);
    }

    // cp5.addSlider("col1R").setPosition(25,50).setRange(0,255).setSize(200,20);
    // cp5.addSlider("col1B").setPosition(25,75).setRange(0,255).setSize(200,20);
    // cp5.addSlider("col1G").setPosition(25,100).setRange(0,255).setSize(200,20);
    //
    // cp5.addSlider("col3R").setPosition(25,125).setRange(0,255).setSize(200,20);
    // cp5.addSlider("col3B").setPosition(25,150).setRange(0,255).setSize(200,20);
    // cp5.addSlider("col3G").setPosition(25,175).setRange(0,255).setSize(200,20);
}


void draw() {
    float x = getSinScale(300, 40, 600);
    col3B = int(x);
    println(col3B);

    float colRedSin = getSinScale(60, 20, 600);

    col1R = int(colRedSin);
    //println(colRedSin);
    col3 = color(col3R, col3G, col3B, 100);
    col1 = color(col1R, col1G, col1B, 100);
    //gradient.quad(width*2,height*2,col1,col3,col1,col1);
    gradient.radial(width * 3, height * 3, col1, col3, 100);

    // for (Mountain2 mount2 : mountainArr2)
    // {
    //   mount2.changeScale(timeChanger);
    // }

    // if( millis() > time )
    // {
    //  time = millis() + 3000;
    //  timeChanger = !timeChanger;
    // }

    //ellipse(500,500,300,300);
    ellipse(1000, 300, 300, 300);

    // for (Mountain1 mount : mountainArr)
    // {
    //    mount.display();
    // }

    for (Mountain2 mount2: mountainArr2) {
        mount2.display();
    }

    for (Mountain2 mount2: mountainArr2) {
        mount2.vertexScale(.3, 0.05);
        // mount2.perlinScale();
        // println("here");
    }

    // textSize(50);

    text("Ze_wig", 300, 750);

}


float getSinScale(float high, float low, float period) {
    float amplitude = high - low;
    float x = (amplitude - low) + (amplitude - high) * cos(TWO_PI * frameCount / period);
    x = abs(x);
    return x;
}

// void keyPressed()
// {
//   switch(key)
//   {
//     case 'a':
//          for (Mountain1 mount : mountainArr)
//          {
//            mount.changeScale(true,maxOffset,minOffset);
//          }
//          for (Mountain2 mount2 : mountainArr2)
//          {
//           mount2.changeScale(true,maxOffset,minOffset);
//          }
//
//           break;
//
//     case 's':
//          for (Mountain1 mount : mountainArr)
//          {
//            mount.changeScale(false,maxOffset,minOffset);
//          }
//          for (Mountain2 mount2 : mountainArr2)
//          {
//           mount2.changeScale(false,maxOffset,minOffset);
//          }
//          break;
//
//       case 'd':
//          for (Mountain1 mount : mountainArr)
//          {
//            mount.changePosition(offsetAmountNeg,offsetAmountPos);
//          }
//          for (Mountain2 mount2 : mountainArr2)
//          {
//           mount2.changePosition(offsetAmountNeg,offsetAmountPos);
//          }
//          break;
//
//       case 'w':
//          for (Mountain2 mount2 : mountainArr2)
//          {
//           mount2.sinScale(1.5,1.15,600);
//          }
//          break;
//
//       case 'q':
//       //  float x= getSinScale(120,1000);
//         //col3B=int(x+col3B)-col3B;
//         //col3B=int(x);
//         //println(col3B);
//         break;
//
//     }
//
//}
