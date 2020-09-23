PFont font;
int j = 32;
int i = 0;
int line_length = 0;
int position = 0;
String [] random_list;

void setup() {
  size (700, 600);
  font = createFont("Luminari", 32);
  textFont(font);
  background(164, 212, 229);

  //read words from the txt file
  String[] all_words = loadStrings("uniquewords.txt");

  //find the length of the list and use the number to generate list random words
  int number = all_words.length;
  random_list = new String [number];
  for (int x = 0; x < number; x++) {
    String word = all_words[int(random(number))];
    random_list[x] = word;
  }
}

  void draw() {
    
    // most verbs are red, adjectives are green, and adverbs are yellow, other words are kept white
    String word = random_list[position];
    if (word.endsWith("ing") || word.endsWith("ed") || word.endsWith("en") || word.endsWith("ize")) {
      fill(201, 18, 30);
    } else if (word.endsWith("less") || word.endsWith("ful") || word.endsWith("ary") || word.endsWith("ive") || word.endsWith("ic")) {
      fill(13, 160, 114);
    } else if (word.endsWith("ly") || word.endsWith("ward") || word.endsWith("wise") ) {
      fill(240, 214, 119);
    } else {
      fill(255);
    }

  text(word, i, j);
  
  //check the to make sure the words are printed within the canvas area
  line_length += (textWidth(word) + 10);
  if ((line_length + textWidth(random_list[position+1]) + 10) < 700) {
    i = line_length;
  } else if ((line_length + textWidth(random_list[position+1]) + 10) >= 700) {
    line_length = 0;
    i = 0;
    if ((j + 32) < 600) {
      j += 32;
    } else {
      noLoop();
    }
  }

  position++;
}
