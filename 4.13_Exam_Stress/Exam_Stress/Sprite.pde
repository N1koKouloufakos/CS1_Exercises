void sprite(float head_x, float head_y, float head_width, float head_height, int arm_strength)
{
  //Head
  strokeWeight(2);
  fill(191, 162, 100);
  ellipse(head_x, head_y, head_width, head_height);
  //Body
  strokeWeight(arm_strength);
  line(head_x, head_y + 0.5*head_height, head_x, head_y + 1.5*head_height); //<>//
  //Legs
  line(head_x, head_y + 1.5*head_height, head_x + 0.8*head_width, head_y +2.5*head_height);
  line(head_x, head_y + 1.5*head_height, head_x - 0.8*head_width, head_y +2.5*head_height);
  //Arms
  line(head_x, head_y + 0.5*head_height, head_x + 0.8*head_width, head_y +1.3*head_height);
  line(head_x, head_y + 0.5*head_height, head_x - 0.8*head_width, head_y +1.3*head_height);
}