//Bear Variables
int bear_width = 50;
int bear_height = 100;
int ear_size = 20;

//Goldilocks Variables
int goldi_height = 100;
int goldi_head_size = 60;

float hor_whitespace;
float vert_whitespace;

void setup() {
  size(600, 600); //<>//
  background(151,251,151);
  //Whitespace is the height or width minus the length of the objects divided by the 
  //number of objects plus 1.
  hor_whitespace = (1/4.0)*(width - 3*bear_width);
  vert_whitespace = (1/3.0)*(height - bear_height - goldi_height - 0.5*goldi_head_size);
}

void draw() {
  for (int i = 1; i < 4; i ++) {
    draw_bear(i*hor_whitespace+int((i-0.5)*bear_width), 2*vert_whitespace+goldi_height+0.5*goldi_head_size+0.5*bear_height, bear_height, bear_width, ear_size); //<>//
  }
  draw_goldilocks(width/2, vert_whitespace+0.5*goldi_height+0.5*goldi_head_size, goldi_height, 80, goldi_head_size);
  
}

void draw_bear(float x, float y, int bear_height, int bear_width, int ear_size) {
  fill(139,105,30);
  ellipse(x,y+(0.2*bear_height), bear_width, 0.8*bear_height);
  ellipse(x, y-(0.2*bear_height), bear_width, bear_width);
  ellipse(x-ear_size, y-(0.5*bear_height)+0.5*ear_size, ear_size, ear_size);
  ellipse(x+ear_size, y-(0.5*bear_height)+0.5*ear_size, ear_size, ear_size);
}

void draw_goldilocks(int x, float y, int dress_height, int dress_width, int head_size) {
  fill(244, 143, 177);
  triangle(x, y-0.5*dress_height,
           x-0.5*dress_width, y+0.5*dress_height,
           x+0.5*dress_width, y+0.5*dress_height);
  fill(255, 224, 178);
  ellipse(x, y-0.5*dress_height, head_size, head_size);
}