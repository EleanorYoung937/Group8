rotate_planet rp1;
Star s1;
TwinStars t1;
Comet c1;

void setup(){
  size(500,500,P3D);
  rp1 = new rotate_planet(50, 0,100,200,100,width,height);
  s1 = new Star(10, 250,50,-50);
  t1 = new TwinStars(2, 350,350,50);
  c1 = new Comet(100,100,0,20,30,100);
  stroke(0);
  strokeWeight(1);
  
}

void draw(){
  background(14,32,46);
  rp1.display();
  s1.display();
  s1.orbit(1/2);
  t1.display();
  t1.rotate(3);
  c1.display();
  c1.orbit();
}
