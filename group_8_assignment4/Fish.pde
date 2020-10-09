class Fish{
  float x; float y; float size; float angle; float speed; PShape body; PShape fish;
  PShape tail1; PShape tail2; float speed2; float t; float center_x; float center_y;
  float n;
  //Fish of given position, size and angle can be created
  Fish(float x, float y, float size, float angle){
    this.x = x;
    this.y = y;
    this.size = size;
    this.angle = angle;
    //Create a shape of fish
    fill(70);
    stroke(70);
    fish = createShape(GROUP);
    tail1 = createShape(TRIANGLE,-50,0,-100,-15,-65,0);
    tail2 = createShape(TRIANGLE,-50,0,-100,15,-65,0);
    body = createShape(ELLIPSE,0,0,100,30);
    fish.addChild(tail1);
    fish.addChild(tail2);
    fish.addChild(body);
    noFill();
    }
 
    void display(){
      pushMatrix();
      translate(x,y);
      scale(size);
      rotate(angle);
      shape(fish,0,0);
      popMatrix();
    }
    
    //let the fish do an exciting super cool jump
    void super_jump(float center_x, float center_y,float speed){
      float x12 = lerp(center_x-50,center_x,t);
      float y12 = lerp(center_y,center_y-400,t);
      float x23 = lerp(center_x,center_x+50,t);
      float y23 = lerp(center_y-400,center_y,t);
      float x123 = lerp(x12,x23,t);
      float y123 = lerp(y12,y23,t);
      if (t >0 & t < 1){
      t += speed;}
      else{t=0.01;}
      angle = (y123-center_y)/(x123-center_x);
      pushMatrix();
      translate(center_x,center_y);
      scale(size);      
      x = x123;
      y = y123;
      //println(x,y);
      popMatrix();
        }
    
    void move_tail(float speed2){
      pushMatrix();
      translate(x-50,y);
      
      if (n >=0 & n<10){
        tail1.rotate(speed2);
        tail2.rotate(speed2);
      }
      else if(n>=10){
      n = -11;}
      else{
        tail1.rotate(-1*speed2);
        tail2.rotate(-1*speed2);
      }
      n += 1;
      popMatrix();
    }
}
      
  
    
    
