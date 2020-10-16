rotate_planet rp1;
Star s1;
TwinStars t1;
Comet c1;
void setup(){
  size(500,500,P3D);
  rp1 = new rotate_planet(50, 0,100,200,100);
  s1 = new Star(10, 250,50,-50);
  t1 = new TwinStars(2, 350,350,50);
  c1 = new Comet(0,0,0,10,500,200);
}

void draw(){
  background(14,32,46);
  camera(-300,-200,-500,0.0, 0.0, 0.0,0.0, 1, 0.0);
  c1.display();
  c1.orbit();
  pushMatrix();
  translate(0, 0);
  rp1.display();
  popMatrix();
  s1.display();
  s1.orbit(1/2);
  t1.display();
  t1.rotate(3);
  
}
