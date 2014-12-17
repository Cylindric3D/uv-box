// Storage register clock is pin 12 on the 74HC595, and might be labelled ST_CP or ????
int LATCH_PIN = 4;

// Shift register clock is pin 11 on the 74HC595, and might be labelled SH_CP or ????
int CLOCK_PIN = 5;

// Serial data input is pin 14 on the 74HC595, and might be labelled DS or SER
int DATA_PIN = 6;

const int digitPins[4] = {7,11,10,12};
 
const int SHIFT_PIN_1  =   1;
const int SHIFT_PIN_2  =   2;
const int SHIFT_PIN_3  =   4;
const int SHIFT_PIN_4  =   8;
const int SHIFT_PIN_5  =  16;
const int SHIFT_PIN_6  =  32;
const int SHIFT_PIN_7  =  64;
const int SHIFT_PIN_15 = 128;

const byte BIT_A   = SHIFT_PIN_4;
const byte BIT_B   = SHIFT_PIN_2;
const byte BIT_C   = SHIFT_PIN_6;
const byte BIT_D   = SHIFT_PIN_1;
const byte BIT_E   = SHIFT_PIN_7;
const byte BIT_F   = SHIFT_PIN_15;
const byte BIT_G   = SHIFT_PIN_3;
const byte BIT_COL = SHIFT_PIN_5;


//seven segment digits in bits
const byte digit[10] =      
{
	/* 0 */ BIT_A | BIT_B | BIT_C | BIT_D | BIT_E | BIT_F,
	/* 1 */ BIT_B | BIT_C,
	/* 2 */ BIT_A | BIT_B | BIT_D | BIT_E | BIT_G,
	/* 3 */ BIT_A | BIT_B | BIT_C | BIT_D | BIT_G,
	/* 4 */ BIT_B | BIT_C | BIT_F | BIT_G,
	/* 5 */ BIT_A | BIT_C | BIT_D | BIT_F | BIT_G,
	/* 6 */ BIT_A | BIT_C | BIT_D | BIT_E | BIT_F | BIT_G,
	/* 7 */ BIT_A | BIT_B | BIT_C,
	/* 8 */ BIT_A | BIT_B | BIT_C | BIT_D | BIT_E | BIT_F | BIT_G,
	/* 9 */ BIT_A | BIT_B | BIT_C | BIT_F | BIT_G
};

int digitBuffer[4] = {0};
int digitScan = 0;

void setup()
{
	for(int i=0;i<4;i++)
	{
		pinMode(digitPins[i],OUTPUT);
	}
	pinMode(LATCH_PIN, OUTPUT);
	pinMode(CLOCK_PIN, OUTPUT);
	pinMode(DATA_PIN, OUTPUT);
	
	Serial.begin(9600);
	Serial.println("Started LED Exposure Controller.");
}


void updateDisp() 
{
	// Turn off all digits
	for(byte j=0; j<4; j++)  
	{
		digitalWrite(digitPins[j], LOW);
	}
	
	// Not sure why the example code was zeroing first
	digitalWrite(LATCH_PIN, LOW);  
	shiftOut(DATA_PIN, CLOCK_PIN, MSBFIRST, B11111111);
	digitalWrite(LATCH_PIN, HIGH);
	delayMicroseconds(50);
	
	// Turn on the current digit to display
	digitalWrite(digitPins[digitScan], HIGH); 

	// Turn on the segments to display
	digitalWrite(LATCH_PIN, LOW);  

	shiftOut(DATA_PIN, CLOCK_PIN, MSBFIRST, ~digit[digitBuffer[digitScan]]);

	//byte n = BIT_B | BIT_B;
	//shiftOut(DATA_PIN, CLOCK_PIN, MSBFIRST, ~n);

	digitalWrite(LATCH_PIN, HIGH);
	
	// Prepare to move to the next digit on the next cycle
	digitScan++;
	if(digitScan>3) 
	{
		digitScan=0; 
	}
}


int numToDisplay = 0;

void loop() 
{
	digitBuffer[0] = numToDisplay/1000;
	digitBuffer[1] = (numToDisplay%1000)/100;
	digitBuffer[2] = (numToDisplay%100)/10;
	digitBuffer[3] = (numToDisplay%100)%10;

	updateDisp();
		
	static unsigned long last_update = 0;
	if(last_update + 200 < millis())
	{
		numToDisplay++;
		if(numToDisplay == 10000) numToDisplay = 0;
		last_update = millis();
		
		Serial.print(digitBuffer[0]); Serial.print("  ");
		Serial.print(digitBuffer[1]); Serial.print("  ");
		Serial.print(digitBuffer[2]); Serial.print("  ");
		Serial.print(digitBuffer[3]); Serial.println("  ");
	}
}
