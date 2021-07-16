public class Walker
{
 public PVector position = new PVector();
 public PVector velocity = new PVector();
 public PVector acceleration = new PVector();
 public PVector direction; 
 
 public float velocityLimit = 10; 
 public float scale; 

public Walker(float size) //cursor
 {
   scale  = size;
   randomSpawn(); 
 }

 public Walker() //default constructor
 {
   scale  = random(15,30);
   randomSpawn(); 
 }
 
 public void update()
 { //speed up/ down of walkers
  
   //this.acceleration = PVector.random2D(); - ORIGINAL, mod4 lesson
   this.acceleration = direction;
   this.acceleration.mult(0.2);
   
   this.velocity.add(this.acceleration); //modifying our velocity
   this.velocity.limit(velocityLimit);
   this.position.add(this.velocity); //modifying our position
 }
 
 public void render()
 {
   fill (180,180,180);
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
