// color bistre = color(61, 46, 32)

class Tree {
  float tWidth;
  float tHeight;
  // coordinate of tree base
  float x;
  float y;
  float leaves_y = y;
  color[] colors;
  
  //init
  Tree(float x, float y, float tWidth, float tHeight, color[] colors){
    this.tWidth = tWidth;
    this.tHeight = tHeight;
    this.x = x;
    this.y = y;
    this.leaves_y = y;
    this.colors = colors;
  }
  
  void display(){
    noStroke();
    
    // trunk
    fill(61, 46, 32);
    rect(this.x + (2 * this.tWidth/ 5), this.y + this.tHeight / 3, (1 * this.tWidth / 5), 2 * this.tHeight / 3);
 
    noStroke();
    // leaves
    int k = 1;
    float max = 7;
    float l_height = 2 * this.tHeight/ (3 * (max+2));
    float l_width = this.tWidth/ max;
    float yc = ( this.leaves_y + l_height/2);
    ellipseMode(CENTER);
    if (yc > this.y + this.tHeight){
      yc = this.y + this.tHeight;
    }
    for (float i = 1; i <= max; i = i+1){
      float xc = ( this.x + (l_width)/2 + ((max - (i))*l_width/2 ));
      for (float j = 1; j <= i; j = j + 1){
        fill(colors[k % (colors.length)]);
        ellipse(xc, yc, l_width, l_height);
        xc = xc + l_width;
        k += 1;
      }
      yc = yc + l_width;
      if (yc > this.y + this.tHeight){
        yc = this.y + this.tHeight;
      }
    }
    yc = yc - l_height/2;
    for (float i = max; i >= 3; i = i-1){
      float xc = ( this.x + (l_width)/2 + ((max - (i))*l_width/2 ));
      for (float j = 1; j <= i; j = j + 1){
        fill(colors[k % (colors.length)]);
        ellipse(xc, yc, l_width, l_height);
        xc = xc + l_width;
        k += 1;
      }
      yc = yc + l_width;
      if (yc > this.y + this.tHeight){
        yc = this.y + this.tHeight;
      }
    }      
  }
  
  void fall(float speed){
    // udpate position of x
    leaves_y += speed;
    if (leaves_y > y + 1.2 * tHeight){
      leaves_y = y;
      }
  }
}
