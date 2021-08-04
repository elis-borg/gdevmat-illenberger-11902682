//MODULE 8 - GRAVITATIONAL ATTRACTION - every object that has mass exerts gravitational force towards another object
/*so if apple falls it gets pulled to earth, and earth gets pulled to apple but becos earth 
is so massive and has more matter than the apple does
formula: F = ((G *m1m2)/ r^2 ) r unit 
F - gravitational force
G - gravitational constant (6.67428 x 10^-11 m3 / kg) or (1 in processing)
m1, m2 - objects' masses
unit r - direction from m1 to m2
r^2 - distance betw. the 2 objects, the farther away an obj is the weaker the attraction is*/

Walker bigMatter = new Walker();
Walker smallMatter = new Walker();

void setup()
{
  size (1280,730,P3D);
  camera (0,0,Window.eyeZ,0,0,0,0,-1,0);
  
  //initialize the matters values
  bigMatter.position = new PVector();
  bigMatter.mass = 20;
  bigMatter.scale = bigMatter.mass * 10; 
  
  smallMatter.position = new PVector(150,150);
  smallMatter.mass = 10;
  smallMatter.scale = smallMatter.mass * 10; 
}

void draw()
{
  background(255);
  
  bigMatter.update();
  bigMatter.render();
  smallMatter.update();
  smallMatter.render(); 
  
  //have big matter attract small matter
  smallMatter.applyForce(bigMatter.calculateAttraction(smallMatter)); //small matter will move towards big
  //as distance becomes smaller as it approaches so when it becomes 0 it starts shooting out so now have to establish a limit
  //use processing's constrain(amt, low, high) -> put in calculateAttraction()
  //small matter also pull on big matter
  bigMatter.applyForce(smallMatter.calculateAttraction(bigMatter));
}
