Aircraft A1;
display_life dl;
Lives[] player_lives = new Lives[3] ;
Invader[] invaders = new Invader[10];
ArrayList<Bullet> shoot;

int shotCount = 0;
int landCount = 3;
boolean [] life = {true, true, true};

float v = 2;
float num = 1;
float time =0;
int idx = -1;
int delay = 5000;
int nextTimer;

void setup() {

  size(1000, 1000);
  frameRate(60);
  A1 = new Aircraft(500, 500);
  dl = new display_life(850, 50, 100);
  shoot = new ArrayList<Bullet>();

  for (int i = 0; i < invaders.length; i++) {
    //Invader(float _x, float _y, float w, float h, int r, float v)
    float w = random(40, 100);
    float h = random(w - 30, w + 50);
    float x = random(w, width - w);
    int r = int(random(1, 3));
    float v = random(1/10, 1.5);
    invaders[i] = new Invader(x, - h/2, w, h, r, v);
    //println(x, - h/2, w, h, r, v);
  }

  for (int j = 0; j < player_lives.length; j++) {
    int x = 875 + j * 25;
    player_lives[j] = new Lives(x, 90, 10);
  }
}

void draw() {

  background(255);

  if (millis() > nextTimer) {
    nextTimer = millis() + delay;
    idx ++;
    //println(idx);
  }

  //invaders[0].display();
  for (int i = 0; i <= constrain(idx, 0, invaders.length - 1); i++) {
    invaders[i].display();
    //println(invaders[i].x);
  }

  keyPressed();
  keyReleased();

  dl.display();
  dl.progress(shotCount);

  //for (Lives l : player_lives){
  //  l.display();

  //}

  for  (int x = 0; x < player_lives.length; x ++) {
    boolean current = life[x];
    player_lives[x].display(current);
  }

  A1.display();
  for (int i=0; i<shoot.size(); i++) {
    Bullet bi = shoot.get(i);
    bi.display();
  }

  shotCount = 0;
  landCount = 3;
  for (int i = 0; i <= constrain(idx, 0, invaders.length - 1); i++) {
    for (Bullet b : shoot) {
      invaders[i].shotornot(b.x, b.y, b.r);
    }
   if (invaders[i].killed == true) {
      shotCount += 1;
    } 
    if (invaders[i].landed == true) {
      landCount -= 1;
      life[landCount] = false;
    }
  }
}

  void keyPressed() {

    if (keyPressed & keyCode == LEFT) {
      A1.move(-v, 0);
    }
    if (keyPressed &keyCode == RIGHT) {
      A1.move(v, 0);
    }
    if (keyPressed &keyCode == UP) {
      A1.move(0, -v);
    }
    if (keyPressed &keyCode == DOWN) {
      A1.move(0, v);
    }
    if (keyPressed & (key == 'z' || key == 'Z')&millis()-time >100) {

      Bullet b = new Bullet(10, A1.x, A1.y);
      shoot.add(b);
      time = millis();
    }
  }

  void keyReleased() {
    A1.move(0, 0);
  }
