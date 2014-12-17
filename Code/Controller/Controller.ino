#include "Encoder.h"

#include "button.h"
#include "clock.h"
#include "panel.h"

/* ***********************************************/
/* DEFINE THE PHYISICAL PINS USED ON THE ARDUINO */
/* ***********************************************/

// ENCODER_PIN_x are the two inputs from the encoder
const int ENCODER_PIN_A = 2;
const int ENCODER_PIN_B = 3;

// PANEL_ENABLE_PIN is the trigger for the main LED control
const int PANEL_ENABLE_PIN = 8;

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
Clock clock;
Encoder encoder(ENCODER_PIN_A, ENCODER_PIN_B);
Panel panel(PANEL_ENABLE_PIN);
Button button(START_BUTTON_PIN);


void setup()
{
	Serial.begin(9600);

	button.setInvert(true);
	
	clock.setShifterPins(4, 5, 6); //latch/clock/data  SRCLK/RCLK/SER
	clock.setDigitPins(7, 11, 10, 12);
	clock.stopBlinkingColon(true);
	clock.setSeconds(timer_seconds);
	
	encoder.write(timer_seconds*4);
	
	Serial.println("Started LED Exposure Controller.");
}

bool alarm_activated = false;
int encoderValue = -999;

void loop() 
{
	// Refresh the button.
	button.update();
	
	// Refresh the clock.
	clock.update();
	
	// Refresh the encoder.
	int newEncoderValue = encoder.read();
	
	
	// Process encoder input
	if(newEncoderValue != encoderValue)
	{
		// Clamp to zero
		if(newEncoderValue < 0)
		{
			newEncoderValue = 0;
			encoder.write(0);
		}
		
		// ignore small movements
		if(abs(newEncoderValue - encoderValue) > 3)
		{
			encoderValue = newEncoderValue;
			clock.setSeconds(encoderValue/4);
		}
	}
	
	
	// If the button has been pressed, start the timer
	static bool started = false;
	static bool last_button_state = false;
	if(!started)
	{
		bool button_state = button.read();
		if(button_state == true && last_button_state == false) // rising edge
		{
			clock.startBlinkingColon();
			clock.startCountdown();
			started = true;
			panel.on();
			last_button_state = button_state;
		}
	}
	
	// Rig a fake start 5s after bootup
	// static unsigned long startupTime = millis();
	// if((started == false) && (startupTime + 5000 < millis()))
	// {
		// clock.startBlinkingColon();
		// clock.startCountdown();
		// started = true;
		// panel.on();
	// }

	
	// The countdown has finished
	if(clock.getAlarm())
	{
		clock.stopBlinkingColon(true);
		panel.off();
		started = false;
	}
	
	// Debug
	// static unsigned long lastUpdate = millis();
	// if(lastUpdate + 1000 < millis())
	// {
		// Serial.print("button: "); Serial.print(button.read());
		// Serial.println();
		// lastUpdate = millis();
	// }
}
