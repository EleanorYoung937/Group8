class Tree {
  float tHeight;
  float tWidth;
  // coordinate of tree base
  float x;
  float y;
  
  //init
  Tree(float x, float y, float tHeight, float tWidth){
    this.tHeight = tHeight;
    this.tWidth = tWidth;
    this.x = x;
    this.y = y;
  }
  
  void display(){
    rect(this.x, this.y, this.tHeight, this.tWidth);
  }
}
