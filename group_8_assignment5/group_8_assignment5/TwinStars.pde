class TwinStars extends Star{
    int temp_x1;
    int temp_y1;
    int temp_z1;
  
  TwinStars(int sze, int sx, int sy, int sz){
    super(sze, sx, sy, sz);
    temp_x1 = 4 * sze;
    temp_y1 = 4 * sze;
    temp_z1 = 4 * sze;
  }
  
  void display(){
    noStroke();
    pushMatrix();
    translate(star_x, star_y, star_z);
    translate(temp_x1, temp_y1, temp_z1);
    for (int i = 1; i < (col.length); i++){
      fill(col[i]);
      sphere(size/2 + i * 4);
    }
    fill(255,255,255,5);
    sphere(size + (col.length - 1)*4);
    popMatrix();
    
    pushMatrix();
    translate(star_x, star_y, star_z);
    translate(-temp_x1, -temp_y1, -temp_z1);
    for (int i = 1; i < (col.length); i++){
      fill(col[i]);
      sphere(size/2 + i * 4);
    }
    fill(255,255,255,5);
    sphere(size/2 + (col.length - 1)*4);
    popMatrix();
  }
  
  
  void rotate(int inc){
    temp_x1 = int((cos(radians(motion))) * 4 * float(size));
    temp_y1 = int((sin(radians(motion))) * 4 * float(size));  
    motion += inc;
  }
}
