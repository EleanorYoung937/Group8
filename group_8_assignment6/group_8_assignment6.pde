//Bird p1;
BirdButton b1;
float Sling_x = 60;
float Sling_y = 250;
float Sling_len = 100;
float elastic_potential = 60;
float mass = 2.0;
float gravity = 0.4;
float friction = 0.998;
boolean b1Pressed = false;

boolean collide = false;
Environment[] top = new Environment[6];
Environment[] bottom = new Environment[5];
//Ball ball;
Slingshot s;

void setup(){
  frameRate(30);
  size(500, 500);
  
  for (int i = 0; i < top.length; i++){
    top[i] = new Environment(100 + i*75, 50 + (i * 10 / 2), 20, 100 + (i * 10), top, i);
  }
  for (int i = 0; i < bottom.length; i++){
    bottom[i] = new Environment(120 + i*75, 449 - (i * 10 / 2), 20, 100 + (i * 10), bottom, i);
  }
  
  //ball = new Ball(100, 250, 15, 15);
  s = new Slingshot(elastic_potential,100,200);
  b1 = new BirdButton(100,300,50,mass);
  
}

void draw(){
  background(200, 200, 255);
  for (Environment r : top){
    r.display();
    r.collision(b1);
    r.move();
  }
  for (Environment r : bottom){
    r.display();
    r.collision(b1);
    r.move();
  } 
  //ball.display();
  s.display();
  //if mouse not click, bird will move with mouse while mouse within the area of 
  //slingshot, and initial velocity will be set corresponding to position.
  if(b1Pressed == false&dist(mouseX,mouseY, Sling_x,Sling_y) < Sling_len ){
     b1.update(mouseX,mouseY); 
     b1.init_vel(mouseX, mouseY, Sling_x, Sling_y,Sling_len,elastic_potential);
     b1.over(true);
     s.update(mouseX,mouseY);}
  //if mouse pressed, the bird being ;aunched and will follow physical rules.
  else if(b1Pressed){
     b1.applyForces(friction,gravity);
     //println(b1.y);
     s.force();
  
   }
  //if mouse not pressed and not within correct area, the bird moves to a default position
  else{
  b1.over(false);
  b1.update(Sling_x,Sling_y);}
  b1.display();
  //println(b1.vx);
}
// change the status of mouse pressed or not
void mousePressed(){
    if (b1.isPressed()) {
      b1Pressed = true;
    }
}
