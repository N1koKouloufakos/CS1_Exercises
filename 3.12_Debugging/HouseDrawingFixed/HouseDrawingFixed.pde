size(500,500);
background(255);

int houseWidth = 200;
int houseHeight = 150;
int houseX = width/2;
int houseY = height*2/3;

fill(70, 162, 31); //<>//
rect(0, height*2/3, width, height/3);

fill(234,210,121);

rectMode(CENTER);
rect(houseX, houseY, houseHeight, houseWidth);

fill(234, 121, 125); //<>//
// The points were labelled wrong in the comments which was confusing -> FIXED
// x2 was using houseY instead of houseX in it's calculation. 
// x3 added houseWidth/2 to HouseX, but since the peak of the house is in the middle of
// the house, houseX was sufficient.
triangle(houseX + houseWidth/2, //x1
         houseY - houseHeight/2, //y1
         houseX - houseWidth/2, //x2
         houseY - houseHeight/2, //y2
         houseX, //x3
         houseY - houseHeight/2 - 100);//y3