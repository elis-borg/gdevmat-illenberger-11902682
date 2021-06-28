public class Walker {

  public PVector position = new PVector(); //no need for initializing position
  //if this variable issa object = any other data types other than float/string, pvector is a class
  // always need to declare and initialize into a new instance. allotting a space in our ram for this class
  public float scale = 15;
  
  public Walker()
  {

  } 
  
  public void render()
  {
    circle(position.x,position.y,scale); 
  }
}
