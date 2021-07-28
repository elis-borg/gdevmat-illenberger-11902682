//MODULE 6 - Earth's gravity, friction
Walker[] walkers = new Walker[10];

PVector wind = new PVector(0.15,0);

void setup()
{
  size(1280, 720, P3D);
  camera (0,0,Window.eyeZ,0,0,0,0,-1,0);
 int posX = 0;
 for(int i=0; i < 10; i++){
   posX = 2 * (Window.windowWidth / 10) * (i - 5);   
   walkers[i] = new Walker();
   walkers[i].position = new PVector(posX, 200); 
   walkers[i].mass = 10-i;
   walkers[i].scale = walkers[i].mass * 15; 
 }
}

void draw()
{
  background(255);
  for (Walker w: walkers){  //for each loop - an enhanced for loop
    //Friction = -1 * mu * N * v
    float mu = 0.1f; //coefficient of friction
    float normal = 1; //in this universe its 1 
    float frictionMagnitude = mu * normal;
    PVector friction = w.velocity.copy(); //copy() copies the current velocity of our walker
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMagnitude);//determine how much friction force there is
    w.applyForce(friction);
    
      PVector gravity = new PVector(0, -0.15 * w.mass);
      w.update();
      w.render();
      //walkers[i].applyForce(wind); //generally correct. however when commented out...
      //then reposition everything side by side-> go to setup
      w.applyForce(gravity); //heavier objects still tend to move last instead of first, which shouldnt be case
      w.checkEdges(); 
  }
}
    /*gravity on earth - force of gravity is calculated relative to an object's mass,
    -the bigger the object the stronger the force of gravity is
    
    on video - in vacuum, removes air friction so both bowlingball n feather fall at the same rate
    
    friction - dissipative force = energy decreases in motion
    F = -1uNv
    u or mu - coefficient of friction, scales up or down (ex. sandpaper n icecube)
    N = force perpendicular to the contact, static value of 1 for our purpose
    v = normalize it to get its direction
    ex. box fallng down the hill, */
