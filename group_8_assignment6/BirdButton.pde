class BirdButton extends Button {
 float x, y;
 float vx, vy;
 float ax, ay;
 float r;
 float m;
 float sx;
 float sy;
 float slen;

 BirdButton(float _x, float _y, float _r, float _m) {
 x = _x;
 y = _y;
 r = _r;
 m = _m;
 }
 
 //Let bird follow gravity, and bounce after hitting ground. But it won't bounce 
 //back if fly out of the canvas from other direction as real game does.
 void applyForces(float fx, float fy)
{

ax = fx;
ay = fy;
vx *= ax;

vy += ay;
x += vx;
y += vy;
if (y > (height - r)) {
 vy = -vy*0.7;
 vx = vx*0.7;
 y = height -r;
 }

}
 void display() {
 ellipse(x, y, r, r);
 }
 //check whetehr mouse is over the bird.
 void over(boolean isMouseOver){
   this.isMouseOver = isMouseOver;}
 //update the position of the bird  
 void update(float mx, float my){
 x = mx;
 y = my;
 }
 //set up inital velocity of bird
 void init_vel(float mx, float my, float sx, float sy,float slen){
 vx = 40/slen*(sx-mx)/m;
 vy = 40/slen*(sy-my)/m;
 }}
