 //<>//
float direction;
float beacon_x, beacon_y;
int speed = 1;
final int angle_to_turn = 30;
float cross;
Robot bot1, bot2;

void setup() {
  size(500, 500);
  beacon_x = 100;
  beacon_y = 100;
  bot1 = new Robot(250, 250, speed);
  bot2 = new Robot(250, 250, speed);
}

void draw() {
  noStroke();
  background(0);
  fill(255,0,0);
  ellipse(beacon_x, beacon_y, 30,30);
  
  bot1.moveBot(beacon_x, beacon_y);
  bot2.moveBot(beacon_x, beacon_y);
  
  fill(0,255,0);
  bot1.drawBot();
  fill(0,0,255);
  bot2.drawBot();
}

void mouseDragged() {
  if (dist(mouseX, mouseY, beacon_x, beacon_y) < 15) {
    beacon_x = mouseX;
    beacon_y = mouseY;
  }
}