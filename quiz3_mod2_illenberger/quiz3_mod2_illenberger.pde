void setup()
{
  size (1280,720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 /180.0), 0,0,0,0,-1,0);
  background (0); 
}

int frameCount;

Splatter mySplatter = new Splatter(); 

void draw(){
  mySplatter.randomSplatter(); 
  mySplatter.render();
  
  println(mySplatter.y); //check if both posi + nega values are being given out
  
  //bonus
  frameCount++;
  println("framecount:" + frameCount); 
  if (frameCount == 300){
  background(0);
  frameCount = 0; 
  println("flushed and resetted"); 
  }
}
