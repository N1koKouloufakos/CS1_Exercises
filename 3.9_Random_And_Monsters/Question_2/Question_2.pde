final int head_width = 150;
final int head_height = 100;
final color monster_color= color(230,100,240);

int monster_x; 
int monster_y;
 

void setup()
{
  size(500,500);
  rectMode(CENTER);
  background(0);
  monster_x = width/2;
  monster_y = height/2;
  draw_monster(monster_x,monster_y, head_width, head_height, monster_color);
}

void draw()
{
  
}

void draw_monster(int x, int y, int width, int height, color fillColor)
{ 
  final int eyeRadius = 5;
 
  fill(fillColor);
  rect(x, y, width, height);

  // Draw the left ear
  triangle(x - width/4, // x1
           y - height/2, // y1
           x - width/4 - 10, // x2
           y - height/2, // y2
           x - width/4 - 5, //x3
           y - height/2 - 10); //y3
 
  // Draw the right ear
  triangle(x + width/4, // x1
           y - height/2, // y1
           x + width/4 + 10, // x2
           y - height/2, // y2
           x + width/4 + 5, //x3
           y - height/2 - 10); //y3
 
  // Draw the left eye
  ellipse(x - width/5,
          y - height/4,
          eyeRadius * 2,
          eyeRadius * 2);
 
 // Draw the right eye
 ellipse(x + width/5,
         y - height/4,
         eyeRadius * 2,
         eyeRadius * 2);
 
 // Draw the Mouth//
 fill(0);
 arc(x,y+25,50,50,-PI,0, CHORD);
}

void mousePressed()
{
  background(0);
  draw_monster(mouseX,mouseY,head_width,head_height,monster_color);
}