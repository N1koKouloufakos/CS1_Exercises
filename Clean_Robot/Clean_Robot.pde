int speed = 1;
final int angle_to_turn = 30;
Robot bot1;

void setup() {
  size(500, 500);
  bot1 = new Robot(0, 20, speed, 1);
}

void draw() {
  noStroke();
  background(0);
  
  bot1.wanderToward(mouseX, mouseY);
  
  fill(0,255,0);
  bot1.drawBot();
}

void mousePressed() {
  if (dist(mouseX, mouseY, bot1.pos.x, bot1.pos.y) < bot1.radius) {
    bot1.state -= (bot1.state > 1) ? 1 : 0; 
  }
}

void puddle(int x, int y, int size) {
  ellipse(x,y, size, size);
}