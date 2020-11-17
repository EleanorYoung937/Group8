class Lives {
  int x, y;
  int r;
  color alive = color(255, 99, 71);
  color dead = color(0);
  boolean survived = true;

  Lives(int _x, int _y, int _r) {
    x = _x;
    y = _y;
    r = _r;
  }

  void display() {
    noStroke();
    fill(alive);
    ellipse(x, y, r, r);
    if (survived == false) {
      fill(dead);
      ellipse(x, y, r, r);
    }
  }
}
