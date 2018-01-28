float x1;
float y1;
float x2;
float y2;
float x3;
float y3;

//Keeps track of how many circles are on the screen that are not connected to a triangle
int num_of_circles;

//The minimum distance allowed between each circle so that we dont have tiny triangles
int min_dist = 50;

void setup()
{
  size(500, 500);
  background(100,40,100);
}

void draw()
{
}

void mousePressed()
{
  num_of_circles++;
  fill(230, 220, 13);
  //If only one circle has been drawn we dont need to check it relative to the others
  if (num_of_circles==1)
  {
    x1 = mouseX;
    y1 = mouseY;
    ellipse(x1, y1, 20, 20);
  } 
  //if 
  else if (num_of_circles==2)
  {
    x2 = mouseX;
    y2 = mouseY;
    if (dist(x1, y1, x2, y2) > min_dist)
    {
      ellipse(x2, y2, 20, 20);
    } else
    {
      num_of_circles-=1;
    }
  } else if (num_of_circles==3)
  {
    x3 = mouseX;
    y3 = mouseY;
    if (dist(x1, y1, mouseX, mouseY) > min_dist && dist(x2, y2, mouseX, mouseY) > min_dist)
    {
    ellipse(x3, y3, 20, 20);
    fill(70, 250, 150);
    triangle(x1, y1, 
      x2, y2, 
      x3, y3);
    num_of_circles=0;
    }
    else
    {
      num_of_circles-=1;
    }
  }
}