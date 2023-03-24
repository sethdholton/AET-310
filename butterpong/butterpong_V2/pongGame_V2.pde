

class PongGame
{
  // members (attributes)
  ArrayList <Ball> balls = new ArrayList<Ball>();
  Paddle pd = new Paddle();
  int numBalls;
  int currentBall;
  int w;
  int h;
  int serves;
  int misses;
  int hits;
  int totalhits;
  
  
  
  
  
  // constructor (sets up attributes)
  PongGame() {
  }
  
  
  
  
  
  // methods (abilities of object)
  void init(int windowWidth, int windowHeight) {
    w = windowWidth;
    h = windowHeight;
    pd.init();
  }
  
  
  
  void serve() {
    serves++;
    balls.add(new Ball());
    
    numBalls = balls.size();
    currentBall = numBalls - 1;
    
    printBallAttributes();
    hits = 0;
  }
  
  
  
  void drawPong() {
    pd.drawPaddle();
    for (int i = 0; i < numBalls; i++) {
      balls.get(i).drawBall();
      
      float bx = balls.get(i).x;
      float by = balls.get(i).y;
      float br = balls.get(i).radius;
      float pw = pd.pwidth;
      float ph = pd.pheight;
      
      if (ishitdistanceX(bx, br, pw) && ishitboxY(by, ph, mouseY)) {
        balls.get(i).hit();
      }
      
      if (balls.get(i).isMissed()) {
        balls.remove(i);
        numBalls = balls.size();
        i = 0;
      }
    }
  }
  
  void printBallAttributes() {
    println("Ball ", serves, "*******");
    println("Size: ", balls.get(currentBall).diameter);
    println("Coords: (", balls.get(currentBall).x, ", ", balls.get(currentBall).y, ")");
    println("****************");
  }
  
  boolean ishitdistanceX(float bx, float br, float pw) {
    if (bx + br + pw + w / 160 >= width) {
      return true;
    }
    else {
      return false;
    }
  }
  
  boolean ishitboxY(float by, float ph, float my) {
    if (by <= my + ph / 2 && by >= my - ph / 2) {
      return true;
    }
    else {
      return false;
    }
  }
}
