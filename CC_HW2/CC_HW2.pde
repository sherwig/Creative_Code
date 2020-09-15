import java.util.ArrayList;
PImage myImage;
color c;
color black= color(0);
PGraphics imageLayer;
ArrayList <Bubble> bubbleArr;
float radius=7;
float radius_wig=3;


void setup() 
{
    size(800, 800);
    //strokeWeight(0.5);
    
    myImage = loadImage("SamsParty_wig.png");
    
    bubbleArr=new ArrayList<Bubble>();
    
    //For A
    //float x[]={width/2, width/2, 200,577};
    //float y[]={height/2, 200, 573,573};
    //float r[]={10,10,10,10,10,10,10,10,10,10,10};
    
    //For no Bubbles to touch eachother
    //float x[]={53, 211, 213,131,301,380,457,539,544,669,734,590,82,82,245,285,285,315,405,456,515,537,587,650,701,752};
    //float y[]={228,164, 297,197,192,261,188,170,293,231,231,229,400,544,472,399,542,432,506,468,515,544,473,546,473,399};
    //float r[]={10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10};
    fillArrays();

    myImage.loadPixels();
}

void draw() {
    clear();
    
    image(myImage,0,0);

    for (Bubble bub :bubbleArr) 
    {
       //for (int i=0; i<3; i++)
       //{
          boolean success=false; 
          int attempts=0;       
          while(success==false && attempts <=1) 
          {
            success=bub.display();
            attempts++;
          } 
      // }
    }

}



void keyPressed() 
{
   if(key==BACKSPACE)
   {
      for (Bubble bub :bubbleArr) 
      { 
        bub.clearArrays();
      }
      fillArrays();
   }
}

void fillArrays() 
{
    bubbleArr.add(new Bubble(82,400,radius));
    bubbleArr.add(new Bubble(82,544,radius));    
    bubbleArr.add(new Bubble(245,472,radius));
    bubbleArr.add(new Bubble(285,399,radius));
    
    bubbleArr.add(new Bubble(285,542,radius));
    bubbleArr.add(new Bubble(315,432,radius));    
    bubbleArr.add(new Bubble(405,506,radius));
    bubbleArr.add(new Bubble(456,468,radius));
    
    bubbleArr.add(new Bubble(515,515,radius));
    bubbleArr.add(new Bubble(537,544,radius));    
    bubbleArr.add(new Bubble(587,473,radius));
    bubbleArr.add(new Bubble(650,546,radius));
    
    bubbleArr.add(new Bubble(701,473,radius));
    bubbleArr.add(new Bubble(752,399,radius));
    
    bubbleArr.add(new Bubble(53,228,radius));
    bubbleArr.add(new Bubble(211,164,radius));    
    bubbleArr.add(new Bubble(213,297,radius));
    bubbleArr.add(new Bubble(131,192,radius));
    
    bubbleArr.add(new Bubble(301,192,radius));
    bubbleArr.add(new Bubble(380,261,radius));    
    bubbleArr.add(new Bubble(457,188,radius));
    bubbleArr.add(new Bubble(539,170,radius));
    
    bubbleArr.add(new Bubble(544,293,radius));
    bubbleArr.add(new Bubble(669,231,radius));    
    bubbleArr.add(new Bubble(734,231,radius));
    bubbleArr.add(new Bubble(590,229,radius));
    
    bubbleArr.add(new Bubble(48,472,radius));
    bubbleArr.add(new Bubble(166,220,radius));
    bubbleArr.add(new Bubble(54,188,radius));
    bubbleArr.add(new Bubble(749,301,radius));
    
    bubbleArr.add(new Bubble(404,404,radius));
    bubbleArr.add(new Bubble(317,543,radius));
    bubbleArr.add(new Bubble(378,162,radius));
    bubbleArr.add(new Bubble(299,299,radius));
    bubbleArr.add(new Bubble(605,401,radius));
    bubbleArr.add(new Bubble(56,309,radius));
    bubbleArr.add(new Bubble(599,176,radius));
    bubbleArr.add(new Bubble(438,164,radius));
    bubbleArr.add(new Bubble(457,253,radius));
    bubbleArr.add(new Bubble(91,151,radius));
    bubbleArr.add(new Bubble(730,159,radius));
    bubbleArr.add(new Bubble(454,407,radius));
    
    bubbleArr.add(new Bubble(726,422,radius));
    bubbleArr.add(new Bubble(651,515,radius));
    bubbleArr.add(new Bubble(744,202,radius));
    bubbleArr.add(new Bubble(739,559,radius));
    bubbleArr.add(new Bubble(757,439,radius));
    bubbleArr.add(new Bubble(46,416,radius));
    bubbleArr.add(new Bubble(43,536,radius));
    
    //For Ze_wig
    bubbleArr.add(new Bubble(464,718,radius_wig));
    bubbleArr.add(new Bubble(481,742,radius_wig));
    bubbleArr.add(new Bubble(498,768,radius_wig));
    bubbleArr.add(new Bubble(545,719,radius_wig));
      
    bubbleArr.add(new Bubble(515,743,radius_wig));
    bubbleArr.add(new Bubble(545,769,radius_wig));
    bubbleArr.add(new Bubble(576,782,radius_wig));
    bubbleArr.add(new Bubble(609,719,radius_wig));
    
    bubbleArr.add(new Bubble(642,719,radius_wig));
    bubbleArr.add(new Bubble(672,719,radius_wig));
    bubbleArr.add(new Bubble(659,769,radius_wig));
    bubbleArr.add(new Bubble(623,768,radius_wig));
    
    bubbleArr.add(new Bubble(699,718,radius_wig));
    bubbleArr.add(new Bubble(699,767,radius_wig));
    bubbleArr.add(new Bubble(770,726,radius_wig));
    bubbleArr.add(new Bubble(724,742,radius_wig));
    bubbleArr.add(new Bubble(770,750,radius_wig));
    
    bubbleArr.add(new Bubble(744,768,radius_wig));
    bubbleArr.add(new Bubble(593,782,radius_wig));
    bubbleArr.add(new Bubble(557,781,radius_wig));
    
    bubbleArr.add(new Bubble(534,744,radius_wig));
    bubbleArr.add(new Bubble(462,766,radius_wig)); 
    bubbleArr.add(new Bubble(630,749,radius_wig));
    bubbleArr.add(new Bubble(630,749,radius_wig));
    bubbleArr.add(new Bubble(668,743,radius_wig));
    
    bubbleArr.add(new Bubble(763,765,radius_wig));
    bubbleArr.add(new Bubble(701,747,radius_wig)); 
    bubbleArr.add(new Bubble(512,767,radius_wig));
    bubbleArr.add(new Bubble(479,770,radius_wig));
    bubbleArr.add(new Bubble(632,763,radius_wig));
    bubbleArr.add(new Bubble(665,761,radius_wig));
    bubbleArr.add(new Bubble(774,748,radius_wig));
    bubbleArr.add(new Bubble(770,718,radius_wig));
   
}


void mousePressed()
{
  println(mouseX,mouseY);
  
}
