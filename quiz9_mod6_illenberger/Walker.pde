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
 public float mu = 0.01f;
 public float normal = 1; 
 public float frictionMagnitude;
 
 public Walker()
 {
   r = int(random(256));
   g = int(random(256));
   b = int(random(256));
   scale  = random(15,30);
 }
 
 public void applyForce(PVector force)
 {
   PVector f = PVector.div(force, this.mass); 
   this.acceleration.add(f);
 }
 
 public void calculateFriction(PVector friction)
 {
   frictionMagnitude = mu*normal;
   
   friction.mult(-1);
   friction.normalize();
   friction.mult(frictionMagnitude);
   
   /*Direction = -1 * unit velocity
   Magnitude = mu * normal
   normal = 1; mu = coefficient of friction*/
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
   fill (r,g,b);
   circle(position.x, position.y, scale);
 }
  
 public void checkEdges()
 {
  if (position.x >= Window.right){
    position.x = Window.right;
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
 
 public void checkMiddle()
 {
   if(this.position.x >= 0){
     mu = 0.4f;
     println(mu);
   }
 }
 
   public void phaseThru()
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
