class Comet{
   float x; float y; float z; float size; float pos_z =0; 
   float pos_x ; float aphelion; float perihelion; float theta = 0; float angle;
   
   Comet(float x,float y,float z, float size, float aphelion, float perihelion){
   this.x = x;
   this.y = y;
   this.z = z;
   this.size = size;
   this.aphelion = aphelion;
   this.perihelion = perihelion;
   pos_x = aphelion;
 }
   //display a comet defaultly at aphelion, it self is blue color and its friction 
   //with air will output red light 
   void display(){
     pushMatrix();
     translate(x,y,z);
     translate(pos_x,0,pos_z);
     fill(255);
     specular(255,128,0);
     lightSpecular(255,255,255);
     shininess(0.5);
     //this point light chaning with angle imitates light caused by friction
     pointLight(255,128,0,size*10*cos(theta),0,size*10*sin(theta));     
     sphere(size);
     popMatrix();
   }
   //let comet orbit with respect to given aphelion and perihelion
    void orbit(){
      pos_x = aphelion*cos(theta);
      pos_z = perihelion*sin(theta);
      theta += 0.01;}
     
}
