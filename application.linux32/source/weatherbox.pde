OPC opc;

Rain r1;

int numDrops = 10;
Rain[] drops = new Rain[numDrops]; // Declare and create the array

void setup()
{
  size(640, 360, P2D);
  // Load a sample image
//  dot = loadImage("dot.png");
//  frameRate(20);
  // Connect to the local instance of fcserver
  opc = new OPC(this, "192.168.0.16", 7890);
//    opc = new OPC(this, "10.254.25.194", 7890);
    
  // Map an 8x8 grid of LEDs to the center of the window
  opc.ledGrid8x7(0, width/2, height/2, height / 12.0, 0, false);

  // Create raindrop objects
    for (int i = 0; i < drops.length; i++) {

    drops[i] = new Rain(); // Create each object
    r1 = new Rain();
  }
  
}

void draw()
{
  background(0);

  // Draw the image, centered at the mouse location
//  float dotSize = height * 0.2;
//  image(dot, mouseX - dotSize/2, mouseY - dotSize/2, dotSize, dotSize);

    fill(255,80);
//    rect(0,0,300,300);
    //Loop through array to use objects.
    for (int i = 0; i < drops.length; i++) {

      drops[i].fall();
    }
  
}

