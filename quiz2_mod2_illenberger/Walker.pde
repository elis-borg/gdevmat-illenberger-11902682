//defining walker class; classes can contain multi-type data/variables, to access these u must use the dot operator

class walker
{ //needs x+y values for coord/positions
  float x; 
  float y; 
  
  //function to be rendered on screen
  void render()
  {
  //randomize fill color
  int r= int(random(256));
  int g= int(random(256));
  int b= int(random(256));
  int a = int(random(50,101)); 
  
  fill (r,g,b,a);
  stroke(r,g,b,a);
  circle (x,y,15); 
  }
  
  void randomWalk()
  { 
    int rng = int(random(7));
    switch(rng){
      case 0:
        y+=10; 
        break;
      case 1:
        y-=10;
        break;
      case 2:
        x+=10;
        break;
      case 3:
        x-=10;
        break;
      case 4:
        y+=10;
        x+=10;
        break;
      case 5:
        y-=10;
        x-=10;
        break;
      case 6:
        x+=10;
        y-=10;
        break;
      case 7:
        x-=10;
        y+=10;
        break;
    }
  }
  
  void randomWalkBiased()
  {// r .25, l .15, u .3, d .07, ul .08, ur .04,  dl .02, dr .09
    float rng = (random(1));
    if (rng < 0.02){
        x+=10;
        y-=10;
     }
     else if (rng < 0.04){
        y-=10;
        x-=10;
     }
     else if (rng < 0.07){
        x-=10;
     }
    else if (rng < 0.08){
        y+=10;
        x+=10;
     }
     else if (rng < 0.09){
        x-=10;
        y+=10;
     }
     else if (rng < 0.15){
        y-=10;
     }
     else if (rng < 0.25){ 
        y+=10; 
     }
     else if (rng < 0.3){
        x+=10;
     }    
  }
}
