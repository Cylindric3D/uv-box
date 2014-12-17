const int BEEP_PIN = A1;


void setup()
{
	pinMode(BEEP_PIN, OUTPUT);

	beep(50);
	beep(50);
	beep(50);
	delay(1000);
}

void loop() 
{
	beep(200); 
}

void beep(unsigned char delayms){
	analogWrite(BEEP_PIN, 20);	// Almost any value can be used except 0 and 255
								// experiment to get the best tone
	delay(delayms);				// wait for a delayms ms
	analogWrite(BEEP_PIN, 0);	// 0 turns it off
	delay(delayms);				// wait for a delayms ms   
}  