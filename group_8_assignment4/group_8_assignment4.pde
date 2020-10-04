//Tree t1;

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
color[] theme = {old_gold, citrine, bright_yellow, harvest_gold, liver_dogs, royal_blue_dark, green, rifle_green, msu_green, feldgrau};

void setup(){
  size(650, 650);
}

void draw(){
  //t1 = new Tree(width/5, 4*height/5, 200, 200);
  background(green);
  
  //sky
  fill(royal_blue_dark);
  noStroke();
  rect(0, 0, width, 2 * height/5);
  //Tree
  
}
