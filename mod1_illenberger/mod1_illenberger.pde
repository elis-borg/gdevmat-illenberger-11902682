//calls this on the 1st frame, same as unity's start()
void setup() 
{
 size(1280, 720, P3D); //how big are window is, 1280x720 (for 1080p screens)
   //P3D = makes our environment 3d, default env will be 2d, optimal flexibility if 3d despite not using 3
  camera(0,0,-(height/2.0) / tan(PI*30.0/180.0), 0,0,0,0,-1,0); //positions our camera to the center
}

//calls every frame; unity's update()
void draw()
{
 //bg is in draw so its there every frame
 background (0); //130 some sort of grey color, 0 is black, 255 white
 
 /*circle (0,0,5); //x,y,extent
 
 strokeWeight(2); //thickness of the line
 //any line placed after this line of code will be taking this size, just type strokeWeight again to change
 color white = color (255,255,255); //color is already premade/defined in the software
 fill (white); //to apply the white color in the line
 stroke(white); //all the strokes will be the color selected
 line (-75, -75, 75,75); //x1,y1,x2,y2 //look skinny bcos default stroke thickness is just 1px */
 
 drawCartesianPlane();
 drawLinearFunction();
 drawQuadraticFunction();
 drawCircle(); 
}

void drawCartesianPlane()
{
 //CARTESIAN PLANE challenge
 strokeWeight(2);
 color white = color (255,255,255);
 fill (white);
 stroke (white);
 line (300, 0, -300, 0);
 line (0, 300, 0, -300);

 //use loops! from sir's video
 for (int i = -300; i <= 300; i +=10){
   line (i, -5, i, 5); //along y axis
   line (-5, i, 5, i); //along x axis
 } //<>//
}

void drawLinearFunction()
{
  /* f(x) = a + bx
  f(x)= x+2
  let x be 4, then y=6; (4,6)
  let x be -5, y=3; (-5, -3) */
  //wont use line() to draw linear function instead a set of points, make use of a loop as well
  
  color red = color (255,0,0);
  fill (red);
  noStroke(); //strokes default to black, no outerlining
  
  for (int x=-200; x <= 200; x++){
    circle(x, x + 2, 5); //outcome is not really a "line", its a set of circles
  }
}

void drawQuadraticFunction()
{
  /* f(x) = ax^2+ bx + c 
  f(x)= x^2+2x-5 
  let x be 2, then y=3
  let x be -1, y= -6 */
  
  color green = color (0,255,0);
  fill (green);
  noStroke();
 
  for (float x= -300; x <= 300; x+=0.1f){ // its 0.1f since its a parabola, when it reaches a peak this prevents it from breaking off weirdly?
    circle (x, ((x*x) + (x*2) - 5), 5); 
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
