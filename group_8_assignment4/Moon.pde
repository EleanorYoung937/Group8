class Moon{
  float x;
  float y;
  float r;
  color c;
  float speed;
  float stay;
  
  Moon(float x, float y, float r, color c, float speed, float stay){
    this.x = x;
    this.y = y;
    this.r = r;
    this.c = c;
    this.speed = speed;
    this.stay = stay;
  }

  
  void display(){
    fill(c);
    ellipse(x,y,r,r);
  }
  
  void move(){
    if (y > stay){
      y -= speed;
    }else if(y <= stay){
      y = 600;
    }
  }
}
  
  
