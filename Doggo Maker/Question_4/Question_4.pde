float random_x;
float random_y;
int doggo_diameter = 100;
color[] doggo_color = {color(150,100,7), color(7,150,100), color(100,7,150)};
boolean[] color_case = {true,false,false};

void setup()
{
  size(500, 500);
  background(100);
  ellipseMode(CENTER);
}

void draw() 
{
   
}

void draw_doggo(float x, float y, int head_diameter, color doggo_color)
{
  // Declared a local variable for the size of the eye and pupil so that 
  // its easier to read when I draw them later.
  float eye_diameter = 0.3*doggo_diameter;
  float pupil_diameter = 0.3*eye_diameter;

  // Drawing the head//
  fill(doggo_color);
  stroke(0);
  strokeWeight(0);
  ellipse(x, y, head_diameter, head_diameter);
  
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
  ellipse(x, y+0.2*head_diameter, head_diameter*0.3, head_diameter*0.2);

  // Mouth//
  noFill();
  arc(x+0.1*head_diameter, y+0.2*head_diameter, 0.2*head_diameter, 0.4*head_diameter, 0.4*PI, PI); 
  arc(x-0.1*head_diameter, y+0.2*head_diameter, 0.2*head_diameter, 0.4*head_diameter, 0, 0.6*PI); 
  arc(x+0*head_diameter, y+0.25*head_diameter, 0.2*head_diameter, 0.3*head_diameter, 0.325*PI, 0.675*PI);
  
}

void keyPressed() 
{
  switch(key) {
    
  case '1':
    color_case[1] = false;
    color_case[2] = false;
    color_case[0] = true;
    break;
  case '2':
   color_case[0] = false;
   color_case[2] = false;
   color_case[1] = true;
   break;
  case '3':
   color_case[0] = false;
   color_case[1] = false;
   color_case[2] = true;
   break;
  case ' ':
    random_x = random(0.5*doggo_diameter,width-0.5*doggo_diameter);
    random_y = random(0.5*doggo_diameter,height-0.5*doggo_diameter);
    for (int i =0; i <=2; i += 1){
      if (color_case[i] == true)  draw_doggo(random_x, random_y, doggo_diameter, doggo_color[i]);
    }
    break;
  }

  if (key == CODED) {
    if  (keyCode == UP) {
      doggo_diameter+= 5;
    } else if (keyCode == DOWN) {
      doggo_diameter -= 5;
    } 
    println("doggo's diameter is"+doggo_diameter);
  }
}