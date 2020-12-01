class Bullet extends Aircraft {
  float bx; 
  float by; 
  float br = 5; 
  float bvy = -5;
  float bvx = 0;
  float br2 = 5;
  float angle = 0;
  //boolean bo;
  Bullet(float br, float x, float y,float bvx,float bvy) {
    super(x, y);
    this.br = br;
    this.bvx = bvx;
    this.bvy = bvy;
  }
  //shooting mode1: single vertical line
  void display() {
    fill(color(255, 0, 0));
    pushMatrix();
    translate(x,y);
    bezier(0,10,15,1,15,22,0,25);
    bezier(0,10,-15,1,-15,22,0,25);
    y += bvy;
    x += bvx;
    popMatrix();
    fill(255);
  }
  //shooting mode2: double vertical lines
  void display2() {
    fill(color(255, 0, 0));
    pushMatrix();
    translate(x,y);
    ellipse(25, -20, br, br);
    ellipse(-25, -20, br, br);
    y += bvy;
    popMatrix();
    fill(255);
  }
  //shooting mode3: rotating bullet
  void display3() {
    fill(color(153, 51, 255));
    pushMatrix();
    translate(x,y);
    rotate(angle);
    angle += 1;
    //if(angle >30){angle=30;}
    //ellipse(0, -10, br, br);
    bezier(0,10,15,1,15,22,0,25);
    bezier(0,10,-15,1,-15,22,0,25);
    y += bvy;
    popMatrix();
    fill(255);
  }
  //shooting mode4: double rotating bullets
  void display4() {
    fill(color(153, 51, 255));
    pushMatrix();
    translate(x,y);
    rotate(angle);
    angle -= 1;
    //if(angle <0){angle=0;}
    ellipse(25, -20, br, br);
    ellipse(-25, -20, br, br);
    y += bvy;
    popMatrix();
    fill(255);
  }
  //cast boom if boom is still not bigger than the screen.
  boolean boom(boolean bo){
    if (bo == false){
      fill(color(204,0,204));
      ellipse(x, y, br2, br2);
      fill(255);
      br2 += 10;
      if (br2>1.5*height){
        return true;}
      else{return false;}}
    else{  
    return true;}}
    
  //shooting mode1: invader bullet
  void invader() {
    fill(color(0, 255, 0));
    pushMatrix();
    translate(x,y);
    bezier(0,10,15,1,15,22,0,25);
    bezier(0,10,-15,1,-15,22,0,25);
    y -= bvy/2;
    popMatrix();
    fill(255);
  }
}
