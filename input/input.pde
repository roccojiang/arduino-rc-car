import processing.serial.*;

Serial port;

boolean up_pressed = false;
boolean down_pressed = false;
boolean left_pressed = false;
boolean right_pressed = false;

void setup()
{
  size(300, 300);
  
  println("Bluetooth Car Control");
  println("wasd for movement, space to stop");
  
  // port = new Serial(this, "/dev/cu.HC-06-DevB", 9600);
  port = new Serial(this, "/dev/cu.usbmodem1452301", 9600);
}

void keyPressed()
{
  if (keyCode == UP) up_pressed = true;
  else if (keyCode == DOWN) down_pressed = true;
  else if (keyCode == LEFT) left_pressed = true;
  else if (keyCode == RIGHT) right_pressed = true;
}

void keyReleased()
{
  if (keyCode == UP) up_pressed = false;
  else if (keyCode == DOWN) down_pressed = false;
  else if (keyCode == LEFT) left_pressed = false;
  else if (keyCode == RIGHT) right_pressed = false;
}

void draw()
{
  // NEED TO COMBINE FORWARD/LEFT, FORWARD/RIGHT, BACKWARD/LEFT, BACKWARD/RIGHT, ETC.
  if (up_pressed && left_pressed)
  {
    println("Forwards + left");
    port.write('1');
  }
  else if (up_pressed && right_pressed)
  {
    println("Forwards + right");
    port.write('2');
  }
  else if (up_pressed)
  {
    println("Forwards");
    port.write('3');
  }
  
  if (down_pressed)
  {
    println("Driving backwards");
    port.write('s');
  }
  if (left_pressed)
  {
    println("Turning left");
    port.write('a');
  }
  if (right_pressed)
  {
    println("Turning right");
    port.write('d');
  }
  
  else
  {
    port.write(0);
    println("CLEAR");
  }
}
