float inc = 0.1;
float scale = 10;
int cols, rows;
float zoff = 0;
ArrayList<Particle> particles = new ArrayList<Particle>();
PVector[] flow;

void setup() {
  //size(500, 500);
  fullScreen(P2D);
  noCursor();
  background(255);
  rows = floor(width/scale);
  cols = floor(height/scale);
  for (int i = 0; i < 20000; i++) {
    particles.add(new Particle());
  }
  flow = new PVector[(rows+1)*(cols+1)];
}

void draw() {
  fill(0,10);
  noStroke();
  rect(-1,-1,width+1,height+1);
  //background(255);
  float yoff = 0;
  for (int y = 0; y < rows + 1; y++) {
    float xoff = 0;
    for (int x = 0; x < cols + 1; x++) {
      int index = (x + y * cols);
      float r = noise(xoff, yoff, zoff) * TWO_PI * 4;
      PVector v = PVector.fromAngle(r);
      v.setMag(map(mouseX,0,width,0,5));
      flow[index] = v;
      xoff += inc;
      //fill(r);
      //stroke(0,100);
      //pushMatrix();
      //translate(x*scale, y*scale);
      //rotate(flow[index].heading());
      ////line(0, 0, scale, 0);
      //popMatrix();
    }
    yoff += inc;
  }
  zoff += inc * 0.1;
  //particles.add(new Particle());
  
  for (Particle part : particles) {
    part.update();
    part.show();
    part.follow(flow);
  }
}

void keyPressed() {
  background(255);
    for (Particle part : particles) {
      part.pos = new PVector(random(width), random(height));
  }
}