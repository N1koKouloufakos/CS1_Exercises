void setup() {
  size(600,400);
  background(0,150,100);
  fill(255,255,0);
}

void draw() {
  ellipse(random(width), random(height), 15,15);
}