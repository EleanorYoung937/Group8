Wave w1;
Wave w2;
Fish f1;
void setup(){
    size(1000,1000,P2D);
    w1 = new Wave(300,300,0.5,-0.5);
    w2 = new Wave(600,600,0.3,-0.2);
    f1 = new Fish(800,300,1,-2);
}

void draw(){
    background(255);
    w1.display();
    w1.move(0.3);
    w2.display();
    w2.move(0.5);
    f1.display();
    f1.super_jump(850,300,0.005);
    f1.move_tail(0.01);
   
    
  
}
