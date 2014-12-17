#ifndef Panel_h
#define Panel_h

#include "Arduino.h"

class Panel
{
	public:
		// Constructor
		Panel(int pin);
		void on();
		void off();
		
	private:
		// Pin that controls panel power
		int _panel_pin;

};

#endif