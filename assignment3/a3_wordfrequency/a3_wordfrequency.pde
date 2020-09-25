PFont font;

void setup(){
  //size(1266,930);
  size(1266,500);
  font = createFont("Luminari", 12);
  textFont(font);
}

void draw(){
  String[] lines = loadStrings("../wordfrequency.txt");
  int num_lines = lines.length;
  for (int i =0;i<num_lines;i++){
      String[] tuple = split(lines[i], ':');
      float wid = float(tuple[0]);
      stroke(0);
      rectMode(CENTER);
      //rect(2531/4,3*(2*i+1),wid/4,6);
      rect(2531/4,10 + 1.5*(2*i+1),wid/4,3);
      }
  strokeWeight(3);
  line(20, 480, 1246, 480);
  line(20, 480, 20, 20);
  fill(0);
  text("Relative Frequency of Words", 25, 250);
  textAlign(CENTER);
  text("Number of Words", 1266/2, 495);
  noLoop();
}
            
