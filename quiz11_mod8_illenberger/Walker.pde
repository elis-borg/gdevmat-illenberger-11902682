public class Walker
{
 public PVector position = new PVector();
 public PVector velocity = new PVector();
 public PVector acceleration = new PVector();
 //public PVector direction; 
 
 public int r,g,b,a; 
 public float velocityLimit = 10; 
 public float scale = 15; 
 
 public float mass = 1;
 public float gravityConstant = 1; 

 public Walker()
 {
   position.x = random(Window.widthPx);
   position.y = random(Window.heightPx);
   r = int(random(256));
   g = int(random(256));
   b = int(random(256));
   a = 155; 
   scale  = random(15,30);
 }
 
 public void applyForce(PVector force)
 {
   PVector f = PVector.div(force, this.mass); 
   this.acceleration.add(f);
 }
 
 public void update()
 {   
   this.velocity.add(this.acceleration); 
   this.velocity.limit(velocityLimit);
   this.position.add(this.velocity);
   this.acceleration.mult(0);
 }
 
 public void render()
 {
   noStroke(); 
   fill (r,g,b,a);
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
 
 public PVector calculateAttraction(Walker walker) //formula for gravity
 {
   PVector force = PVector.sub(this.position, walker.position); //direction
   float distance = force.mag();
   force.normalize();  //normalize to accurately get direction
   
   distance = constrain(distance, 5, 25); //prevents it from matter shootign out 
   
   //implementing the strength of each gravity but before that, each obj must have its own G value -> go back to top to implement gravitational constant 
   float strength = (this.gravityConstant * this.mass * walker.mass) / (distance * distance);
   force.mult(strength);
   return force; 
 }

}
