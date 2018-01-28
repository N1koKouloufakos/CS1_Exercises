// Just a note about this program,  //<>//
// The tabs are functions - not objects!
//  I just wanted to clean up the main code area 
// and have the main drawing functions easily readable



float ground_level;

float door_height;
float door_width; 
float door_depth;
float door_x;
float door_y; 
float door_opened;

float clock_x;
float clock_y;
float clock_radius;
float minute_hand_radius;
float hour_hand_radius; 

float angle;
float minutes_x;  
float minutes_y;
float minute_angle;
float hour_angle;

float head_height;
float head_width; 
float head_x;
float head_y; 

float book_height;
float book_width;
float book_depth;

int dumbbell_radius = 20;
int weight_depth = 20;

int book_click_counter = 0;
int arm_strength = 1;

void setup()
{
  size(500, 500, P3D);
  textSize(32);
  
  //Classroom Variables
  ground_level = 0.75*height;
  door_height = 0.4*height;
  door_width = 0.25*width; 
  door_depth = 8;
  door_x = 0.1*width;
  door_y = ground_level - door_height; 
  
  //Clock Variables
  clock_x = 0.85*width;
  clock_y = 0.15*height;
  clock_radius = 0.1*height;
  minute_hand_radius = 0.8*clock_radius;
  hour_hand_radius = 0.6*clock_radius;

  //Sprite Variables
  head_height = 80;
  head_width = 80;
  head_x = width/2;
  head_y = door_y + head_height;

  book_height = 8;
  book_width = 0.06*width;
  book_depth = 0.06*width;

  // These are used to set up the points along the clock
  angle = -HALF_PI;
  minutes_x = clock_x + cos(radians(90)) * minute_hand_radius;
  minutes_y = clock_y + sin(radians(90)) * minute_hand_radius;


  minute_angle = -HALF_PI;
  hour_angle = PI;
}

void draw()
{

  stroke(0);
  strokeCap(SQUARE);
  classroom();
  sprite(head_x, head_y, head_width, head_height, arm_strength);
  //Books disappear with every click of them
  if (book_click_counter < 3) {
    book(color(0, 0, 200), 0.7*width, ground_level + 3*book_height, 1.7*book_depth);
  }
  if (book_click_counter < 2) {
    book(color(0, 200, 0), 0.75*width, ground_level + book_height, 1.5*book_depth);
  }
  if (book_click_counter < 1) {
    book(color(200, 0, 0), 0.72*width, ground_level - 1.1*book_height, 1.6*book_depth);
  }
  door(door_x, door_y+door_height, 0);
  if (book_click_counter >= 3) {
    fill(0);
    text("NERD", width/2 - textWidth("NERD")/2, clock_y);
  }
  dumbbell();
}

//This classroom function does not generalize the drawing of the classroom, however,
//It does abstract away the details, which is all I want it to do anyways.
void classroom()
{  
  //The sky
  background(20, 100, 200);
  //The grass
  fill(45, 180, 55);
  noStroke();
  pushMatrix();
  translate(-100, 150, -150);
  rect(0, door_height, width, 0.4*door_height);
  popMatrix();
  fill(200, 140, 130);
  noStroke();
  //The background wall
  beginShape();
  vertex(door_x, door_y + door_height);
  vertex(0, door_y + door_height);
  vertex(0, 0);
  vertex(width, 0);
  vertex(width, door_y + door_height);
  vertex(door_x + door_width, door_y + door_height);
  vertex(door_x + door_width, door_y);
  vertex(door_x, door_y);
  endShape();
  //Floor
  fill(216, 212, 205);
  rect(0, ground_level, width, height);
  //Door
  strokeWeight(8);
  stroke(0);
  noFill();
  beginShape();
  vertex(door_x, door_y + door_height);
  vertex(door_x, door_y);
  vertex(door_x + door_width, door_y);
  vertex(door_x + door_width, door_y + door_height);
  endShape();


  //Clock and components
  strokeWeight(2);
  fill(255);
  ellipse(clock_x, clock_y, 2*clock_radius, 2*clock_radius);

  noStroke();
  //The minute ticks on the face
  for (int i = 0; i < 360; i += 6) // 360/6=60 ticks for the minutes and seconds 
  {
    angle = radians(i);
    minutes_x = clock_x + cos(angle) * minute_hand_radius;
    minutes_y = clock_y + sin(angle) * minute_hand_radius;
    if (i / 30.0 == floor(i/30.0)) 
    {
      fill(250, 100, 100);
      ellipse(minutes_x, minutes_y, 2, 2);
    } else 
    {
      fill(0);
      ellipse(minutes_x, minutes_y, 2, 2);
    }
  }
  fill(0);
  stroke(2);
  clock_hands();
}

void time_passing()
{
  minute_angle += PI/2.5;
  hour_angle += PI/30;
}

void clock_hands()
{
  //Draws the clock hands
  line(clock_x, clock_y, clock_x + cos(minute_angle) * minute_hand_radius, clock_y + sin(minute_angle) * minute_hand_radius);
  line(clock_x, clock_y, clock_x + cos(hour_angle) * hour_hand_radius, clock_y + sin(hour_angle) * hour_hand_radius);
}

void mousePressed()
{
  //If the clock is clicked
  if (dist(mouseX, mouseY, clock_x, clock_y) < clock_radius)
  {
    time_passing();
  }
  //If the door is clicked
  if  (mouseX>door_x && mouseX<door_x+door_width && mouseY > door_y && mouseY < door_y+door_height)
  {
    time_passing();
    door_opened = (door_opened == 1) ? 0:1;
  }
  
  if (book_pressed()) {
    time_passing();
    book_click_counter ++;
  }
  //If the weight is pressed then the arm_strength increases
  if (weight_pressed()) {
    time_passing();
    arm_strength ++;
  }
}

boolean book_pressed() {
  //If the pixel that the mouse touches is the color of the books then it was clicked
  color c;
  c = get(mouseX, mouseY);
  if (c == color(0, 0, 200) || c == color(0, 200, 0) || c == color(200, 0, 0) || c == color(245, 242, 193)) {
    return true;
  } else {
    return false;
  }
}

boolean weight_pressed() {
  //If the pixel that the mouse touches is the color of the weights then it was clicked
  color c;
  c = get(mouseX, mouseY);
  if (c == color(100) || c == color(50) || c == color(254)){
    return true;
  } else {
    return false;
  }
}