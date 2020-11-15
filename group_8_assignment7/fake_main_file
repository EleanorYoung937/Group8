Aircraft A1;
ArrayList<Bullet> shoot;
float v = 1;
float num = 1;
float time =0;
void setup(){
  size(1000,1000);
  frameRate(60);
  A1 = new Aircraft(500,500);
  shoot = new ArrayList<Bullet>();
}

void draw(){
  background(255);
  keyPressed();
  keyReleased();
  A1.display();
  for (int i=0;i<shoot.size();i++){
    Bullet bi = shoot.get(i);
    bi.display();}
  
}

void keyPressed(){
  if (keyPressed & keyCode == LEFT){
    A1.move(-v,0);}
  if (keyPressed &keyCode == RIGHT){
    A1.move(v,0);}
  if (keyPressed &keyCode == UP){
    A1.move(0,-v);}
  if (keyPressed &keyCode == DOWN){
    A1.move(0,v);}
  if (keyPressed & (key == 'z' || key == 'Z')&millis()-time >100){
    
    Bullet b = new Bullet(10,A1.x,A1.y);
    shoot.add(b);
    time = millis();}
    
}

void keyReleased(){
  A1.move(0,0);
}
