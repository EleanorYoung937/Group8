class BirdButton extends Button {
 float x, y;
 float vx, vy;
 float ax, ay;
 float r;
 float m;
 float sx;
 float sy;
 float slen;
 //boolean isMouseOver;
 BirdButton(float _x, float _y, float _r, float _m) {
 x = _x;
 y = _y;
 r = _r;
 m = _m;
 }
 void applyForces(float fx, float fy)
{
ax = fx;
ay = fy/m;
vx *= ax;
vy += ay;
x += vx;
y += vy;
}
 void display() {
 ellipse(x, y, r, r);
 if (y > (height - r)) {
 vy = -vy/2;
 vx = vx/2;
 }
 }
 void over(boolean isMouseOver){
   this.isMouseOver = isMouseOver;}
   
 void update(float mx, float my){
 x = mx;
 y = my;
 }
 void init_vel(float mx, float my, float sx, float sy,float slen){
 vx = 10/slen*(sx-mx);
 vy = 10/slen*(sy-my);

 }}
