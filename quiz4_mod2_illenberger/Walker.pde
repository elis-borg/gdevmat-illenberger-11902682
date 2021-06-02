class Walker
{ 
  public float x, y, extent; //circle coords + scale
  public float tx = 0, ty = 10000, tExtent = 30000; //circle ts 
  public int r, g, b; //circle fill colors 
  public float tr = 4 , tg = 51, tb = 12.09; //circle color ts 
  
  void render()
  {
  r = int(map(noise(tr), 0,1, 0, 255));
  g = int(map(noise(tg), 0,1, 0, 255));
  b = int(map(noise(tb), 0,1, 0, 255));
    
  noStroke(); 
  fill (r,g,b,255);
  circle (x,y,extent); 
  
  tr += 0.4f;
  tg += 0.15f;
  tb += 0.2f;
  }
  
  void perlinWalk()
  {
    x = map(noise(tx), 0,1, -640, 640);
    y = map(noise(ty), 0,1, -360, 360); 
    extent = map(noise(tExtent), 0,1, 5, 150);
    
    tx += 0.01f;
    ty += 0.01f;
    tExtent += 0.01f;
  }
}
