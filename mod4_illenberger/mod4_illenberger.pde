Walker myWalker = new Walker(); 

void setup()
 {
   camera(0, 0, Window.eyeZ,0,0,0,0,-1,0);
   size(1280, 720, P3D);
   
   //setup velocity
   //myWalker.velocity = new PVector(-5,8);
   
   //myWalker.acceleration = new PVector(-0.01,0.1); //will be going left n up
   /*will keep accelerating, needs limiters - back to walker, use limit(max)
   why tiny values? acceleration values are measured in screen pixels, will accumulate in time, every frame
   */
   
   //random PVector - random2D(target, parent) - go back to walker   
 }
 
 
 //VECTOR MOTION - a natural way of producing vector movement
 /*1. add velocity to the position (modify the walker class)
 //2. draw object at position
 3.* add acceleration (rate of change in our velocity, add it to our velocity variable)
 */
 
 void draw()
 {
 background(80); //dark grey, to flush 
 
 myWalker.update(); //upd8 by adding velocity to position
 myWalker.render();  //then render
 
 //redo bounceball excercise by teleport to the opposite edge - go back to walker and make function
 myWalker.checkEdges(); 
 
 //add acceleration to make thigns interesting (speed up or down)
 }
 
 
