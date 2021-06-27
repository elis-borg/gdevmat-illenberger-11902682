void setup()
{
  size(1280, 720, P3D);
  camera(0,0,Window.eyeZ, 0,0,0,0, -1, 0); 
}

Walker perlinWalker = new Walker();

void draw()
{
 //flush - currently disabled to show the color change
 //background(255);
  
 perlinWalker.bounceBack();
 //perlinWalker.perlinWalk(); 
 perlinWalker.render();
}
