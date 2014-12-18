#ifndef Beep_h
#define Beep_h

class Beep
{
	public:
		
		enum notes_t
		{
			c = 261,
			d = 294,
			e = 329,
			f = 349,
			g = 391,
			gS = 415,
			a = 440,
			aS = 455,
			b = 466,
			cH = 523,
			cSH = 554,
			dH = 587,
			dSH = 622,
			eH = 659,
			fH = 698,
			fSH = 740,
			gH = 784,
			gSH = 830,
			aH = 880
		};

		// Constructor
		Beep(int pin);
		
		// Call this every time through the loop
		void update();

		// Make a sound
		void beep(notes_t note, unsigned long delayms);
		
		void melodyUp();

		
	private:

		enum beep_t
		{
			NONE,
			BEEPING,
			MELODY_UP
		};

		// Pin that the piezo is connected to.
		int _beep_pin;

		unsigned long _end_time;
		beep_t _state;

};

#endif