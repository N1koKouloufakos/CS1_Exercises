//Change this number to change the number of bars on screen
int num_bars = 50;

void setup() {
  size(500,500);
}

void draw() {
  divideScreen(num_bars);
}

void divideScreen(int n) {
  int i = 0;
  float rect_width = 1.0*width/n;
  color c;
  while (i < n) {
    c = (i % 2 == 0) ? color(0) : color(255);
    fill(c);
    rect(i*rect_width, 0, rect_width, height);
    i ++;
  }
}