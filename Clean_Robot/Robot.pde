class Robot {
  PVector pos, vel;
  int radius = 15;
  
  int state = 1;
  final int CLEAN = 1;
  final int HALF_DIRTY = 2;
  final int DIRTY = 3;

  Robot(float x, float y, int speed, int _state) {
    pos = new PVector(x, y);
    vel = new PVector(speed, speed);
    state= _state;
  }
  
  //Wanders toward given (x, y) location
  void wanderToward(float x, float y) {
    if (dist(pos.x, pos.y, x, y) > radius) {
      if (random(1) < 0.05) {
        vel.set(x - pos.x, y - pos.y);
        vel.normalize();

        if (vel.cross(pos).mag() > 0) {
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
    ellipse(pos.x, pos.y, 2*radius, 2*radius);
  }
}