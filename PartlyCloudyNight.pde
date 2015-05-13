class PartlyCloudyNightView {
  
  PImage moon;
  PImage cloud;
  float x;
  
  PartlyCloudyNightView() {
      moon = loadImage("ClearNight.png");
      cloud = loadImage("Cloud.png");
      x = -width;
  }

  void advance() {
      x += 10;
      background(0);
      image(moon, 0, 0);
      image(cloud, x, height * 0.4, width * 0.5, height * 0.5);

      // reset to left of frame if we've gone off the right end
      if (x > width) {
        x = -height;
      }
  }
}