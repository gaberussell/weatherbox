class WindView {
  
  PImage wind;
  float x;
  
  WindView() {
      wind = loadImage("Wind.png");
      x = -width;
  }

  void advance() {
      background(50);
      x += 10;
      image(wind, x, 0, width, height);

      // reset to left of frame if we've gone off the right end
      if (x > width) {
        x = -height;
      }
  }
}