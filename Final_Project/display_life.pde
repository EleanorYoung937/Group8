class display_life {
  float x, y, r;
  int remaining = 3;
  int killed = 0;

  display_life(float _x, float _y, float _r) {
    x = _x;
    y = _y; 
    r = _r;
  }

  void display() {
    fill(0);
    rect(x, y, r, r/2);
    fill(255);
    text("lives remaining", 855, 70);
  }

  void progress(int killed) {
    fill(0);
    rect(50, 50, 100, 50);
    
    fill(255);
    text("score", 85, 70);
    textSize(17);
    fill(255,99,71);
    text(killed, 92,90);
  }
  
  void power(int coins) {
    fill(0);
    rect(100, 950, 800, 20);
    
    fill(255,50,50);
    int x = 20 * coins;
    if (x <= 800){
      rect(100, 950, x, 20);
    }
  }
}
