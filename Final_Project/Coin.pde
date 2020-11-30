class Coin {
  float x; 
  float y; 
  float r = random(5,15); 
  boolean collected = false;
  
  Coin(float ix, float iy, float iw, float ih) {
    this.x = random(ix - 2 * iw, ix + 2 * iw);
    this.y = random(iy - 2 * ih, iy + 2 * ih);
  }
  
  void display() {
    fill(color(252, 186, 3));
    ellipse(x, y, r, r);
    fill(255);
  }
  
  void collected(float bx, float by, float br) {
    // adapted from https://happycoding.io/tutorials/processing/collision-detection
    if( (bx > x - r && bx < x + r ) && (by > y - r && by < y + r)){
      //the point is inside the rectangle
      collected = true;
    }
  }
}
