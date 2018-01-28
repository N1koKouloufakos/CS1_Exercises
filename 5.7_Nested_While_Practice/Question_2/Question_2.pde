int numSquares = 8;
int i = 0;
float rect_width;

void setup() {
  size(500,500);
  noStroke();
  background(255,255,0);
  
  //each rectangle size is equal to the quotient of the
  //width minus the total whitespace divided by the number of squares.
  rect_width = (width-(numSquares+1.0))/numSquares;
  
  
   while (i < numSquares) {
    int j = 0;
    while (j < numSquares) {
      //Determines whether square is red or black
      if ((i+j) % 2 != 0){
        fill(255,0,0);
      } else {
        fill(0);
      }
      //Draws the rectangle with 1 pixel of space between each one.
      rect(j*rect_width+j+1, i*rect_width+i+1, rect_width, rect_width);
      j++;
    }
    i++;
  }
}

void draw() {
 
}