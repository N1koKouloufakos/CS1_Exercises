int n = 20;

int size = 30;
int [] x = new int[n];
int [] y = new int[n];
color [] primary = new color[n];
color [] secondary = new color[n];


void setup() {
  size(500, 500);
  colorMode(HSB);
  for (int i = 0; i < n; i++) {
    x[i] = int(random(0, width-size));
    y[i] = int(random(0, height-size));
    int c = 123;
    int b = int(random(0,255));
    //Makes the alternate colour distinct enough from the original
    //And ensures the alternate is a unique alternate.
    while (abs(c-b) < 30 && !(contains(b, secondary))) {
      b = int(random(0,255));
    }
    println(b);
    primary[i] = color(c, 200,200);
    secondary[i] = color(b, 200,200);
  }
}

void draw() {
  for (int i = 0; i < n; i++) {
    if (mouseX > x[i] && mouseX < x[i]+size &&
      mouseY > y[i] && mouseY < y[i]+size) {
      fill(secondary[i]);
    } else {
      fill(primary[i]);
    }
    rect(x[i], y[i], size, size);
  }
}

//Taken from https://forum.processing.org/two/discussion/7696/unique-random-number-for-elements-in-array
boolean contains(color c, color[] colors) {
  for (color i : colors)  if (i == c)  return true;
  return false;
}