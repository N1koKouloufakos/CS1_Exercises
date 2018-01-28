size(500,500);
background(50,110,220);
noStroke();
ellipseMode(CORNERS);

int horizon = floor(0.7 * height);
int train_bodyX = floor(0.6 * width);

// Green Floor //
fill(210, 240, 20); 
rect(0, horizon , width, height);

//Floor Rug //
fill(250,100,240);

ellipse(width*0.2, horizon + 30 ,width*0.8,horizon + 100);

// Letter Block //
fill(255);
stroke(255,0,0);
strokeWeight(3);
rect(50,horizon + 30,20,20);
fill(255,0,0);
text("A", 56, horizon + 45);

// 2nd Letter Block //
fill(255);
stroke(0,255,0);
strokeWeight(3);
rect(100,horizon + 80,20,20);
fill(0,255,0);
text("B", 106, horizon + 95);

// 3rd Letter Block //
fill(255);
stroke(0,0,255);
strokeWeight(3);
rect(60,horizon + 70,20,20);
fill(0,0,255);
text("C", 66, horizon + 85);

// Toy Train //
noStroke();
//Green Body//
rectMode(CORNERS);
fill(0,160,0);
rect(train_bodyX, horizon + 50, train_bodyX+60, horizon + 80,0,8,0,0);
//Blue Cockpit//
fill(0,0,220);
rect(train_bodyX - 20, horizon + 30, train_bodyX, horizon + 80);
//Lighter Undercarriage//
fill(227,215,176);
rect(train_bodyX -20, horizon + 75, train_bodyX + 60, horizon + 80);
//Red Top and Wheels//
fill(240,0,0);
rect(train_bodyX - 25, horizon + 28, train_bodyX + 5, horizon + 35);
ellipseMode(CENTER);
ellipse(train_bodyX-10, horizon + 80, 20,20);
ellipse(train_bodyX + 50, horizon + 80, 20, 20);
//Chimney//
triangle(train_bodyX + 50, horizon + 50, train_bodyX + 55, horizon + 35, train_bodyX + 45, horizon + 35); 
rect(train_bodyX+ 48, horizon + 50, train_bodyX + 52, horizon + 40);