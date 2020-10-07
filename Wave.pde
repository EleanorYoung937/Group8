class Wave{
  float x; float y; float size; float angle; float speed; PShape wave1;
  
  Wave(float x, float y, float size, float angle){
    this.x = x;
    this.y = y;
    this.size = size;
    this.angle = angle;
  }
  PShape makeWave(){
    PShape wave;
    wave = createShape();
    wave.beginShape();
    wave.curveVertex(x-50,y-10);
    wave.curveVertex(x,y);
    wave.curveVertex(x+50,y+10);
    wave.curveVertex(x+100,y);
    wave.curveVertex(x+150,y-10);
    wave.curveVertex(x+200,y);
    wave.curveVertex(x+250,y+10);
    wave.endShape();
    wave.scale(size);
    wave.rotate(angle);
    return wave;
  }
    
  void display(){
    fill(0);   
    wave1 = makeWave();
    shape(wave1,x,y);
    }
  void move(float speed){
    x += speed*size;
    y += speed*size;
    speed = -2*speed;}
}
