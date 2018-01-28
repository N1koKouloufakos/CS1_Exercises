class Face {
  int x, y, size, happiness;

  Face(int _x, int _y, int _size, int _happiness) {
    x = _x;
    y = _y;
    size = _size;
    happiness = _happiness;
  }

  void display() {
    fill(200, 200, 0);
    ellipse(x, y, size, size);
    ellipse(x+20, y-20, size/10, size/10);
    ellipse(x-20, y-20, size/10, size/10);
    if (happiness>= 0) {
      fill(0);
      arc(x, y, size/2, size/2, 0, PI);
    } else {
      fill(0);
      arc(x, y+size/4, size/2, size/2, PI, 2*PI);
    }
  }
}


size(500, 500);
Face face = new Face(width/2, height/2, 100, -2);
Face face1 = new Face(width/4, height/4, 100, 2);
Face face2 = new Face(3*width/4, 3*height/4, 100, 32);
face.display();
face1.display();
face2.display();