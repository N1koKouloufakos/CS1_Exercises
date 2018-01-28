int circle_diameter = 50;
boolean x_restrict = false;
boolean y_restrict = false;

void setup()
{
  size(500, 500);
  background(20);
  ellipseMode(CENTER);
  ellipse(width/2, height/2, circle_diameter, circle_diameter);
}

void draw()
{
}

void mouseDragged()
{
  background(20);
  //Default//
  if ((mouseX < width-0.5*circle_diameter && mouseX > 0.5 * circle_diameter) &&
    (mouseY < height-0.5*circle_diameter && mouseY > 0.5 * circle_diameter))
  {
    ellipse(mouseX, mouseY, circle_diameter, circle_diameter);
    x_restrict = false;
    y_restrict = false;
  }

  //Test to make sure that the x and y coordinates aren't restricted when they shouldn't be along the edges.
  if (x_restrict == true && mouseX >= 0.5*circle_diameter && mouseX <= width-0.5*circle_diameter) 
  {
    x_restrict = false;
  }
  if (y_restrict == true && mouseY >= 0.5*circle_diameter && mouseY <= height-0.5*circle_diameter) 
  {
    y_restrict = false;
  }

  //Too Far Right
  if (mouseX >= width-0.5*circle_diameter)
  {


    //Too far right and too far down
    if (mouseY >= height-0.5*circle_diameter)
    { 
      x_restrict = true;
      y_restrict = true;
      ellipse(width-0.5*circle_diameter, height-0.5*circle_diameter, circle_diameter, circle_diameter);
    }   
    //Too far right and too far up
    else if (mouseY <= 0.5 * circle_diameter)
    {
      x_restrict = true;
      y_restrict = true;
      ellipse(width-0.5*circle_diameter, 0.5*circle_diameter, circle_diameter, circle_diameter);
    } else 
    {
      x_restrict = true;
      ellipse(width-0.5*circle_diameter, mouseY, circle_diameter, circle_diameter);
    }
  } 

  //Too Far Left
  else if (mouseX <= 0.5 * circle_diameter) 
  {
    //Too far left and too far down
    if (mouseY >= height-0.5*circle_diameter)
    { 
      x_restrict = true;
      ellipse(0.5*circle_diameter, height-0.5*circle_diameter, circle_diameter, circle_diameter);
    }   
    //Too far left and too far up
    else if (mouseY <= 0.5 * circle_diameter)
    {
      x_restrict = true;
      ellipse(0.5*circle_diameter, 0.5*circle_diameter, circle_diameter, circle_diameter);
    } else
    {
      x_restrict = true;
      ellipse(0.5*circle_diameter, mouseY, circle_diameter, circle_diameter);
    }
  }

  //Too far down
  if (mouseY >= height-0.5*circle_diameter)
  {
    if (x_restrict!= true)
    {
      y_restrict = true;
      ellipse(mouseX, height-0.5*circle_diameter, circle_diameter, circle_diameter);
    }
  }
  //Too far up
  else if (mouseY <= 0.5 * circle_diameter)
  {
    if (x_restrict!= true)
    {
      y_restrict = true;
      ellipse(mouseX, 0.5*circle_diameter, circle_diameter, circle_diameter);
    }
  }
}