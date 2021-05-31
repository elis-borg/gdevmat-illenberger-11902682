//defining walker class; classes can contain multi-type data/variables, to access these u must use the dot operator

class walker
{ //needs x+y values for coord/positions
  float x; 
  float y; 
  
  //function to be rendered on screen
  void render()
  {
  circle (x,y,30); 
  }
  
  void randomWalk()
  {//responsible for where our walker would be 
    int rng = int(random(4));
    if (rng == 0){
    y+=10; 
    }
    else if (rng == 1){
    y-=10;
    }
    else if (rng == 2){
    x+=10;
    }
    else if (rng == 3){
    x-=10; 
    }
  }
}
