void book(color cover_color, float x_pos, float y_pos, float z_pos)
{
   // Books on the floor
  noFill();
  strokeWeight(1);
  stroke(1);
  pushMatrix();
  translate(x_pos, y_pos, z_pos);
  rotateY(0.4);
  rotateX(-0.1);
  beginShape(QUADS);

  fill(245, 242, 193); vertex(-book_width,  book_height,  book_depth);
  fill(245, 242, 193); vertex( book_width,  book_height,  book_depth);
  fill(245, 242, 193); vertex( book_width, -book_height,  book_depth);
  fill(245, 242, 193); vertex(-book_width, -book_height,  book_depth);

  fill(cover_color); vertex( book_width,  book_height,  book_depth);
  fill(cover_color); vertex( book_width,  book_height, -book_depth);
  fill(cover_color); vertex( book_width, -book_height, -book_depth);
  fill(cover_color); vertex( book_width, -book_height,  book_depth);

  fill(cover_color); vertex( book_width,  book_height, -book_depth);
  fill(cover_color); vertex(-book_width,  book_height, -book_depth);
  fill(cover_color); vertex(-book_width, -book_height, -book_depth);
  fill(cover_color); vertex( book_width, -book_height, -book_depth);

  fill(cover_color); vertex(-book_width,  book_height, -book_depth);
  fill(cover_color); vertex(-book_width,  book_height,  book_depth);
  fill(cover_color); vertex(-book_width, -book_height,  book_depth);
  fill(cover_color); vertex(-book_width, -book_height, -book_depth);

  fill(cover_color); vertex(-book_width,  book_height, -book_depth);
  fill(cover_color); vertex( book_width,  book_height, -book_depth);
  fill(cover_color); vertex( book_width,  book_height,  book_depth);
  fill(cover_color); vertex(-book_width,  book_height,  book_depth);

  fill(cover_color); vertex(-book_width, -book_height, -book_depth);
  fill(cover_color); vertex( book_width, -book_height, -book_depth);
  fill(cover_color); vertex( book_width, -book_height,  book_depth);
  fill(cover_color); vertex(-book_width, -book_height,  book_depth);

  endShape();
  popMatrix();
}