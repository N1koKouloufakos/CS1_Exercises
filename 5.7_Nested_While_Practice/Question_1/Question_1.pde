float rect_width;

void setup() {
  size(500,500);
  noStroke();
  background(255,255,0);
  
  //each rectangle size is equal to the quotient of the
  //width minus the total whitespace divided by the number of squares.
  fill(255,0,0);
  rect(2,2,(width/2)-3, (height/2)-3);
  rect((width/2)+1,(height/2)+1, (width/2)-3, (height/2)-3);
  fill(0);
  rect((width/2)+1,2,(width/2)-3, (height/2)-3);
  rect(2,(height/2)+1, (width/2)-3, (height/2)-3);
  
}

void draw() {
  //<>//
}