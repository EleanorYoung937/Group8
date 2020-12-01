import processing.sound.*;
//importing music into the game reference
//https://processing.org/reference/libraries/sound/SoundFile.html
SoundFile file;

boolean playing;
PImage description;
boolean display = false;


Table table;
Table table2;
int player_id;

Aircraft A1;
display_life dl;
Lives[] player_lives;
Invader[] invaders;
ArrayList<Bullet> shoot;
ArrayList<Bullet> shoot2;
ArrayList<Bullet> shoot3;
ArrayList<Bullet> shoot4;
//ArrayList<ArrayList<Bullet>> enemy_bullets;
ArrayList<Bullet>[] enemy_bullets;
ArrayList<Bullet>[] enemy_bullets_copy;
ArrayList<Coin> money;

Bullet boom;
//Bullet test;
boolean boomUsed;
boolean boomEnded;
boolean paused = false;
boolean gameOver= false;
int shotCount = 0;
int[] killList;
int landCount = 3;
int coinsCollected = 0;
boolean [] life = {true, true, true};

float v ;
float num ;
float time ;
float time2;
//float time3;
int rate;
int idx ;
int delay;
int nextTimer;

Menu play;
Menu quit;
Menu rules;
Menu high_score;

void setup() {
  file = new SoundFile(this, "game.mp3");
  //file.loop();
  file.play();

  playing = false;
  description = loadImage("rules.png");

  play = new Menu(300, 200, 400, 100, false, "PLAY");
  rules = new Menu(300, 400, 400, 100, false, "RULES");
  high_score = new Menu(300, 600, 400, 100, false, "HIGH SCORE");
  quit = new Menu(300, 800, 400, 100, false, "QUIT");

  table = new Table();
  table.addColumn("PLAYER");
  table.addColumn("SCORE");
  
  //table2 = loadTable("score.CSV", "header");
  
  rate = 60;
  size(1000, 1000);
  frameRate(rate);
  boomUsed = false;
  boomEnded = false;
  v = 2;
  num = 1;
  time =0;
  time2 = 0;
  //time3 = 0;
  idx = -1;
  delay = 2500;
  player_lives = new Lives[3] ;
  invaders = new Invader[30];
  A1 = new Aircraft(500, 500);
  dl = new display_life(850, 50, 100);
  //4 kinds of shooting methods and 1 boom. 
  shoot = new ArrayList<Bullet>();
  shoot2 = new ArrayList<Bullet>();
  shoot3 = new ArrayList<Bullet>();
  shoot4 = new ArrayList<Bullet>();
  money = new ArrayList<Coin>();
  //enemy_bullets = new ArrayList<ArrayList<Bullet>>();
  enemy_bullets = new ArrayList[30];
  enemy_bullets_copy = new ArrayList[30];
  boom = new Bullet(10, A1.x, A1.y, 0, -5);


  //test = new Bullet(10,500,900,0,-5);

  //create invaders
  for (int i = 0; i < invaders.length; i++) {
    //Invader(float _x, float _y, float w, float h, int r, float v)
    float w = random(20, 100);
    float h = random(w - 10, w + 40);
    float x = random(w, width - w);
    int r = int(random(1, 3));
    float v = random(1/10, 2);
    invaders[i] = new Invader(x, - h/2, w, h, r, v);
    //create an array to store an array of bullets for each invader
    ArrayList<Bullet> e = new ArrayList<Bullet>();
    enemy_bullets[i]= e;
    ArrayList<Bullet> f = new ArrayList<Bullet>();
    enemy_bullets_copy[i]= f;
  }

  for (int j = 0; j < player_lives.length; j++) {
    int x = 875 + j * 25;
    player_lives[j] = new Lives(x, 90, 10);
  }
}

