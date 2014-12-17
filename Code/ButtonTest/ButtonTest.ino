#include "button.h"

// START_BUTTON_PIN is the main 'go' button
const int START_BUTTON_PIN = A0;

Button button(START_BUTTON_PIN);


void setup()
{
	Serial.begin(9600);
	Serial.println("Started LED Exposure Controller.");
	button.setInvert(true);
}

void loop() 
{
	// Refresh the button.
	button.update();
	
	Serial.println(button.read());
}
