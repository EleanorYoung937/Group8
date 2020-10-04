Tree t1;
Grass g1;

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
color[] greens = {green, rifle_green, msu_green, feldgrau};
color[] blues = {royal_blue_dark};

void setup(){
  size(650, 650);
  t1 = new Tree(200, 200, width/5, 3*height/5, yellows);
  g1 = new Grass(0, 250, width, height, 15, greens);
}

void draw(){
  
  //sky
  background(royal_blue_dark);
  
  //grass
  g1.display();
  //fill(rifle_green);
  //rect(0, 250, width, height);

  t1.display();
  
  //noLoop();
  
}
