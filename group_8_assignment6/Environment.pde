class Environment extends Box{
  Box[] group;
  int id;
  
    
  Environment(float _x, float _y, float _w, float _h, Environment[] r, int _id){
    super(_x, _y, _w, _h);
    group = r;
    id = _id;
  }
  
  void collision(BirdButton b){
   for (int i = 0; i < group.length; i++){
     if(i != id){
       // adapted from https://happycoding.io/tutorials/processing/collision-detection
       if (group[i].x + group[i].w > group[id].x && group[i].x < group[id].x + group[id].w && group[i].y + group[i].h > group[id].y && group[i].y < group[id].y + group[id].h){
         //group[i].collide(group[id].mass);
         //group[id].collide(group[i].mass);
         if(group[i].x_velocity != 0){
           float v1 = group[i].x_velocity;
           float v2 = group[id].x_velocity;
           float m1 = group[i].mass;
           float m2 = group[id].mass;
           float v1_prime = v1 * (m1 - m2) / (m1 + m2);
           float v2_prime = (v1 + v2) - v1_prime;
           group[i].x_velocity = v1_prime;
           group[id].x_velocity = v2_prime;           
         }
         else{
           float v1 = group[id].x_velocity;
           float v2 = group[i].x_velocity;
           float m1 = group[id].mass;
           float m2 = group[i].mass;
           float v1_prime = v1 * (m1 - m2) / (m1 + m2);
           float v2_prime = (v1 + v2) - v1_prime;
           group[id].x_velocity = v1_prime;
           group[i].x_velocity = v2_prime;           
         }         
       }
       if (b.x + b.r/2 > group[id].x && b.x < group[id].x + group[id].w && b.y + b.r/2 > group[id].y && b.y < group[id].y + group[id].h){
         float v1 = b.vx;
         float v2 = group[id].x_velocity;
         float m1 = b.m;
         float m2 = group[id].mass;
         float v1_prime = v1 * (m1 - m2) / (m1 + m2);
         float v2_prime = (v1 + v2) - v1_prime;
         b.vx = v1_prime;
         group[id].x_velocity = v2_prime;          
         //b.collide(group[id].mass);
       }
     }
   }
 }
}
