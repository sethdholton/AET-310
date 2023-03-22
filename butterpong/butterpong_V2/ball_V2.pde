

class Ball
{
  // members (attributes)
  PVector speed;
  float bsize;
  float radius, diameter;
  float x, y;
  float w, h;
  boolean hit;
  boolean ybounce;
  
  
  
  
  // constructor (sets up attributes)
  Ball() {
    w = width;
    h = height;
    bsize = 1.5;
    radius = h / bsize / 2;
    diameter = radius * 2;
    speed = new PVector();
    speed.x = 10;
    speed.y = 10;
    x = radius;
    y = random(radius, h - radius);
  }
  
  
  
  
  
  // methods (abilities of object)
  void drawBall() {
    moveBall();
    fill(255);
    ellipse(x, y, diameter, diameter);
  } 
  
  void moveBall() {
    x += speed.x;
    y += speed.y;
    
    if (isBounceX()) {
      speed.x *= -1;
    }
    if (isBounceY()) {
      speed.y *= -1;
    }
  }
  
  

  boolean isBounceX() {
    if (x - radius <= 0 && hit) {
      //println(x - radius);
      hit = false;
      return true;
    }
    else {
      return false;
    }
  }
  
  boolean isBounceY() {
    if (y + radius >= h && !ybounce) {
      ybounce = true;
      return true;
    }
    else if (y - radius <= 0 && ybounce) {
      ybounce = false;
      return true;
    }
    else {
      return false;
    }
  }
  
  boolean isMissed() {
    if (x - radius >= w) {
      return true;
    }
    else {
      return false;
    }
  }
}
