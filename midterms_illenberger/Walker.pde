public class Walker {
  
  public PVector position = new PVector(); 
  public float scale;
  public int r,g,b;
  
  //CONSTRUCTORS
  Walker (){
    //random circle scales + color
    r = int(random(256));
    g = int(random(256));
    b = int(random(256));
    
    //randomize scale
    float gaussianScale = randomGaussian();
    float stdDeviationScale = 50;
    float meanScale = 8;
    scale  = stdDeviationScale * gaussianScale + meanScale;
  }
  
  Walker (int rVal,int gVal, int bVal, float scaleVal){
    //fixed scales, aka blackhole constructor
    r = rVal;
    g = gVal;
    b = bVal;
    scale = scaleVal; 
  }
  
  public void render()
  {
   noStroke();
   fill (r,g,b);
   circle(position.x,position.y,scale); 
  }
  
  void randomSpawn()
  {
    int rng = int(random(2));
    switch(rng){
      case 0:
        position.y = (random(361)); 
        break;
      case 1:
        position.y = -(random(361));
        break;
    }
    
    float gaussianX = randomGaussian();
     
    float stdDeviationX = 387; 
    float meanX = 0; 
     
    position.x  = stdDeviationX * gaussianX + meanX;
  }
  
  void towardsBlackhole()
  {
  
  }
}
