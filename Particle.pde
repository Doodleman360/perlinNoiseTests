class Particle {
  PVector pos, vel, acc, Ppos;
  float maxspeed = 4;
  Particle() {
    pos = new PVector(random(width), random(height));
    Ppos = pos.copy();
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    maxspeed += random(1);
  }

  void update() {
    vel.add(acc);
    vel.limit(maxspeed);
    pos.add(vel);
    acc.mult(0);
    edges();
  }

  void follow (PVector[] flow) {
    int x = floor(pos.x/scale);
    int y = floor(pos.y/scale);
    int index = (x + y * cols);
    PVector force = flow[index];
    applyForce(force);
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  void show() {
    stroke(map(pos.x, 0, width, 0, 255), map(pos.y, 0, height, 0, 255), 100, 255);
    line(Ppos.x, Ppos.y, pos.x, pos.y);
    Ppos = pos.copy();
  }

  void edges() {
    if (pos.x > width) {
      pos.x = 0;
      Ppos = pos.copy();
    }
    if (pos.x < 0) {
      pos.x = width; 
      Ppos = pos.copy();
    }
    if (pos.y > height) { 
      pos.y = 0; 
      Ppos = pos.copy();
    }
    if (pos.y < 0) { 
      pos.y = height; 
      Ppos = pos.copy();
    }
  }
}