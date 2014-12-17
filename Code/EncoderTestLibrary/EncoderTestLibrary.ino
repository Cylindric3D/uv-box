#include "Encoder.h"

int ENC_A = 2;
int ENC_B = 3;


volatile boolean fired = false;
volatile long rotaryCount = 0;

Encoder encoder(ENC_A, ENC_B);

void setup()
{
	Serial.begin(9600);
}

long encval = -999;

void loop() 
{
	long newEnc = encoder.read();
	if(newEnc != encval)
	{
		Serial.println(newEnc/4);
		encval = newEnc;
	}
}
