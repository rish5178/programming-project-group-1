class WelcomePage {

PImage airplane;
float xPos = 0;
float yPos;


void setup() {
  size(1000, 1000);
  airplane = loadImage("white_airplane.png");
  yPos = height / 2 - airplane.height / 2;
}

void draw() {
    background(255);
    fill(0);
    textSize(24);
    textAlign(CENTER);
    text("Welcome to the Flights Data Visualizer", width / 2, height / 2);
  }


void welcomePage() {
  background(0, 0, 255);
  image(airplane, xPos, yPos);
  xPos += 2;
  if (xPos > width) {
    xPos = -airplane.width;
  }
}


void mouseClicked() {
  float distance = dist(mouseX, mouseY, xPos + airplane.width / 2, yPos + airplane.height / 2);
  if (distance <= airplane.width / 2 && !clicked) {
    clicked = true;
  }
}

}
