void setup(){
  size(1550,500);
}

//Use color to represent number of words with certain freq, the lighter the larger
//Use order to represent increasing frequency from left to right
void draw(){
  String[] lines = loadStrings("wordfrequency.txt");
  int num_lines = lines.length;
  for (int i =0;i<num_lines;i++){
      String[] tuple = split(lines[i], ':');
      float ht = float(tuple[0]);
      ht = constrain(ht,0,255);
      color c = color(ht,0,0);
      stroke(0);
      strokeWeight(1);
      fill(c);
      rectMode(CORNER);
      rect(10*i,0,10,500);
      }
  noLoop();
}
