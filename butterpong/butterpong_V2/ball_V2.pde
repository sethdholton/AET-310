

class Ball
{
  // members (attributes)
  PVector speed;
  float bsize;
  float radius, diameter;
  float x, y;
  int w, h;
  boolean xbounce;
  boolean ybounce;
  int hits;
  int r, g, b;
  int prevr, prevg, prevb;
  int counter;
  
  // cs = colorspeed, d = difference, r/g/b = red, green, blue
  int csr;
  int dr;
  
  int csg;
  int dg;
  
  int csb;
  int db;
  
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
    
    prevr = int(random(0, 255));
    prevg = int(random(0, 255));
    prevb = int(random(0, 255));
    
    counter = 0;
    setupColorshift();
  }
  
  
  
  
  
  // methods (abilities of object)
  void drawBall() {
    fill(colorshift());
    moveBall();
    radius = h / bsize / 2;
    diameter = radius * 2;
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
    if (x - radius <= 0 && xbounce) {
      //println(x - radius);
      xbounce = false;
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
  
  void hit() {
    if (!xbounce) {
      speed.x *= -1;
      xbounce = true;
      
      hits++;
      if (hits > 8) {
        speed.x *= 1.1;
        speed.y *= 1.1;
      }
      if (hits < 12) {
        bsize *= 1.5;
      }
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
  
  void setupColorshift() {
    prevr = int(random(0, 255));
    prevg = int(random(0, 255));
    prevb = int(random(0, 255));
    
    r = int(random(0, 255));
    g = int(random(0, 255));
    b = int(random(0, 255));
    //color c = color(random(0, 255), random(0, 255), random(0, 255));
    //fill(c);
    
    dr = abs(r - prevr);
    csr = int(map(dr, 0, 255, 0, 100));
    
    dg = abs(g - prevg);
    csg = int(map(dg, 0, 255, 0, 100));
    
    db = abs(b - prevb);
    csb = int(map(db, 0, 255, 0, 100));
  }
  
  color colorshift() {
    
    if (frameCount % 100 == 0) {
      prevr = r;
      prevg = g;
      prevb = b;
      
      r = int(random(0, 255));
      g = int(random(0, 255));
      b = int(random(0, 255));
      
      dr = abs(r - prevr);
      csr = int(map(dr, 0, 255, 0, 100));
      
      dg = abs(g - prevg);
      csg = int(map(dg, 0, 255, 0, 100));
      
      db = abs(b - prevb);
      csb = int(map(db, 0, 255, 0, 100));
    }
    
    //csr = prevr + (counter * (r - prevr) / 255);
    //csg = prevg + (counter * (g - prevg) / 255);
    //csb = prevb + (counter * (b - prevb) / 255);
    if (csr != 0) {
      if (frameCount % csr == 0) {
        if (prevr < r) {
          prevr -= 25;
        }
        if (prevr > r) {
          prevr += 25;
        }
      }
    }
    
    if (csg != 0) {
      if (frameCount % csg == 0) {
        if (prevg < g) {
          prevg -= 25;
        }
        if (prevg > g) {
          prevg += 25;
        }
      }
    }
    
    if (csb != 0) {
      if (frameCount % csb == 0) {
        if (prevb < b) {
          prevb -= 25;
        }
        if (prevb > b) {
          prevb += 25;
        }
      }
    }
    
    color c = color(prevr, prevg, prevb);
    
    //counter++;
    return c;
  }
  
  
}
