class Menu{
  boolean boxHover = false;
  int x;
  int y;
  int w = 400;
  int h = 100;
  String str = "";
  
  Menu(int _x, int _y, int _w, int _h, boolean boxHover, String str){
    this.x = _x;
    this.y = _y;
    this.w = _w;
    this.h = _h;
    this.boxHover = boxHover;
    this.str = str;
  }
  
  void display(){
    noStroke();
    if (this.boxHover){
      fill(239,240,162);
    }else{
      fill(124,198,144);
    }
    rect(this.x,this.y,this.w,this.h);
    textSize(60);
    textAlign(CENTER,CENTER);
    fill(255);
    text(this.str, 500, this.y+40);
  }
  
  void check(){
    if (rectCheck(this.x, this.y, this.w, this.h)){
      boxHover = true;
    }else{
      boxHover = false;
    }
  }
  
  boolean rectCheck(float x, float y, float w, float h){
    if (mouseX >= x && mouseX <= (x+w)
    && mouseY >= y && mouseY <= (y+h)){
      return true;
    }return false;}
}
