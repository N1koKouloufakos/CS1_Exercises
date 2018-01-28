void setup() {
  size(500,500);
  int p = 0;
  while (p < 500) {
    float rand = random(0,width);
    stroke(60,100,40);
    line(rand, height, rand+random(-3,3), height - random(20,40));
    p++;
  }
  draw_doggo(width/2, height/2, 100, color(#795548));
}

void draw() {
  
}

void draw_doggo(float x, float y, int doggo_diameter, color doggo_color)
{
  // Declared a local variable for the size of the eye and pupil so that 
  // its easier to read when I draw them later.
  float eye_diameter = 0.3*doggo_diameter;
  float pupil_diameter = 0.3*eye_diameter;

  // Drawing the head//
  fill(doggo_color);
  stroke(0);
  strokeWeight(0);
  ellipse(x, y, doggo_diameter, doggo_diameter);
  
  // Drawing the Ears //
  // These 
  //Right Ear//
  beginShape();
  curveVertex(x + eye_diameter, y - 0.4*doggo_diameter); // the first control point
  curveVertex(x + eye_diameter, y - 0.4*doggo_diameter); // is also the start point of curve
  curveVertex(x + 1.8 *eye_diameter, y - 0.4*doggo_diameter);
  curveVertex(x + 2.0 *eye_diameter, y - 0.2*doggo_diameter);
  curveVertex(x + 2.4 *eye_diameter, y - 0.1*doggo_diameter);
  curveVertex(x + 2.2*eye_diameter, y );
  curveVertex(x + 2.0*eye_diameter, y + 0.1*eye_diameter );
  curveVertex(x+0.5*doggo_diameter, y); // the last point of curve
  curveVertex(x+0.5*doggo_diameter, y); // is also the last control point
  endShape(CLOSE);
  
  //Left Ear//
  beginShape();
  curveVertex(x - eye_diameter, y - 0.4*doggo_diameter); // the first control point
  curveVertex(x - eye_diameter, y - 0.4*doggo_diameter); // is also the start point of curve
  curveVertex(x - 1.8 *eye_diameter, y - 0.4*doggo_diameter);
  curveVertex(x - 2.0 *eye_diameter, y - 0.2*doggo_diameter);
  curveVertex(x - 2.4 *eye_diameter, y - 0.1*doggo_diameter);
  curveVertex(x - 2.2*eye_diameter, y );
  curveVertex(x - 2.0*eye_diameter, y + 0.1*eye_diameter );
  curveVertex(x-0.5*doggo_diameter, y); // the last point of curve
  curveVertex(x-0.5*doggo_diameter, y); // is also the last control point
  endShape(CLOSE);

  // Drawing the Eyes//
  fill(240);
  strokeWeight(2);
  ellipse(x-0.5*eye_diameter, y-0.5*eye_diameter, eye_diameter, eye_diameter);
  ellipse(x+0.5*eye_diameter, y-0.5*eye_diameter, eye_diameter, eye_diameter);

  // Drawing the Pupils//
  fill(0);
  ellipse((x-0.5*eye_diameter)+0.5*pupil_diameter, y-0.45*eye_diameter, pupil_diameter, pupil_diameter);
  ellipse((x+0.5*eye_diameter)-0.5*pupil_diameter, y-0.45*eye_diameter, pupil_diameter, pupil_diameter);

  // Nose//
  ellipse(x, y+0.2*doggo_diameter, doggo_diameter*0.3, doggo_diameter*0.2);

  // Mouth//
  noFill();
  arc(x+0.1*doggo_diameter, y+0.2*doggo_diameter, 0.2*doggo_diameter, 0.4*doggo_diameter, 0.4*PI, PI); 
  arc(x-0.1*doggo_diameter, y+0.2*doggo_diameter, 0.2*doggo_diameter, 0.4*doggo_diameter, 0, 0.6*PI); 
  arc(x+0*doggo_diameter, y+0.25*doggo_diameter, 0.2*doggo_diameter, 0.3*doggo_diameter, 0.325*PI, 0.675*PI);
  
}