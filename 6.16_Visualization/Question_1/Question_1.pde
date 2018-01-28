final String filename = "CPP-Gender-Type.csv";
String[] splitline;
Data[][] data;

void setup() {
  size(800, 800);
  colorMode(HSB);
  ellipseMode(CENTER);
  readData(filename);
  dataLocations(data);
}


void draw() {
  background(140);
  drawData(data);
  displayLegend();
  for (int i = 1; i < data.length; i++) {
    for (int j = 2; j < data[i].length; j++) {
      if (data[i][j].collision()) {
        data[i][j].printInfo();
      }
    }
  }
  
}

void readData(String filename) {
  //Reading and parsing data
  /*
  To generalize this function for more CSV formats would be difficult,
   but I would start by giving the user 2 more parameters - a start row and a start column
   Also, this function relies heavily on the data class having all the same attributes 
   all the time.  I would generalize this by perhaps storing the attributes in an
   ArrayList that I can append new information onto.  This way, a new data object could 
   be molded to hold whatever data is in the CSV file.  Project for another day.
   */
  if (filename != null) {
    String[] lines = loadStrings(filename);

    data = new Data[lines.length][lines[0].split(",").length];

    for (int i = 1; i < lines.length; i++) {
      splitline = lines[i].split(",");
      for (int j = 2; j < splitline.length; j++) {
        data[i][j] = new Data(Integer.parseInt(lines[0].split(",")[j]), 
          Integer.parseInt(splitline[j]), 
          splitline[1], 
          splitline[0]);
      }
    }
  } else {
    println("The file could not be found");
  }
}

int [] maxMinOfData(Data[][] data) {
  //Returns an array of length 2 [max, min]
  int[] max_min = new int[2];
  max_min[1] = data[1][2].total;

  for (int i = 1; i < data.length; i++) {
    for (int j = 2; j < data[i].length; j++) {
      if (data[i][j].total > max_min[0]) {
        max_min[0] = data[i][j].total;
      } else if (data[i][j].total < max_min[1]) {
        max_min[1] = data[i][j].total;
      }
    }
  }

  return max_min;
}

void drawData(Data[][] data) {
  //Vertical Scale
  //I want 10 notches on the side of the screen as scale
  int max = maxMinOfData(data)[0];
  int min = maxMinOfData(data)[1];

  for (int i = 10; i >= 1; i--) {
    fill(0);
    float b = map((i/10.0)*(max-min), min, max, 0, height);
    if (i != 10) {
      text(int(max-(i/10.0)*max), 0, b);
    } else {
      text(min, 0, b);
    }
  }

  //Horizontal Scale
  for (int i = 2; i < data[0].length; i++) {
    text(nf((data[1][i].year)%100, 2, 0), 
      ((1.0*i/data[0].length)*width), 
      height);
  }

  //draw data points
  for (int i = 1; i < data.length; i++) {
    for (int j = 2; j < data[i].length; j++) {
      data[i][j].display(data[i][j].x, data[i][j].y);
    }
  }
}

void dataLocations(Data [][] data) {
  //Assigns the x and y location of a dataset mapped to screen size
  for (int i = 1; i < data.length; i++) {
    for (int j = 2; j < data[i].length; j++) {
      data[i][j].x = (1.0*j/data[0].length)*width;
      data[i][j].y = map(maxMinOfData(data)[0]-data[i][j].total, maxMinOfData(data)[1], maxMinOfData(data)[0], 0, height);
    }
  }
}

void displayLegend() {
  fill(0);
  text("CPP Benefits By Gender and Type",width/2 - 0.5*textWidth("CPP Benefits By Gender and Type"), 20);
  fill(0);
  text("Darker Color is Male", width/10+30, height/10+95);
  fill(0,255,255);
  ellipse(width/10, height/10, 20,20);
  text("Retirement Pension", width/10+30, height/10+5);
  fill(100,255,255);
  ellipse(width/10, height/10+30, 20,20);
  text("Survivor Benefit", width/10+30, height/10 + 35);
  fill(180,255,255);
  ellipse(width/10, height/10+60, 20,20);
  text("Disability Benefit", width/10+30, height/10 + 65);
}