// jokes.pde
//Tutorial on original shape.
//https://www.openprocessing.org/sketch/60952

int pointCount = 800;
int freqX = 1;
int freqY = 4;
int freqZ = 2;
float phiX = 0;
float phiY = 0;

JSONObject jokey;
String part;
// int []  ;
int[] id = new int[10];
int x, y, z;
float phiX2;
float phiY2;
int index;

import controlP5.*;

ControlP5 cp5;

PVector lissajousPoints[];


// ------ mouse interaction ------
int offsetX = 0, offsetY = 0, clickX = 0, clickY = 0, zoom = -300;
float rotationX = 0, rotationY = 0, targetRotationX = 0, targetRotationY = 0, clickRotationX, clickRotationY;


void setup() {
    size(800, 800, P3D);
    cp5 = new ControlP5(this);

    // cp5.addSlider("freqX").setPosition(25,50).setRange(-10,10).setSize(200,20);
    // cp5.addSlider("freqY").setPosition(25,75).setRange(-10,10).setSize(200,20);
    // cp5.addSlider("freqZ").setPosition(25,100).setRange(-10,10).setSize(200,20);
    // cp5.addSlider("phiX").setPosition(25,125).setRange(-100,100).setSize(200,20);
    // cp5.addSlider("phiY").setPosition(25,150).setRange(-100,100).setSize(200,20);

    calculateLissajousPoints();

}

void draw() {

    loadData();
    background(0);
    lights();
    pushMatrix();
    // ------ set view ------
    translate(width / 2, height / 2, zoom);
    if (mousePressed && mouseButton == RIGHT) {
        offsetX = mouseX - clickX;
        offsetY = mouseY - clickY;
        targetRotationX = min(max(clickRotationX + offsetY / float(width) * TWO_PI, -HALF_PI), HALF_PI);
        targetRotationY = clickRotationY + offsetX / float(height) * TWO_PI;
    }
    rotationX += (targetRotationX - rotationX) * 0.25;
    rotationY += (targetRotationY - rotationY) * 0.25;
    rotateX(-rotationX);
    rotateY(rotationY);

    // ------ draw triangles ------
    noStroke();
    beginShape(TRIANGLE_FAN);
    for (int i = 0; i < pointCount - 2; i++) {
        if (i % 3 == 0) {
            //gradient for every trinangle to lissajou path
            fill(180);
            vertex(60, 255, 80);
            fill(0, 100, 200);
            vertex(lissajousPoints[i].x, lissajousPoints[i].y + 20 * sin(frameCount * .05), lissajousPoints[i].z + 20 * sin(frameCount * .05));
            vertex(lissajousPoints[i + 2].x + 20 * sin(frameCount * .05), lissajousPoints[i + 2].y, lissajousPoints[i + 2].z + 20 * cos(frameCount * .05));
        }
    }
    endShape();
    popMatrix();
    // stroke(0);
    //   strokeWeight(1);
    //   noFill();
    //   beginShape();
    //   for (int i=0; i<=pointCount; i++){
    //     vertex(lissajousPoints[i].x, lissajousPoints[i].y, lissajousPoints[i].z);
    //   }
    //   endShape();

}

void calculateLissajousPoints() {
    lissajousPoints = new PVector[pointCount + 1];
    float f = width / 2;

    for (int i = 0; i <= pointCount; i++) {
        float angle = map(i, 0, pointCount, 0, TWO_PI);
        float x = sin(angle * freqX + radians(phiX)) * sin(angle * 2) * f;
        float y = sin(angle * freqY + radians(phiY)) * f;
        float z = sin(angle * freqZ) * f;
        lissajousPoints[i] = new PVector(x, y, z);
    }
}


void keyPressed() {
    // if(key == '1') freqX--;
    // if(key == '2') freqX++;
    // freqX = max(freqX, 1);
    //
    // if(key == '3') freqY--;
    // if(key == '4') freqY++;
    // freqY = max(freqY, 1);
    //
    // if(key == '5') freqZ--;
    // if(key == '6') freqZ++;
    // freqZ = max(freqZ, 1);
    //
    // if (keyCode == LEFT) phiX -= 15;
    // if (keyCode == RIGHT) phiX += 15;
    //
    // if (keyCode == DOWN) phiY -= 15;
    // if (keyCode == UP) phiY += 15;

    if (keyCode == RIGHT)
    {
      index = getRandomInt();
      // println(index);
      println("freqX: " + freqX + ", freqY: " + freqY + ", freqZ: " + freqZ + ", phiX: " + phiX + ", phiY: " + phiY);
    }

    calculateLissajousPoints();



}

void mousePressed() {
    clickX = mouseX;
    clickY = mouseY;
    clickRotationX = rotationX;
    clickRotationY = rotationY;
}


int getRandomInt() {
    int randomInt = floor(random(0, 10));
    return randomInt;
}

void loadData() {
    // Load the JSON file and grab the array.
    JSONObject json = loadJSONObject("jokes.json");
    JSONArray jokesData = json.getJSONArray("jokes");

    index = getRandomInt();

    for (int i = 0; i < jokesData.size(); i++) {

        jokey = jokesData.getJSONObject(i);
        part = jokey.getString("type");
        id[i] = jokey.getInt("id");

        if (index == id[i]) {
            int x = jokey.getInt("freqX");
            int y = jokey.getInt("freqY");
            int z = jokey.getInt("freqZ");
            int phiX2 = jokey.getInt("phiX");
            int phiY2 = jokey.getInt("phiY");
            freqX = x;
            freqY = y;
            freqZ = z;
            phiX = phiX2;
            phiY = phiY2;
        }
    }
}
