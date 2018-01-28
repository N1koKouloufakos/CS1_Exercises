/*  
The draw_circles function is an abstraction of the original
tedious circle drawing code. It generalizes the task of drawing a bullseye
shape by letting any size of bullseye of any color be drawn in any location.
It also hides away the details of extracting the colors and modifying them,
and the for loop that layers the 3 circles on top of each other.
*/


void setup()
{
  size(500,500);
}

void draw()
{
  background(255);
  
  // Drawing the circles 
  // Parameters are (x, y, diameter, outer circle's color)
  draw_circle(50, 50, 100, color(180,0,0));
  draw_circle(275, 300, 200, color(50,50,0));
  draw_circle(350, 80, 140, color(0,0,195));

}

void draw_circle(int x, int y, float diameter, int circle_color)
{
  //Since the bullseye has a gradient, the 3 color components have to be 
  //extracted and operated on.
  float red = red(circle_color);
  float green = green(circle_color);
  float blue = blue(circle_color);
  
  for (int i = 0; i<= 2; i += 1)
  {
    fill(red+30*i, green+30*i, blue+30*i);
    ellipse(x,y, diameter/pow(2,i), diameter/pow(2,i));
  }
}
  