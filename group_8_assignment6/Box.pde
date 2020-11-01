class Box{
  
  boolean isPressed = false;
  int x;
  int y;
  int w;
  int h;
  int mass;
  int x_velocity = 0;
  int y_velocity = 0;
  
  Box(int _x, int _y, int _w, int _h){
    this.x = _x;
    this.y = _y;
    this.w = _w;
    this.h = _h;
    this.mass = w * h / 2;
    // density of 0.5 mass units per length unit squared
  }
  
  void display(){
    rectMode(CENTER);
    rect(x, y, w, h);
  }
  
  void move(){
    if(x_velocity != 0){
      if ((x + w/2 == 0) || (x + w/2 == width)){
        x_velocity = -1 * ( x_velocity);
        x = x+x_velocity/2;
      }
      else{
        x = x+x_velocity;
      }
    }
    if(x_velocity != 0){
      if ((y + h/2 == 0) || (y + h/2 == height)){
        y_velocity = -1 * ( y_velocity);
        y = y+y_velocity/2;
      }
      else{
        y = y+y_velocity;
      }
    }
  }
  
  void collide(int mass_obj2){
    int new_vel_x = x_velocity * (this.mass - mass_obj2)/(this.mass + mass_obj2);
    int new_vel_y = y_velocity * (this.mass - mass_obj2)/(this.mass + mass_obj2);
    x_velocity = new_vel_x;
    y_velocity = new_vel_y;
  }
}
