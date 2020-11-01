class Environment extends Box{
  Box[] group;
  int id;
  
    
  Environment(int _x, int _y, int _w, int _h, Environment[] r, int _id){
    super(_x, _y, _w, _h);
    group = r;
    id = _id;
  }
  
  void collision(Ball b){
   for (int i = 0; i < group.length; i++){
     if(i != id){
       // adapted from https://happycoding.io/tutorials/processing/collision-detection
       if (group[i].x + group[i].w/2 > group[id].x && group[i].x < group[id].x + group[id].w/2 && group[i].y + group[i].h/2 > group[id].y && group[i].y < group[id].y + group[id].h/2){
         group[i].collide(group[id].mass);
         group[id].collide(group[i].mass);
       }
       if (b.x + b.w2/2 > group[id].x && b.x < group[id].x + group[id].w/2 && b.y + b.h2/2 > group[id].y && b.y < group[id].y + group[id].h/2){
         group[id].collide(b.mass);
         //b.collide(group[id].mass);
       }
     }
   }
 }
}
