 //INITIALIZE
 Walker[] walkers = new Walker[100];
 Walker mouse = new Walker(0); 
 
 int frame;

void setup()
 {
   camera(0, 0, Window.eyeZ,0,0,0,0,-1,0);
   size(1280, 720, P3D); 
   
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
 
 void draw()
 {
  background(80);
  
  PVector mousePt = mousePos();
  mousePt.mult(1);
  mouse.position.x = mousePt.x;
  mouse.position.y = mousePt.y;
  
  mouse.render();

  for(int i=0; i < 100; i++){
      //lifted from walkTowards();
      walkers[i].direction = PVector.sub(mouse.position, walkers[i].position);
      walkers[i].direction.normalize();
      walkers[i].update(); 
      walkers[i].render();
      walkers[i].checkEdges(); 
   
      mouse.render();
    }
 }
 
 
