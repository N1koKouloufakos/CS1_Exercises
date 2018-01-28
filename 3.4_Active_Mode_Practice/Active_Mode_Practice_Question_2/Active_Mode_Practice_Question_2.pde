// I will require a variable for the horzontal position of the ellipse
// because it will be changing throughout the execution of the file.
// I am going to also make a y variable for flexibility

float circle_x;
float circle_y;

void setup()
{
  size(500, 500);
  smooth();
  ellipseMode(CENTER);
  noStroke();
  fill(0);
  circle_x = width/4;
  circle_y = height*7/8;
  
}


void draw()
{
  background(255);
  ellipse(circle_x, circle_y, 30,30);
  circle_x += 1;
}

  