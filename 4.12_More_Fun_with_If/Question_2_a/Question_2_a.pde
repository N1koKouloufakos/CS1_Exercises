float random_x;
float random_y;
int circle_diameter = 50;
color circle_color;

void setup()
{
  size(500,500);
  background(255);
}

void draw()
{
  random_x = random(0,width);
  random_y = random(0,height);
  
  if ((random_y < 300 && random_y > 200) || (random_x < 300 && random_x > 200)) //<>//
  {
    circle_color = color(0,255,0);
  }
  else
  {
    circle_color = color(0,0,255);
  }
  noStroke();
  fill(circle_color);
  ellipse(random_x, random_y, circle_diameter, circle_diameter);
}