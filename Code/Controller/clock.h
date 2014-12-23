#ifndef Clock_h
#define Clock_h

#include "Arduino.h"

// Bit values for defining connections between the shift-register and the LED segments
const int SHIFT_PIN_1  =   1;
const int SHIFT_PIN_2  =   2;
const int SHIFT_PIN_3  =   4;
const int SHIFT_PIN_4  =   8;
const int SHIFT_PIN_5  =  16;
const int SHIFT_PIN_6  =  32;
const int SHIFT_PIN_7  =  64;
const int SHIFT_PIN_15 = 128;

const byte BIT_A   = SHIFT_PIN_4;
const byte BIT_B   = SHIFT_PIN_2;
const byte BIT_C   = SHIFT_PIN_5;
const byte BIT_D   = SHIFT_PIN_1;
const byte BIT_E   = SHIFT_PIN_6;
const byte BIT_F   = SHIFT_PIN_15;
const byte BIT_G   = SHIFT_PIN_3;
const byte BIT_COL = SHIFT_PIN_7;

class Clock
{
	public:
		// Constructor
		Clock();
		
		// Set the pins connected to the shift register.
		void setShifterPins(int latch, int clock, int data);
		
		// Set the pins connected to the four digit-enable pins.
		void setDigitPins(int digit_1, int digit_2, int digit_3, int digit_4);
		
		// Call update to recalculate the state of the clock and to cause an update.
		void update();
		
		// Set the current time on the clock, in seconds. 
		// Values lower than zero will be clamped to zero.
		// Resets the state of getAlarm().
		void setSeconds(int seconds);
		
		// Start counting down the clock. A time must first be set with setSecods().
		void startCountdown();
		
		// Stop counting down the clock.
		void stopCountdown();
		
		// Start blinking the colon.
		void startBlinkingColon();
		
		// Stop blinking the colon, leaving it in the final_state.
		void stopBlinkingColon(bool final_state = false);
		
		// Get the current time on the clock, in seconds.
		int getSeconds();
		
		// Get the current state of the alarm. Returns true if a countdown has expired; else false.
		bool getAlarm();
		
		// Clear a current alarm state.
		void clearAlarm();
		
		
	private:
		// Storage register clock is pin 12 on the 74HC595, and might be labelled ST_CP
		int _latch_pin;

		// Shift register clock is pin 11 on the 74HC595, and might be labelled SH_CP
		int _clock_pin;

		// Serial data input is pin 14 on the 74HC595, and might be labelled DS or SER
		int _data_pin;

		// _digit_pins are the four pins connected to the four anodes of the display, left to right
		int _digit_pins[4];

		//seven segment digits in bits
		byte _digit[10];
		
		int _display_mode;
		int _digit_buffer[4];
		int _digit_scan;
		bool _colon_blinking;
		bool _colon_enabled;
		bool _countdown_running;
		bool _countdown_alarm;
		unsigned long _clock_time_ms;
		unsigned long _clock_started_ms;
		unsigned long _countdown_ms;
		unsigned long _colon_lastchanged_ms;
		int _last_second;

		void display();

};

#endif