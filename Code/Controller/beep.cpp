#include "Arduino.h"
#include "beep.h"

/*
const int c = 261;
const int d = 294;
const int e = 329;
const int f = 349;
const int g = 391;
const int gS = 415;
const int a = 440;
const int aS = 455;
const int b = 466;
const int cH = 523;
const int cSH = 554;
const int dH = 587;
const int dSH = 622;
const int eH = 659;
const int fH = 698;
const int fSH = 740;
const int gH = 784;
const int gSH = 830;
const int aH = 880;
*/






Beep::Beep(int pin)
{
	_beep_pin = pin;
	_end_time = millis();
	_state = NONE;
	
	pinMode(_beep_pin, OUTPUT);
}


void Beep::update()
{
	switch(_state)
	{
		case MELODY_UP:
			if(millis() >= _end_time)
			{
				melodyUp();
			}
			break;
			
		case BEEPING:
			if(millis() >= _end_time)
			{
				noTone(_beep_pin);
				_state = NONE;
			}
			break;
	}
}


void Beep::beep(notes_t note, unsigned long delayms){
	// start beeping
	Serial.print("Beeping "); Serial.print(note); Serial.print(" for "); Serial.print(delayms); Serial.println("ms");
	_end_time = millis() + delayms;
	tone(_beep_pin, note);
	_state = BEEPING;
}


void Beep::melodyUp()
{
	static int note = 0;
	_state = MELODY_UP;
	switch(note)
	{
		case 0: tone(_beep_pin, 261); _end_time = millis() + 100; break;
		case 1: tone(_beep_pin, 294); _end_time = millis() + 100; break;
		case 2: tone(_beep_pin, 329); _end_time = millis() + 100; break;
		default: noTone(_beep_pin); note = -1; _state = NONE;
	}
	note++;
}
