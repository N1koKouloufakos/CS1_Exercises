//The following code was taken directly from
// http://vormplus.be/blog/article/drawing-a-cylinder-with-processing
void dumbbell() {
  pushMatrix();
  translate(0.24*width, ground_level + dumbbell_radius, 4*weight_depth);
  rotateY(PI/4);
  cylinder(30, dumbbell_radius, weight_depth, 50);
  translate(0, 0, 1.5*weight_depth);
  cylinder(30, 5, 2*weight_depth, 100);
  translate(0, 0, 1.5*weight_depth);
  cylinder(30, dumbbell_radius, weight_depth, 50);
  translate(0, 0, 0.5*weight_depth);
  textSize(24);
  fill(254);
  text("25", -16, 9, 3);
  popMatrix();
}


void cylinder(int sides, float r, float h, color col) {
  stroke(0);
  fill(col);
  float angle = 360 / sides;
  float halfHeight = h / 2;
  // draw top shape
  beginShape();
  for (int i = 0; i < sides; i++) {
    float x = cos( radians( i * angle ) ) * r;
    float y = sin( radians( i * angle ) ) * r;
    vertex( x, y, -halfHeight );
  }
  endShape(CLOSE);
  // draw bottom shape
  beginShape();
  for (int i = 0; i < sides; i++) {
    float x = cos( radians( i * angle ) ) * r;
    float y = sin( radians( i * angle ) ) * r;
    vertex( x, y, halfHeight );
  }
  endShape(CLOSE);

  // draw body
  noStroke();
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x = cos( radians( i * angle ) ) * r;
    float y = sin( radians( i * angle ) ) * r;
    vertex( x, y, halfHeight);
    vertex( x, y, -halfHeight);
  }
  endShape(CLOSE);
}