void draw() {
  background(0);
  textAlign(CENTER, CENTER);
  textSize(30);
  text("AIRPLANE INVADERS", 500, 100);

  play.check();
  play.display();

  rules.check();
  rules.display();

  high_score.check();
  high_score.display();

  quit.check();
  quit.display();

  if (display == true) {
    description.resize(1000, 1000);
    image(description, 0, 0);
  }


  if (playing == false) {
  } else {


    background(255);
    textAlign(CENTER);
    fill(0);
    textSize(20);
    int s = rate/60;
    text("Speed:"+s+'x', 900, 130);
    textAlign(LEFT);
    textSize(12);
    fill(255);
    if (millis() > nextTimer) {
      nextTimer = millis() + delay;
      idx ++;
      //println(idx);
    }

    //display invaders
    for (int i = 0; i <= constrain(idx, 0, invaders.length - 1); i++) {
      invaders[i].display();
      //println(invaders[i].x);
    }

    keyPressed();
    keyReleased();

    //display aircraft
    A1.display();

    //display bullets in each array and remove once out of bounds
    for (int i=0; i<shoot.size(); i++) {
      Bullet bi = shoot.get(i);
      bi.display();
      if (bi.y< -20) {
        shoot.remove(bi);
      }
    }
    for (int i=0; i<shoot2.size(); i++) {
      Bullet bi = shoot2.get(i);
      bi.display2();
      if (bi.y< -20) {
        shoot2.remove(bi);
      }
    }
    for (int i=0; i<shoot3.size(); i++) {
      Bullet bi = shoot3.get(i);
      bi.display3();
      if (bi.y< -20) {
        shoot3.remove(bi);
      }
    }
    for (int i=0; i<shoot4.size(); i++) {
      Bullet bi = shoot4.get(i);
      bi.display4();
      if (bi.y< -20) {
        shoot4.remove(bi);
      }
    }

    //one time use of a bomb to clear invaders
    if (boomUsed == true &boomEnded ==false) {
      boomEnded = boom.boom(boomEnded);
      for (int i = 0; i <= constrain(idx, 0, invaders.length - 1); i++) {
        if (invaders[i].landed == false && invaders[i].killed == false) {
          invaders[i].wiped = true;
        }
      }
    }

    //remove bullets out of frame
    for (int i=0; i<enemy_bullets.length; i++) {
      ArrayList<Bullet> e = enemy_bullets[i];
      ArrayList<Bullet> f = enemy_bullets_copy[i];
      int j =0;
      for (Bullet b : e) {
        if (!(b.y< -20||b.y>height+20||b.x<-20||b.x>width+20)) {
          f.set(j, b);
          j ++;
        }
      }
    }
    enemy_bullets = enemy_bullets_copy;

    //display enemy bullets and determine if plane has been shot
    for (int i=0; i<enemy_bullets.length; i++) {
      ArrayList<Bullet> e = enemy_bullets[i];
      //int position = 0;
      //innerate through bullets
      for (Bullet b : e) {
        //Bullet b = e.get(i);
        b.invader();
        A1.shotornot(b.x, b.y, b.r);
        //if (b.y< -20||b.y>height+20||b.x<-20||b.x>width+20){
        //  enemy_bullets_copy[i].remove(position);
        //  position = position - 1;
        //}
        //position ++;
      }
    }

    shotCount = 0;
    landCount = 3;

    //display different kinds of bullets and determine if invader has been shot
    for (int i = 0; i <= constrain(idx, 0, invaders.length - 1); i++) {
      for (Bullet b : shoot) {
        invaders[i].shotornot(b.x, b.y, b.r);
      }
      for (Bullet b : shoot2) {
        invaders[i].shotornot2(b.x, b.y, b.r);
      }
      for (Bullet b : shoot3) {
        invaders[i].shotornot(b.x, b.y, b.r);
      }
      for (Bullet b : shoot4) {
        invaders[i].shotornot(b.x, b.y, b.r);
      }
      if (invaders[i].killed == true) {
        shotCount += 1;
        if (invaders[i].coins == false) {
          invaders[i].coins = true;
          int num = int(random(1, 5));
          for (int z = 0; z < num; z++) {
            Coin c = new Coin(invaders[i].x, invaders[i].y, invaders[i].wid, invaders[i].hig);
            money.add(c);
          }
        }
      } 
      if (invaders[i].landed == true) {
        landCount -= 1;
        life[landCount] = false;
      }
      if (millis()-invaders[i].time % 1500 == 0) {
        Bullet b2 = new Bullet(10, invaders[i].x, invaders[i].y, -3, 3);
        enemy_bullets[i].add(b2);
      }
      if (millis()-invaders[i].time > 3000) {     
        Bullet b1 = new Bullet(10, invaders[i].x, invaders[i].y, -3, -3);
        enemy_bullets[i].add(b1);
        invaders[i].time =millis();
      }
    }

    //display coins and check for collection
    coinsCollected = 0;
    for (Coin c : money) {
      if (c.collected == false) {
        c.display();
        c.collected(A1.x, A1.y);
      } else {
        coinsCollected++;
      }
    }

    //Aircraft being shot
    //test.display();
    //A1.shotornot(test.x, test.y, test.r);
    if (A1.killed==true) {
      if (millis()-A1.time > 1000) {
        A1.killed = false;
        landCount -=1;
        life[landCount] = false;
      }
    }
    //println(A1.killed);
    //
    dl.display();
    dl.progress(shotCount);
    dl.power(coinsCollected);

    for  (int x = 0; x < player_lives.length; x ++) {
      boolean current = life[x];
      player_lives[x].display(current);
    }

    //pause condition and instructions on screen.
    if (paused ==true) {
      textAlign(CENTER);
      fill(0);
      textSize(30);
      text("Press r to resume", 500, 500);
      text("Press q to quit", 500, 600);
      fill(255);
      noLoop();
    }
    //check game over condition and set up again
    if (landCount ==0) {  
      gameOver = true;
      textAlign(CENTER);
      fill(0);
      textSize(30);
      fill(255, 50, 50);
      text("GAME OVER", 500, 200);
      fill(0);
      text("Press r to return to main menu", 500, 500);
      text("Press q to quit", 500, 600);
      fill(255);
      TableRow newRow = table.addRow();
      player_id += 1;
      newRow.setInt("PLAYER", player_id);
      newRow.setInt("SCORE", shotCount);
      //saveTable(table, "score/score.CSV");
      setup();
      file.stop();
      noLoop();
    }

    //check wining condition and set up again
    if (shotCount == 10) {  
      gameOver = true;
      textAlign(CENTER);
      fill(0);
      textSize(30);
      fill(255, 50, 50);
      text("YOU WIN!", 500, 400);
      fill(0);
      text("Press r to return to main menu", 500, 500);
      text("Press q to quit", 500, 600);
      fill(255);
      TableRow newRow = table.addRow();
      player_id += 1;
      newRow.setInt("PLAYER", player_id);
      newRow.setInt("SCORE", shotCount);
      //saveTable(table, "score/score.CSV");
      setup();
      file.stop();
      noLoop();
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
  //press z to fire with mode 1
  if (keyPressed & (key == 'z' || key == 'Z')&millis()-time >50) {

    Bullet b = new Bullet(10, A1.x, A1.y, 0, -5);
    shoot.add(b);
    time = millis();
  }
  //press x to fire with mode 2
  if (keyPressed & (key == 'x' || key == 'X')&millis()-time2 >100) {
    Bullet b = new Bullet(10, A1.x, A1.y, 0, -5);
    shoot2.add(b);
    time2 = millis();
  }
  //press c to fire with mode 3
  if (keyPressed & (key == 'c' || key == 'C')&millis()-time >50) {

    Bullet b = new Bullet(10, A1.x, A1.y, 0, -5);
    shoot3.add(b);
    time = millis();
  }
  //press v to fire with mode 4
  if (keyPressed & (key == 'v' || key == 'V')&millis()-time2 >100) {
    Bullet b = new Bullet(10, A1.x, A1.y, 0, -5);
    shoot4.add(b);
    time2 = millis();
  }
  //press b to cast boom
  if (key == 'b' || key == 'B') {
    boomUsed = true;
  }

  if (key == 'p'|| key == 'P') {
    paused = true;
  }
  if (key == 't'|| key == 'T') {
    saveFrame();
  }
  if (key == 'r'|| key == 'R') {
    paused = false;
    gameOver = false;
    life[0] = true;
    life[1] = true;
    life[2] = true;
    loop();
  }
  if (paused == true &(key == 'q'|| key == 'Q')) {
    exit();
  }
  if (gameOver == true &(key == 'q'|| key == 'Q')) {
    exit();
  }
  if (keyPressed &(key == 's'|| key == 'S')) {
    rate = (rate+60) %240;
    if (rate==0) {
      rate = 60;
    }
    frameRate(rate);
  }
}

void keyReleased() {
  A1.move(0, 0);
}

void mousePressed() {
  if (play.boxHover) {
    playing = true;
  }
  if (rules.boxHover) {

    display = true;
  }
  if (display == true && mouseX >= 10 && mouseX <= 40
    && mouseY >= 25 && mouseY <= 65 ) {
    display = false;
  }
  if (high_score.boxHover){
  }
  if (quit.boxHover) {
    exit();
  }
}
