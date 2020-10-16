rotate_planet rp1;

void setup(){
  size(500,500,P3D);
  rp1 = new rotate_planet(50, 0,100,200,100);
}

void draw(){
  translate(width/2, height/2);
  rp1.display();
}
