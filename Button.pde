class Button{
  boolean pressed = false;
  boolean isMouseOver;
  boolean isMousePressed;
  
   
  Button(){
    isMouseOver = false;
    isMousePressed = false;}
     
  boolean isPressed() {
    if (isMouseOver) {
    isMousePressed = true;
    return true;
   }
   else{return false;}}
  
 // boolean isReleased(){
 //   isMousePressed = false;
 //   return false;
 // }

  void display(){
  
    
  }
  void over(boolean isMouseOver){
   this.isMouseOver = isMouseOver;}
}
