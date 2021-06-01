//2-2: NOISE - much natural and normal way of producing numbers
// good number generator produces values that dont have a discernable pattern 
// PERLIN NOISE - more organic appearnce, smoother appearance of values vs pure random numbers
  //considers the previous values it had before it randomizes the next value
 void setup()
{
  size (1280,720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 /180.0), 0,0,0,0,-1,0);
  background (255); 
}
int frameCount; 
float t = 0; 

void draw()
{
  /*float random = noise(t); //(x,y,z). generates a value from 0-1
  //will generate the same value overtime, u need a dynamic variable to change overtime
  //make a global variable for it 
  println(random); 
  t += 0.01f; //the generating is much smoother, no drastic jumps */
  
  //can "map" the values 0-1 to a newer values, will be relatively in the same position
  float n = noise(t);
  //map to wider range
  float x = map(n,0,1,0,360); //movement to the right; (value - incoming value to be converted , start1 - lowb of v current range , stop1 - upb of vcr, start2 - lowb of v target r,stop2 - f upb of vtr)
  //stop 2 here will be the max height of screen
  
  rect(-640 + (t*100), -360, 1, x); //(a,b,c,d) x coord, y coord, width, height 
  t += 0.01f; //this is 1-dimensional mountain range
}
