Tree t1;
Evergreen e1;
Evergreen e2;
Evergreen e3;
Moon m1;
Birds b1;
Wave w1;
Wave w2;
Fish f1;

color old_gold = color(201, 184, 36);
color citrine= color(221, 202, 40);
color bright_yellow= color(243, 222, 44);
color goldenrod= color(217, 164, 22);
color harvest_gold= color(204, 135, 11);
color liver_dogs= color(191, 105, 0);
color royal_blue_dark= color(23, 37, 90);
color rifle_green= color(75, 84, 59);
color msu_green= color(45, 71, 57);
color green= color(48, 71, 45);
color feldgrau= color(64, 88, 75);


color[] yellows = {old_gold, citrine, bright_yellow, harvest_gold, liver_dogs};
color[] greens = {green, msu_green, feldgrau};
color[] blues = {royal_blue_dark};

void setup(){
  size(650, 650);
  //t1 = new Tree(200, 200, width/5, 3*height/5, yellows);
  //g1 = new Grass(0, 250, width, height, 15, greens);
  m1 = new Moon(50,700,70,old_gold,5,70);
  b1 = new Birds(600,150,color(0));
  w1 = new Wave(300,300,0.5,-0.5);
  w2 = new Wave(600,600,0.3,-0.2);
  f1 = new Fish(800,300,1,-2);
  t1 = new Tree(50, 200, width/4, 3*height/5, yellows);
  e1 = new Evergreen(400, 150, width/10, 3*height/10, greens);
  e2 = new Evergreen(500, 150, width/10, 3*height/10, greens);
  e3 = new Evergreen(450, 200, width/10, 3*height/10, greens);
}

void draw(){
  
  //sky
  background(royal_blue_dark);
  
  // moon rising 
  m1.display();
  m1.move();
  b1.display();
  b1.move();
 
  //grass
  fill(rifle_green);
  rect(0, 250, width, height);
  
  //forest
  e1.display();
  e2.display();
  e3.display();
  
  //river
  w1.display();
  w1.move(0.3);
  w2.display();
  w2.move(0.5);
  f1.display();
  f1.super_jump(850,300,0.005);
  f1.move_tail(0.01);
  
  //fall tree
  t1.display();
  t1.fall(1);
}
