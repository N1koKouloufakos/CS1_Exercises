class Face {
	int x, y, size, happiness;

	void display() {
		fill(200,200,0);
  	ellipse(x,y, size, size);
		ellipse(x+20, y-20, size/10, size/10);
		ellipse(x-20, y-20, size/10, size/10);
		if (happiness>= 0) {
  			fill(0);
  			arc(x,y,size/2,size/2,0,PI);
		} else {
  			fill(0);
  			arc(x,y+size/4,size/2,size/2,PI,2*PI);
		}

	}
}

size(500,500);

Face face = new Face();
face.x = width/2;
face.y = height/2;
face.size = 100;
face.happiness = -2;
Face face1 = new Face();
face1.x = width/4;
face1.y = height/4;
face1.size = 100;
face1.happiness = 2;
Face face2 = new Face();
face2.x = 3*width/4;
face2.y = 3*height/4;
face2.size = 100;
face2.happiness = 32;

face.display();
face1.display();
face2.display();