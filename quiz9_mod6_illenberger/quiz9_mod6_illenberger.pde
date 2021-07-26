//Q9 - braking walkers
Walker[] walkers = new Walker[8];

void setup()
{
  size(1280, 720, P3D);
  camera (0,0,Window.eyeZ,0,0,0,0,-1,0);
 int posY = 0;
 for(int i=0; i < 8; i++){
   posY = 2 * (Window.windowHeight / 8) * (i - 4);   
   walkers[i] = new Walker();
   walkers[i].position = new PVector(-500, posY); 
   walkers[i].mass = 10-i;
   walkers[i].scale = walkers[i].mass * 15; 
 }
}

void draw()
{
  background(255);
  
  //drawline
  stroke(0,0,0);
  strokeWeight(10);
  line(0,0,0,Window.top); 
  
  stroke(0,0,0);
  strokeWeight(10);
  line(0,0,0,Window.bottom);
  
  //for walkers  
  for (Walker w: walkers){
    //Friction = -1 * mu * N * v
    float mu = 0.01f; 
    float normal = 1;
    float frictionMagnitude = mu * normal;
    PVector friction = w.velocity.copy(); 
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMagnitude);
    w.applyForce(friction);
    
    w.acceleration = new PVector(0.2,0);
    //PVector acceleration = new PVector(0.2,0);
    PVector gravity = new PVector(0, -0.15 * w.mass);
    w.update();
    w.render();
    //w.applyForce(acceleration);
    w.applyForce(gravity); 
    w.checkEdges(); 
    
    if(w.position.x >= 0){
      mu = 0.4f;
      println("Walker has passed the middle");
   }
  }
}
