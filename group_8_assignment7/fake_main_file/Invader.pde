class Invader{
 float x;
 float y;
 float wid;
 float hig;
 int resistance;
 float velocity;
 
 float acceleration = 5;
 boolean landed = false;
 boolean killed = false;
 
 //vectors of additional x and y movements and chose from them at random
 int[] move = {0,0,0,0,0,20,-2,4,17,-60,-20,8,9,9,0,0,3,7,7,42, -75,66,88,32,67,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

 
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
   if (y + hig/2 == height && killed == false){
     landed = true;
   }
   
   //alive invaders are displayed
   if (killed == false){
     
     //invaders in the air speed up due to gravity
     if (landed == false){
       velocity += acceleration;
       x += velocity;
       int i = int(random(move.length));
       int j = int(random(move.length));
       x = constrain ( x + move[i], 0, width);
       y = constrain ( y + move[j], 0, height);
     }
     
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

  void shotornot(int bx, int by, int br){
    
    // adapted from https://happycoding.io/tutorials/processing/collision-detection
    if(bx > x && bx < x + wid && by > y && by < y + hig){
      //the point is inside the rectangle
      killed = true;
    }
  }
  
}
