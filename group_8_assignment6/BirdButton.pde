class BirdButton extends Button {
 float x, y;
 float vx, vy;
 float ax, ay;
 float r;
 float m;
 float sx;
 float sy;
 float slen;
 float elastic_potential;
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
if (y > (height - r/2)) {
 vy = -vy*0.7;
 vx = vx*0.7;
 y = height -r/2;
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
 //set up inital velocity of bird based on the position of bird, length and elastic 
 //potential of the slingshot
 void init_vel(float mx, float my, float sx, float sy,float slen,float elastic_potential){
 vx = elastic_potential/slen*(sx-mx)/m;
 vy = elastic_potential/slen*(sy-my)/m;
 }}
