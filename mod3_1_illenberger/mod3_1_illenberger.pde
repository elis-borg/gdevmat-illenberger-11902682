//Euclidean Vectors  - defined as an entity with both magnitude and direction
//a geometric vector
 
 void setup()
 {
 size(1280, 720, P3D);
 camera (0,0,Window.eyeZ, 0,0,0,0,-1,0);
 }
 
 /*float x, y;
 float xSpeed = 5, ySpeed = 8;*/
 
 //^ convert into vector code (2d), helps with organizing code structure
 PVector position = new PVector();
 PVector speed = new PVector(5,8); 
 
 void draw()
 {
   background(255); //white bg, everytime its run a white bg is drawn, acts as a flush
   
   //add speed to the current position
   /*position.x += speed.x;
   position.y += speed.y;*/
   position.add(speed); //cleaner version
   
   //make it bounce, detect edge of the screen
   if ((position.x > Window.right) || (position.x < Window.left)){
     speed.x *= -1; 
     // whats happening? it negates the value of our x and y speed when it reaches the edges
   }
   if ((position.y > Window.top) || (position.y < Window.bottom)){
     speed.y *= -1; 
   }
   
   //render the circle, common practice is that it needs to move if its going to move anw
   // rather than spawning in origin
   fill (182,52,100);
   circle(position.x,position.y,50);
   
   //Vector Operations 
   // addition: adds 2 vectors, PVector.add(Pvector) => instead of adding xy, adding both xs and ys variables 
   //subtraction: subtract 2,, Pvector.sub(Pvector) =>^ same except subtracting
   
 }
