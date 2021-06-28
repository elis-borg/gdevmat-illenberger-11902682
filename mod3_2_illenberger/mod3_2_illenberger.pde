 void setup()
 {
   camera(0, 0, Window.eyeZ,0,0,0,0,-1,0);
   size(1080, 720, P3D); 
 }
 
 PVector mousePos()
 { //new window vector 
   float x =  mouseX - Window.windowWidth / 2;
   float y = -(mouseY - Window.windowHeight / 2);
   return new PVector(x,y); 
 }
 
 void draw()
 {
   //println(mousePos().x + "" + mousePos().y);
   //draw a line from origin from wherever line is pointing
   
   background(130);
   strokeWeight(5);
   stroke(255,0,0);
   
   PVector mouse = mousePos();
   
   /*vector normalization - making smth standard, standard v length = 1, take vector of any length and keep it pointing
   //at the same direction but change its length to 1, sometine like a proportion/ ration translator length of 5 would stil equate to being 1
   to compute = get vector's side and divide it by the absolute value of its length. (x / ||x|| */
   mouse.normalize().mult(500); //can now multiply after normalizing, will have a fixed size/length
   
   /*PVector.mult(scalar) or PVector.div(scalar)
   multiplying vectors - (in add/subtract, u can operate on 2 vectors), can multiply a vector to a scalar
   scalar = only hab magnitude, no direction*/
   //mouse.mult(0.5); //divide by half/ vice versa with bigger numbers, mouse cursor can go far but length of line is just half
   
   //draw line again from origin to mouse
   line(0,0,mouse.x,mouse.y); //first 2 are for origin, last 2 where the endpoint of line is
   
   //looking for the length of hypotenuse: c = sqrt(a^2+b^2)
   // magnitude is how long the vector is/ the hypotenuse
   println(mouse.mag()); //PVector.mag()
   
   
   
 }
