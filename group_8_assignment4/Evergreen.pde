class Evergreen extends Tree{
  float leaves_y;
  
  color[] colors;
  
  Evergreen(float x, float y, float tWidth, float tHeight, color[] colors){
    super(x, y, tWidth, tHeight, colors);
    this.colors = colors;
  }
 
  void display(){
    noStroke();
    
    // trunk
    
    fill(61, 46, 32);
    rect(this.x + (2 * this.tWidth/ 5), this.y + this.tHeight / 3, (1 * this.tWidth / 5), 2 * this.tHeight / 3);
    
    //leaves
    float j = this.x; 
    float i = this.y; 
    float wide = (this.tWidth/ 2);
    float tall = (2 * this.tHeight/3)/ 27;
    float slant = tall * 8;
    int k = 1;
    while (i < this.y + (2 * this.tHeight/3)){
      fill(greens[k % (colors.length)]);;
      quad(j, i + slant, j + wide, i,  j + wide, i + tall, j, i + tall + slant);
      j = j + wide;
      k = k + 1;
      fill(greens[k % (colors.length)]);
      quad(j, i , j + wide, i + slant,  j + wide, i + tall + slant, j, i + tall);
      j = j - wide;
      i = i + tall;
      k = k + 1;
    }
  }
}
