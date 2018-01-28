class Slot {
  //A slot contains a list of colors that it cycles through at an ever-
  //changing rate.  It also has dimensions and a location for when it is displayed.
  color [] colors = {color(0, 200, 0), 
    color(200, 0, 200), 
    color(200, 200, 0), 
    color(0, 200, 200), 
    color(200, 0, 0)};
    
  float x, y;
  float s_width, s_height;
  int color_index;
  int changeRate, frames_since_last_change;

  Slot(float _x, float _y, float _width, float _height, int _changeRate) {
    x = _x;
    y = _y;
    s_width = _width;
    s_height = _height;
    color_index = int(random(0, colors.length-1));
    changeRate = _changeRate;
  }


  void display() {
    fill(colors[color_index]);
    rect(x, y, s_width, s_height);
  }
  
  void colorChange() {
    //Cycles through the color list and goes back to the start if at the end.
     color_index = (color_index == colors.length-1) ? 0 : color_index+1;
  }
  
  boolean shouldChange() {
    //Slots should change when the frames since last change is equal to 
    //that slot's changeRate
    if (frames_since_last_change == changeRate) {
      frames_since_last_change = 0;
      changeRate = int(random(2,9));
      return true;
    } else {
      return false;
    }
  }
}