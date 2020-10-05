//MountainClass.pde

public class Mountain
{

  float mountainOffset=150;
  float mountainPoint=150;
  float turnX=100;
  float turnY=100;
  final short NUM = 7;
  PVector[] vectors = new PVector[NUM];
  PVector[] vec =new PVector[NUM];
  float radX,radY;
  float x,y;
  float amount;

  Mountain(float xPos, float yPos)
  {
    vectors[0] = new PVector(mountainPoint+xPos, (mountainPoint*5)+yPos);
    vectors[1] = new PVector(mountainPoint+mountainOffset+xPos, mountainPoint+mountainOffset+yPos);
    vectors[2] = new PVector((mountainPoint*random(2,2.5))+xPos, mountainPoint+(mountainOffset*random(1.5,3.5))+yPos);
    vectors[3] = new PVector((mountainPoint*random(2.6,3.5))+xPos, mountainPoint-(mountainOffset*random(.5,2))+yPos);
    vectors[4] = new PVector((mountainPoint*random(3.6,4))+xPos, mountainPoint+mountainOffset+yPos);
    vectors[5] = new PVector((mountainPoint*random(4,5))+xPos, mountainPoint-(mountainOffset*random(.2,1))+yPos);
    vectors[6] = new PVector((mountainPoint*5.5)+xPos, (mountainPoint*5)+yPos);

    vec[0]= new PVector(vectors[3].x-200,vectors[3].y);
    vec[1]= new PVector(vectors[4].x,vectors[4].y+400);


    // println(vectors[2]);

  }


  public void display()
  {

    arc(vec[0].x, vec[0].y, turnX*sin(frameCount/.05), turnY, 0, loopProgressRadians);
    arc(vec[1].x, vec[1].y, random(150,200), random(25,50)*sin(frameCount/.05), 0, loopProgressRadians);

    // x=lerp(vectors[3].x,vectors[3].x+40,totalProgress);
    // y=lerp(vectors[3].y,vectors[3].y+400,totalProgress);

    // pushStyle();
    // strokeWeight(.1);
    // noFill();
    // beginShape();
    // vertex(vectors[3].x, vectors[3].y);
    // bezierVertex(vectors[1].x, vectors[1].y, vectors[5].x, vectors[5].y, x, y);
    // // bezierVertex(20, 130, 75, 140, 120, 120);
    // endShape();
    // popStyle();

    // bezier(, , 200, 600, 300, 700, x, y);

    if(totalProgress<=1)
    {
      x=lerp(vectors[0].x,vectors[1].x,totalProgress);
      y=lerp(vectors[0].y,vectors[1].y,totalProgress);
      line(vectors[0].x,vectors[0].y,x,y);


    }

    else if(totalProgress>=1 && totalProgress <2)
    {
      x=lerp(vectors[1].x,vectors[2].x,totalProgress/2);
      y=lerp(vectors[1].y,vectors[2].y,totalProgress/2);

      line(vectors[1].x,vectors[1].y,x,y);
    }

    else if(totalProgress>=2 && totalProgress <3)
    {
      x=lerp(vectors[2].x,vectors[3].x,totalProgress/3);
      y=lerp(vectors[2].y,vectors[3].y,totalProgress/3);

      line(vectors[2].x,vectors[2].y,x,y);
    }

    else if(totalProgress>=3 && totalProgress <4)
    {
      x=lerp(vectors[3].x,vectors[4].x,totalProgress/4);
      y=lerp(vectors[3].y,vectors[4].y,totalProgress/4);

      line(vectors[3].x,vectors[3].y,x,y);
    }

    else if(totalProgress>=4 && totalProgress <5)
    {
      x=lerp(vectors[4].x,vectors[5].x,totalProgress/5);
      y=lerp(vectors[4].y,vectors[5].y,totalProgress/5);

      line(vectors[4].x,vectors[4].y,x,y);
    }

    else if(totalProgress>=5 && totalProgress <6)
    {
      x=lerp(vectors[5].x,vectors[6].x,totalProgress/6);
      y=lerp(vectors[5].y,vectors[6].y,totalProgress/6);

      line(vectors[5].x,vectors[5].y,x,y);
    }

  }

  // public void setOpacity()
  // {
  //   setStroke(color(0,0,0,amount));
  //
  // }

  void vertexScale(float offset, float speed)
   {
       for (int i = 0; i < vectors.length; i++)
       {
         // PVector v;
         // vectors.getVertex(i);
         // v.x=v.x+offset*sin(frameCount*speed);
         vectors[i].y=vectors[i].y+offset*sin(frameCount*speed);
         // shape.setVertex(i,v);
       }
     }

};
