class Ring {
  ArrayList<Particle> particles;
  float randomValue;
  
  Ring() {
    randomValue = random(0,10000);
    particles = new ArrayList<Particle>();
  }
  
  //------------------------------------------------------
  //generate ring
  //radius, noise size scaling, centre x value, centre y value, n particles, times particles loop circle, noise speed, colour variation
  //speed should be value ~ 0.01 - 3
  //colourspeed is number of gradient cycles
  //------------------------------------------------------
  void generateRing(float r, float w, float x_, float y_, int N, int loops, float speed, float colourSpeed, color col) {
    for(int i = 0; i < N; i++) {
      float theta = -i * 2*PI*loops/N;
      float x = x_ + r*cos(theta);
      float y = x_ +r*sin(theta);
      x += map(noise(i*speed + randomValue), 0, 1, -r*w, r*w);
      y += map(noise(i*speed + 2*randomValue), 0, 1,  -r*w, r*w);
      Particle p = new Particle(x, y, (i*colourSpeed * 3 * fps / N) % (3*fps), col);
      particles.add(p);
    }
  }
  
  void generateRing(float r, float w, float x, float y, int N, int loops, float speed, float colourSpeed) {
    generateRing(r, w, x, y, N, loops, speed, colourSpeed, color(255,255,255));
  }
  
  //------------------------------------------------------
  //update and display
  //------------------------------------------------------
  void update() {
    for(Particle p : particles) {
      p.update();
      p.display();
    }
  }
}