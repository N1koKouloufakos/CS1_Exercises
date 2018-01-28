class Button {
  //Simple button class that has a message displayed on the button
  float x, y;
  float size;
  String text;

  Button(float _x, float _y, float _size, String _text) {
    x = _x;
    y = _y;
    size = _size;
    text = _text;
  }


  void display() {
    fill(0);
    ellipse(x, y, size, size);
    fill(255);
    text(text, x-0.5*textWidth(text), y);
  }
  
  boolean buttonClicked() {
    //Returns true if the mouse is on the button.
    if (dist(x,y,mouseX,mouseY) < 0.5*size) {
       return true;
    } else {
      return false;
    }
  }
}