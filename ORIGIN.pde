//void drawOriginBarChart() {
//  float x = 50;
//  float y = 40;
//  float barWidth = 20;

//  // Draw y-axis line and labels
//  stroke(0);
//  textAlign(RIGHT, CENTER);
//  textSize(16);
//  for (int i = 0; i <= 10; i++) {
//    float label = map(i, 0, 10, max(stateCounts), 0);
//    float labelY = map(label, 0, max(stateCounts), 0, height - 100);
//    line(x - 5, y + height - labelY - 50, x, y + height - labelY - 50);
//    text((int) label, x - 10, y + height - labelY - 50);
//  }
  
//  // Draw x-axis line
//  line(x, y + height - 50, x + 25 * (barWidth + 10), y + height - 50);
  
//  // Draw bars and labels
//  textSize(20);
//  textAlign(CENTER);
//  fill(0);
//  text("Frequency of Flights from Origin State", width/3, y+40); // add title
//  textSize(16);
//  for (int i = 0; i < 25; i++) {
//    float barHeight = map(stateCounts[i], 0, max(stateCounts), 0, height - 100);
//    fill(50, 150, 255);
//    rect(x, y + height - barHeight - 50, barWidth, barHeight);
//    textAlign(CENTER);
//    fill(0);
//    text(states[i], x + barWidth/2, y + height - barHeight - 70); // add state name on top of each bar
//    text(stateCounts[i], x + barWidth/2, y + height - barHeight - 52);
//    x += barWidth + 10;
//  }
//}
