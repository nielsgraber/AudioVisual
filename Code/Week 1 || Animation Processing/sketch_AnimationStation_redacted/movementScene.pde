int cubeCount = 10;

ArrayList<Float> startLocations = new ArrayList<Float>();
ArrayList<Float> endLocations = new ArrayList<Float>();

void setupMovementScene() {
  for (int i=0; i < cubeCount; i++) {
    startLocations.add(random(50, width - 50));
    endLocations.add(random(50, width - 50));
  }
}

void drawMovementScene() {
  colorMode(RGB, 255, 255, 255);

  if (frameCount % 60 == 0) {
    startLocations.clear();
    startLocations.addAll(endLocations);
    endLocations.clear();
    for (int i=0; i < cubeCount; i++) {
      endLocations.add(random(50, width - 50));
    }
  }

  background(0);
  stroke(191, 215, 255);
  strokeWeight(3);
  fill(84, 101, 255, 75);


  float transition = (float) (frameCount % 60) / 60;
  
  transition = tan(transition) / 1.56;

  for (int i=0; i<cubeCount; i++) {
    float start = startLocations.get(i);
    float end = endLocations.get(i);

    float location = lerp(start, end, transition);

    pushMatrix();
    translate(location, height / 2);
    rotateX(radians(frameCount));
    rotateY(radians(frameCount));
    rotateZ(2);
    box(75);
    popMatrix();
  }
}
