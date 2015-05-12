class SnowView {
  
  SnowFlake[] flakes;
  
  SnowView(int num) {
    // Create snowflake objects
    flakes = new SnowFlake[num];
    for (int i = 0; i < flakes.length; i++) {
      flakes[i] = new SnowFlake(); // Create each object
    }
  }

  void advance() {
      background(0);

      //Loop through array to use objects.
      for (int i = 0; i < flakes.length; i++) {
        flakes[i].fall();
      }    
  }
}

class SnowFlake {
  PImage dot;

  float r = random(width * .1, width * .9);
  float y = random(-height);
  float dotSize = height * 0.45;

  void fall() {
    dot = loadImage("white_dot.png");
    y = y + 20;

    image(dot, r, y, dotSize, dotSize);  

   if(y>height){
    // r = random(360);
     r = random(width * .1, width * .9);
     y = random(-100);
   }
  }
}
