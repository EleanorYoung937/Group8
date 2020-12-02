class Aircraft {
  float x; 
  float y; 
  float vx; 
  float vy; 
  float r = 10;
  
  float pos = 0;
  float inc = 2;
  float wing = 20;
  
  boolean killed = false;
  float time;
  
  Aircraft(float _x, float _y) {
    x = _x;
    y = _y;
  }

  //aircraft can move with given step and directions.
  //it cannot move outside the screen.
  void move(float vx, float vy) {
    x += vx;
    y += vy;
    if (y > (height - r)) {
      y = height -r;
    }
    if (y < r) {
      y = r;
    }
    if (x > (width - r)) {
      x = width -r;
    }
    if (x < r) {
      x = r;
    }
  }

  void display() {
    if (killed == false){
    fill(color(255, 0, 0));
    pushMatrix();
    translate(x, y);
    //main body with ring and shooting system
    ellipse(0, 0, 2*r, 2*r);
    fill(color(0,0,255));
    ellipse(25, -20, r, r);
    ellipse(-25, -20, r, r);
    fill(color(255,255,0));
    ellipse(0, -20, 3*r, r);
    fill(255);
    ellipse(0, -20, 2*r, 2*r/3);
    //triangle(0, -30, -10, -10, 10, -10); 
    
    //multilevel animantion
    if (pos % (2 * wing) >= - wing && pos % (2 * wing) <= wing){
      translate(0, pos % (2 * wing));
    }
    else {
      translate(0, wing - pos % (2 * wing));
    }
    
    pos = pos + inc;
    //left wing
    fill(color(51,153,255));
    triangle(-20, -5, -40, -25, -33,-10); 
    beginShape();
    vertex(-20,0); 
    vertex(-33,-5);
    vertex(-40,0);
    vertex(-33,5);
    endShape();
    triangle(-20, 5, -40, 25, -33,10);
    //right wing
    triangle(20, -5, 40, -25, 33,-10); 
    beginShape();
    vertex(20,0); 
    vertex(33,-5);
    vertex(40,0);
    vertex(33,5);
    endShape();
    triangle(20, 5, 40, 25, 33,10);
    popMatrix();
    fill(255);
  }
  else{
    if((millis()-time)%2==0){
    fill(color(255,0,0));
    ellipse(x,y,50,50);
    fill(255);}
  }
    
  }
  void shotornot(float bx, float by, float br) {
    // adapted from https://happycoding.io/tutorials/processing/collision-detection
    if(dist(bx,by,x,y)<r){
      //the point is inside the circle
      killed = true;
      time = millis();
    }
  }
}
