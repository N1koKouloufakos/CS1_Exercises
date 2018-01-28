/*Assignment Requirements  //<>// //<>// //<>// //<>// //<>//
 
 n.b After discussing with Gail on Monday, Oct 2, it was decided
 that a parallel array was not mandatory for the colors.
 
 8 rows of bricks - DONE
 From bottom up - yellow, green, orange and red - DONE
 Track information about the bricks’ x/y coordinates using parallel arrays - DONE
 Ball will need to bounce off the side and top walls - DONE
 Player must be able to control a paddle off of which the ball can bounce - DONE
 If paddle misses the ball, he or she loses a turn - DONE
 Player has three turns to try to clear all the bricks - DONE
 Number of turns remaining should be visible on the screen - DONE
 yellow brick = 1 point - DONE
 green brick = 3 points - DONE
 orange bricks = 5 points - DONE
 red bricks = 7 points - DONE
 current score should be displayed on the screen - DONE
 Ball speed increases at: 
 four hits on the bricks - DONE
 twelve hits on the bricks - DONE
 making contact with the orange row - DONE
 making contact with the red rows - DONE
 After you starting again, the ball speed should return back to normal - DONE
 
 I believe that I have met all assignment requirements.
 */

Paddle paddle;
Ball ball;

float[][] x = new float[8][8];
float[][] y = new float[8][8];
boolean[][] display = new boolean[8][8]; 
boolean[][] display_snapshot = new boolean[8][8];
color[][] colors_list = new color[8][8];

int brick_width;
int brick_height;

int brick_hit_counter = 0;
int turns = 3;

color [] colors = {color(240, 10, 10), 
  color(255, 155, 50), 
  color(30, 200, 100), 
  color(240, 240, 0)};

void setup() {
  size(500, 500, P3D);
  smooth(6);

  paddle = new Paddle(width/2, height-40);
  ball = new Ball(180, 300);

  brick_width = width/10;
  float hor_whitespace = (2/10.0*width)/9;

  brick_height = (height/2)/10;
  float vert_whitespace = (1/20.0*width)/9;

  for (int i = 0; i < x.length; i ++ ) {
    for (int j = 0; j < x[i].length; j ++ ) {
      x[i][j] = j*brick_width + (j+1)*hor_whitespace;
      y[i][j] = i*brick_height+ (i+1)*vert_whitespace;
      display[i][j] = true;
      display_snapshot[i][j] = true;
      colors_list[i][j] = colors[i/2];
    }
  }
  
}

