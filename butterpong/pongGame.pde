class PongGame
{
  // members (attributes)
  
  // constructor (sets up attributes)
  PongGame() {
  }
  // methods (abilities of object)
  void setdim(int setW, int setH) {
    testball.setdim(setW, setH);
  }
  
  void serve() {
    testball.reset();
  }
  
  void draw() {
    testball.drawBall();
  }
}
