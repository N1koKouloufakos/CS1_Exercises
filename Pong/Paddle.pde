class Paddle
{
  int y;
  int x;
  int paddle_width;
  int paddle_height;
  int paddle_speed;
  boolean moving_up;
  boolean moving_down;
  int paddle_num;

  Paddle(int tempX, int tempY)
  {
    y = tempY;
    x = tempX;   
    paddle_height = 80;
    paddle_width = 20;
    paddle_speed = 2;
  }

 void display()
  {
    fill(20);
    rect(x, y, paddle_width, paddle_height);
  }

  boolean collision(Ball b)
  {
    if (y < b.y && y+paddle_height > b.y && dist(x+0.5*paddle_width, b.y, b.x, b.y) < 0.5*paddle_width + 0.5*b.ball_size)
    {
      return true;
    } else
    {
      return false;
    }
  }

  void move_up()
  {
    y-=paddle_speed;
  }

  void move_down()
  {
    y+=paddle_speed;
  }

  void within_limits()
  {
    if (y>height-paddle_height)
      y = height-paddle_height;
    else if (y<0)
      y = 0;
  }
}