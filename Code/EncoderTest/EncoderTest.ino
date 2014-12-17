// Pro Micro Interruptable pins:
// pin 0 is interrupt 2
// pin 1 is interrupt 3
// pin 2 is interrupt 1
// pin 3 is interrupt 0
// pin 7 is interrupt 4

// UNO Interrupt pins:
// pin 2 is interrupt 0
// pin 3 is interrupt 1

int ENC_A = 2;
int ENC_B = 3;

int INT_A = 0;
int INT_B = 1;

//http://www.gammon.com.au/forum/?id=11130
volatile boolean fired = false;
volatile long rotaryCount = 0;

void setup()
{
	pinMode(ENC_A, INPUT);
	pinMode(ENC_B, INPUT);
	digitalWrite(ENC_A, HIGH);
	digitalWrite(ENC_B, HIGH);
	attachInterrupt (INT_A, isr, CHANGE);   // pin 2
	attachInterrupt (INT_B, isr, CHANGE);   // pin 3
	
	Serial.begin(9600);
}

int timerValue = 0;

void loop() 
{
	
	if (fired)
    {
		long currentCount;

		// protected access to the counter
		noInterrupts ();
		currentCount = rotaryCount;
		interrupts ();
		
		Serial.print("RC:");
		Serial.print(rotaryCount);
		if(abs(currentCount) > 3)
		{
			if(currentCount > 0)
				timerValue += 1;
			else
				timerValue -= 1;

			rotaryCount = 0;
		}

		Serial.print("\tTV:");
		Serial.println(timerValue);
		fired = false;
	}  // end if fired
}

void isr()
{
	static boolean ready;
	static unsigned long lastFiredTime;
	static byte pinA, pinB;  

	// wait for main program to process it
	if (fired)
		return;

	byte newPinA = digitalRead(ENC_A);
	byte newPinB = digitalRead(ENC_B);

	// Forward is: LH/HH or HL/LL
	// Reverse is: HL/HH or LH/LL

	// so we only record a turn on both the same (HH or LL)

	if (newPinA == newPinB)
	{
		if (ready)
		{
			long increment = 1;

			// if they turn the encoder faster, make the count go up more
			// (use for humans, not for measuring ticks on a machine)
			unsigned long now = millis ();
			unsigned long interval = now - lastFiredTime;
			lastFiredTime = now;

			if (interval < 10)
			{
				increment = 5;
			}
			else if (interval < 20)
			{
				increment = 3;
			}
			else if (interval < 50)
			{
				increment = 2;
			}

			if (newPinA == HIGH)  // must be HH now
			{
				if (pinA == LOW)
				{
					rotaryCount += increment;
				}
				else
				{
					rotaryCount -= increment;
				}
			}
			else // must be LL now
			{
				if (pinA == LOW) 
				{
					rotaryCount -= increment;
				}
				else
				{
					rotaryCount += increment;
				}
			}
			fired = true;
			ready = false;
		}  // end of being ready
	}  // end of completed click
	else
	{
		ready = true;
	}
	
	pinA = newPinA;
	pinB = newPinB;
}