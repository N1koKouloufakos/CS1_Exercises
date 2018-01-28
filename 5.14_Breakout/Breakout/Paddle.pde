class Paddle {
  int y;
  int x;
  int paddle_width;
  int paddle_height;
  int paddle_speed = 5;
  boolean move_left;
  boolean move_right;

  Paddle(int tempX, int tempY)
  {
    y = tempY;
    x = tempX;   
    paddle_height = 20;
    paddle_width = 80;
  }

 void display()
  {
    fill(20);
    rect(x, y, paddle_width, paddle_height);
  }

  void move_left()
  {
    x-=paddle_speed;
    move_left = true;
    move_right = false;
  }

  void move_right()
  {
    x+=paddle_speed;
    move_right = true;
    move_left = false;
  }
  
  void affect_ball(Ball ball) {
    float angle;
    if (move_right) {
      angle = random(9*PI/8, 3*PI/2);
      ball.vel = PVector.fromAngle(angle).normalize().mult(ball.speed());
    } else if (move_left) {
      angle = random(3*PI/2, 15*PI/8);
      ball.vel = PVector.fromAngle(angle).normalize().mult(ball.speed());
    }
    
    
  }

  void within_limits()
  {
    if (x>width-paddle_width) {
      x = width-paddle_width;
    } else if (x<0) {
      x = 0;
    }
  }
  
  
}