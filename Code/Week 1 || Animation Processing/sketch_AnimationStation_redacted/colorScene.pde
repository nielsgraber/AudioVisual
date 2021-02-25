color foregroundColor;
color backgroundColor;

void setupColorScene() {
  colorMode(HSB, 360, 100, 100);
  foregroundColor = color(random(360), 50, 100);
  backgroundColor = color(random(360), 50, 100);
  colorMode(RGB, 255, 255, 255);
}

void drawColorScene() {

  if (frameCount % 120 == 0) {
    colorMode(HSB, 360, 100, 100);
    foregroundColor = color(random(360), 50, 100);
    backgroundColor = color(random(360), 50, 100);
    colorMode(RGB, 255, 255, 255);
  }

  float transition = (float) (frameCount % 120) / 120;
  color currentForegroundColor = lerpColor(foregroundColor, backgroundColor, transition);
  color currentBackgroundColor = lerpColor(backgroundColor, foregroundColor, transition);

  background(currentBackgroundColor);
  noFill();
  stroke(currentForegroundColor);
  strokeWeight(3);

  translate(width / 2, height / 2);
  pushMatrix();
  rotateX(radians(frameCount / 2));
  rotateY(radians(frameCount));
  sphere(height / 1.61803 / 2);
  popMatrix();

  rotateY(radians(frameCount / 2));
  translate(width / 3, 0);
  
  rotateX(360);
  rotateZ(radians(frameCount));
  
  strokeWeight(8);
  
  beginShape();
  vertex(-100, -100, -100);
  vertex( 100, -100, -100);
  vertex(   0, 0, 100);

  vertex( 100, -100, -100);
  vertex( 100, 100, -100);
  vertex(   0, 0, 100);

  vertex( 100, 100, -100);
  vertex(-100, 100, -100);
  vertex(   0, 0, 100);

  vertex(-100, 100, -100);
  vertex(-100, -100, -100);
  vertex(   0, 0, 100);
  endShape();
}
