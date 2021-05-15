//hint for bonus
int globalVariable = 100;
int time = 10000; 

//calls this on the 1st frame, same as unity's start()
void setup() 
{
 size(1280, 720, P3D); 
 camera(0,0,-(height/2.0) / tan(PI*30.0/180.0), 0,0,0,0,-1,0); //positions our camera to the center
}

//calls every frame; unity's update()
void draw()
{
 background (0);
 
 drawCartesianPlane();
 drawLinearFunction();
 drawQuadraticFunction();
 drawSineWave(); 
}

void drawCartesianPlane()
{
 strokeWeight(2);
 color white = color (255,255,255);
 fill (white);
 stroke (white);
 line (300, 0, -300, 0);
 line (0, 300, 0, -300);

 for (int i = -300; i <= 300; i +=10){
   line (i, -5, i, 5); //along y axis
   line (-5, i, 5, i); //along x axis
 }
}

void drawLinearFunction()
{
  // f(x) = a + bx
  //f(x)= -5x+30
  color purple = color (127,0,255);
  fill (purple);
  noStroke(); //strokes default to black, no outerlining
  
  for (int x=-200; x <= 200; x++){
    circle(x, ((-5*x) + 30), 5); //outcome is not really a "line", its a set of circles
  }  
  
}

void drawQuadraticFunction()
{
  // f(x) = ax^2+ bx + c 
  // f(x)= x^2-15x-3 
  color yellow = color (255,255,51);
  fill (yellow);
  noStroke();
  
  for (float x= -300; x <= 300; x+=0.1f){ // its 0.1f since its a parabola, when it reaches a peak this prevents it from breaking off weirdly?
    circle (x, ((x*x) + (-(15*x)) - 3), 3); 
  }
}

void drawCircle()
{
  color blue = color (0,0,255);
  fill (blue);
  stroke(blue);
  float radius = 90;
  
  for (int x = 0; x <= 360; x++){
    circle ((float)Math.cos(x) * radius, (float)Math.sin(x) * radius,  5); 
  }
}

void drawSineWave()
{
  // f(x) = A sin(B(x + C)) + D
  color rose = color (255, 179, 179);
  fill (rose);
  stroke (rose);
  
  for (int x = -300; x <= 300; x++){
  circle ( x, (70 * (float)Math.sin(x*25)), 3);
  } 
}
