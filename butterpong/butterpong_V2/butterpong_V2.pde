
/**
  * ~*~ ButterPong ~*~
  * 
  * game by Seth Holton
  *
  * ~~~ Controls ~~~
  * left click - serve the ball
  * move mouse - control paddle
  * space ------ generate butterfly
  * j ---------- antennae
  * k ---------- head/eyes
  * l ---------- thorax
  * ; ---------- abdomen
  * u ---------- upper wing
  * i ---------- lower wing
  * o ---------- full butterfly
  * r ---------- reset
  *
**/

Ball testball = new Ball();

void setup() {
  size (800, 800);
  frameRate(100);
  noStroke();
  testball.initialize(width, height);
}

void draw() {
  background(230, 193, 238);
  testball.drawBall();
}

void mousePressed() {
}
