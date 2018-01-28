final int[] numbers = new int[10];
final int[] sortedNumbers = new int[10];

boolean showSorted;

void setup()
{
  size(500, 200);

  showSorted = false;

  // Fill both arrays with the same numbers
  int num = 0;
  while (num < numbers.length)
  {
    numbers[num] = (int)random(5, 30);
    sortedNumbers[num] = numbers[num];

    num++;
  }

  // Sort the second array
  sortArray(sortedNumbers);
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
      //Run through the list backwards until item is less than element
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

void draw()
{
  background(255);
  textAlign(CENTER, CENTER);

  final int buttonWidth = 40;

  int[] array;
  if (showSorted)
  {
    array = sortedNumbers;
  } else
  {
    array = numbers;
  }

  float spaceBetween = (width - (buttonWidth*array.length)) /
    (array.length + 1);

  int buttonNum = 0;
  while (buttonNum < array.length)
  {
    float buttonHeight = array[buttonNum] * 2;

    float x = (buttonNum+1)*spaceBetween + buttonNum*buttonWidth;
    float y = height/2 - buttonHeight/2;

    fill(230);   
    rect(x, y, buttonWidth, buttonHeight);

    fill(0);
    text(array[buttonNum], x + buttonWidth/2, y + buttonHeight/2);  

    buttonNum++;
  }
}

void keyPressed()
{
  showSorted = !showSorted;
}