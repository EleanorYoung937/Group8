class rotate_planet {

  float x;
  float angle;
  float r;
  float g;
  float b;

  rotate_planet(float x, float angle, float r, float g, float b) {
    this.x = x;
    this.angle = angle;
    this.r = r;
    this.g = g;
    this.b = b;
  }

  void display() {
    PShape sphere = createShape(SPHERE, x);
    fill(r,g,b);
    pushMatrix();
    rotateX(angle);
    angle += 0.05;
    shape(sphere);
    popMatrix();
  }
}
