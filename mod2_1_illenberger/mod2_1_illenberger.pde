//2-1: GAUSSIAN METHOD
//normal distribution of numbers: imp. factors = need to calculate mean+standard deviation
//should look like a bell in the graph
// std: measure of how spread out our numbers are; mean is the avg of a set of numbers 
// get the range after (highest value - lowest value) 
// get the variance: expectation of square deviation of a random variable from its mean
// v form: sum of (values - mean) ^ 2 then divide by n (number of items)
//std dev: square root of variance 

void setup()
{
  size (1020,720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 /180.0), 0,0,0,0,-1,0);
  background (0); 
}

void draw(){
   float gaussian = randomGaussian();
   println(gaussian);
   
   //define the std deviation in our mean
   float stdDeviation = 100; //the variance or how scattered the values are
   float mean = 0; //where the center of our line is/ where most values are being displayed 
   
   //only modify the x coords of our circle
   float x  = stdDeviation * gaussian + mean;
   
   //draw circle
   noStroke();
   fill (255, 10); 
   circle (x, 0, 30); 
   //expected result, more circles are in the center than there are at the tails 
   
}
