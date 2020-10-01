public class Mountain2 extends MountainSuper{
  int r=0;
  int g=0;
  int b=255;
  int alpha=255;
  float offSetX=200;
  float offSetY=300;
  float midPoint=offSetX/2;
  float mountainOffset=100;
  float mountainsmallOffset=20;


  public Mountain2(float mountainPoint, float x, float y, float z )
  {
    super(0,0,0,100,x,y,z);
    shape=createShape();
    //shape.beginShape(TRIANGLES);
    shape.beginShape();
    shape.noFill();
    smooth();

    shape.vertex(0, 0);

    shape.vertex(60+20*sin(frameCount*.05), -100);
    shape.vertex(60, -100);
    shape.vertex(80, -80);
    shape.vertex(80, -80);
    shape.vertex(100, -120);
    shape.vertex(100, -120);

    shape.vertex(150, 0);


    shape.endShape(CLOSE);


    shape.strokeJoin(MITER);
    shape.setStroke(color(r,g,b,alpha));
    shape.setStrokeWeight(.5);
    shape.setFill(color(r,g,b,alpha));

    println(60);

  };


}
