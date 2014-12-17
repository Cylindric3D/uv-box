#include "Arduino.h"
#include "button.h"

Button::Button(int pin)
{
	_button_pin = pin;
	_last_button_state = LOW;
	_button_state = LOW;
	_last_change_ms = 0;	
	_debounce_ms = 50;
	_is_inverted = false;
	pinMode(_button_pin, INPUT);
}


void Button::setInvert(bool is_inverted)
{
	_is_inverted = is_inverted;
	if(_is_inverted)
	{
		_last_button_state = HIGH;
		_button_state = HIGH;
	}
	else
	{
		_last_button_state = LOW;
		_button_state = LOW;
	}
}

void Button::update()
{
	int new_state = digitalRead(_button_pin);

	// A state-change has been detected
	if(new_state != _last_button_state) 
	{
		_last_change_ms = millis();
	}
	
	// If the button has been in the current state for long enough, keep that as the new state.
	if((millis() - _last_change_ms) > _debounce_ms)
	{
		if(new_state != _button_state)
		{
			_button_state = new_state;
		}
	}
	
	_last_button_state = new_state;
}

bool Button::read()
{
	if(_is_inverted)
		return !_button_state;
	else
		return _button_state;
}