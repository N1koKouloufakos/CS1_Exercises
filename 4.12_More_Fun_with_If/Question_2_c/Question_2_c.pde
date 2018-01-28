float random_x;
float random_y;
int circle_diameter = 20;
color circle_color;
float green_minimum;
float green_maximum;
float slope;

void setup()
{
  size(500,500);
  background(255);
  ellipseMode(CENTER);
  slope = height/(width/2);
}

void draw()
{
  random_x = random(0,width);
  random_y = random(0,height);
  
  //Using the inverse of the slope, we find not how y changes with x
  // but how x changes with y.
  // I suppose you could calculate your slope with y as your independent variable, but if it ain't broke...
  green_minimum = width/2 - 1/slope*random_y;
  green_maximum = width/2 + 1/slope*random_y;
  
  if (random_x < green_maximum && random_x > green_minimum)
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