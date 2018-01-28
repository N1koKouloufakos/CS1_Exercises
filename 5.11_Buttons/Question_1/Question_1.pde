int button_width;
int hor_whitespace;

Button [] buttons = new Button[10];
void setup() {
  size(500, 500);
  button_width = width/20;
  hor_whitespace = (width - 10*button_width)/10;
  for (int i = 0; i < 10; i ++) {
    buttons[i] = new Button((i+1)*hor_whitespace + i*button_width, height/2, button_width);
  }
}

void draw() {
  for (int i = 0; i < buttons.length; i ++) {
    buttons[i].display();
  }
}

void mousePressed() {
  for (int i = 0; i < buttons.length; i ++) {
    if (buttons[i].buttonClicked()) {
      buttons[i].colorChanged();
    }
  }
}