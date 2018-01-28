float x;
float y;
int circle_diameter = 10;
color circle_color;

void setup() 
{
  size (500,500);
  background(0,0,240);
}

void draw() 
{
  //Choosing the coordinate for the random circle
  x = random(width); //<>//
  y = random(height);
  //Determing whether the circle will be red or yelly
  circle_color= (x < width/2) ? color(240,30,0) : color(200,250,7);
  fill(circle_color);
  ellipseMode(CENTER);
  ellipse(x,y, circle_diameter, circle_diameter);
}