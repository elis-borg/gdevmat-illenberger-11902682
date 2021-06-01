class Splatter
{ //needs x+y values for coord/positions
  float x, y; 
  int max, min;
  
  //function to be rendered on screen
  void render()
  {
  //randomize fill color
  int r= int(random(256));
  int g= int(random(256));
  int b= int(random(256));
  int a = int(random(10,101)); 
  
  float gaussianExt = randomGaussian();
  
  float stdDeviationExt = 100;
  float meanExt = 8;
  
  float extent  = stdDeviationExt * gaussianExt + meanExt;
  
  noStroke();
  fill (r,g,b,a);
  circle (x,y,extent); 
  }
  
  void randomSplatter()
  { 
    int rng = int(random(2));
    switch(rng){
      case 0:
        y = int(random(361)); 
        break;
      case 1:
        y = -int(random(361));
       
        break;
    }
    
    float gaussianX = randomGaussian();
     
    float stdDeviationX = 387; 
    float meanX = 0; 
     
    x  = stdDeviationX * gaussianX + meanX;
    //expected result: splattered paint
  }
}
