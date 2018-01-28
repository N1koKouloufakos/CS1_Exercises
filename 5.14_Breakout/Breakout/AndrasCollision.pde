int testX = circleX;
int textY = circleY;

if (circleX < rectX) {
	textX = rectX;
} else if (circleX > rectX+rectWidth) {
	textX = rectX+rectWidth;
}
if (circleY < rectY) {
	textY = rectY;
} else if (circleY > rectY+rectHeight) {
	textY = rectY+rectHeight;
}

//Then compare dist from the testX and testY to the circleC and circleY.