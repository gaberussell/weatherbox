class PartlyCloudyDayView {
  
  PImage icon;
  
  PartlyCloudyDayView() {
      icon = loadImage("PartlyCloudyDay.png");
  }

  void advance() {
      background(150);
      image(icon, 0, 0);
  }
}