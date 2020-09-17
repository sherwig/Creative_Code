//Clock_1.pde

int cx, cy;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;
float s;
float m;
float h;
float h2;
String h3;

void setup() {
  size(1080,720 );
  stroke(255);

  // int radius = min(width, height) / 2;
  // secondsRadius = radius * 0.72;
  // minutesRadius = radius * 0.60;
  // hoursRadius = radius * 0.50;
  // clockDiameter = radius * 1.8;
  //
  // cx = width / 2;
  // cy = height / 2;
}

void draw() {
  background(0);

  fill(255);
  h=hour();
  h2=hour();
  m=minute();
  s=second();
  s= map(s,0,60,50,width-100);
  m= map(m,0,60,50,width-100);
  h= map(h,0,24,50,width-100);
  // println(s);

  // if(h2>=13)
  // {
  //   h2=h2-12;
  //   h3 = nf(h2, 0);
  // }
  textSize(h/5);
  text(h2,h,height/3);
  textSize(m/5);
  text(minute(),m,height/2);
  textSize(s/5);
  text(second(),s,500);



}
