class Ball
{
  float x;
  float y;
  int ball_size;
  int paddle_adjustment;
  float x_speed;
  float y_speed;
  color ball_color;
  
  //The important information about the ball is its
  // position, size and color.  I just chose an arbitrary 
  //starting speed in the constructor
  Ball (float tempX, float tempY, int tempSize, color tempColor, int paddle_width)
  {
    x = tempX;
    y = tempY;
    ball_size = tempSize;
    ball_color = tempColor;
    x_speed = -1;
    y_speed = 1;
    paddle_adjustment = paddle_width+tempSize/2;
  }

  //Displays the ball onto the screen
  //   NO CALCULATIONS ARE PERFORMED   //
  void display () 
  {
    fill(ball_color);
    noStroke();
    ellipse(x, y, ball_size, ball_size);
  }

  void move() {
    x += x_speed;
    y += y_speed;
  }

  void collision(Paddle collided_paddle) {
      
      //This chunk is used to determine how the paddle's
      //movement will affect the ball's speed
      y_speed = collided_paddle.paddle_speed/abs(collided_paddle.paddle_speed)*random(0.4,0.6);
      x_speed *= -1;
      x = paddle_adjustment;
      paddle_adjustment *= -1;
    }
  
  void within_limits()
  {
    if (y>height)
    {
      y = height;
      y_speed *= -1;
    }
    else if (y<0)
    {
      y = 0;
      y_speed *= -1;
    }
  }
  
}