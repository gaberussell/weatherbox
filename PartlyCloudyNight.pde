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
      x += 1;
      background(0);
      image(moon, 0, 0);
      image(cloud, x, height * 0.5, width * 0.25, height * 0.25);

      // reset to left of frame if we've gone off the right end
      if (x > width) {
        x = -height;
      }
  }
}