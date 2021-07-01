//getting the direction:
//direction = target.position - my.position
//add normalize direction to ur position
//me.position.add.(normalized direction)

void setup()
 {
   camera(0, 0, Window.eyeZ,0,0,0,0,-1,0);
   size(1080, 720, P3D); 
 }
 
 PVector mousePos()
 {
   float x = mouseX - Window.windowWidth / 2;
   float y = -(mouseY - Window.windowHeight / 2);
   return new PVector(x,y);
 }
 
 //INITIALIZE
 Walker blackhole = new Walker(255,255,255,100); 
 Walker[] walkers = new Walker[100];
  
 boolean holeSpawned = false; //checks if blackhole has been spawned
 
 void draw()
 {
  background(0);
  
  //SPAWN BLACKHOLE
  if (holeSpawned != true){
  blackhole.randomSpawn();
  blackhole.render();
  holeSpawned = true; 
  }
  
  //SPAWN WALKERS - insert forloop here to draw lotsa circles on the map
  for(int i=0; i < 100; i++){
  walkers[i] = new Walker(); //instantiates values for each class in the array.
  walkers[i].randomSpawn(); 
  walkers[i].render();  
  }
  
  PVector direction = PVector.sub(blackhole.position, walkers[10].position); 
  
  //use forloop to simulate everyone walking towards blackhole, 
 }
