/*

//Bird p1;
BirdButton b1;
float Sling_x = 100;
float Sling_y = 300;
float Sling_len = 100;
float mass = 2.0;
float gravity = 0.4;
float friction = 0.995;
boolean b1Pressed = false;

void draw(){
  background(255);
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
    }}
    
    */
