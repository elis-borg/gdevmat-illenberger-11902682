public class Walker {
  
  public PVector position = new PVector();
  public PVector oldPos;
  public PVector direction; 
  public float scale;
  public int r,g,b,a;
  
  //CONSTRUCTORS
  Walker (){
    //random circle scales + color
    r = int(random(256));
    g = int(random(256));
    b = int(random(256));
    a = int(random(10,101));
    
    //randomize scale
    float gaussianScale = randomGaussian();
    float stdDeviationScale = 15;
    float meanScale = 2;
    scale  = stdDeviationScale * gaussianScale + meanScale;
    
    randomSpawn(); //set where they will spawn.
  }
  
  Walker (int rVal,int gVal, int bVal, float scaleVal, float x, float y){
    //fixed scales, aka blackhole constructor
    r = rVal;
    g = gVal;
    b = bVal;
    scale = scaleVal;
    position.x = x;
    position.y = y; 
  }
  
  Walker (int rVal,int gVal, int bVal, float scaleVal){
    //fixed scales, aka blackhole constructor
    r = rVal;
    g = gVal;
    b = bVal;
    scale = scaleVal;
    randomSpawn();
  }
  
  public void render()
  {
   noStroke();
   fill (r,g,b);
   circle(position.x,position.y,scale); 
  }
  
  private void randomSpawn()
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
  
  void towardsBlackhole(Walker target)
  {
    /*PVector direction = PVector.sub(target.position, this.position);
    direction.normalize();
    this.position.add(direction);*/
    
    direction = PVector.sub(target.position, position); 
    position.add(direction.normalize().mult(7));
    println("location: " + debris.position.x + ", " + debris.position.y); 
  }
}
