class Tile {
  float x, y;
  float size;
  boolean revealed;
  
  Tile(float temp_x,float temp_y, float temp_size, boolean temp_revealed) {
    x = temp_x;
    y = temp_y;
    size = temp_size;
    revealed = temp_revealed;
  }
  
  void display() {
    rect(x,y, size, size);
  }
  
}