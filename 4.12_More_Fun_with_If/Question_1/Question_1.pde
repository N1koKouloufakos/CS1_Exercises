//Final Variables or Constants//
final int my_frame_rate = 60;
// 9.8 meter's per second per second is the acceleration, 
// but I will apply this every frame, so I divide by my_frame_rate
final float gravity = 9.8/my_frame_rate; 

//Variables//
float x;
float y;
float speed;
int red = 0;
float circle_diameter = 50;
color circle_color = color(red,30,200);
float displacement;

boolean first_time = true;

void setup()
{
  size(500,500);
  displacement = height;
  ellipseMode(CENTER);
  frameRate(my_frame_rate);
  x = width/2;
  y = 0;
  
}

void draw()
{
   y += speed;
   speed += gravity;
   red ++;
   circle_color = color(red,30,200);
   
  if (y>height)
  {
   // puts the ball back at height of screen to avoid 
   // problems with being too far over the height of the screen
    y = height; //<>//
    
    // If we want the ball to bounce to half the height as before
    // we say that with this line below
    if (first_time){
     first_time = false;
    } else {
      displacement = (displacement/2);
    }
    // Using a basic kinematics equation,
    // I can determine the new speed that I would have to set
    // in order to make the ball bounce to half the previous height
    speed = sqrt(2*gravity*displacement) *-1;
  }
  
  fill(circle_color);
  background(10);
  ellipse(x,y,circle_diameter,circle_diameter);
}