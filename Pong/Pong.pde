Ball my_ball;
Paddle paddle1, paddle2;

void setup() {
  size(500,500);
  paddle1 = new Paddle(0, height/2);
  paddle2 = new Paddle(width-20,height/2);
  my_ball = new Ball (width/2, 100, 20, color(200, 20, 250), paddle1.paddle_width);
  frameRate(120);
}

void draw() {
  background(200);
  my_ball.display();
  my_ball.within_limits();
  my_ball.move();
  checkScore(my_ball);
  
  paddle1.display();
  paddle2.display();
  paddle1.within_limits();
  paddle2.within_limits();
  
}


void checkScore(Ball ball) {
  if (ball.x>width || ball.x<0) {
    ball.x = width/2;
    ball.y = random(ball.ball_size,height-ball.ball_size);
    ball.y_speed = random(-2.0,2.0);
    ball.x_speed*= round(random(0,1)) * 2 - 1;
  }
}

void bounceOffPaddle(Paddle paddle, Ball ball) {
  //paddle.collision detects the collision 
  if (paddle.collision(ball)) {
    //ball.collision uses the paddles speed to affect the balls speed
    ball.collision(paddle);
  }
}