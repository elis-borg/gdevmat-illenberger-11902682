//RANDOMNESS - diff types of generation, patterns and applications in simulation+processing
//randomness - quality of state lacking organization, unpredictable, independent of rules

//coin1 + coin2; heads (forward) or tails (back)
//hh forward 0 , tt back 1, ht right 2 , th left 3

void setup()
{
  size(1020, 720, P3D);
  camera(0,0,-(height/2.0) / tan(PI*30.0 /100.0), 0,0,0,0, -1, 0);
}

walker myWalker = new walker(); //creates a new instance of the walker class here in sketch
//walker xWalker = new walker();

void draw()
{
//generating RNG using random(); exclusive function from processing
  // each time random() is called, returns an unexpected value within the specified range (high or low,high)
  // will return a float, doesnt include the highest; to convert float to int, use int()
  
  //float rng = random(5);
  //int rng = int(random(5)); //getting rid of float/ decimals, convert it to int 
    //other method: floor(random(5));
  //println(rng); //function that enables to print in dev console
  
  myWalker.randomWalk(); 
  myWalker.render(); //currently in the middle since no values declared for x & y 
  //xWalker.x = 100;
  //xWalker.render(); 
}

// now we need visualization! time to make a class
