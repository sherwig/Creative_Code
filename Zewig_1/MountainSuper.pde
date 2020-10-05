public class MountainSuper
{
  PShape shape;
  int r=128;
  int g=128;
  int b=128;
  int alpha=100;
  PVector offset;
  PVector currentPosition;
  PVector basePosition;
  float currentScale=1;
  float rotation=0;
  float offsetRotation=0;
  float noiseScale = 0.02;
  float amplitude = 2;
  float period = 1000;

  public MountainSuper(int r, int g, int b, int alpha, float x, float y, float z)
  {
      this.r=r;
      this.g=g;
      this.b=b;
      this.alpha=alpha;
      offset=new PVector();
      basePosition=new PVector(x,y);
      currentPosition=new PVector(x,y);
  };

 public void display()
    {
      pushMatrix();
      rotation=lerp(rotation,offsetRotation,.05);
      currentPosition.lerp(basePosition.x+offset.x,basePosition.y+offset.y,0,.05);
      translate(currentPosition.x,currentPosition.y);
      rotate(rotation);
      shape(shape,0, 0,shape.width*currentScale,shape.height*currentScale);
      popMatrix();
    };


  void changeRotation()
    {
      if(random(0,1)>.5)
      {
        offsetRotation=random(-PI,PI);
      }
      else
      {
        offsetRotation=0;
      }
    };

    void setColor(int r, int g, int b,int alpha)
    {
       shape.setStroke(color(r,g,b,alpha));
       shape.setFill(color(r,g,b,alpha));
    };

     void RandomStroke()
     {
      shape.setStrokeWeight(random(3,7));
     };

     void changeScale(boolean flailing, float maxOffset, float minOffset)
     {
       if(flailing)
       {
         currentScale=lerp(currentScale,maxOffset,.08);

       }
       else
       {
         currentScale=lerp(currentScale,minOffset,.03);
       }

     };

   void setRotation(float amount)
    {
      shape.rotate(amount);
    };

    void setScale(float amount)
    {
     shape.scale(amount);
    };

    void setOpacity(float amount)
    {
       shape.setStroke(color(r,g,b,amount));
       shape.setFill(color(r,g,b,amount));
    }

    void changeOpacity(float amount)
    {
      alpha+=amount;
      if (alpha>=255)
      {
         alpha=255;
      }
      shape.setStroke(color(r,g,b,alpha));
      shape.setFill(color(r,g,b,alpha));
    };

   void changePosition(float offsetAmountNeg, float offsetAmountPos)
    {
      if(random(0,1)>.5)
      {
        //slider.sliderValue=offsetAmountNeg;
        offset.set(random(offsetAmountNeg,offsetAmountPos),random(offsetAmountNeg,offsetAmountPos));
      }
      else
      {
        offset.set(0,0);
      }
    };

    void perlinScale()
    {
      float noiseScale=noise(200);
      shape.scale(noiseScale);
    };

   void sinScale(float high, float low, float period)
    {
     float amplitude=high-low;
     float x = (amplitude-low)+(amplitude-high) * cos(TWO_PI * frameCount / period);
     x=abs(x);
     shape.scale(x);
     // println(x);
    };


    void vertexScale(float offset, float speed)
     {
       for (int i = 2; i < shape.getVertexCount(); i++)
       {
         PVector v = shape.getVertex(i);
         // v.x=v.x+offset*sin(frameCount*speed);
         v.y=v.y+offset*sin(frameCount*speed);
         shape.setVertex(i,v);
       }

     };

}
