/* Create a class with the name Tree. - DONE
   Add attribute variables for the tree’s location, the trunk’s width and height, 
   The size of the circle on top, and the colour of the circle. - DONE
   Inside the Tree class, create an array of colours for the tree tops - DONE
   Add a constructor to the Tree class that takes x and y coordinates as parameters. - DONE
   Using a loop, create an array of at least 10 Tree objects. - DONE
   Trees are evenly spaced across the width of the window. - DONE
   Write a function called drawTree that has a Tree variable as a parameter. - DONE
   Write a loop that calls drawTree for each Tree object stored in the array. - DONE
*/

final int num_trees = 10;
float hor_whitespace;
Tree[] trees = new Tree[num_trees];

void setup() {
  size(500,500);
  println(hor_whitespace);
  
  for (int i = 0; i < num_trees; i++) {
    trees[i] = new Tree(i*width/(num_trees)+0.5*(width/(num_trees)), int(random(50, 100)));
  }
  
  for (int i = 0; i < num_trees; i++) {
    drawTree(trees[i]);
  }
}

void drawTree(Tree t) {
    fill(121, 85, 72);
    rect(t.x-0.5*t.tree_width, t.y, t.tree_width, t.tree_height);
    fill(t.leaf_color);
    ellipse(t.x, t.y, t.leaf_size, t.leaf_size);
}