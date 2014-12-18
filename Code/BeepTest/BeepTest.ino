#include "beep.h"

const int BEEP_PIN = 9;


Beep beep(BEEP_PIN);


// const int c = 261;
// const int d = 294;
// const int e = 329;
// const int f = 349;
// const int g = 391;
// const int gS = 415;
// const int a = 440;
// const int aS = 455;
// const int b = 466;
// const int cH = 523;
// const int cSH = 554;
// const int dH = 587;
// const int dSH = 622;
// const int eH = 659;
// const int fH = 698;
// const int fSH = 740;
// const int gH = 784;
// const int gSH = 830;
// const int aH = 880;


void setup()
{
	Serial.begin(9600);
	
	pinMode(BEEP_PIN, OUTPUT);
	
	
	// beep(a, 500);
	// beep(a, 500);    
	// beep(a, 500);
	// beep(f, 350);
	// beep(cH, 150);  
	// beep(a, 500);
	// beep(f, 350);
	// beep(cH, 150);
	// beep(a, 650);
 
	beep.beep(Beep::b, 200);
//	beep.melodyUp();
}

void loop() 
{
	beep.update();
	// static unsigned char t = 0;
	
	// Serial.println(t);
	// beep(200, t); 
	
	// t+= 10;
}


// void beep(int note, int duration)
// {
	// // if(tone <= 20)
		// // tone = 20;
		
	// // if(tone >= 255)
		// // tone = 254;

	// // tone(BEEP_PIN, note, duration);
	// // delay(duration);
	// // noTone(BEEP_PIN);
	// // delay(50);
	// // analogWrite(BEEP_PIN, tone);	// Almost any value can be used except 0 and 255
								// // // experiment to get the best tone
	// // delay(delayms);				// wait for a delayms ms
	// // analogWrite(BEEP_PIN, 0);	// 0 turns it off
	// // delay(delayms);				// wait for a delayms ms   
// }  