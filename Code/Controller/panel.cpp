#include "Arduino.h"
#include "panel.h"

Panel::Panel(int pin)
{
	_panel_pin = pin;

	pinMode(_panel_pin, OUTPUT);
	off();
}


void Panel::on()
{
	digitalWrite(_panel_pin, HIGH);
}

void Panel::off()
{
	digitalWrite(_panel_pin, LOW);
}