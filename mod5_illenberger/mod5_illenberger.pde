//MODULE 5
//NEWTON'S LAWS OF MOTION
Walker walker = new Walker();
Walker heavyWalker = new Walker();

PVector wind = new PVector(0.05,0);
PVector gravity = new PVector(0, -0.1);

void setup()
{
  size(1280, 720, P3D);
  camera (0,0,Window.eyeZ,0,0,0,0,-1,0);
  
 heavyWalker.position.y = -50;
 heavyWalker.mass = 5;
 
 walker.mass = 2;
 walker.scale = walker.mass * 15; 
}

void draw()
{
  background(80);

  walker.render(); //solo walker, constant velocity since no other forces  
  //create a function that applies force; go into Walker class
  walker.update();
  walker.applyForce(wind); 
  walker.applyForce(gravity);
  //walker.checkEdges(); 

  /*heavyWalker.render();
  heavyWalker.update();
  heavyWalker.applyForce(wind); 
  //heavyWalker.checkEdges();*/
  
  //APPLY 3rd law
  if (walker.position.y <= Window.bottom)
  {
    walker.position.y = Window.bottom; //doesnt go past but doesnt bounce and keeps going to the right  
    walker.velocity.y *= -1; //provides little bounce but doesnt really give "airtime"
  }
}

/*1st law: object at rest will stay at rest, motion in motion in a constant speed n direction
will only keep being on motion if there are no other forces available/ cancel each other out
= that will be called equilibrium
in processing: PVector will be at a constant if it stays in an equilibrium*/

/*3rd law: for every action there is an equal but opposite reaction. "law of action-reaction"
we did this in our vector module (the one where it bounces off)*/

/*2nd law: F=ma, getting the acceleration a= F/m; acceleration is directly proportional to force, force is inversely proportional to its mass
the bigger u are the slower the rate
*/
