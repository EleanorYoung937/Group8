class Button {
  boolean buttonHover = false;
  int x;
  int y;
  int r;

  Button(int _x, int _y, int _r, boolean buttonHover) {
    this.x = _x;
    this.y = _y;
    this.r = _r;
    this.buttonHover = buttonHover;
  }

  void display() {
    noStroke();
    if (this.buttonHover) {
      fill(100);
    } else {
      fill(200);
    }
    ellipseMode(CENTER);
    ellipse(this.x, this.y, this.r, this.r);
  }

  void check() {
    if (Buttoncheck(this.x, this.y, this.r)) {
      buttonHover = true;
    } else {
      buttonHover = false;
    }
  }

  boolean Buttoncheck(float x, float y, float r) {
    float x_dist = x - mouseX;
    float y_dist = y - mouseY;
    if (sqrt(sq(x_dist) + sq(y_dist)) <= r/2) {
      return true;
    } else {
      return false;
    }
  }
}
