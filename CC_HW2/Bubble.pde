public class Bubble
{
  int maxCount = 5000; // max count of the cirlces
  int currentCount = 1;
  float[] x = new float[maxCount];
  float[] y = new float[maxCount];
  float[] r = new float[maxCount];
  
  //public Bubble(float[] x, float[] y, float[] r)
  //{
    
  //  //strokeWeight(0.5);    
    
  //  for (int i=0; i<x.length; i++)
  //  {
  //   // println(i);
  //    this.x[i] = x[i];
  //    this.y[i] = y[i];
  //    this.r[i] = r[i];
  //    currentCount++;
  //    //println(r[i]);
  //  }
  //}
  
  public Bubble(float x, float y, float r)
  {   
      this.x[0] = x;
      this.y[0] = y;
      this.r[0] = r;    
  }
  
  public boolean display() 
  {
    float newR = random(1, this.r[0]);
    float newX = random(newR, width - newR);
    float newY = random(newR, height - newR);
    
    boolean checker=false;
    
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
            checker=true;
        }
    }
    
    // draw them
    for (int i = 0; i < currentCount; i++) {
        fill(255);
        ellipse(x[i], y[i], r[i] * 2, r[i] * 2);
    }

    if (currentCount >= maxCount) noLoop();
     return checker;
  }
  
  void clearArrays() 
  {
    for (int i=0; i<x.length; i++) 
    {
      x[i]=0;   
    }  
    for (int i=0; i<y.length; i++) 
    {
      y[i]=0;   
    }  
    
    for (int i=0; i<r.length; i++) 
    {
      r[i]=0;   
    }  
    
  }

}
