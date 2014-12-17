#ifndef Button_h
#define Button_h

#include "Arduino.h"

class Button
{
	public:
		// Constructor
		Button(int pin);
		
		// Call this every time through the loop
		void update();
		
		// Returns true if the button is pressed; else false.
		bool read();
		
		// Reverse the default state of the button. On becomes off.
		void setInvert(bool is_inverted);
		
	private:
		// Pin that the button is connected to.
		int _button_pin;
		
		// The current (known) button state.
		int _button_state;
		
		// The state at the last update.
		int _last_button_state;
		
		// The last time that a change was detected.
		unsigned long _last_change_ms;
		
		// The Debounce time.
		int _debounce_ms;
		
		// Is the button state reversed or not?
		bool _is_inverted;
		

};

#endif