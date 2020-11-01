class Ball{
  
  boolean isPressed = false;
  int x;
  int y;
  int w;
  int h;
  int w2;
  int h2;
  int x_velocity = 0;
  int y_velocity = 0;
  int mass;
  
  Ball(int _x, int _y, int _w, int _h){
    this.x = _x;
    this.y = _y;
    this.w = _w;
    this.h = _h;
    this.w2 = _w;
    this.h2 = _h;
    this.mass = 10;
  }
  
  void display(){
    ellipseMode(CENTER);
    ellipse(mouseX, mouseY, w2, h2);
  }

  void mp(){
   if (mousePressed == true) {
     if ((w2 < 10 + w)){
       w2 += 10;
       h2 += 10;
     }
     else{
       w2 = w;
       h2 = h;
     }
   }
 }
 
 void collide(int mass_obj2){
   //uncomment this to use for object that moves freely
   //also uncomment line 22 in Environment
    //int new_vel_x = x_velocity * (this.mass - mass_obj2)/(this.mass + mass_obj2);
    //int new_vel_y = y_velocity * (this.mass - mass_obj2)/(this.mass + mass_obj2);
    //x_velocity = new_vel_x;
    //y_velocity = new_vel_y;
  }
  
}
