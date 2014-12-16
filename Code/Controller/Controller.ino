#include "clock.h"
Clock clock;

/* ***********************************************/
/* DEFINE THE PHYISICAL PINS USED ON THE ARDUINO */
/* ***********************************************/

// ENCODER_PIN_x are the two inputs from the encoder
const int ENCODER_PIN_A = 8;
const int ENCODER_PIN_B = 9;

// PANEL_ENABLE_PIN is the trigger for the main LED control
const int PANEL_ENABLE_PIN = 6;

// START_BUTTON_PIN is the main 'go' button
const int START_BUTTON_PIN = A0;


/* ***********************************************/
/* SETUP THE PARAMETERS                          */
/* ***********************************************/
// How long the timer will run for.
int timer_seconds = 10;

// Refresh-period of the display
int refresh_millis = 200;


/* ***********************************************/
/* START                                         */
/* ***********************************************/

void setup()
{
	Serial.begin(9600);

	clock.setEncoderPins(2, 3, 4);
	clock.setDigitPins(7, 11, 10, 12);
	clock.stopBlinkingColon(true);
	clock.setSeconds(timer_seconds);
	
	Serial.println("Started LED Exposure Controller.");
}

bool alarm_activated = false;

void loop() 
{
	// Refresh the clock.
	clock.update();
	
	static unsigned long startupTime = millis();
	static bool started = false;
	if((started == false) && (startupTime + 5000 < millis()))
	{
		clock.startBlinkingColon();
		clock.startCountdown();
		started = true;
	}

	if(clock.getAlarm())
	{
		clock.stopBlinkingColon(true);
		clock.setSeconds(timer_seconds);
	}
	
	// Debug
	static unsigned long lastUpdate = millis();
	if(lastUpdate + 1000 < millis())
	{
		Serial.print("clock: "); Serial.print(clock.getSeconds()); Serial.print(" ");
		if(clock.getAlarm())
		{
			Serial.print("alarm: activated ");
		}
		Serial.println();
		lastUpdate = millis();
	}
}
