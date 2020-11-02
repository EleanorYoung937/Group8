boolean collide = false;
Environment[] top = new Environment[6];
Environment[] bottom = new Environment[5];
Ball ball;
Slingshot s;

void setup(){
  
  size(500, 500);
  
  for (int i = 0; i < top.length; i++){
    top[i] = new Environment(230 + i*50, 50 + (i * 10 / 2), 20, 100 + (i * 10), top, i);
  }
  for (int i = 0; i < bottom.length; i++){
    bottom[i] = new Environment(250 + i*50, 449 - (i * 10 / 2), 20, 100 + (i * 10), bottom, i);
  }
  
  ball = new Ball(100, 250, 15, 15);
  s = new Slingshot(50,100);
  
}

void draw(){
  background(255);
  for (Environment r : top){
    r.display();
  }
  for (Environment r : bottom){
    r.display();
  } 
  ball.display();
  s.force();
  s.display();
  s.shape();
}
