class ClearDayView {
  PImage sun;
  float counter;
  
  ClearDayView() {
    

    counter = 0.0;
      
  }

  void advance() {
    // Create center sun
    sun = loadImage("sun_rays_sharp_orange.png");
    sun.resize(300,300);
    counter+=4;
    background(255);
    translate(width/2,height/2);
    rotate(counter*TWO_PI/360);
    translate(-sun.width/2, -sun.height/2);
    image(sun,0,0);
    // filter(BLUR,5);
  }
}



class Ray {

}