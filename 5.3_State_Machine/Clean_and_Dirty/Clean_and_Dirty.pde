int speed = 1;
Robot bot1;
Puddle[] puddles = new Puddle[2];
PImage watering_can;

void setup() {
  size(500, 500);
  watering_can = loadImage("watering_can.png");
  tint(255,255,0);
  watering_can.resize(32,32);

  //Initialize all the puddles
  for (int i = 0; i < puddles.length; i++) {
    boolean cleanliness = (i%2 == 0) ? true : false;
    puddles[i] = new Puddle(random(100, width-100), random(((i)/2.0)*height+100, ((i+1)/2.0)*height-100), 100, cleanliness);
  }
  bot1 = new Robot(0, 20, speed, 2);
}

void draw() {
  cursor(watering_can, 25, 7);
  tint(0,255,0);
  noStroke();
  background(255);
  bot1.checkPuddles(puddles);
  bot1.wanderToward(mouseX, mouseY);
  
  puddles[0].display();
  puddles[1].display();
  bot1.display();
}

void mousePressed() {
  if (dist(mouseX, mouseY, bot1.pos.x, bot1.pos.y) < bot1.radius) {
    bot1.state = (bot1.state == bot1.DIRTY) ? bot1.HALF_DIRTY : bot1.CLEAN; 
  }
}