PImage dot;

class Rain {
  float r = random(600);
  float y = random(-height);
  float dotSize = height * 0.25;

  void fall() {
    dot = loadImage("dot_transparent_blue.png");
    y = y + 7;
//    fill(0,10,200,180);
//    ellipse(r, y, 50, 50);
    image(dot, r, y, dotSize, dotSize);  
//    ellipse(r,y,dotSize,dotSize);
//    fill(0,0,200);
//    filter(BLUR,4);
   if(y>height){
    // r = random(360);
     r = random(150,460);
     y = random(-200);
   }

  }
}
