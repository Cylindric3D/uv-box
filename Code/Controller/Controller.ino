#include <EEPROM.h>
#include "Encoder.h"

#include "beep.h"
#include "button.h"
#include "clock.h"
#include "memory.h"
#include "panel.h"

/* ***********************************************/
/* DEFINE THE PHYISICAL PINS USED ON THE ARDUINO */
/* ***********************************************/

// SHIFT_X_PIN are the three inputs to the shift-register.
const int SHIFT_LATCH_PIN = 4;
const int SHIFT_CLOCK_PIN = 5;
const int SHIFT_DATA_PIN = 6;

// DIGIT_X_PIN are the four digit-enable pins.
const int DIGIT_1_PIN = 7;
const int DIGIT_2_PIN = 11;
const int DIGIT_3_PIN = 10;
const int DIGIT_4_PIN = 12;

// ENCODER_PIN_x are the two inputs from the encoder.
const int ENCODER_PIN_A = 2;
const int ENCODER_PIN_B = 3;

// PANEL_ENABLE_PIN is the trigger for the main LED control.
const int PANEL_ENABLE_PIN = 8;

// START_BUTTON_PIN is the main 'go' button.
const int START_BUTTON_PIN = A0;

// BEEP_PIN is the buzzer pin.
const int BEEP_PIN = 9;

/* ***********************************************/
/* SETUP THE PARAMETERS                          */
/* ***********************************************/

// Each physical 'click' of the encoder results in this many increments of the encoder counter.
const int ENCODER_STEPS_PER_CLICK = 4;

// The number of seconds to beep for.
const int TOTAL_COUNTDOWN_BEEPS = 3;

// How long to wait before resetting the clock display.
const int CLOCK_RESET_DELAY = 2000;


/* ***********************************************/
/* START                                         */
/* ***********************************************/

Beep beep(BEEP_PIN);
Button button(START_BUTTON_PIN);
Clock clock;
Encoder encoder(ENCODER_PIN_A, ENCODER_PIN_B);
Memory memory;
Panel panel(PANEL_ENABLE_PIN);



const int STATE_STARTUP    = 1; // Controller is still starting up.
const int STATE_READY      = 2; // Ready for input from the user.
const int STATE_ACTIVE     = 4; // Countdown is running and lamps are on.
const int STATE_RESETTING  = 8; // Countdown is complete and clock will reset.



// state is used to track the current state of the controller.
int state;

unsigned long last_state_change = 0;



void setState(int newstate)
{
	state = newstate;
	last_state_change = millis();
	Serial.print("New state is "); Serial.println(newstate);
}



void setup()
{
	state = STATE_STARTUP;
	Serial.begin(9600);
	delay(1000);

	button.setInvert(true);
	
	clock.setShifterPins(SHIFT_LATCH_PIN, SHIFT_CLOCK_PIN, SHIFT_DATA_PIN);
	clock.setDigitPins(DIGIT_1_PIN, DIGIT_2_PIN, DIGIT_3_PIN, DIGIT_4_PIN);
	clock.stopBlinkingColon(true);
	clock.setSeconds(memory.getClockSeconds());
	
	encoder.write(memory.getClockSeconds() * ENCODER_STEPS_PER_CLICK);
	
	Serial.println("Started LED Exposure Controller.");
	beep.melodyUp();
	
	setState(STATE_READY);
}

bool alarm_activated = false;
int encoderValue = -999;


void loop() 
{
	// Refresh the button.
	button.update();
	
	// Refresh the clock.
	clock.update();
	
	// Refresh the beeper.
	beep.update();
	
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
			memory.setClockSeconds(encoderValue / ENCODER_STEPS_PER_CLICK);
			clock.setSeconds(memory.getClockSeconds());
			Serial.print("Encoder: "); Serial.println(encoderValue);
		}
		
	}
	

	// See if the button has been clicked
	static bool last_button_state = false;
	bool button_state = button.read();
	if(button_state == true && last_button_state == false) // falling edge
	{
		Serial.println("Button pressed!");
		
		// The button press has been detected
		if(STATE_ACTIVE & state)
		{
			// The button was pressed while the countdown is running
			// Stop the countdown
			Serial.println("Stopping countdown.");
			clock.stopBlinkingColon(true);
			clock.stopCountdown();
			setState(STATE_RESETTING);
			panel.off();
		}
		else if(STATE_READY & state)
		{
			// The button was pressed while the countdown is not running
			// Start the countdown
			Serial.print("Starting countdown at "); Serial.println(millis());
			clock.startBlinkingColon();
			clock.startCountdown();
			setState(STATE_ACTIVE);
			panel.on();
		}
		else
		{
			Serial.println("Doing nothing");
		}

	}
	last_button_state = button_state;

	
	// If we're resetting the clock display for any reason, do it now
	if(STATE_RESETTING & state)
	{
		if(last_state_change + CLOCK_RESET_DELAY <= millis())
		{
			clock.setSeconds(memory.getClockSeconds());
			setState(STATE_READY);
		}
	}


	// If the countdown is running and we're near the end, start beeping.
	static int countdownbeeps = TOTAL_COUNTDOWN_BEEPS;
	if(state == STATE_ACTIVE && countdownbeeps == clock.getSeconds() + 1)
	{
		beep.beep(Beep::b, 200);
		countdownbeeps--;
	}

	
	
	// The countdown has finished
	if(clock.getAlarm())
	{
		Serial.print("Alarm triggered at "); Serial.println(millis());
		clock.clearAlarm();
		clock.stopBlinkingColon(true);
		panel.off();
		setState(STATE_RESETTING);
		beep.beep(Beep::fH, 600);
		countdownbeeps = TOTAL_COUNTDOWN_BEEPS;
		memory.save();
	}

}
