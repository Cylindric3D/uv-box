// LATCH_PIN is pin 11 on the 74HC595, and might be labelled ST_CP or SRCLK
#define LATCH_PIN 2

// DATA_PIN is pin 12 on the 74HC595, and might be labelled SH_CP or RCLK
#define CLOCK_PIN 3

// DATA_PIN is pin 14 on the 74HC595, and might be labelled DS or SER
#define DATA_PIN 4

const int digitPins[4] = {5,6,7,8};
 
// Bit values for defining connections between the shift-register and the LED segments
#define BIT_A 1
#define BIT_B 2
#define BIT_C 4
#define BIT_D 8
#define BIT_E 16
#define BIT_F 32
#define BIT_G 64
#define BIT_COL 128

//seven segment digits in bits
const byte digit[10] =      
{
	/* 0 */ BIT_A | BIT_B | BIT_C | BIT_D | BIT_E | BIT_F,
	/* 1 */ BIT_A | BIT_B,
	/* 2 */ BIT_A | BIT_B | BIT_D | BIT_F | BIT_G,
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
	//digitalWrite(LATCH_PIN, LOW);  
	//shiftOut(DATA_PIN, CLOCK_PIN, MSBFIRST, B11111111);
	//digitalWrite(LATCH_PIN, HIGH);
	//delayMicroseconds(50);
	
	// Turn on the current digit to display
	digitalWrite(digitPins[digitScan], HIGH); 

	// Turn on the segments to display
	digitalWrite(LATCH_PIN, LOW);  
	shiftOut(DATA_PIN, CLOCK_PIN, MSBFIRST, ~digit[digitBuffer[digitScan]]);
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
	}
}
