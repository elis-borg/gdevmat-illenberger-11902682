 //INITIALIZE
 Walker blackhole = new Walker(255,255,255,50); //currently static 
 Walker[] walkers = new Walker[100];
 Walker debris = new Walker(34,124,68,45,89,233);
 int frame;

void setup()
 {
   camera(0, 0, Window.eyeZ,0,0,0,0,-1,0);
   size(1080, 720, P3D); 
   
   for(int i=0; i < 100; i++){
      walkers[i] = new Walker(); //instantiates values for each class in the array.
      walkers[i].render();  
   }
 }
 
 PVector mousePos()
 {
   float x = mouseX - Window.windowWidth / 2;
   float y = -(mouseY - Window.windowHeight / 2);
   return new PVector(x,y);
 }
  
 boolean holesSpawned = false;
 
 PVector direction = PVector.sub(blackhole.position, debris.position);
 
 void draw()
 {
  background(0);
  
  blackhole.render();

  for(int i=0; i < 100; i++){
      walkers[i].render();
      walkers[i].towardsBlackhole(blackhole);
      blackhole.render();
    }
  frame++; 
  
  if(frame >= 150){
    frame = 0;
    resetMatter();
  }
  
  //TESTING WITH SINGULAR WALKER
  /*blackhole.render();
  debris.render();
  debris.towardsBlackhole(blackhole);*/ 
 }
 
 void resetMatter()
  {
    for(int i=0; i < 100; i++){
      walkers[i] = new Walker(); //instantiates values for each class in the array.
      walkers[i].render();  
   }
   blackhole.randomSpawn();
  }
 
 //NOTES FROM LECTURE, TRIAL AND ERROR
  /*getting the direction:
  direction = target.position - my.position  
  add normalize direction to ur position
  me.position.add.(normalized direction)
  
  PVector direction = blackhole.position.sub(walkers[].position)  - will affect the values, need to use static funcs
  PVector direction = PVector.sub(blackhole.position, walkers[10].position); - the static version
  normalize direction after getting it
  direction.normalize(); 
  move towards the direction
  add normalize direction to the normalize position
  walkers[10].position.add(direction);
  use forloop to simulate everyone walking towards blackhole,  
  
  direction = PVector.sub(blackhole.position, debris.position); //direction is updated frequently or else debris will go past the target
  
  debris.position.add(direction.normalize().mult(7)); //will continue moving in that direction and not stop on target, need an i
  //.mult() is there to accelerate the speed of it moving
  
  println("location: " + debris.position.x + ", " + debris.position.y);
  blackhole.render(); - call again so debris is hidden underneath it eventually when it stops moving */ 
