class ClearNightView {
  PImage moon;
  
  ClearNightView() {
  moon = loadImage("ClearNight.png")

  }

  void advance() {
    image(moon,0,0);
    filter(BLUR,5);
  }
}