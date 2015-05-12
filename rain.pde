class RainView {
  
  RainDrop[] drops;
  
  RainView(int num) {
    // Create raindrop objects
    drops = new RainDrop[num];
    for (int i = 0; i < drops.length; i++) {
      drops[i] = new RainDrop(); // Create each object
    }
  }

  void advance() {
      background(0);

      //Loop through array to use objects.
      for (int i = 0; i < drops.length; i++) {
        drops[i].fall();
      }    
  }
}

class RainDrop {
  PImage dot;

  float r = random(width * .1, width * .9);
  float y = random(-height);
  float dotSize = height * 0.25;

  void fall() {
    dot = loadImage("white_dot.png");
    tint(0, 100, 230);
    y = y + 50;

    image(dot, r, y, dotSize, dotSize);  

   if(y>height){
    // r = random(360);
     r = random(width * .1, width * .9);
     y = random(-200);
   }
  }
}