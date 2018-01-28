class Tile {
  float x, y;
  float t_width, t_height;
  color c;
  boolean revealed;
  
  Tile(float temp_x,float temp_y, float temp_width, float temp_height, color temp_c, boolean temp_revealed) {
    x = temp_x;
    y = temp_y;
    t_width = temp_width;
    t_height = temp_height;
    c = temp_c;
    revealed = temp_revealed;
  }
  
  void display() {
    if (revealed) {
      fill(c);
    } else {
      fill(255);
    }
    rect(x,y, t_width, t_height);
  }
  
}