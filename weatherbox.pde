import processing.net.*;

OPC opc;
PFont font;

Server cueServer;
Client cueClient;
View current_view = View.CLEAR_DAY;

RainView rain;
SnowView snow;
ClearDayView clear_day;
ClearNightView clear_night;
WindView wind;
FogView fog;
CloudyView cloudy_view;
PartlyCloudyDayView partly_cloudy_day;
PartlyCloudyNightView partly_cloudy_night;


void setup()
{
  size(360, 360);
  // Connect to the local instance of fcserver
  opc = new OPC(this, "127.0.0.1", 7890);

  // Map an 8x8 grid of LEDs to the center of the window
  opc.ledGrid8x7(0, width/2, height/2, height / 10.0, 0, false);

  // Create server to recieve display cues from external client
  cueServer = new Server(this, 12345);
  font = createFont("Arial Bold",48);
  
  initScenes(); 

}

void draw()
{

  // recieve data from cue server
  Client cueClient = cueServer.available();
  if (cueClient != null) {
    
    // get string from client and reformat so it can be matched against View enum
    String cue = cueClient.readString().trim().toUpperCase().replace("-", "_");
    println("Received cue: " + cue);

    View new_view = null;
    try {
      new_view = View.valueOf(cue);
    }
    catch (Exception e) {
      println(e);
    }

    // switch view if we aren't already on it
    if (new_view != current_view) {
      switchView(new_view);      
    }
  }

  // draw next frame of current view
  drawView(current_view);
  textFont(font,18);

  // gray int frameRate display:
  fill(200);
  text(int(frameRate),20,50);  
}

void switchView(View new_view) {
  println(new_view);
  if (new_view != null) {
    current_view = new_view; 
    noTint();   
  }
  else {
    println("Error: invalid cue input");
  }
}

void initScenes(){
  rain = new RainView(1);
  snow = new SnowView(2);
  clear_day = new ClearDayView();
  clear_night = new ClearNightView();
  wind = new WindView();
  fog = new FogView();
  cloudy_view = new CloudyView();
  partly_cloudy_day = new PartlyCloudyDayView();
  partly_cloudy_night = new PartlyCloudyNightView();
}

void drawView(View view){
  switch (view) {
    case RAIN:
      rain.advance();
      break;
    case SNOW:
      snow.advance();
      break;
    case CLEAR_DAY:
      clear_day.advance();
      break;
    case CLEAR_NIGHT:
      clear_night.advance();
      break;
    // case SLEET:
    //   break;
    case WIND:
      wind.advance();
      break;
    case FOG:
      fog.advance();
      break;
    case CLOUDY:
      break;
    case PARTLY_CLOUDY_DAY:
      partly_cloudy_day.advance();
      break;
    case PARTLY_CLOUDY_NIGHT:
      partly_cloudy_night.advance(); 
      break;

  }

}
