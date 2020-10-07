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
    fill(this.c);
    ellipse(this.x,this.y,this.r,this.r);
  }
  
  void move(){
    if (this.y > this.stay){
      this.y -= this.speed;
    }
  }
}
  
  
