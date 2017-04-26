//globals
int fps = 30;
Ring points;
Ring lightning;
Ring fire;
ArrayList<Ring> rings;

color red = color(255,0,0);
color green = color(0,255,0);
color blue = color(0,0,255);
int saveCount = 0;
boolean saveFrames = false;

void setup() {
  size(500,500, P2D);
  //points = new Ring();
  //points.generateRing(width*0.3, 0.3, width/2, height/2, 3000, -6, 0.2, 4, color(169, 123, 223));
  
  //lightning = new Ring();
  //lightning.generateRing(width*0.3, 0.4, width/2, height/2, 9000, 1, 0.01, 0.05, color(99, 193, 255));
  
  //fire = new Ring();
  //fire.generateRing(width*0.3, 0.15, width/2, height/2, 3000, -1, 0.04, 3, color(255, 93, 49));
  
  rings = new ArrayList();
  for(int i = 1; i <= 20; i++) {
    Ring r = new Ring();
    r.generateRing(width*(i/3.0)*0.04, 0.6-(i*0.05), width/2, height/2, i*800, int(pow(-1,i)), 0.02, 1, color(i*25, i*25, i*25));
    rings.add(r);
  }
  for(int i = 26; i <= 30; i++) {
    Ring r = new Ring();
    r.generateRing(width*(i/3.0)*0.04, 0.3-((i-22)*0.05), width/2, height/2, i*2000, -1, 0.02, 2, color((i-25)*50, (i-25)*50, (i-25)*50));
    rings.add(r);
  }
}

void draw() {
  background(0);
  
  //fire.update();
  //points.update();
  //lightning.update();
  for(Ring r : rings) {
    r.update();
  }
  
  if(saveFrames) {
    if(saveCount < 3 * fps) {
      saveFrame("frame-###.gif");
      saveCount ++;
    } else {
      saveFrames = false;
      saveCount = 0;
    }
    
  }
  
}

void keyPressed() {
  if (key == 's') {
    saveFrames = true;
  }
}