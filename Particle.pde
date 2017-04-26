class Particle {
  PVector pos;
  float light;
  color col;
  
  Particle(float x, float y) {
    pos = new PVector(x, y);
    light = 0;
    col = color(255);
  }
  
  Particle(float x, float y, float l) {
    pos = new PVector(x, y);
    light = l;
    col = color(255);
  }
  
  Particle(float x, float y, float l, color c) {
    pos = new PVector(x, y);
    light = l;
    col = c;
  }
  
  void update() {
    light = (light + 1) % (3 * fps); 
  }
  
  void display() {
    noStroke();
    pushMatrix();
    translate(pos.x, pos.y);
    for(int i = 5; i > 0; i--) {
      fill(col, light/i);
      ellipse(0,0, 1, 1);
    }
    popMatrix();
  }
}