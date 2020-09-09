import java.util.ArrayList;
PImage myImage;
color c;
color black= color(0);
PGraphics imageLayer;
ArrayList <Bubble> bubbleArr;

void setup() 
{
    size(800, 800);
    //strokeWeight(0.5);
    //// first circle
    //x[0] = width / 2;
    //y[0] = height / 2;
    //r[0] = 10;
    
    myImage = loadImage("Letter1.png");
    
    bubbleArr=new ArrayList<Bubble>();
    
    bubbleArr.add(new Bubble(width/2,height/2,10));
    bubbleArr.add(new Bubble(width/2,200,10));
    
    bubbleArr.add(new Bubble(200,573,10));
    bubbleArr.add(new Bubble(577,573,10));
}

void draw() {
    clear();
  
    myImage.loadPixels();
    
    for (Bubble bub :bubbleArr) 
    {
      bub.display();
    }

}

void mousePressed()
{
  println(mouseX,mouseY);
  
}
