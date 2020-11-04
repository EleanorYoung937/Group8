class Environment extends Box{
  Box[] group;
  int id;
  
    
  Environment(int _x, int _y, int _w, int _h, Environment[] r, int _id){
    super(_x, _y, _w, _h);
    group = r;
    id = _id;
  }
  
  void collision(BirdButton b){
   for (int i = 0; i < group.length; i++){
     if(i != id){
       // adapted from https://happycoding.io/tutorials/processing/collision-detection
       if (group[i].x + group[i].w/2 > group[id].x && group[i].x < group[id].x + group[id].w/2 && group[i].y + group[i].h/2 > group[id].y && group[i].y < group[id].y + group[id].h/2){
         //group[i].collide(group[id].mass);
         //group[id].collide(group[i].mass);
         if(group[i].x_velocity != 0){
           int v1 = group[i].x_velocity;
           int v2 = group[id].x_velocity;
           int m1 = group[i].mass;
           int m2 = group[id].mass;
           int v1_prime = v1 * (m1 - m2) / (m1 + m2);
           int v2_prime = (v1 + v2) - v1_prime;
           group[i].x_velocity = v1_prime;
           group[id].x_velocity = v2_prime;           
         }
         else{
           int v1 = group[id].x_velocity;
           int v2 = group[i].x_velocity;
           int m1 = group[id].mass;
           int m2 = group[i].mass;
           int v1_prime = v1 * (m1 - m2) / (m1 + m2);
           int v2_prime = (v1 + v2) - v1_prime;
           group[id].x_velocity = v1_prime;
           group[i].x_velocity = v2_prime;           
         }         
       }
       if (b.x + b.r > group[id].x && b.x < group[id].x + group[id].w/2 && b.y + b.r > group[id].y && b.y < group[id].y + group[id].h/2){
         int v1 = int(b.vx);
         int v2 = group[id].x_velocity;
         int m1 = int(b.m);
         int m2 = group[id].mass;
         int v1_prime = v1 * (m1 - m2) / (m1 + m2);
         int v2_prime = (v1 + v2) - v1_prime;
         b.vx = v1_prime;
         group[id].x_velocity = v2_prime;          
         //b.collide(group[id].mass);
       }
     }
   }
 }
}
