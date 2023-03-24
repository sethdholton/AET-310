

class Paddle
{
  // members (attributes)
  float x, y;
  int w, h;
  float pwidthFrac, pheightFrac;
  float pwidth, pheight;
  
  
  
  
  
  // constructor (sets up attributes)
  Paddle() {
    w = width;
    h = height;
    pwidthFrac = 50;
    pheightFrac = 5;
    pwidth = w / pwidthFrac;
    pheight = h / pheightFrac;
    x = width - (pwidth + w / 160);
    y = bound(mouseY);
  }
  
  // methods (abilities of object)
  void drawPaddle() {
    rectMode(CENTER);
    pwidth = w / pwidthFrac;
    pheight = h / pheightFrac;
    rect(width - (pwidth + w / 160), bound(mouseY), pwidth, pheight);
  }
  
  float bound(float y) {
    if (y + pheight / 2 >= h) {
      y = h - pheight / 2;
    }
    else if (y - pheight / 2 <= 0) {
      y = pheight / 2 - 1;
    }
    return y;
  }
  
  void init() {
    w = width;
    h = height;
  }
}
