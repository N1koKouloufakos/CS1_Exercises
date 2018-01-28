//SkyScraper
float rect_width, rect_height;
float window_width, window_height;
int i = 0, j = 0;
int numFloors = 20, numWindows = 10;
float hor_whitespace, vert_whitespace;

void setup() {
  size(500,500);
  rect_width = 0.4*width;
  window_width = (0.5*rect_width)/numWindows;
  hor_whitespace = (rect_width - (window_width*numWindows))/(numWindows+1);
  rect_height = 0.8*height;
  window_height = (0.7*rect_height)/numFloors;
  vert_whitespace = (rect_height - (window_height*numFloors))/(numFloors+1);
  
  float left = width/3;
  float top = 0.2*height;
  rect(left, top, rect_width, rect_height);
  
  while (i < numFloors) {
    while (j < numWindows) {
       rect(left+(j+1)*hor_whitespace+j*window_width, top+(i+1)*vert_whitespace+i*window_height, window_width, window_height);
      j++;
    }
    j = 0;
    i++;
  }
}

void draw() {

}