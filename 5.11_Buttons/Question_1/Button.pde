class Button {
  //Simple button class that can cycle through a list of colors.

  color [] colors = {color(200, 0, 0), 
    color(200, 100, 0), 
    color(200, 200, 0), 
    color(0, 200, 0), 
    color(0, 0, 200)};
    
  int x, y;
  float size;
  int color_index;

  Button(int _x, int _y, float _size) {
    x = _x;
    y = _y;
    size = _size;
    color_index = 0;
  }


  void display() {
    fill(colors[color_index]);
    ellipse(x, y, size, size);
  }
  
  void colorChanged() {
     color_index = (color_index == colors.length-1) ? 0 : color_index+1;
  }
  
  boolean buttonClicked() {
    if (dist(x,y,mouseX,mouseY) < 0.5*size) {
       return true;
    } else {
      return false;
    }
  }
}