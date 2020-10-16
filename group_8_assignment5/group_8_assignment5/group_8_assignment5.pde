rotate_planet rp1;
Star s1;

void setup(){
  size(500,500,P3D);
  rp1 = new rotate_planet(50, 0,100,200,100);
  s1 = new Star(10, 250,50,-50);
}

void draw(){
  background(14,32,46);
  pushMatrix();
  translate(width/2, height/2);
  rp1.display();
  popMatrix();
  s1.display();
  s1.orbit(1/2);
}
