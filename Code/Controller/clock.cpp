#include "Arduino.h"
#include "clock.h"

Clock::Clock()
{
	_latch_pin = -1;
	_clock_pin = -1;
	_data_pin = -1;
	
	_digit[0] = BIT_A | BIT_B | BIT_C | BIT_D | BIT_E | BIT_F;
	_digit[1] = BIT_B | BIT_C;
	_digit[2] = BIT_A | BIT_B | BIT_D | BIT_E | BIT_G;
	_digit[3] = BIT_A | BIT_B | BIT_C | BIT_D | BIT_G;
	_digit[4] = BIT_B | BIT_C | BIT_F | BIT_G;
	_digit[5] = BIT_A | BIT_C | BIT_D | BIT_F | BIT_G;
	_digit[6] = BIT_A | BIT_C | BIT_D | BIT_E | BIT_F | BIT_G;
	_digit[7] = BIT_A | BIT_B | BIT_C;
	_digit[8] = BIT_A | BIT_B | BIT_C | BIT_D | BIT_E | BIT_F | BIT_G;
	_digit[9] = BIT_A | BIT_B | BIT_C | BIT_F | BIT_G;
	
	_clock_time_ms = 0;
	_clock_started_ms = 0;
	_colon_blinking = false;
	_colon_enabled = false;
	_countdown_running = false;
	_countdown_ms = 0;
	_digit_scan = 0;
	_countdown_alarm = false;
	_colon_lastchanged_ms = 0;
	_display_mode = 0;
	_last_second = 0;
}

void Clock::setShifterPins(int latch, int clock, int data)
{
	_latch_pin = latch;
	_clock_pin = clock;
	_data_pin = data;
	pinMode(_latch_pin, OUTPUT);
	pinMode(_clock_pin, OUTPUT);
	pinMode(_data_pin, OUTPUT);
}

void Clock::setDigitPins(int digit_1, int digit_2, int digit_3, int digit_4)
{
	_digit_pins[0] = digit_1;
	_digit_pins[1] = digit_2;
	_digit_pins[2] = digit_3;
	_digit_pins[3] = digit_4;
	for(int i=0;i<4;i++)
	{
		pinMode(_digit_pins[i],OUTPUT);
	}
}

int Clock::getSeconds()
{
	return _clock_time_ms / 1000;
}

bool Clock::getAlarm()
{
	return _countdown_alarm;
}

void Clock::clearAlarm()
{
	_countdown_alarm = false;
}

void Clock::update()
{
	// See if we need to turn on the colon or not.
	if(_colon_blinking)
	{
		if(_colon_lastchanged_ms + 500 < millis())
		{
			_colon_enabled = !_colon_enabled;
			_colon_lastchanged_ms += 500; // We don't add 500 to millis() to prevent drift.
		}
	}

	// Handle any running countdown.
	if(_countdown_running)
	{
		// Calculate how long the clock has been running.
		unsigned long clock_running_millis = (millis() - _clock_started_ms);
		
		// Update how much time is left on the clock.
		long ms = _countdown_ms - clock_running_millis;
		if(ms < 0) {
			ms = 0;
			_countdown_running = false;
			_countdown_alarm = true;
		}
		
		_clock_time_ms = ms;
	}

	// Set the digits to display
	int minutesPart = (_clock_time_ms / 1000) / 60;
	int secondsPart = (_clock_time_ms / 1000) % 60;
	int millisPart = (_clock_time_ms / 10) % 100;
	
	switch(_display_mode)
	{
		case 0:
			_digit_buffer[0] = minutesPart / 10;
			_digit_buffer[1] = minutesPart % 10;
			_digit_buffer[2] = secondsPart / 10;
			_digit_buffer[3] = secondsPart % 10;
			break;
		
		case 1:
			_digit_buffer[0] = secondsPart / 10;
			_digit_buffer[1] = secondsPart % 10;
			_digit_buffer[2] = millisPart / 10;
			_digit_buffer[3] = millisPart % 10;
			break;
		
	}
	
	display();
	
	if(secondsPart != _last_second)
	{
		Serial.print("Clock: "); Serial.println(_clock_time_ms / 1000);
		_last_second = secondsPart;
	}
}


void Clock::display()
{
	// Turn off all digits
	for(byte j=0; j<4; j++)  
	{
		digitalWrite(_digit_pins[j], LOW);
	}
	
	// Reset all segments
	digitalWrite(_latch_pin, LOW);  
	shiftOut(_data_pin, _clock_pin, MSBFIRST, B11111111);
	digitalWrite(_latch_pin, HIGH);
	delayMicroseconds(50);

	// Get the bit-pattern to display.
	byte valueToShift = 0;
	if(_digit_buffer[_digit_scan] != -1)
	{
		valueToShift = _digit[_digit_buffer[_digit_scan]];
	}
	
	// See if we need to turn on the colon or not.
	static unsigned long _colon_lastchanged_ms = 0;
	if(_colon_enabled)
	{
		valueToShift = valueToShift | BIT_COL;
	}
	
	// Turn on the current digit to display.
	digitalWrite(_digit_pins[_digit_scan], HIGH);

	// Turn on the segments to display.
	digitalWrite(_latch_pin, LOW);  
	shiftOut(_data_pin, _clock_pin, MSBFIRST, ~valueToShift);
	digitalWrite(_latch_pin, HIGH);
	
	// Move on to the next digit on the next cycle.
	_digit_scan++;
	if(_digit_scan > 3)
	{
		_digit_scan = 0;
	}

}

void Clock::setSeconds(int seconds)
{	
	if(seconds < 0)
		seconds = 0;

	_clock_time_ms = (unsigned long)seconds * 1000;
	_countdown_ms = _clock_time_ms;
	clearAlarm();
}

void Clock::startCountdown()
{
	_countdown_running = true;
	_clock_started_ms = millis();
	_colon_lastchanged_ms = _clock_started_ms;
}

void Clock::stopCountdown()
{
	_countdown_running = false;
}

void Clock::startBlinkingColon()
{
	_colon_blinking = true;
}

void Clock::stopBlinkingColon(bool final_state)
{
	_colon_blinking = false;
	_colon_enabled = final_state;
}
