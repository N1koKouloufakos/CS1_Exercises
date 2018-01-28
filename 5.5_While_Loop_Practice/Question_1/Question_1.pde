int i = 1;
color c;

size(500, 500);
while (i <= 25) {
  c = (i % 2 ==0) ? color(0, 0, 255) : color(255, 0, 0);
  fill(c);
  text(i, i/27.0*width, height/2);
  i ++;
}