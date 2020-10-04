class Grass{
  
  float dim;
  float x;
  float y;
  float gWidth;
  float gHeight;
  
  Grass(float _x, float _y, float gWidth, float gHeight, float dimension, color[] colors){
    this.dim = dimension;
    this.x = _x;
    this.y = _y;
    this.gWidth = gWidth;
    this.gHeight = gHeight;
  }
  
  void display(){
    noStroke();
    float j = this.x; 
    float i = this.y; 
    int k = 1;
    while ((i + j) < (this.gWidth + this.gHeight)){
      fill(greens[k % (greens.length)]);
      rect(j, i, this.dim, this.dim);
      if (j >= width){
        j = 0;
        i = i + this.dim;
      }
      else {
        j = j + this.dim/3;
      }
       k = k + 1;
    } 
  }
}
