class Walker
{ 
  //vectorized variables
  PVector position = new PVector(); //x y variables for circle
  PVector tPos = new PVector(0,10000,30000);
  
  PVector speed = new PVector(5,8); 
  
  public int r, g, b;
  PVector tRgb = new PVector(4, 51, 12.09);
  
  void bounceBack()
  {   
  position.add(speed);
  
  if ((position.x > Window.right) || (position.x < Window.left)){
     speed.x *= -1; 
   }
   if ((position.y > Window.top) || (position.y < Window.bottom)){
     speed.y *= -1; 
   }
  }
  
  void perlinWalk()
  {
    position.x = map(noise(tPos.x), 0,1, -640, 640);
    position.y = map(noise(tPos.y), 0,1, -360, 360); 
    position.z = map(noise(tPos.z), 0,1, 5, 150); //extent, z is just placeholder
     
    tPos.x += 0.01f;
    tPos.y += 0.01f;
    tPos.z  += 0.01f;
  }
  
  void render()
  {
  //xyz is acting as the rgb in this case
  r = int(map(noise(tRgb.x), 0,1, 0, 255));
  g = int(map(noise(tRgb.y), 0,1, 0, 255));
  b = int(map(noise(tRgb.z), 0,1, 0, 255));
    
  noStroke(); 
  fill (r,g,b,255);
  //circle (position.x,position.y,position.z); //z's value is the extent
  circle (position.x,position.y,50); //comment out and use above for perlin walk
  
  tRgb.x += 0.4f;
  tRgb.y += 0.15f;
  tRgb.z += 0.2f;
  }
}
