void setup()
{
  size(500, 350);
  background(14, 54, 8);
  smooth();
  ellipseMode(CENTER);
}

void draw()
{
  happy(width/2, height/2);
  happy(30,50);
  happy(400,300);
}

void happy(float face_center_x, float face_center_y)
{
  noStroke();
  fill(200,200,0);
  ellipse(face_center_x, face_center_y, 100,100);
  fill(0);
  ellipse(face_center_x - 20, face_center_y - 20, 20,20);
  ellipse(face_center_x + 20, face_center_y - 20, 20,20);
  arc(face_center_x,face_center_y,50,50,0,PI);
}

void mousePressed() {
  happy(mouseX, mouseY);
}