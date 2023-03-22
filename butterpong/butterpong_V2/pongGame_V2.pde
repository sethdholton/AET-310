

class PongGame
{
  // members (attributes)
  ArrayList <Ball> balls = new ArrayList<Ball>();
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
  void simulate(int setW, int setH) {
    w = setW;
    h = setH;
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
    for (int i = 0; i < numBalls; i++) {
      balls.get(i).drawBall();
      if (balls.get(i).isMissed() && balls.size() >= 2) {
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
}
