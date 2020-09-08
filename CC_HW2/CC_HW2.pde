int maxCount = 5000; // max count of the cirlces
int currentCount = 1;
float[] x = new float[maxCount];
float[] y = new float[maxCount];
float[] r = new float[maxCount];
PImage myImage; 
color c;

void setup() {
    size(800, 800);
    strokeWeight(0.5);

    // first circle
    x[0] = width / 2;
    y[0] = height / 2;
    r[0] = 10;
    
    myImage= loadImage("Letter1.png");
}

//int halfImage = width*height/2;
//PImage myImage = loadImage("apples.jpg");
//image(myImage, 0, 0);

//loadPixels();
//for (int i = 0; i < halfImage; i++) 
//{
//  pixels[i+halfImage] = pixels[i];
//}

//Load the pixels from an image and then check if the color at every x and y point are either 0 or 255. 
//if they are white then continue to draw.
//image.get

//color c = get(25, 25);
//fill(c);
//noStroke();
//rect(25, 25, 50, 50);

void draw() {
    clear();
    
    image(myImage, 0, 0);
    
    //for (int i=0; i<width; i++) 
    //{
    //  for (int j=0; j<height; j++) 
    //  {
    //     c = get(i,j);
    //     println(c);
    //  }
    //}
    
    
 
    
    // create a random set of parameters
    float newR = random(1, 7);
    float newX = random(newR, width - newR);
    float newY = random(newR, height - newR);

    float closestDist = 10000000;
    int closestIndex = 0;
    // which circle is the closest?
    for (int i = 0; i < currentCount; i++) {
        float newDist = dist(newX, newY, x[i], y[i]);
        if (newDist < closestDist) {
            closestDist = newDist;
            closestIndex = i;
        }
    }

    // show original position of the circle and a line to the new position
    //fill(230);
    //ellipse(newX, newY, newR * 2, newR * 2);
    //line(newX, newY, x[closestIndex], y[closestIndex]);

    // aline it to the closest circle outline
    float angle = atan2(newY - y[closestIndex], newX - x[closestIndex]);

    x[currentCount] = x[closestIndex] + cos(angle) * (r[closestIndex] + newR);
    y[currentCount] = y[closestIndex] + sin(angle) * (r[closestIndex] + newR);
    r[currentCount] = newR;
  
  
      loadPixels();

  // We must also call loadPixels() on the PImage since we are going to read its pixels.
  myImage.loadPixels();
  for (int y = 0; y < height; y++ ) {
    for (int x = 0; x < width; x++ ) {
      int loc = x + y*width;
      // The functions red(), green(), and blue() pull out the three color components from a pixel.
      float r = red(myImage.pixels [loc]); 
      float g = green(myImage.pixels[loc]);
      float b = blue(myImage.pixels[loc]);
      
      c=color(r,g,b);
      
    }
  }
  updatePixels();
    
    if (x[currentCount] > 600 || x[currentCount] < 100 || y[currentCount] > 600 || y[currentCount] < 100) {  
    } 
      else {
        boolean overlapped = false;
        for (int i = 0; i < currentCount - 1; i++) {
            float distance = dist(x[currentCount], y[currentCount], x[i], y[i]);
            if (distance < r[currentCount] + r[i]) {
                overlapped = true;
            }
        }
        if (overlapped == false) {
            currentCount++;
        }

    }

    // draw them
    for (int i = 0; i < currentCount; i++) {
        fill(255);
        //println(x[i]);
        ellipse(x[i], y[i], r[i] * 2, r[i] * 2);

    }

    pushStyle();
    noFill();
    stroke(255);
    strokeWeight(1);
    rect(100, 100, 500, 500);
    popStyle();
  
    if (currentCount >= maxCount) noLoop();
    
}
