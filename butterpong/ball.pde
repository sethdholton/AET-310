

class Ball
{
  // members (attributes)
  float x, y;
  int w, h;
  PVector speed;
  float bsize;
  float radius, diameter;
  
  // constructor (sets up attributes)
  Ball() {
    bsize = 1.5;
    radius = propy(bsize) / 2;
    diameter = radius * 2;
    x = radius;
    y = random(radius, h - radius);
    speed = new PVector();
    speed.x = 10;
    speed.y = 10;
  }
  
  // methods (abilities of object)
  void drawBall() {
    moveBall();
    fill(255);
    ellipse(w/2, h/2, diameter, diameter);
  }
  
  void moveBall() {
    x += speed.x;
    y += speed.y;
    
    if (isBounceX() == true) {
      x -= speed.x;
    }
    if (isBounceY() == true) {
      y -= speed.y;
    }
  }
  
  void reset() {
    x = radius;
    y = random(radius, h - radius);
    speed.x = 10;
    speed.y = 10;
  }
  
  boolean isBounceX() {
    if (x - radius <= 0 || x + radius >= w) {
      return true;
    }
    else {
      return false;
    }
  }
  
  boolean isBounceY() {
    if (y + radius <= 0 || y - radius >= h) {
      return true;
    }
    else {
      return false;
    }
  }
  
  float propx(float fracx) {
    fracx = w / fracx;
    return fracx;
  }
  
  float propy(float fracy) {
    fracy = h / fracy;
    return fracy;
  }
  
  void setdim(int setW, int setH) {
    w = setW;
    h = setH;
  }
}
