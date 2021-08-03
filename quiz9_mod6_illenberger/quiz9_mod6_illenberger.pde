//Q9 - braking walkers
Walker[] walkers = new Walker[8];
int posY = 0;

void setup()
{
  size(1280, 720, P3D);
  camera (0,0,Window.eyeZ,0,0,0,0,-1,0);
 for(int i=0; i < 8; i++){
   posY = 2 * (Window.windowHeight / 8) * (i - 4);   
   walkers[i] = new Walker();
   walkers[i].position = new PVector(-500, posY); 
   walkers[i].mass = 8-i;
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
  line(0,0,0,Window.bottom);
  
  //for walkers  
  for (Walker w: walkers){
    //Friction = -1 * mu * N * v
    PVector friction = w.velocity.copy();
    w.calculateFriction(friction);
    w.applyForce(friction);
    
    //PVector acceleration = new PVector(0.2,0); //regular
    PVector acceleration = new PVector(0.05 * w.mass,0); //FOR BONUS
    w.update();
    w.render();
    w.applyForce(acceleration);
    println(w.mu); //check on mu's value before reaching midpoint
    w.checkMiddle(); 
    w.checkEdges(); //the wall
    //w.phaseThru();//see how long till the walker stops w/o bumping into a wall
  }
  
  if (mousePressed){
    reset();
  }
}

void reset(){
 posY = 0;
 for(int i=0; i < 8; i++){
   posY = 2 * (Window.windowHeight / 8) * (i - 4);   
   walkers[i] = new Walker();
   walkers[i].position = new PVector(-500, posY); 
   walkers[i].mass = 8-i;
   walkers[i].scale = walkers[i].mass * 15; 
 }
}
