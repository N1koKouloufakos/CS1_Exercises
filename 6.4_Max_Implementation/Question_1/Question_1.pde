//Max Implementation
//Finds the maximum value in a list

/*  Assignment Requirements
Create a new array of ten integers and fill the array with random numbers between 1 and 20 (inclusive). - DONE
Record the index of the first instance of the largest number. - DONE
Draw and label a series of evenly spaced rectangles on the screen with it's random number from the array - DONE
Highlight the rectangle that corresponds with the maximum number in another colour - DONE
*/

int test[];
int num_of_data = 10;

float rect_width;
float hor_whitespace;

int max;

void setup() {
  size(500,500);
  //Setting up rect_width and whitespace to evenly spread the rectangles.
  rect_width = (0.8*width)/num_of_data;
  hor_whitespace = (width-(rect_width*num_of_data))/(num_of_data+1);
  test = new int[num_of_data];
  for (int i = 1; i < test.length; i++) {
    test[i] = int(random(1, 21));
  }
  max = findMax(test);
}

void draw() {
  background(255,255,0);
  for (int i = 0; i < test.length; i++) {
    fill((i == max) ? color(255,0,0) : 100); //highlight the max number
    rect((i)*rect_width + (i+1)*hor_whitespace, height/2, rect_width, 50);
    fill(255);
    text(test[i], (i)*rect_width + (i+1)*hor_whitespace+0.5*rect_width, height/2+30);
  }
  noLoop();
}

int findMax(int [] data) {
  //Cycles through all data and outputs the index of the largest value
  int max_val_index = -1;
  int max_val = data[0];
  for (int i = 1; i < data.length; i++) {
    if(data[i] > max_val) {
       max_val_index = i;
       max_val = data[i];
    }
  }
  return max_val_index;
}