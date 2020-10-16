class rotate_planet {

  float x;
  float angle;
  float r;
  float g;
  float b;
  float w;
  float h;

  rotate_planet(float x, float angle, float r, float g, float b, float w, float h) {
    this.x = x;
    this.angle = angle;
    this.r = r;
    this.g = g;
    this.b = b;
    this.w = w;
    this.h = h;
  }

  void display() {
    PShape sphere = createShape(SPHERE, x);
    pushMatrix();
    translate(w/2, h/2);
    fill(r,g,b);
    shininess(20);
    directionalLight(255,255,255,-1,0,-1);
    rotateX(angle);
    angle += 0.05;
    shape(sphere);
    popMatrix();
  }
}
