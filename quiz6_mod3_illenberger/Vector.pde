public class Vector
{
  PVector mousePos()
   { //new window vector 
   float x =  mouseX - Window.windowWidth / 2;
   float y = -(mouseY - Window.windowHeight / 2);
   return new PVector(x,y); 
   }
 
 color handle = color (64,64,64);
 color glow = color (255,0,0);
 color saber = color (255,204,204); 
 
  public void renderLine()
  {
   glowR();
   glowL();
   saberEndR();
   saberEndL();
   blackHandleR();
   blackHandleL(); 
  }
  
  void blackHandleR()
   {
   strokeWeight(20);
   stroke(handle);
   
   PVector mouse = mousePos();
   mouse.normalize().mult(50); 
   line(0,0,mouse.x,mouse.y); 
   
   println("right handle" + mouse.mag()); //how long is ur line
   }
   
   void blackHandleL()
   {
   strokeWeight(20);
   stroke(handle);
   
   PVector mouse = mousePos();
   mouse.normalize().mult(-50); 
  line(0,0,mouse.x,mouse.y); 
   
   println("left handle" + mouse.mag()); //how long is ur line
   }
   
   void saberEndR()
   {
   stroke(saber);
   strokeWeight(10);
   strokeCap(ROUND);  //not working sad
   
   PVector mouse = mousePos();
   mouse.normalize().mult(300); 
  line(0,0,mouse.x,mouse.y); 
   
   println("saber" + mouse.mag()); //how long is ur line
   }
   
   void saberEndL()
   {
   stroke(saber);
   strokeWeight(10);
   strokeCap(ROUND);  //not working sad
   
   PVector mouse = mousePos();
   mouse.normalize().mult(-300); 
  line(0,0,mouse.x,mouse.y); 
   
   println("saber" + mouse.mag()); //how long is ur line
   }
   
   void glowR()
   {
   stroke(glow);
   strokeWeight(20);
   strokeCap(ROUND);  //not working sad
   
   PVector mouse = mousePos();
   mouse.normalize().mult(300); 
  line(0,0,mouse.x,mouse.y); 
   
   println("glow" + mouse.mag()); //how long is ur line
   }
   
   void glowL()
   {
   stroke(glow);
   strokeWeight(20);
   strokeCap(ROUND);  //not working sad
   
   PVector mouse = mousePos();
   mouse.normalize().mult(-300); 
  line(0,0,mouse.x,mouse.y); 
   
   println("glow" + mouse.mag()); //how long is ur line
   }
} 
