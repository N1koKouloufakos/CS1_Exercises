float [] data = new float[20];
float data_width = (0.5*width)/data.length;
float hor_whitespace = (width - data.length)/(data.length+1);

size(500, 500);
rectMode(CORNERS);
stroke(255,0,0);
line(0, height/2, width, height/2);

for (int i = 0; i < data.length; i ++) {
  data[i] = random(-50, 50);
  float m = map(data[i], -50, 50, 0, height);
  fill(0);
  stroke(0);
  rect((i+1)*hor_whitespace+i*(data_width), height/2, (i+1)*hor_whitespace+(i+1)*(data_width), m);
}