void setup()
{
  size(500, 350);
  background(14, 54, 8);
  smooth();
  ellipseMode(CENTER);
}

void draw()
{
  happy();
}

void happy()
{
  noStroke();
  fill(200,200,0);
  ellipse(width/2, height/2, 100,100);
  fill(0);
  ellipse(width/2 - 20, height/2 - 20, 20,20);
  ellipse(width/2 + 20, height/2 - 20, 20,20);
  arc(width/2,height/2,50,50,0,PI);
}