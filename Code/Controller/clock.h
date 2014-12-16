#ifndef Clock_h
#define Clock_h

#include "Arduino.h"

// digitPins are the four pins connected to the four anodes of the display, left to right
//const int digitPins[4] = {15, 14, 10, 16};
const int digitPins[4] = {7, 11, 10, 12};

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
const byte BIT_C   = SHIFT_PIN_6;
const byte BIT_D   = SHIFT_PIN_1;
const byte BIT_E   = SHIFT_PIN_7;
const byte BIT_F   = SHIFT_PIN_15;
const byte BIT_G   = SHIFT_PIN_3;
const byte BIT_COL = SHIFT_PIN_5;

class Clock
{
	public:
		Clock();
		void setEncoderPins(int latch, int clock, int data);
		void setDigitPins(int digit_1, int digit_2, int digit_3, int digit_4);
		void update();
		void setSeconds(int seconds);
		void setDisplay(int number);
		void startCountdown();
		void startBlinkingColon();
		void stopBlinkingColon(bool final_state = false);
		
		unsigned long getSeconds();
		bool getAlarm();
		
		
	private:
		// LATCH_PIN is pin 11 on the 74HC595, and might be labelled ST_CP or SRCLK
		int LATCH_PIN;

		// DATA_PIN is pin 12 on the 74HC595, and might be labelled SH_CP or RCLK
		int CLOCK_PIN;

		// DATA_PIN is pin 14 on the 74HC595, and might be labelled DS or SER
		int DATA_PIN;

		// digitPins are the four pins connected to the four anodes of the display, left to right
		//const int digitPins[4] = {15, 14, 10, 16};
		int digitPins[4];

		//seven segment digits in bits
		byte digit[10];
		
		int digitBuffer[4];
		int digitScan;
		bool colonIsBlinking;
		bool colonEnabled;
		bool countdownRunning;
		bool countdownAlarm;
		unsigned long clockTimeMillis;
		unsigned long clockStartTime;
		unsigned long countdownMillis;
		unsigned long lastColonChange;

		void display();
		void updateClock();
		void updateNumeric();

};

#endif