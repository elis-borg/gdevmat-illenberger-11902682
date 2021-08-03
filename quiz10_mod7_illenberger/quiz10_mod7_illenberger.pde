Walker[] walkers = new Walker[10];
Liquid ocean = new Liquid (0,-100, Window.right, Window.bottom, 0.1f);

PVector wind = new PVector(0.1,0);

void setup()
{
  size(1280, 720, P3D);
  camera (0,0,Window.eyeZ,0,0,0,0,-1,0);
 int posX = 0;
 for(int i=0; i < 10; i++){
   posX = 2 * (Window.windowWidth / 10) * (i - 5);   
   walkers[i] = new Walker();
   walkers[i].position = new PVector(posX, 300); 
   walkers[i].mass = random(5,10);
   walkers[i].scale = walkers[i].mass * 10; 
 }
}

void draw()
{
  background(255);
  
  ocean.render();
  
  for (Walker w: walkers){  
    float c = 0.1f; 
    float normal = 1; 
    float frictionMagnitude = c * normal;
    PVector friction = w.velocity.copy(); 
    w.applyForce(friction.mult(-1).normalize().mult(frictionMagnitude));
    
   PVector gravity = new PVector(0, -0.15 * w.mass);
   w.update();
   w.render();
   w.applyForce(wind);
   w.applyForce(gravity); 
   w.checkEdges(); 
   
   if (ocean.isCollidingWith(w))
  {
    PVector dragForce = ocean.calculateDragForce(w);
    w.applyForce(dragForce);
  }
  }
}
