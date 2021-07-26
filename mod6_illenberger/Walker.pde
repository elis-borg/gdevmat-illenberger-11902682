public class Walker
{
 public PVector position = new PVector();
 public PVector velocity = new PVector();
 public PVector acceleration = new PVector();
 //public PVector direction; 
 
 public int r,g,b; 
 public float velocityLimit = 10; 
 public float scale = 15; 
 
 public float mass = 1;

 public Walker() //default constructor
 {
   r = int(random(256));
   g = int(random(256));
   b = int(random(256));
   scale  = random(15,30);
 }
 
 public void applyForce(PVector force)
 {
   PVector f = PVector.div(force, this.mass); 
   this.acceleration.add(f); //force accumulation instead
 }
 
 public void update()
 {   
   this.velocity.add(this.acceleration); //modifying our velocity, velocity accumulation
   this.velocity.limit(velocityLimit);
   this.position.add(this.velocity); //modifying our position
   this.acceleration.mult(0); //resets acceleration
 }
 
 public void render()
 {
   fill (r,g,b);
   circle(position.x, position.y, scale);
 }
  
 public void checkEdges()
 {
  if (position.x >= Window.right){
    position.x = Window.right; //exists so as to safeguard pos and not overflow towards the farther end of the edge
    velocity.x *= -1;
  }
  else if (position.x <= Window.left){
    position.x = Window.left;
    velocity.x *= -1;
  }
  
  if (this.position.y >= Window.top){
    this.position.y = Window.top;
    velocity.y *= -1;
  }
  else if (this.position.y <= Window.bottom){
    position.y = Window.bottom;
    velocity.y *= -1;
  }
 }
}
