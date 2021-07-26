Walker[] walkers = new Walker[10];
Walker walker = new Walker();

//INITIALIZE THE FORCES
PVector wind = new PVector(0.15,0);
PVector gravity = new PVector(0, -0.4);

void setup()
{
  size(1280, 720, P3D);
  camera (0,0,Window.eyeZ,0,0,0,0,-1,0);
 
 //walker.mass = 10;
 //walker.scale = walker.mass * 15; 
 
 //setup 10 walkers
 for(int i=0; i < 10; i++){
      walkers[i] = new Walker(); //instantiates values for each class in the array.
      walkers[i].mass = i+1;
      walkers[i].scale = walkers[i].mass * 15; 
   }
}

void draw()
{
  background(80);

  /*walker.render(); 
  walker.update();
  walker.applyForce(wind); 
  walker.applyForce(gravity);*/
  
  for(int i=0; i < 10; i++){
      walkers[i].render();
      walkers[i].update();
      walkers[i].applyForce(wind);
      walkers[i].applyForce(gravity);
      walkers[i].checkEdges(); 
    }
}
