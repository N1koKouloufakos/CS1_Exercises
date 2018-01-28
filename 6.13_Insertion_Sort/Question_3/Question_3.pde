/*  //<>//
  Observations on sorting an array of objects vs. integers.
  It seems that the biggest difference is that inside the sort function
  you have to decide which attribute you are comparing of the ball.  ball.size or balls.x.
  Other than that I changed little else about the code.
  This reminds me of how in Python, you can set an object attribute 
  as a default comparison opperand.
  
*/



void setup() {
  size(500, 500);
  background(255);


  ////
  // Define the ball's properties

  int[] ballX = new int[5];
  int[] ballY = new int[5];
  int[] ballSize = new int[5];
  Ball[] balls = new Ball[5];
  ////
  // Create 5 balls

  int ballNum = 0;
  while (ballNum < ballX.length)
  {
    ballX[ballNum] = (int)random(20, width-20);
    ballY[ballNum] = (int)random(20, height-20);
    ballSize[ballNum] = (int)random(20, 100);
    balls[ballNum] = new Ball(ballX[ballNum], ballY[ballNum], ballSize[ballNum]);
    ballNum++;
  }


  ////
  // Sort the balls by size

  // ********** Implement this! ********** 
  sortArray(balls);
  ////
  // Draw the array of balls (reuse ballNum variable)

  textAlign(CENTER, CENTER);

  ballNum = 0;
  while (ballNum < ballX.length)
  {
    fill(200);
    ellipse(balls[ballNum].x, balls[ballNum].y, 
      balls[ballNum].size, balls[ballNum].size);

    fill(0);
    text(ballNum, balls[ballNum].x, balls[ballNum].y);

    ballNum++;
  }
}
void draw() {
}
void sortArray(Ball[] balls)
{
  //Counter.  Increases by 1 every pass.  
  //j is the length of the subsorted list.
  int j;
  //Temporary holder for the element being moved
  int item;

  for (int i = 0; i < balls.length-1; i++) {
    j = i + 1;
    item = balls[j].size;
    //Run through the list backwards until item is less than current element
    while (j > 0 && item < balls[j-1].size) {
      //Shift larger items to the right by one
      balls[j].size = balls[j-1].size; //<>//
      //Prepare to check the next item to the left
      j -= 1;
    }
    //put sorted item in open location
    balls[j].size = item;
  }
}