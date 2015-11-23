/***************************************
 DO NOT MODIFY FROM HERE ...
****************************************/
 
/** The array of objects */
AnimatedObject[] objs = new AnimatedObject[20];

/** Constant for the sandHeight */
int SAND_HEIGHT = 40;

/** Setup the sketch */
void setup() {
  size(800,600);
  smooth();

  // initialize all the objects
  for (int i=0; i < objs.length; i++) {
    objs[i] = new JunObj(random(30,50));   // change this line to call your constructor
  }
}

/** The main draw loop */
void draw() {
  
  // draw the tank background
  background(50,50,255);
  
  // draw the sandy bottom of the tank
  fill(168,168,50);
  rect(0,height-SAND_HEIGHT, width, SAND_HEIGHT);
  
  // draw the enhanced tank background, if necessary
  drawTankBackground();
  
  // draw and animate each of the objects
  for (int i=0; i<objs.length; i++) {
    objs[i].display(objs);
    objs[i].move();
  }
}

/** A super class for animated objects */
class AnimatedObject {
  
  /** Location fields inherited by all subclass */
  float x, y;
  float xSpeed, ySpeed;
  
  /** Size parameter inherited by subclass */
  float size = 50;
  
  /** Constructor
   *  Note that your constructor should accept a single float specifying the size, which will overwrite the inherited default value 50
   *  In addition, your constructor should initialize x and y to a starting location where your creature will appear
   */
  
  /** Displays the object
   *  Note: Implement only one of the display() functions in your subclass, but NOT both.
   *  @param objs an array of AnimatedObject objects in the environment
   */
  void display() { }
  void display( AnimatedObject[] objs ) { display(); }
  
  /** Advances the object's animation by one frame 
   */
  void move() { }

  /* Methods that provide access to class data fields */
  float getX() {return x;}
  float getY() {return y;}
  float getSize() {return size;}
  float getxSpeed() {return xSpeed;}
  float getySpeed() {return ySpeed;}
}

/**************************************
 ... TO HERE
***************************************/