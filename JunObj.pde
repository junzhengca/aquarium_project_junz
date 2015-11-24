/*
  Copyright Jun Zheng
  A creature that will eat other creatures if touched (only when it's bigger)
  Will have random speed, 33.33% of the creature will have "super speed"
  Will turn screen to red if all other creature are eated by it
  Licence - MIT
 */

class JunObj extends AnimatedObject {
  // Constructor
  float s;
  PImage img;
 /* Trun agsv determines wheather this creature will eat other creatures, default is true */
  boolean tinted = false, agsv = true;
  float angle;
  
 /** Constructs the object
  *  size - creature size
  */
  JunObj(float size) { 
    this.x = random(0,width);
    this.y = random(0,height);
    
    int superSpeed = (int)random(0,3); //this is obvious
    if (superSpeed >= 2){
      this.xSpeed = random(5,10);
      this.ySpeed = random(5,10);
    } else {
      this.xSpeed = random(1,2);
      this.ySpeed = random(1,2); 
    }
    
    this.s = size;
    this.img = loadImage("MissingNo..png");
    this.img.resize(0,(int)size); //will result in more blurry image, but higher performance
  }

 /** Displays the creature
  *  AnimatedObject[] objs - all other objects in the aquarium
  */
  void display(AnimatedObject[] objs) {
    
    super.display(objs);
    
    boolean alleaten = true;
    for(int i = 0; i < objs.length; ++i){
      if(this != objs[i] && objs[i] != null){ //to avoid NullPointer exception, who knows if other uses objs[i] = null
        String classname = split(objs[i].getClass().getName(),"$")[1]; //Get object's class name
        if(alleaten && !classname.equals("AnimatedObject")) {
          alleaten = false;
        }
        if(dist((objs[i].x + objs[i].size / 2),(objs[i].y + objs[i].size / 2),(this.x + this.size / 2),(this.y + this.size / 2)) < this.size / 2 + objs[i].size / 2){
          //delete the object without causing NullPointe
          if(this.size >= objs[i].size){
            if(agsv) {
              this.size+=objs[i].size / 7;
              this.img.resize(0,(int)size);
              objs[i] = new AnimatedObject();
              this.tinted = true;
            }
          }
        }
      }
    }
    
    //Draw red background if everything is eaten by this creature
    if(alleaten){
      fill(255,0,0,150);
      rect(0,0,width,height); 
    }
    
    
    //Draw the creatrue
    pushMatrix();
    angle = atan2(x-mouseX, y-mouseY);
    translate(x, y);
    rotate(-angle-HALF_PI);
    if(tinted) tint(255,0,0);
    else tint(255,255,255);
    image(this.img,0,0);
    if(alleaten){
      fill(255,0,0);
      textSize(30);
      text("mmmmmmm..",0,0);
    }
    popMatrix();
    
  }

 /** Move the creature
  */
  void move() {
    
    super.move();
    
    //Basic x y movement, bounce if reaches edge
    this.x+=xSpeed;
    this.y+=ySpeed;
    if(this.x >= width - this.size || this.x <= 0 + this.size){
      if(this.xSpeed < 0){
        this.x = 0 + this.size;
      } else {
        this.x = width - this.size;
      }
      this.xSpeed*=-1; 
    }
    
    if(this.y >= height - this.size || this.y <= 0 + this.size){
      if(this.ySpeed < 0){
        this.y = 0 + this.size;
      } else {
        this.y = height - this.size;
      }
      this.ySpeed*=-1; 
    }
  }
}

void drawTankBackground() {
}