void draw() {
  background(200);
  if (turns > 0) {
    //If the ball is off the screen then reset the game with 1 less turn.
    if (ball.off_screen()) {
      turns --;
      paddle = new Paddle(width/2, height-40);
      ball = new Ball(width/2, height-80);
      brick_hit_counter = 0;
      for (int i = 0; i < x.length; i ++ ) {
        for (int j = 0; j < x[i].length; j ++ ) {
          display_snapshot[i][j] = display[i][j];
        }
      }
    }

    //Display bricks in correct location with correct corresponding colours.
    for (int i = 0; i < x.length; i ++ ) {
      for (int j = 0; j < x[i].length; j ++ ) {
        stroke(0);
        fill(colors_list[i][j]);
        if (display[i][j]) {
          rect(x[i][j], y[i][j], brick_width, brick_height);
        }
      }
    }

    //Collision Detection
    /*
    There is a commented out line in every collision case and 
     it places the ball at the edge of the brick before removing that
     brick... This cause some jarring frames on weird corner bounces,
     but it removes the bug that allows the player to line up perfectly along
     a single edge and smash through an entire column of bricks.
     
     The reason I have commented out this code that fixes this bug is because
     I actually like the bug.  Since the angles are random, the player can't particularly
     abuse the bug, and it's really fun when you get lucky enough for it to happen to you.
     */
    /*for (int i = 0; i < x.length; i ++ ) {
     for (int j = 0; j < x[i].length; j ++ ) {
     if (display[i][j]) {
     if (ball.pos.y + ball.radius > y[i][j] && ball.pos.y < y[i][j] && ball.pos.x+ball.radius > x[i][j] && ball.pos.x-ball.radius < x[i][j] + brick_width) { 
     ball.vel.y *= -1; //top
     //ball.pos.y = y[i][j] - ball.radius;
     display[i][j] = false;
     brick_hit_counter++;
     } else if (ball.pos.x - ball.radius < x[i][j]+brick_width && ball.pos.x > x[i][j]+brick_width && ball.pos.y+ball.radius > y[i][j] && ball.pos.y-ball.radius < y[i][j] + brick_height) { 
     ball.vel.x *= -1; //right
     //ball.pos.x = x[i][j] + brick_width + ball.radius;
     display[i][j] = false;
     brick_hit_counter++;
     } else if (ball.pos.y - ball.radius < y[i][j] + brick_height && ball.pos.y > y[i][j] + brick_height && ball.pos.x+ball.radius > x[i][j] && ball.pos.x-ball.radius < x[i][j] + brick_width) { 
     ball.vel.y *= -1; //bottom
     //ball.pos.y = y[i][j]+brick_height+ball.radius;
     display[i][j] = false;
     brick_hit_counter++;
     } else if (ball.pos.x + ball.radius > x[i][j] && ball.pos.x < x[i][j] && ball.pos.y+ball.radius > y[i][j] && ball.pos.y-ball.radius < y[i][j] + brick_height) { 
     ball.vel.x *= -1; //left
     //ball.pos.x = x[i][j]-ball.radius;
     display[i][j] = false;
     brick_hit_counter++;
     }
     }
     }
     }*/
     
    //Brick_hit makes sure that only one brick can disappear per frame.
    boolean brick_hit = false;
    for (int i = 0; i < x.length; i ++ ) {
      for (int j = 0; j < x[i].length; j ++ ) {
        if (display[i][j]) {
          if (ball.pos.x + ball.radius > x[i][j] && ball.pos.x - ball.radius < x[i][j] + brick_width && ball.pos.y + ball.radius > y[i][j] && ball.pos.y - ball.radius < y[i][j] + brick_height)
          {
            ball.bounce(x[i][j], y[i][j], brick_width, brick_height);
            display[i][j] = false;
            brick_hit_counter++;
            brick_hit = true;
            break;
          }
        }
        if (brick_hit) {
          break;
        }
      }
      if (brick_hit) {
        break;
      }
    }


    //Tracks how many state changing events have occurred
    int state_counter = 1;
    boolean orange_hit=false, red_hit=false;
    //Increase the ball state if certain number of bricks are hit
    if (brick_hit_counter >= 4) {
      state_counter++;
    }
    if (brick_hit_counter >= 12) {
      state_counter++;
    }
    //Has an orange been hit
    for (int i = 0; i < x.length; i ++ ) {
      for (int j = 0; j < x[i].length; j ++ ) {
        if (display[i][j] == false && display_snapshot[i][j] == true && (i/2) == 1) {
          orange_hit = true;
          break;
        }
      }
      if (orange_hit) {
        state_counter++;
        break;
      }
    }

    //Has a red been hit
    for (int i = 0; i < x.length; i ++ ) {
      for (int j = 0; j < x[i].length; j ++ ) {
        if (display[i][j] == false && display_snapshot[i][j] == true && (i/2) == 0) {
          red_hit = true;
          break;
        }
      }
      if (red_hit) {
        state_counter++;
        break;
      }
    }

    ball.state = state_counter;


    //User input for moving the paddle
    if (keyPressed) {
      if (key == CODED) {
        if (keyCode == LEFT) {
          paddle.move_left();
        } else if (keyCode == RIGHT) {
          paddle.move_right();
        }
      }
    } else {
      paddle.move_right = false;
      paddle.move_left = false;
    }

    ball.move();
    ball.collides_with(paddle);
    ball.within_limits();

    paddle.within_limits();

    ball.display();
    paddle.display();
    //Display score and lives
    text(turns+" turns left", 10, height-20);
    text("Score: "+calculate_score(), 10, height-40);
    //Display percent of screen cleared
    //text(nf(100.0*brick_hit_counter/(x.length*x.length), 3, 2)+"% cleared", 10, height-60);
  } else {
    text("YOU LOST", width/2, height/2);
  }
}


int calculate_score() {
  //Calculates current score
  int score = 0;
  for (int i = 0; i < x.length; i ++ ) {
    for (int j = 0; j < x[i].length; j ++ ) {
      if (display[i][j] == false) {
        score += x.length-(2*(i/2) + 1);
      }
    }
  }
  return score;
}