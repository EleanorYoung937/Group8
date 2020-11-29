class Menu{
  boolean boxPressed = false;
  int x = 600;
  int y = 200;
  int w = 200;
  int h = 100;
  
  Menu(){
  }
  
  void display(){
    noStroke();
    background(0);
    fill(239,240,162);
    rect(x,y,w,h);
  }
}
