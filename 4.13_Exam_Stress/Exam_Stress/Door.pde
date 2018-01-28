void door(float x_pos, float y_pos, float z_pos)
{
   // Books on the floor
  noFill();
  strokeWeight(1);
  stroke(1);
  pushMatrix();
  translate(x_pos, y_pos, z_pos);
  rotateY(door_opened);
  beginShape(QUADS);

  fill(121,87,50); vertex( 0,  0,  0);
  fill(121,87,50); vertex( door_width,  0,  0);
  fill(121,87,50); vertex( door_width, -door_height,  0);
  fill(121,87,50); vertex( 0, -door_height,  0);

  fill(121,87,50); vertex( door_width,  0, 0);
  fill(121,87,50); vertex( door_width,  0, -door_depth);
  fill(121,87,50); vertex( door_width, -door_height, -door_depth);
  fill(121,87,50); vertex( door_width, -door_height, 0);

  fill(121,87,50); vertex( door_width,  0, -door_depth);
  fill(121,87,50); vertex(0,  0, -door_depth);
  fill(121,87,50); vertex(0, -door_height, -door_depth);
  fill(121,87,50); vertex( door_width, -door_height, -door_depth);

  fill(121,87,50); vertex(0,  0, -door_depth);
  fill(121,87,50); vertex(0,  0,  0);
  fill(121,87,50); vertex(0, -door_height,  0);
  fill(121,87,50); vertex(0, -door_height, -door_depth);

  fill(121,87,50); vertex(0,  0, -door_depth);
  fill(121,87,50); vertex( door_width,  0, -door_depth);
  fill(121,87,50); vertex( door_width,  0,  0);
  fill(121,87,50); vertex(0,  0,  0);

  fill(121,87,50); vertex(0, -door_height, -door_depth);
  fill(121,87,50); vertex( door_width, -door_height, -door_depth);
  fill(121,87,50); vertex( door_width, -door_height, 0);
  fill(121,87,50); vertex(0, -door_height,  0);

  endShape();
  popMatrix();
}