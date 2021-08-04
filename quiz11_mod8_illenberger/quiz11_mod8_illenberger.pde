Walker[] walkers = new Walker[10];

void setup()
{
  size (1280,730,P3D);
  camera (0,0,Window.eyeZ,0,0,0,0,-1,0);
 for(int i=0; i < 10; i++){   
   walkers[i] = new Walker();
   walkers[i].mass = random(20);
   walkers[i].scale = walkers[i].mass * 10; 
 }
}

void draw()
{
  background(255);
  
  for (int i=0; i < 10; i++)
  {  
     walkers[i].update();
     walkers[i].render();
     walkers[i].checkEdges(); 
    
     for(int j=0; j < 10; j++)
    { 
      if (walkers[i] != walkers[j]){
      walkers[i].applyForce(walkers[j].calculateAttraction(walkers[i]));
      }
    }
  } 
}
