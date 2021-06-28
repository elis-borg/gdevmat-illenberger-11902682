 void setup()
 {
   camera(0, 0, Window.eyeZ,0,0,0,0,-1,0);
   size(1080, 720, P3D); 
 }
 
 Vector lightsaber = new Vector(); //instantiating class
 
 void draw()
 {
   background(130);
   
   lightsaber.renderLine(); 
   //println(mousePos().x + "" + mousePos().y);
   //draw a line from origin from wherever line is pointing
   
  
 }
