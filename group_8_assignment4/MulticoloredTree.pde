class MulticoloredTree extends Tree{
  
  color[] colors;
  
  MulticoloredTree(float x, float y, float tWidth, float tHeight, color[] colors){
    super(x, y, tWidth, tHeight);
    this.colors = colors;
  }

}
