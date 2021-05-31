void setup()
{
  size(1020, 720, P3D);
  camera(0,0,-(height/2.0) / tan(PI*30.0 /100.0), 0,0,0,0, -1, 0);
}

walker myWalker = new walker();

void draw()
{
  //myWalker.randomWalk();
  myWalker.randomWalkBiased();
  myWalker.render();
}
