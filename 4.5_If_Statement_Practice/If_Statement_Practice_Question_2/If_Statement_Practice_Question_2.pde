// Variables//
color yellow = color(245,250,10);
color purple = color(183, 10,250);
color rect_color;

float rect_x;
float rect_y;
float rect_width = 200;
float rect_height = 200;

void setup()
{
  size(500,500);  //<>//
  background(purple);
  rectMode(CENTER);
  
  rect_x = width/2;
  rect_y = height/2;
}

void draw()
{
  if (mouseY >= rect_y - 0.5*rect_height &&
    mouseY <= rect_y + 0.5*rect_height &&
    mouseX >= rect_x - 0.5*rect_width&&
    mouseX <= rect_x + 0.5*rect_width)
{
  rect_color = purple;
  background(yellow);
} else {
  rect_color = yellow;
  background(purple);
}
 fill(rect_color);
 rect(rect_x, rect_y, rect_width , rect_height);
}