class Slingshot {
  float x;
  float y;
  float vx;
  float vy;
  float m; 
  float rx;
  float ry;
  float ks = 0.5; 
  float kd = 0.5;
  float mx;
  float my;
 
  Slingshot(float _m, float _rx, float _ry) {
    this.m = _m;
    this.rx = _rx;
    this.ry = _ry;

  }

  void force() {
    float f = -((ks * (x - rx)) + kd*vx);
    float a = f/m; 
    vx = vx + a;
    x += vx;
    
    float f_1 = -((ks * (y - ry)) + kd*vy);
    float a_1 = f_1/m; 
    vy = vy + a_1;
    y += vy;
  }
  
  void display(){
    bezier(70,200,x-30,y,x-30,y,50,250);
    line(70,200,60,300);
    line(50,250,60,300);
    line(60,300,60,350);
  }
  
  
  void update(float mx, float my){
      x = mx;
      y = my;
    }
}
