public class Bubble
{
  int maxCount = 5000; // max count of the cirlces
  int currentCount = 1;
  float[] x = new float[maxCount];
  float[] y = new float[maxCount];
  float[] r = new float[maxCount];
  
  public Bubble(float x, float y, float r)
  {
    
    strokeWeight(0.5);    
    // first circle
    this.x[0] = x;
    this.y[0] = y;
    this.r[0] = r;    
  }
  
  public void display() 
  {
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
    
    c = myImage.get(int(x[currentCount]),int(y[currentCount]));
    
    if (c == black){
     }
   // if (x[currentCount] > 600 || x[currentCount] < 100 || y[currentCount] > 600 || y[currentCount] < 100) {} 
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
        ellipse(x[i], y[i], r[i] * 2, r[i] * 2);
    }

    if (currentCount >= maxCount) noLoop();   
  }
  
  
  
}
