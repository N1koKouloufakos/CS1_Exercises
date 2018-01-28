//Slot Machine  //<>//
//The slot machine consists of n slot objects.  The user can start and stop
//the slots with start/stop buttons.  The user gets a WINNER message if all 
//the slots are the same color, otherwise they are NOT A WINNER.
int n = 3;
Slot [] slots = new Slot[n];
Button start, stop;
boolean playGame = true;
float slot_width;
float hor_whitespace;

void setup() {
  size(500, 500);

  //Instantiating all objects with nice spacing 
  slot_width = 0.2*width;
  hor_whitespace = (width - slots.length*slot_width)/(slots.length+1);
  for (int i = 0; i < slots.length; i ++) {
    slots[i] = new Slot((i+1)*hor_whitespace+i*slot_width, height/3, slot_width, height/3, int(random(2, 9)));
  }
  //Buttons are not spaced particularly mathematically but they look
  //okay and I'm happy with that for now.
  start = new Button(width/3, 0.8*height, 0.15*height, "START");
  stop = new Button(2*width/3, 0.8*height, 0.15*height, "STOP");
}

void draw() {
  background(200);
  //Only while playing the slots will they color change
  if (playGame) {
    for (int i = 0; i < slots.length; i ++) {
      if (slots[i].shouldChange()) {
        slots[i].colorChange();
      }
      slots[i].frames_since_last_change += 1;
    }
  }

  //Code for displaying the slots and the buttons
  for (int i = 0; i < slots.length; i ++) {
    slots[i].display();
  }
  start.display();
  stop.display();

  //Text to be displayed if the user stops the slots
  if (!playGame) {
    int prev_color = slots[0].color_index;
    boolean all_match = false;
    for (int i = 1; i < slots.length; i++) {
      if (slots[i].color_index == prev_color) {
        if (i == slots.length - 1) {
          all_match = true;
        }
        continue;
      } else {
        break;
      }
    }
    if (all_match) {
      text("WINNER", width/2-0.5*textWidth("WINNER"), 0.1*height);
    } else {
      text("NOT A WINNER", width/2-0.5*textWidth("NOT A WINNER"), 0.1*height);
    }
  }
}

void mousePressed() {
  if (start.buttonClicked()) {
    playGame = true;
  } else if (stop.buttonClicked()) {
    playGame = false;
  }
}