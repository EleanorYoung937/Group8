class Invader{
 float x;
 float y;
 float wid;
 float hig;
 int resistance;
 float velocity;
 
 float acceleration = 1/10;
 boolean landed = false;
 boolean killed = false;
 boolean wiped = false;
 
 //vectors of additional x and y movements and chose from them at random
 int[] move = {100,-100,50,20,-20,20,-40,40,17,-17,-6,-20,8,9,9,30,-30,-7,7,4,-7,6,8,30,-17,
 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

 Invader(float _x, float _y, float w, float h, int r, float v){
   x = _x;
   y = _y;
   wid = w;
   hig = h;
   resistance = r;
   velocity = v;
 }
 
 void display() {
   
   //landed invaders are safe from bullets
   if (y + hig/2 >= height && killed == false && wiped == false){
     landed = true;
     velocity = 0;
     acceleration = 0;
   }
   
   //alive invaders are displayed
   if (killed == false && wiped == false){
     
     //invaders in the air speed up due to gravity
     if (landed == false){
       velocity += acceleration;
       y += velocity;
       int i = int(random(move.length));
       int j = int(random(move.length));
       x = constrain ( x + move[i], 0, width);
       //y = constrain ( y + move[j], 0, height);
     }
     
    stroke(0);
    fill(0);
    rect(x - wid/2, y,wid,hig/2); //body
    
    fill(57,255,20);
    ellipse(x,y,wid,hig);  //Head
    
    
    fill(0);
    line(x - wid/3,y - hig/7,x - wid/9,y + hig/14);    //Right Eye
    bezier(x - wid/3,y - hig/7,  x - wid/3 - wid/9,y + hig/14,  x - wid/9,y + hig/14,  x - wid/9,y + hig/14); 
    line(x + wid/3,y - hig/7,x + wid/9,y + hig/14);   //Left Eye
    bezier(x + wid/3,y - hig/7,    x + wid/3 + wid/9,y + hig/14,  x + wid/9,y + hig/14,  x + wid/9,y + hig/14); 
    line(x - wid/18, y + hig/4, x + wid/18, y + hig/4);
   }
 }

  void shotornot(float bx, float by, float br) {
    // adapted from https://happycoding.io/tutorials/processing/collision-detection
    if( (bx > x - wid/2 && bx < x + wid/2 ) && (by > y - hig/2 && by < y + hig/2) && landed == false && wiped == false){
      //the point is inside the rectangle
      killed = true;
      velocity = 0;
      acceleration = 0;
    }
  }
  
    void shotornot2(float bx, float by, float br) {
    // adapted from https://happycoding.io/tutorials/processing/collision-detection
    bx += 25;
    if( (bx > x - wid/2 && bx < x + wid/2 ) && (by > y - hig/2 && by < y + hig/2) && landed == false && wiped == false){
      //the point is inside the rectangle
      killed = true;
      velocity = 0;
      acceleration = 0;
    }
    bx -= 50;
    if( (bx > x - wid/2 && bx < x + wid/2 ) && (by > y - hig/2 && by < y + hig/2) && landed == false && wiped == false){
      //the point is inside the rectangle
      killed = true;
      velocity = 0;
      acceleration = 0;
    }
  }
}
