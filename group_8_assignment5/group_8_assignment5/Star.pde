class Star{
  
  int size;
  int star_x;
  int star_y;
  int star_z;
  int temp_x;
  int temp_y;
  int temp_z;
  
  color white = color(255);
  color yellow_pantone = color(244, 222, 21, 125);
  color yellow_orange = color(243, 149, 11, 100);
  color princeton_orange = color(244, 129, 24, 100);
  color pumpkin = color(244, 114, 24, 75);
  color orange = color(244, 98, 24, 75);
  color persimmon = color(243, 87, 12, 75);
  color international_orange = color(242, 76, 0, 50);
  color red = color(206, 32, 41, 50);
  color dark_purple = color(34, 3, 31, 50);
  color rich_black = color(7, 16, 19, 246);
  
  color[] col = {white,yellow_pantone,yellow_orange,princeton_orange,pumpkin,orange,persimmon,international_orange,red,dark_purple};
  
  int motion;

  Star(int sze, int sx, int sy, int sz){
    size = sze;
    star_x = sx;
    star_y = sy;
    star_z = sz;
    temp_x = sx;
    temp_y = sy;
    temp_z = sz;
  }
  
  void display(){
    noStroke();
    pushMatrix();
    translate(star_x, star_y, star_z);
    translate(temp_x, temp_y, temp_z);
    for (int i = 1; i < (col.length); i++){
      fill(col[i]);
      sphere(10 + i * 4);
    }
    fill(255,255,255,5);
    sphere(size + (col.length - 1)*4);
    popMatrix();
    motion ++;
  }
  
  void orbit(int inc){
    temp_x = int((cos(radians(motion))) * float(star_x/2));
    temp_y = int((sin(radians(motion))) * float(star_y/2));
    
    motion += inc;
  }

}
