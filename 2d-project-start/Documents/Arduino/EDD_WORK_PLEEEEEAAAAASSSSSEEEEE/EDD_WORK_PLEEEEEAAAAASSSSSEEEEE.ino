
const int trigPin = 3; 
const int echoPin = 2; 
const int buttPin = 7;

long duration, cm;

void setup() 
{
  Serial.begin(9600);  
  pinMode(trigPin, OUTPUT);  
  pinMode(echoPin, INPUT);

  pinMode(buttPin, INPUT);
}

void loop()
{
  digitalWrite(trigPin, LOW); 
  delayMicroseconds(2);  
  digitalWrite(trigPin, HIGH);  
  delayMicroseconds(10);  
  digitalWrite(trigPin, LOW);

  int buttState = digitalRead(buttPin);

  // Read the signal from the sensor: a HIGH pulse whose  
  // duration is the time (in microseconds) from the sending  
  // of the ping to the reception of its echo off of an object.

  duration = pulseIn(echoPin, HIGH);

  // convert the time into a distance
  cm = (duration/2)/29.1;

  // check if the button is pressed
  // when pressed, it will start checking for the distance from the ultrasonic sensor
  if (buttState == HIGH) 
  {
    // checks if the distance is close or far
    if(cm < 50)
    {
      // when the diatance is far, sends a signal to the app to activate alarm
      Serial.println("d"); 
      delay(150);
    }
    else
    {
      // when the distance is close, sends a signal to the app to deactivate alarm
      Serial.println("a"); 
      delay(150);
    }

  }  
  // Checks if the button is not pressed down
  else if (buttState == LOW) 
  {
    // sends a signal which de-activates alarm
      Serial.println("n"); 
      delay(150);
  }
}