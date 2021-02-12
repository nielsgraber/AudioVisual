int scene = 1;

void setup() {
  size(1280, 720);
  
  setupGridScene();
  setupColorScene();
  setupMovementScene();
}

void draw() {
  background(255);
  
  if (frameCount % 120 == 0){
    scene = floor(random(3));
  }
  
  switch (scene) {
    case 0:
  drawGridScene();
  break;
  case 1:
  drawColorScene();
  break;
  case 2:
  drawMovementScene();
  break;
  }
}
