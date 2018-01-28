void setup()
{
  size(500,500);
  rectMode(CENTER);
}

void draw() 
{
  draw_monster(300, 100, 100,100, color(30,230,200));
  draw_monster(200, 400, 80,150, color(240,200,100));
  draw_monster(100, 200, 200,90, color(200,100,200));
}

void draw_monster (int x, int y, int head_width, int head_height, color monster_color)
{
  fill( monster_color);
  rect(x,y,head_width, head_height);
  
  //Drawing the ears//
  //Left Ear//
  triangle(x - head_width/4, // x1
           y - head_height/2, // y1
           x - head_width/4 - 10, // x2
           y - head_height/2, // y2
           x - head_width/4 - 5, //x3
           y - head_height/2 - 10); //y3
  //Right Ear//
   triangle(x + head_width/4, // x1
           y - head_height/2, // y1
           x + head_width/4 + 10, // x2
           y - head_height/2, // y2
           x + head_width/4 + 5, //x3
           y - head_height/2 - 10); //y3
 // Drawing the eyes
 //Left Eye
  ellipse(x - head_width/5, y - head_height/4, 20, 20);
 
 //Right Eye
 ellipse(x + head_width/5, y - head_height/4, 20, 20);
 
 //Mouth//
 fill(0);
 arc(x,y+25,50,50,-PI,0, CHORD);
}