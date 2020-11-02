class Slingshot {
  float x;
  float vx;
  float m; 
  float rx; 
  float ks = 0.5; 
  float kd = 0.5;

  Slingshot(float _m, float _rx) {
    this.m = _m;
    this.rx = _rx;

  }

  void force() {
    float f = -((ks * (x - rx)) + kd*vx);
    float a = f/m; 
    vx = vx + a;
    x += vx;
  }
  
  void display(){
    bezier(x+10,200,x-30,200,x-30,250,x-10,250);
    line(x+10,200,x,300);
    line(x-10,250,x,300);
    line(x,300,x,350);
  }
  
  void shape(){
      x = mouseX;
  }
}
