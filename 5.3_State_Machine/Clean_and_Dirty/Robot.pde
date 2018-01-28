class Robot {
  //A Robot class that wanders towards given coordinates.  It has different states that affect its speed and color.
  PVector pos, vel;
  int radius = 15;
  final int angle_to_turn = 30;

  float state = 2;
  final int CLEAN = 2;
  final float HALF_DIRTY = 1.5;
  final float DIRTY = 1;

  Robot(float x, float y, int speed, int _state) {
    pos = new PVector(x, y);
    vel = new PVector(speed, speed);
    state= _state;
  }

  //Wanders toward given (x, y) location
  void wanderToward(float x, float y) {
    if (dist(pos.x, pos.y, x, y) >= radius) {
      if (random(1) < 0.05) {
        vel.set(x - pos.x, y - pos.y);

        if (vel.cross(pos).mag() > 0) {
          vel.rotate(radians(angle_to_turn + random(-angle_to_turn/4.0f, angle_to_turn/4.0f)));
        } else {
          vel.rotate(-1*radians(angle_to_turn + random(-angle_to_turn/4.0f, angle_to_turn/4.0f)));
        }
      }
      vel.normalize().mult(state);
      pos.add(vel);
    }
  }

  void display() {
    noStroke();
    fill(colorState(state));
    ellipse(pos.x, pos.y, 2*radius, 2*radius);
  }
  
  color colorState(float state) {
    if (state == DIRTY) {
      return color(20, 100, 20);
    } else if (this.state == HALF_DIRTY) {
      return color(10, 170, 10);
    } else {
      return color(0, 255, 0);
    }
  }

  void checkPuddles(Puddle[] puddles) {
    //Checks whether or not the bot has collided with 
    // any of the puddles provided.
    for (int i = 0; i < puddles.length; i++) {
      if (dist(pos.x, pos.y, puddles[i].x, puddles[i].y) < puddles[i].size/2.0+radius) {
        if (puddles[i].isClean()) {
          bot1.state = CLEAN;
        } else {
          bot1.state = DIRTY;
        }
      }
    }
  }
}