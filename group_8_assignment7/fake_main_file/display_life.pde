class display_life{
  float x,y,r;
  float remaining;
  
  display_life(float _x, float _y, float _r){
    x = _x;
    y = _y; 
    r = _r;
  }
  
  void display(){
    rect(x,y,r,r/2);
    fill(0);
    text("lives remaining", 855,70);
  }
  
  void lives(){
  }
}
