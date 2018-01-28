int n = 4;

int[] x = new int[n];
float[] y = new float[n];
int car_width = 60;
int car_height = 30;

int frame_counter = 0;
int frames_to_change = 30;
int[] speed = new int[n];
 //<>//
void setup() {
  size(1000,500);
  //Randomly spaces the cars vertically and gives them a random speed
  for (int i = 0; i < n; i++) {
    y[i] = random((1.0*i/n)*height, ((1.0*i+1)/n)*height-car_height);
    speed[i] = int(random(1, 3));
  }
}

void draw() {
  background(0);
  
  frame_counter += 1;
  
  for (int i = 0; i < n; i++) {
    if (x[i]+car_width > width) {
      noLoop();
    }
    rect(x[i], y[i], car_width, car_height);
    x[i] += speed[i];
  }
  
  if (frame_counter >= frames_to_change) {
    for (int i = 0; i < n; i++) {
      float speed_change = int(random(-3,3));
      while (speed[i] + speed_change <= 0 || speed_change == 0) {
        speed_change = int(random(-3,3));
      }
      speed[i] += speed_change;
    }
    frame_counter = 0;
  }
}