class Tree {

  float x, y;
  float tree_width, tree_height;
  float leaf_size;
  color leaf_color;

  color[] possible_colors = {color(20, 150, 50), color(200, 150, 50), color(200, 100, 0) };

  Tree(float _x, int _y) {
    x = _x;
    y = _y;
    leaf_size = int(random(width/(3*num_trees), width/(2*num_trees)));
    tree_height = (random(2, 3))*leaf_size; 
    tree_width = 0.4*leaf_size; 
    leaf_color = possible_colors[int(random(0, 3))];
  }

  void display() {
    fill(121, 85, 72);
    rect(x-0.5*tree_width, y, tree_width, tree_height);
    fill(leaf_color);
    ellipse(x, y, leaf_size, leaf_size);
  }
}