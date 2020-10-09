class Wave{
  float x; float y; float size; float angle; float speed; PShape wave; int n =1;
  PVector p1 = new PVector(0.0,0.0); float t =0.01;
  //Wave of gien position, size and angle can be created
  Wave(float x, float y, float size, float angle){
    this.x = x;
    this.y = y;
    this.size = size;
    this.angle = angle;
    wave = makeWave();
    
    pushMatrix();
    translate(x,y);  
    
    wave.scale(size);
    wave.rotate(angle);
    popMatrix();
  }
  PShape makeWave(){
    strokeWeight(3);
    wave = createShape();
    wave.beginShape();
    wave.curveVertex(-150,-10);
    wave.curveVertex(-100,0);
    wave.curveVertex(-50,10);
    wave.curveVertex(0,0);
    wave.curveVertex(50,-10);
    wave.curveVertex(100,0);
    wave.curveVertex(150,10);
    wave.endShape();  
    strokeWeight(1);
    return wave; 
  }
  //Design the projectory of Spindrift
  PVector Spindrift(){
    float x12 = lerp(-150,0,t);
    float y12 = lerp(0,-200,t);
    float x23 = lerp(0,60,t);
    float y23 = lerp(-100,0,t);
    float x123 = lerp(x12,x23,t);
    float y123 = lerp(y12,y23,t);
    if (t >0 & t < 0.8){
    t += 0.005;}
    else{t=0.01;}
    p1.x = x123;
    p1.y = y123;
    return p1;
    }
  //Display a wave with moving Spindrift  
  void display(){ 
    strokeWeight(3);
    fill(255);
    shape(wave,x,y);
    pushMatrix();
    translate(x,y);
    rotate(angle);
    scale(size);
    p1 = Spindrift();    
    bezier(p1.x,p1.y,p1.x-50,p1.y+10,-100,0,-80,10);
    bezier(p1.x+20,p1.y,p1.x,p1.y+20,-80,0,-60,10);
    bezier(p1.x+40,p1.y,p1.x+20,p1.y+10,-60,0,-40,10);
    bezier(p1.x+60,p1.y,p1.x+40,p1.y,-40,0,-20,10);
    bezier(p1.x+80,p1.y,p1.x+60,p1.y+10,-20,0,0,0);
    bezier(p1.x+100,p1.y,p1.x+80,p1.y+10,50,0,30,-8); 
    bezier(p1.x+120,p1.y,p1.x+100,p1.y+10,100,-20,60,-5); 
    circle(p1.x,p1.y,30);
    circle(p1.x+20,p1.y,30);
    circle(p1.x+40,p1.y,30);
    circle(p1.x+60,p1.y,30);
    circle(p1.x+80,p1.y,30);
    circle(p1.x+100,p1.y,30);
    circle(p1.x+120,p1.y,30);
    noFill();
    
    popMatrix();    
    }
  //Let wave move back and forth  
  void move(float speed){
    if (n >=0 & n<30){
    x += speed *size * cos(angle) ;
    y += speed *size * sin(angle) ;}
    else if(n>=30){
      n = -31;}
    else{
    x -= speed *size * cos(angle) ;
    y -= speed *size * sin(angle) ;}
    n += 1;
    }
}
