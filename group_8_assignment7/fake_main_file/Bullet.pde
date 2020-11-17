class Bullet extends Aircraft {
  float bx; 
  float by; 
  float br = 5; 
  float bv = 5;
  Bullet(float br, float x, float y) {
    super(x, y);
    this.br = br;
  }

  void display() {
    fill(color(255, 0, 0));
    ellipse(x, y, br, br);
    y -= bv;
    fill(255);
  }
}
