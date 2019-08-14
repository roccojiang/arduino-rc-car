import processing.serial.*;

Serial port;

// EDIT PORT NAME HERE
String port_name = "/dev/cu.HC-05-DevB";
// String port_name = "/dev/cu.usbmodem1452301";

boolean up_pressed = false;
boolean down_pressed = false;
boolean left_pressed = false;
boolean right_pressed = false;

void setup()
{
  size(300, 300);
  
  println("Bluetooth Car Control");
  println("Arrow keys for movement");
  
  port = new Serial(this, port_name, 9600);
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
  
  if (down_pressed && left_pressed)
  {
    println("Backwards + left");
    port.write('4');
  }
  else if (down_pressed && right_pressed)
  {
    println("Backwards + right");
    port.write('5');
  }
  else if (down_pressed)
  {
    println("Backwards");
    port.write('6');
  }
  
  else
  {
    port.write(0);
    println("CLEAR");
  }
}
