Tile[][] tiles = new Tile[4][3];
color[] colors = {color(255, 0, 0), 
  color(0, 255, 0), 
  color(0, 0, 255), 
  color(255, 255, 0), 
  color(0, 255, 255), 
  color(255, 0, 255), 
  color(255, 0, 0), 
  color(0, 255, 0), 
  color(0, 0, 255), 
  color(255, 255, 0), 
  color(0, 255, 255), 
  color(255, 0, 255)};

int whitespace = 20;
int tile_width, tile_height;
boolean delay_next = false;
Tile tile_revealed[] = new Tile[0];

void setup() {
  size(500, 500, P3D);

  tile_width = (width - (tiles[0].length+1)*whitespace)/tiles[0].length;
  tile_height = (height - (tiles.length+1)*whitespace)/tiles.length;
  for (int i = 0; i < 4; i ++) {
    for (int j = 0; j < 3; j ++) {
      int c = int(random(0, colors.length-1));
      color temp;
      temp = colors[c];
      colors[c] = colors[colors.length - 1];
      colors = shorten(colors);
      tiles[i][j] = new Tile( j*(tile_width)+(j+1)*whitespace, 
        i*(tile_height)+(i+1)*whitespace, 
        tile_width, 
        tile_height, 
        temp, 
        false);
    } //<>//
  }
}

void draw() {
  //Delays for 1 second if the two tiles don't match
  if (delay_next) {
    delay(1000);
    delay_next = false;
  }
  
  //Draws all 12 tiles
  for (int i = 0; i < 4; i ++) {
    for (int j = 0; j < 3; j ++) {
      tiles[i][j].display();
    }
  }
  
  //Empties the list of tiles revealed after 2 selections are made
  if (tile_revealed.length == 2) { //<>//
    if (tile_revealed[0].c == tile_revealed[1].c) {
      ;
    } else {
      tile_revealed[0].revealed = false; //<>//
      tile_revealed[1].revealed = false;
      delay_next = true;
    }
    tile_revealed = new Tile[0];
  }
}

void mousePressed() {
  //Sets the tile's reveal state to true if there is
  // less than 2 unmatched tiles revealed
  if (tile_revealed.length < 2) {
    for (int i = 0; i < 4; i ++) {
      for (int j = 0; j < 3; j ++) {
        if ((tiles[i][j].x < mouseX && mouseX < tiles[i][j].x + tiles[i][j].t_width) 
          && (tiles[i][j].y < mouseY && mouseY < tiles[i][j].y + tiles[i][j].t_height)
          && tiles[i][j].revealed == false) {
          tiles[i][j].revealed = true; //<>//
          tile_revealed = (Tile[]) append(tile_revealed, tiles[i][j]);
        }
      }
    }
  }
}