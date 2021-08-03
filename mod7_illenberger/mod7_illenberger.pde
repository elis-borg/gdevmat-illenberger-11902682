//MODULE 7 - DRAG FORCE - a dissipative force or also known as viscous force
/*- air & fluid resistance, 3rd law of newton: action-reaction
- imagine the shape of airplane and the air flow cutting thru
formula: Fd = -1/2 * P * v^2 * A* Cd * vector unit
Fd = drag force
-1/2 - constant (-0.5)
P - "raw" density (1)
v^2 - velocity of our object ^ 2
A = surface area of moving object (1)
Cd = (d here is in subscript), Coefficient of drag; same as q from friction formula, how strong or weak our drag force is
unit vector = velocity.normalized() */ 

Liquid ocean = new Liquid (0,-100, Window.right, Window.bottom, 0.1f);
Walker myWalker = new Walker();
Walker myWalker2 = new Walker();

void setup()
{
  size(1280, 720, P3D);
  camera (0,0,Window.eyeZ,0,0,0,0,-1,0);
  
  myWalker.position = new PVector(0,300);
  //myWalker.g = 0; //green n blue are set to 0 since sir's example default value for this was 255 for rgb which would make everything white but we hab white bg so
  //myWalker.b = 0;
  myWalker.mass = 5;
  myWalker.scale = myWalker.mass * 10;
  
  myWalker2.position = new PVector(100,300);
  myWalker2.mass = 5;
  myWalker2.scale = myWalker2.mass * 10; 
}

void draw()
{
  background(255);
  
  ocean.render(); 
  myWalker.render(); 
  myWalker. update();
  
  myWalker2.render(); 
  myWalker2. update();
  
  PVector gravity = new PVector(0, -0.25 * myWalker.mass);
  myWalker.applyForce(gravity); //applying gravity to our Walker
  myWalker2.applyForce(gravity);
  
  
  float c = 0.1f;
  float normal = 1;
  float frictionMagnitude = c * normal;
  PVector friction = myWalker.velocity.copy();
    //F = -uv 
  myWalker.applyForce(friction.mult(-1).normalize().mult(frictionMagnitude)); // applying friction to Walker
  
  
  if (myWalker.position.y <= Window.bottom)
  {
  myWalker.position.y = Window.bottom;
  myWalker.velocity.y *= -1; 
  }
  
  if (ocean.isCollidingWith(myWalker))
  {
    PVector dragForce = ocean.calculateDragForce(myWalker);
    myWalker.applyForce(dragForce);
  }
  
  if (myWalker2.position.y <= Window.bottom)
  {
  myWalker2.position.y = Window.bottom;
  myWalker2.velocity.y *= -1; 
  }
  
  if (ocean.isCollidingWith(myWalker2))
  {
    PVector dragForce = ocean.calculateDragForce(myWalker2);
    myWalker2.applyForce(dragForce);
  }
}
