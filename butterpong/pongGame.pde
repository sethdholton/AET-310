class PongGame
{
  // members (attributes)
  
  // constructor (sets up attributes)
  PongGame() {
  }
  // methods (abilities of object)
  void simulate(int setW, int setH) {
    testball.initialize(setW, setH);
  }
  
  void serve() {
    testball.reset();
  }
  
  void draw() {
    testball.drawBall();
  }
}
