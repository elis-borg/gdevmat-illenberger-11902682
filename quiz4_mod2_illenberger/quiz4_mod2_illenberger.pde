void setup()
{
  size(1280, 720, P3D);
  camera(0,0,-(height/2.0) / tan(PI*30.0 /180.0), 0,0,0,0, -1, 0);
  background(255); 
}

Walker perlinWalker = new Walker();


void draw()
{
 perlinWalker.perlinWalk(); 
 perlinWalker.render();
}
