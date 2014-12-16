#include "Arduino.h"
#include "clock.h"

Clock::Clock()
{
	digit[0] = BIT_A | BIT_B | BIT_C | BIT_D | BIT_E | BIT_F;
	digit[1] = BIT_B | BIT_C;
	digit[2] = BIT_A | BIT_B | BIT_D | BIT_E | BIT_G;
	digit[3] = BIT_A | BIT_B | BIT_C | BIT_D | BIT_G;
	digit[4] = BIT_B | BIT_C | BIT_F | BIT_G;
	digit[5] = BIT_A | BIT_C | BIT_D | BIT_F | BIT_G;
	digit[6] = BIT_A | BIT_C | BIT_D | BIT_E | BIT_F | BIT_G;
	digit[7] = BIT_A | BIT_B | BIT_C;
	digit[8] = BIT_A | BIT_B | BIT_C | BIT_D | BIT_E | BIT_F | BIT_G;
	digit[9] = BIT_A | BIT_B | BIT_C | BIT_F | BIT_G;
	
	clockTimeMillis = 0;
	clockStartTime = 0;
	colonIsBlinking = false;
	colonEnabled = false;
	countdownRunning = false;
	countdownMillis = 0;
	digitScan = 0;
	countdownAlarm = false;
	lastColonChange = 0;
}

void Clock::setEncoderPins(int latch, int clock, int data)
{
	LATCH_PIN = latch;
	CLOCK_PIN = clock;
	DATA_PIN = data;
	pinMode(LATCH_PIN, OUTPUT);
	pinMode(CLOCK_PIN, OUTPUT);
	pinMode(DATA_PIN, OUTPUT);
}

void Clock::setDigitPins(int digit_1, int digit_2, int digit_3, int digit_4)
{
	digitPins[0] = digit_1;
	digitPins[1] = digit_2;
	digitPins[2] = digit_3;
	digitPins[3] = digit_4;
	for(int i=0;i<4;i++)
	{
		pinMode(digitPins[i],OUTPUT);
	}
}

unsigned long Clock::getSeconds()
{
	return clockTimeMillis / 1000;
}

bool Clock::getAlarm()
{
	return countdownAlarm;
}

void Clock::update()
{
	// See if we need to turn on the colon or not.
	if(colonIsBlinking)
	{
		if(lastColonChange + 500 < millis())
		{
			colonEnabled = !colonEnabled;
			lastColonChange = millis();
		}
	}

	// Handle any running countdown.
	if(countdownRunning)
	{
		// Calculate how long the clock has been running.
		unsigned long clock_running_millis = (millis() - clockStartTime);
		
		// Update how much time is left on the clock.
		long ms = countdownMillis - clock_running_millis;
		if(ms < 0) {
			ms = 0;
			countdownRunning = false;
			countdownAlarm = true;
		}
		
		clockTimeMillis = ms;
	}

	// Set the digits to display
	int minutesPart = (clockTimeMillis / 1000) / 60;
	int secondsPart = (clockTimeMillis / 1000) % 60;

	digitBuffer[0] = minutesPart / 10;
	digitBuffer[1] = minutesPart % 10;
	digitBuffer[2] = secondsPart / 10;
	digitBuffer[3] = secondsPart % 10;
	
	display();
}


void Clock::display()
{
	// Turn off all digits
	for(byte j=0; j<4; j++)  
	{
		digitalWrite(digitPins[j], LOW);
	}
	
	// Reset all segments
	digitalWrite(LATCH_PIN, LOW);  
	shiftOut(DATA_PIN, CLOCK_PIN, MSBFIRST, B11111111);
	digitalWrite(LATCH_PIN, HIGH);
	delayMicroseconds(50);

	// Get the bit-pattern to display.
	byte valueToShift = 0;
	if(digitBuffer[digitScan] != -1)
	{
		valueToShift = digit[digitBuffer[digitScan]];
	}
	
	// See if we need to turn on the colon or not.
	static unsigned long lastColonChange = 0;
	if(colonEnabled)
	{
		valueToShift = valueToShift | BIT_COL;
	}
	
	// Turn on the current digit to display.
	digitalWrite(digitPins[digitScan], HIGH);

	// Turn on the segments to display.
	digitalWrite(LATCH_PIN, LOW);  
	shiftOut(DATA_PIN, CLOCK_PIN, MSBFIRST, ~valueToShift);
	digitalWrite(LATCH_PIN, HIGH);
	
	// Move on to the next digit on the next cycle.
	digitScan++;
	if(digitScan > 3)
	{
		digitScan = 0;
	}

}

void Clock::setSeconds(int seconds)
{	
	clockTimeMillis = (unsigned long)seconds * 1000;
	countdownMillis = (unsigned long)seconds * 1000;
}

void Clock::startCountdown()
{
	countdownRunning = true;
	clockStartTime = millis();
	lastColonChange = clockStartTime;
}

void Clock::startBlinkingColon()
{
	colonIsBlinking = true;
}

void Clock::stopBlinkingColon(bool final_state)
{
	colonIsBlinking = false;
	colonEnabled = final_state;
}
