//Bird p1;
BirdButton b1;
float Sling_x = 100;
float Sling_y = 300;
float Sling_len = 100;
float mass = 2.0;
float gravity = 0.4;
float friction = 0.995;
boolean b1Pressed = false;

boolean collide = false;
Environment[] top = new Environment[6];
Environment[] bottom = new Environment[5];
//Ball ball;
Slingshot s;

void setup(){
  
  size(500, 500);
  
  for (int i = 0; i < top.length; i++){
    top[i] = new Environment(230 + i*50, 50 + (i * 10 / 2), 20, 100 + (i * 10), top, i);
  }
  for (int i = 0; i < bottom.length; i++){
    bottom[i] = new Environment(250 + i*50, 449 - (i * 10 / 2), 20, 100 + (i * 10), bottom, i);
  }
  
  //ball = new Ball(100, 250, 15, 15);
  s = new Slingshot(60,100);
  b1 = new BirdButton(100,300,50,mass);
  
}

void draw(){
  background(255);
  for (Environment r : top){
    r.display();
    r.collision(b1);
  }
  for (Environment r : bottom){
    r.display();
    r.collision(b1);
  } 
  //ball.display();
  s.force();
  s.display();
  s.shape();
  if(b1Pressed == false&dist(mouseX,mouseY, Sling_x,Sling_y) < Sling_len ){
     b1.update(mouseX,mouseY); 
     b1.init_vel(mouseX, mouseY, Sling_x, Sling_y,Sling_len);
     b1.over(true);}
  else if(b1Pressed){
     b1.applyForces(friction,gravity);
     
   }
  else{
  b1.over(false);
  b1.update(Sling_x,Sling_y);}
  b1.display();
  println(b1.vx);
}

void mousePressed(){
    if (b1.isPressed()) {
      b1Pressed = true;
    }
    s.shape();
}
