//Times Table
int i = 0, j = 0;
float rect_width;

void setup() {
  size(500,500);
  rect_width = width/10;
  
  while (i < 10) {
    while (j < 10) {
      fill(255);
      rect(j*rect_width, i*rect_width, rect_width, rect_width);
      fill(0);
      if (i == 0) {
        text(j, j*rect_width, i*rect_width+rect_width);
      } else if (j == 0) {
        text(i, j*rect_width, i*rect_width+rect_width);
      } else {
      text(i*j, j*rect_width, i*rect_width+rect_width);
      }
      j++;
      
    }
    j = 0;
    i++;
  }
}


void draw() {
  
}