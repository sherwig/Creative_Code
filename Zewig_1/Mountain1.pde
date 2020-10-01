public class Mountain1 extends MountainSuper{
  int r=0;
  int g=0;
  int b=255;
  int alpha=255;
  float offSetX=200;
  float offSetY=300;
  float midPoint=offSetX/2;
  float mountainOffset=100;

  public Mountain1(float mountainPoint, float x, float y, float z)
  {
    super(0,0,0,100,x,y,z);
    shape=createShape();
    shape.beginShape(LINES);
    shape.noFill();
    smooth();

    shape.vertex(mountainPoint, mountainPoint);

    shape.vertex(mountainPoint-mountainOffset, mountainPoint-mountainOffset);

    shape.vertex(mountainPoint-mountainOffset, mountainPoint-mountainOffset);
    shape.vertex(mountainPoint, mountainPoint-(mountainOffset*2));

    shape.vertex(mountainPoint, mountainPoint-(mountainOffset*2));
    shape.vertex(mountainPoint-mountainOffset, mountainPoint-(mountainOffset*3));
    shape.vertex(mountainPoint, mountainPoint-(mountainOffset*4));


    shape.endShape(CLOSE);

    shape.strokeJoin(MITER);
    shape.setStroke(color(r,g,b,alpha));
    shape.setStrokeWeight(3);
    // shape.setFill(color(r,g,b,alpha));

  };


}
