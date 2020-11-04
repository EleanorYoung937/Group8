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
    bezier(70,200,x-30,200,x-30,250,50,250);
    line(70,200,60,300);
    line(50,250,60,300);
    line(60,300,60,350);
  }
  
  void shape(){
    if (mousePressed){
      x = mouseX;
    }
  }
}
