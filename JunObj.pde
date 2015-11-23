class JunObj extends AnimatedObject {
  // Constructor
  float s;
  PImage img;
  boolean tinted = false;
  float angle;
  int totalEaten;
  JunObj(float size) { 
    int superSpeed = (int)random(0,20);
    this.x = random(0,width);
    this.y = random(0,height);
    this.xSpeed = random(1,2);
    this.ySpeed = random(1,2);
    if (superSpeed >= 10){
      this.xSpeed = random(5,10);
      this.ySpeed = random(5,10);
    }
    this.s = size;
    this.img = loadImage("MissingNo..png");
    this.img.resize(0,(int)size);
  }

  // Displays the creature
  void display(AnimatedObject[] objs) {
    boolean alleaten = true;
    for(int i = 0; i < objs.length; ++i){
      if(this != objs[i] && objs[i] != null){
        String classname = split(objs[i].getClass().getName(),"$")[1];
        if(alleaten && !classname.equals("AnimatedObject")) {
          alleaten = false;
        }
        if(dist((objs[i].x + objs[i].size / 2),(objs[i].y + objs[i].size / 2),(this.x + this.size / 2),(this.y + this.size / 2)) < this.size / 2 + objs[i].size / 2){
          //delete the object without causing NullPointer..
          if(this.size >= objs[i].size){
            this.size+=objs[i].size / 7;
            this.img.resize(0,(int)size);
            objs[i] = new AnimatedObject();
            this.tinted = true;
          }
        }
      }
    }
    
    //Draw the creature
    if(alleaten){
      fill(255,0,0,150);
      rect(0,0,width,height); 
    }
    
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

  // Moves the creature
  void move() {
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