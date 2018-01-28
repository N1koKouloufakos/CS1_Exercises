/* 
 First, create a class that represents something with a property that can be sorted 
 (for example, by size, weight, temperature, etc). 
 Include an x location and a y location in the class. 
 Give the class a suitable constructor.
 
 Then, outside of the class, create a function that takes no parameters,
 but returns a new instance of the class you just designed with reasonable random values.
 For example, if you made a pumpkin class that could be different sizes, 
 you might have a function called randomPumpkin() that returned a new instance 
 with a random size. - DONE
 
 Next, write a drawing function that takes a single instance of your class as a parameter,
 but does not return anything. - DONE
 Your function should draw your object such that you visualize 
 the magnitude of the attribute that can be sorted.  - DONE
 For example, the height of the objects could be different, 
 or hotter objects could be more red, etc. 
 
 Now write a function called selectionSort that takes an array of your objects
 as a parameter and returns nothing. 
 The function will use the selection sort algorithm to sort the array
 in place (so the parameter array will be modified). - DONE
 
 Finally, test your sorting algorithm by creating an array of random objects 
 using the function you wrote earlier, then drawing the objects in sorted order. 
 It must be obvious to the person running the program that the objects 
 are sorted just by looking at them. - DONE
 */
int num_doggos = 10;
Doggo[] doggos = new Doggo[num_doggos];

void setup() {
  size(500,500);
  for (int i = 0; i < num_doggos; i++) {
    doggos[i] = randomDoggo();
  }
  selectionSort(doggos);
  doggoLocations(doggos); //<>//
  for (int i = 0; i < num_doggos; i++) {
    doggoVisualizer(doggos[i]);
  }
}

void draw() {
}

Doggo randomDoggo() {
  return new Doggo(int(random(10, 50)));
}

void doggoVisualizer(Doggo doggo) {
  rect(doggo.x, doggo.y, doggo.size, doggo.size);
}

void selectionSort(Doggo[] doggos) {
  int large_loc;
  Doggo temp;
  for (int i = doggos.length-1; i > 0; i--) {
    large_loc = 0; //Assume doggo[0] is the largest one to start
    for (int j = 1; j < i+1; j++) { 
      //compare next doggo size to largest one found so far..
      if (doggos[j].size < doggos[large_loc].size) {
        large_loc = j;
      }
    }
    temp = doggos[i]; //temporary storage for swapping //<>//
    doggos[i] = doggos[large_loc];
    doggos[large_loc] = temp;
  }
}

void doggoLocations(Doggo[] doggos) {
  for (int i = 0; i < doggos.length; i ++) {
    doggos[i].x = int((1.0*i/doggos.length)*width);
  }
}