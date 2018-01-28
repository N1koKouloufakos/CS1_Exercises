void setup () {
  size(500,500);
  rectMode(CORNERS);
}

void draw () {
  // These variables hold the position of the two corners of the car's chassis
  // I am using it so that all the positions of the other components will follow
  // wherever I choose to place the chassis
  int car_body_x1 = mouseX;
  int car_body_y1 = height - 60;
  int car_body_x2 = car_body_x1 + 200;
  int car_body_y2 = car_body_y1 - 60;
  
  background(0,100,240);
  
  //Road//
  fill(0);
  rect(0,car_body_y1 + 40, width, car_body_y2 - (car_body_y1 + 40 - car_body_y2));
  fill(200,200,100);
  for (int i = 0; i < width; i += 80) {
    rect(i, car_body_y1-50, i + 50, car_body_y1-70);
  }
  //Chassis//
  noStroke();
  fill(200,20,100);
  rect(car_body_x1,car_body_y1,car_body_x2,car_body_y2,100,100,10,10);
  //Roof of car//
  quad(car_body_x1 + 40, car_body_y2, car_body_x1 + 80, car_body_y2-30,car_body_x2 - 50, car_body_y2-30, car_body_x2 - 30, car_body_y2+20);
 
  //Tires//
  fill(0);
  stroke(255);
  ellipse(car_body_x1 + 40, car_body_y1, 40,40);
  ellipse(car_body_x2 - 40, car_body_y1, 40,40);
  //Windows//
  fill(200);
  stroke(50);
  triangle(car_body_x1 + 42, car_body_y2, car_body_x1 + 80, car_body_y2 - 29, car_body_x1 + 80, car_body_y2);
  
  //Just experimenting with if statements here
  if (mousePressed == true) {
    text("You're the Best", car_body_x1, car_body_y1 - 20);
  }
}