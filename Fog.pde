class FogView {
  PImage fog_lines;
  float y;

  FogView() {
      fog_lines = loadImage("Fog.png");
      y = height;
  }

  void advance() {
	background(100);
	y -= 5;
	image(fog_lines, 0, y, width, height);
	tint(255, 128);

	// reset to left of frame if we've gone off the right end
	if (y < -height) {
		y = height;
	}    
  }
}