class Robot {
  PVector pos, vel;
  int radius = 30;

  Robot(float x, float y, int speed) {
    pos = new PVector(x, y);
    vel = new PVector(speed, speed);
  }
  
  //Wanders toward given (x, y) location
  void moveBot(float x, float y) {
    if (dist(pos.x, pos.y, x, y) > radius) {
      if (random(1) < 0.05) {
        vel.set(x - pos.x, y - pos.y);
        vel.normalize();

        if (pos.cross(vel).mag() > 0) {
          vel.rotate(radians(angle_to_turn + random(-angle_to_turn/4.0f, angle_to_turn/4.0f)));
        } else {
          vel.rotate(-1*radians(angle_to_turn + random(-angle_to_turn/4.0f, angle_to_turn/4.0f)));
        }
      }
      pos.add(vel);
    }
  }

  void drawBot() {
    noStroke();
    ellipse(pos.x, pos.y, 20, 20);
    PVector g = new PVector(vel.x, vel.y);
    g.mult(10);
    stroke(255);
    line(pos.x, pos.y, pos.x + g.x, pos.y + g.y);
  }
}