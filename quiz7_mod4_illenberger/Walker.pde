public class Walker
{
 public PVector position = new PVector();
 public PVector velocity = new PVector();
 public PVector acceleration = new PVector();
 public PVector direction; 
 
 public float velocityLimit = 10; 
 public float scale = 15; 

 public Walker() //default constructor
 {
   //randomize scale
    float gaussianScale = randomGaussian();
    float stdDeviationScale = 15;
    float meanScale = 2;
    scale  = stdDeviationScale * gaussianScale + meanScale;
    
   randomSpawn(); 
 }
 
 public void update()
 {
   this.acceleration = PVector.random2D(); 
   this.velocity.add(this.acceleration); //modifying our velocity
   this.velocity.limit(velocityLimit);
   this.position.add(this.velocity); //modifying our position
 }
 
 public void render()
 {
   circle(position.x, position.y, scale);
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
  }
 
 void towardsMouse(Walker target)
  {
    /*PVector direction = PVector.sub(target.position, this.position);
    direction.normalize();
    this.position.add(direction);*/
    
    direction = PVector.sub(target.position, position); 
    position.add(direction.normalize().mult(7));
    //println("location: " + debris.position.x + ", " + debris.position.y); 
  }
 
 public void checkEdges()
 {
  if (this.position.x > Window.right){
    this.position.x = Window.left;
  }
  else if (this.position.x < Window.left){
    this.position.x = Window.right;
  }
  
  if (this.position.y > Window.top){
    this.position.y = Window.bottom;
  }
  else if (this.position.y < Window.bottom){
    this.position.y = Window.top;
  }
 }
}
