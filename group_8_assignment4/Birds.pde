class Birds{
  
  PShape bird;
  color c;
  float x;
  float y;
  float a = 0.0;
  
  Birds(float x, float y, color c){
    this.x = x;
    this.y = y;
    this.c = c;
  }
  
  void display(){
    bird  = createShape();
    bird.beginShape();
    bird.fill(c);
    bird.vertex(x,y);
    bird.vertex(x+20,y-15);
    bird.vertex(x+45,y+10);
    bird.vertex(x+60,y-20);
    bird.vertex(x+75,y+10);
    bird.vertex(x+100,y+5);
    bird.vertex(x+50,y+30);
    bird.vertex(x+20,y-3);
    bird.endShape();
    shape(bird);
  }
  
  void move(){
    frameRate(30);
    x -= 5;
    if (a < 360){
      a += 90;
    }if (x < 0){
      x = 600;
    } if (a >= 360) {
      a = 0;
    }
    y += 25*cos(radians(a));
  
  }
}
