
void setup(){
  size(1266,930);
}

void draw(){
  String[] lines = loadStrings("wordfrequency.txt");
  int num_lines = lines.length;
  for (int i =0;i<num_lines;i++){
      String[] tuple = split(lines[i], ':');
      float wid = float(tuple[0]);
      stroke(0);
      rectMode(CENTER);
      rect(2531/4,3*(2*i+1),wid/4,6);
      }
  noLoop();
}
            
