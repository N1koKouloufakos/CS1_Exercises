class Ball { //<>//
  PVector pos, vel;
  int radius = 10;

  int state = 1;
  final int SLOW = 2;
  final int FAST = 3;
  final int FASTER = 4;
  final int FASTEST = 5;
  final int PRESTISSIMO = 6;

  Ball(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector(1, 1);
    vel.normalize().mult(speed());
  }

  //Moves the ball
  void move() {
    vel.normalize().mult(speed());
    pos.add(vel);
  }

  //Displays the ball
  void display() {
    noStroke();
    fill(0);
    ellipse(pos.x, pos.y, 2*radius, 2*radius);
  }

  //Returns how fast the ball should be moving
  int speed() {
    if (state == 1) {
      return SLOW;
    } else if (state == 2) {
      return FAST;
    } else if (state == 3) {
      return FASTER;
    } else if (state == 4) {
      return FASTEST;
    } else {
      return PRESTISSIMO;
    }
  }


  void collides_with(Paddle paddle) {
    if (pos.x+radius > paddle.x && pos.x-radius < paddle.x + paddle.paddle_width &&
      pos.y+radius > paddle.y && !(pos.y > paddle.y) ) {
      vel.y *= -1;
      paddle.affect_ball(this);
    }
  }

  void bounce(float colliding_x, float colliding_y, float colliding_width, float colliding_height)
  {
    float temp;
    /*if (pos.y < colliding_y && pos.x > colliding_x + colliding_width && !(vel.x>0 || vel.y<0)) { //Top Right
      temp = vel.x;
      vel.x = vel.y;
      vel.y = temp;
    } else if (pos.y < colliding_y && pos.x < colliding_x && !(vel.x<0 || vel.y<0)) { //Top Left
      temp = vel.x;
      vel.x = vel.y;
      vel.y = temp;
    } else if (pos.y > colliding_y + colliding_height && pos.x < colliding_x && !(vel.x<0 || vel.y>0)) { //Bottom Left
      temp = vel.x;
      vel.x = vel.y;
      vel.y = temp;
    } else if (pos.y > colliding_y + colliding_height && pos.x > colliding_x + colliding_width && !(vel.x>0 || vel.y>0)) { //Bottom Right
      temp = vel.x;
      vel.x = vel.y;
      vel.y = temp;
    } else {*/
      if (pos.x < colliding_x || pos.x > colliding_x + colliding_width)
      {
        vel.x *= -1;
      }
      else if (pos.y < colliding_y || pos.y > colliding_y + colliding_height)
      {
        vel.y *= -1;
      }
    
  }

  void within_limits() {
    if (pos.x+radius > width || pos.x-radius < 0) {
      vel.x *= -1;
    }
    if (pos.y-radius < 0) {
      vel.y *= -1;
    }
  }

  boolean off_screen() {
    return (pos.y-radius > height)? true: false;
  }
}