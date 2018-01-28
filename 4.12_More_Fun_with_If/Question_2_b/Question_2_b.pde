float random_x;
float random_y;
int circle_diameter = 20;
color circle_color;
float centre_circle_x = width/2;
float centre_circle_y = height/2;
int centre_circle_diameter = 150;
float outer_circle_x = width/2;
float outer_circle_y = height/2;
int outer_circle_diameter = 300;

void setup()
{
  size(500,500);
  background(255);
  ellipseMode(CENTER);
  centre_circle_x = width/2;
  centre_circle_y = height/2;
  outer_circle_x = width/2;
  outer_circle_y = height/2;
}

void draw()
{
  random_x = random(0,width);
  random_y = random(0,height);
  
  if (dist(centre_circle_x, centre_circle_y, random_x, random_y) < 0.5*centre_circle_diameter) //<>//
  {
    circle_color = color(0,255,0);
  }
  else if (dist(centre_circle_x, centre_circle_y, random_x, random_y) >= 0.5*centre_circle_diameter &&
          dist(outer_circle_x, outer_circle_y, random_x, random_y) <= 0.5*outer_circle_diameter)
  {
    circle_color = color(0,0,255);
  }
  else
  {
    circle_color = color(0,255,0);
  }
  noStroke();
  fill(circle_color);
  ellipse(random_x, random_y, circle_diameter, circle_diameter);
}