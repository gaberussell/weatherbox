class FogView {
  pImage wind;
  float y;

  FogView() {
      wind = loadImage("Wind.png");
      y = height;
  }

  void advance() {
	background(100);
	y -= 5;
	image(wind, 0, y, width/2, height/2);
	tint(255, 128)

	// reset to left of frame if we've gone off the right end
	if (y < -height) {
		y = height;
	}    
  }
}