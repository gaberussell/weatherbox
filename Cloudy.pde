class CloudyView {
  
  PImage cloud;
  float x;
  
  CloudyView() {
      cloud = loadImage("Cloud.png");
      x = -width;
  }

  void advance() {
      background(100);
      x += 10;
      image(cloud, x, height * 0.6, width * 0.8, height * 0.8);

      // reset to left of frame if we've gone off the right end
      if (x > width) {
        x = -height;
      }
  }
}