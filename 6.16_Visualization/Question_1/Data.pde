class Data { //<>// //<>// //<>//
  //Actual data
  int year, total;
  String gender, type;

  //Variable useful in visualizing the data
  color c;

  float x, y;

  Data() {
    year = 0;
    total = 0;
    gender = "Apache Helicopter";
    type = "Disability";
  }

  Data(int year, int total, String gender, String type) {
    this.year = year;
    this.total = total;
    this.gender = gender;
    this.type = type;
  }

  void display(float x, float y) {
    this.x = x;
    this.y = y;

    int darkness;
    int hue;

    if (type.equals("Retirement Pension")) {
      hue = 360;
    } else if (type.equals("Disability Benefit")) {
      hue = 160;
    } else {
      hue = 80;
    }

    if (gender.equals("Female")) {  //Female
      darkness = 360;
    } else { // Male
      darkness = 180;
    }
    c = color(hue, 255, darkness);
    fill(c);
    ellipse(x, y, 10, 10);
  }

  void printInfo() {

    if (x+textWidth(year+": "+total+" "+gender+"s were on "+type)+40 > width) {
      if (y+50 > height) {
        fill(255);
        rect(x, y-50, textWidth(year+": "+total+" "+gender+"s were on "+type)+40, 50);
        fill(0);
        text(year+": "+total+" "+gender+"s were on "+type, x+20, y-50+30);
      } else {
        fill(255);
        rect(x-textWidth(year+": "+total+" "+gender+"s were on "+type)-40, y, textWidth(year+": "+total+" "+gender+"s were on "+type)+40, 50);
        fill(0);
        text(year+": "+total+" "+gender+"s were on "+type, x-textWidth(year+": "+total+" "+gender+"s were on "+type)-40+20, y+30);
      }
    } else if (y+50 > height) {
      fill(255);
      rect(x, y-50, textWidth(year+": "+total+" "+gender+"s were on "+type)+40, 50);
      fill(0);
      text(year+": "+total+" "+gender+"s were on "+type, x+20, y-50+30);
    } else {
      fill(255);
      rect(x, y, textWidth(year+": "+total+" "+gender+"s were on "+type)+40, 50);
      fill(0);
      text(year+": "+total+" "+gender+"s were on "+type, x+20, y+30);
    }
  }

  boolean collision() {
    return (dist(mouseX, mouseY, this.x, this.y) < 5) ? true : false;
  }
}