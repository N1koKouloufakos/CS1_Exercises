void setup() {
  size(500, 500);
  background(255);


  ////
  // Define the ball's properties

  int[] ballX = new int[5];
  int[] ballY = new int[5];
  int[] ballSize = new int[5];

  ////
  // Create 5 balls

  int ballNum = 0;
  while (ballNum < ballX.length)
  {
    ballX[ballNum] = (int)random(20, width-20);
    ballY[ballNum] = (int)random(20, height-20);
    ballSize[ballNum] = (int)random(20, 100);

    ballNum++;
  }


  ////
  // Sort the balls by size

  // ********** Implement this! ********** 
  sortArray(ballSize);
  ////
  // Draw the array of balls (reuse ballNum variable)

  textAlign(CENTER, CENTER);

  ballNum = 0;
  while (ballNum < ballX.length)
  {
    fill(200);
    ellipse(ballX[ballNum], ballY[ballNum], 
      ballSize[ballNum], ballSize[ballNum]);

    fill(0);
    text(ballNum, ballX[ballNum], ballY[ballNum]);

    ballNum++;
  }
}
void draw() {
}
void sortArray(int[] numbers)
{
  //Counter.  Increases by 1 every pass.  
  //j is the length of the subsorted list.
  int j;
  //Temporary holder for the element being moved
  int item;

  for (int i = 0; i < numbers.length-1; i++) {
    j = i + 1;
    item = numbers[j];
    //Run through the list backwards until item is less than current element
    while (j > 0 && item < numbers[j-1]) {
      //Shift larger items to the right by one
      numbers[j] = numbers[j-1];
      //Prepare to check the next item to the left
      j -= 1;
    }
    //put sorted item in open location
    numbers[j] = item;
  }
}