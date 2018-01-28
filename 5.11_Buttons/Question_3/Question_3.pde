int[] data = new int[100];
int[] uh_oh = {100, 2, 4, 2};
int[] negs = {-3, -45, -4, -23};
int[] negs_and_pos = {-4, 50, 32, -62, -40, 27}; //Total = 3
int[] negs_and_extra_pos = {-4, 50, 32, -62, -40, 27, 43, 54}; //Total = 100
int[] empty = {};
int[] non_100_pos = {43,6,2,3,8,3}; //Total = 65
int[] pos_plus_a_minus = {100,-6,2,3,8,3};

void setup() {
  
  //Testing the data array. Observe the console for output.
  for (int j = 0; j < 100; j ++) {
    data[j] = int(random(1, 10));
  }
  //Print all the data in the list
  for (int j = 0; j < 100; j ++) {
    print(data[j]+", ");
  }
  println(" ");
  //Print the index of the element before the sum is > 100.
  println("This is the index where we stopped: "+findIndex(data));
  int good_total = 0;
  for (int i = 0; i <= findIndex(data); i ++) {
    good_total += data[i];
  }
  int bad_total = 0;
  for (int i = 0; i <= findIndex(data)+1; i ++) {
    bad_total += data[i];
  }
  //Comparing the total when we use findIndex properly
  // with when we go just 1 step too far, thus proving our function works properly.
  println("This is the total where we stop: "+good_total);
  println("This is the total if we went 1 step further: "+bad_total);
  
  println(" ");
  
  //Testing when the first element is >= 100 and the second element is positive.
  println("Since our first num is >= 100 and the second is a positive integer we should see a -1 below");
  println(findIndex(uh_oh));
  
  //In this case of only negative numbers, it will return -1, since by the end of 
  //the array we never satisfy the requirements.
  println("A bunch of only negative numbers return a -1:");
  println(findIndex(negs));
  
  //In a list of negative and positives, we expect the output to be -1 if
  //by the end of the list we haven't fulfilled the requirements.
  println("Negatives and positives return a -1 if they do not equal or exceed 100:");
  println(findIndex(negs_and_pos));
  
  //In a list of negative and positives where the sum does equal or exceed 100
  //we expect to receive the index as per usual.
  println("Negatives and positives return an index as per usual.  We expect index 6:");
  println(findIndex(negs_and_extra_pos));
  
  //An empty list should return -1, the return value for a list that doesn't work
  println("An empty list should return -1");
  println(findIndex(empty));
  
  //A list that doesn't add up to 100 should.
  println("This list of positive integers doesn't add to 100 therefore we expect a -1");
  println(findIndex(non_100_pos));
  
  //A list that doesn't add up to 100 should.
  println("First number is > 100, but the next number puts it to < 100, so we expect a 3");
  println(findIndex(pos_plus_a_minus));
  
}

void draw() {
}


int findIndex(int[] data) {
  if (data.length == 0) {
    //If list is empty
    return -1;
  }
  
  int total = data[0];
  for (int i = 1; i < data.length; i++) {
    if (total + data[i] < 100) {
      total += data[i];
    } else {
      if (total >= 100) {
        //The only way for this statement to run is if the 
        //total + data[i] is > 100 and total > 100
        //The only time that happens is when the first element is >100.
        return -1;
      }
      return i-1;
    }
  }
  //if the for loop goes through all values and doesn't exceed
  //100, then there is no index that satisfies the requirements and 
  //therefore we return -1, meaning there is no index.
  return -1;
}