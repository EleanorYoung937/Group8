class Aircraft {
  float x; 
  float y; 
  float vx; 
  float vy; 
  float r = 10;
  Aircraft(float _x, float _y) {
    x = _x;
    y = _y;
  }

  //Let bird follow gravity, and bounce after hitting ground. But it won't bounce 
  //back if fly out of the canvas from other direction as real game does.
  void move(float vx, float vy) {
    x += vx;
    y += vy;
    if (y > (height - r)) {
      y = height -r;
    }
    if (y < r) {
      y = r;
    }
    if (x > (width - r)) {
      x = width -r;
    }
    if (x < r) {
      x = r;
    }
  }

  void display() {
    fill(color(255, 0, 0));
    ellipse(x, y, r, r);
    pushMatrix();
    translate(x, y);
    triangle(0, -30, -10, -10, 10, -10); 

    popMatrix();
    fill(255);
  }
}
