class Puddle {
  //A simple puddle that is either clean or not clean.
  boolean clean;
  float x, y, size;
  
  Puddle(float _x, float _y, float _size, boolean type) {
    x = _x;
    y = _y;
    size = _size;
    clean = type;
  }
  
  void display() {
    if (this.isClean()){
      fill(0,0,255);
    } else {
      fill(100,100,80);
    }
    ellipse(x, y, size, size);
  }
  
  boolean isClean() {
    return clean;
  }
}