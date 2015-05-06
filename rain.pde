PImage dot;
class RainView {
  
  RainDrop[] drops;
  
  RainView(int num) {
    // Create raindrop objects
    println("Creating Raindrops");
    drops = new RainDrop[num];
    for (int i = 0; i < drops.length; i++) {
      drops[i] = new RainDrop(); // Create each object
    }
  }

  void advance() {
    println("Making it rain");
      //Loop through array to use objects.
      for (int i = 0; i < drops.length; i++) {
        drops[i].fall();
      }    
  }
}

class RainDrop {
  float r = random(600);
  float y = random(-height);
  float dotSize = height * 0.25;

  void fall() {
    dot = loadImage("white_dot.png");
    y = y + 30;

    image(dot, r, y, dotSize, dotSize);  

   if(y>height){
    // r = random(360);
     r = random(150,460);
     y = random(-200);
   }
  }
}