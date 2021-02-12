int counter = 3;

color gridForeground = color(84, 101, 255);
color gridBackground = color(0, 0, 0);

void setupGridScene() {
}

void drawGridScene() {

  if (frameCount % 30 == 0) {
    counter++; 

    if (counter > 3) {
      counter = 0;

      color tmp = gridForeground;
      gridForeground = gridBackground;
      gridBackground = tmp;
    }
  }

  colorMode(RGB, 255, 255, 255);

  background(gridBackground);

  int cellCountY = (int) pow(2, counter);
  float cellSize = (float) height / cellCountY; // makes it square 
  int cellCountX = (int) (width / cellSize);

  translate(width / 2, height / 2);

  for (int x = -cellCountX / 2; x <= cellCountX / 2; x++) {
    for (int y = -cellCountY / 2; y <= cellCountY / 2; y++) {
      if (((x + y) % 2 == 0)) {

        pushMatrix();

        translate(x * cellSize, y * cellSize);
        rotateX(radians(frameCount / -2.5));
        rotateY(radians(frameCount / -5));

        noFill();
        strokeWeight(3);

        if (x % 2 == 0) {
          stroke(gridForeground);
          box(50, 100, 50);
        } else {
          stroke(191, 215, 255);
          box(50, 100, 50);
        }

        popMatrix();
      }
    }
  }
}
