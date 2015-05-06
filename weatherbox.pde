import processing.net.*;

OPC opc;

Server cueServer;
Client cueClient;
View current_view = View.RAIN;

RainView rain;


void setup()
{
  size(640, 360);
  // Connect to the local instance of fcserver
  //opc = new OPC(this, "192.168.0.16", 7890);

  // Map an 8x8 grid of LEDs to the center of the window
  //opc.ledGrid8x7(0, width/2, height/2, height / 10.0, 0, false);

  // Create server to recieve display cues from external client
  cueServer = new Server(this, 12345);
 
  initScenes(); 

}

void draw()
{
  background(0);
  // rain.advance();
  // recieve data from cue server
  Client cueClient = cueServer.available();
  if (cueClient != null) {
    
    // get string from client and reformat so it can be matched against View enum
    String cue = cueClient.readString().trim().toUpperCase().replace("-", "_");

    View new_view = null;
    try {
      new_view = View.valueOf(cue);
    }
    catch (Exception e) {
      println(e);
    }
    
    println("Received cue: " + new_view);

    // switch view if we aren't already on it
    if (new_view != current_view) {
      println("Switching View");
      switchView(new_view);      
    }

  }

  // draw next frame of current view
  drawView(current_view);
}

void switchView(View new_view) {
  println(new_view);
  // cueInt = view;
}

void initScenes(){
  rain = new RainView(1);
}

void drawView(View view){
  switch (view) {
    case  CLEAR_DAY:
          CLEAR_NIGHT:
          RAIN:
            println("rain");
            rain.advance();
            break;

  }

}