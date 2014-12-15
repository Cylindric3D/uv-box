/* ***********************************************/
/* DEFINE THE PHYISICAL PINS USED ON THE ARDUINO */
/* ***********************************************/

// ENCODER_PIN_x are the two inputs from the encoder
const int ENCODER_PIN_A = 8;
const int ENCODER_PIN_B = 9;

// PANEL_ENABLE_PIN is the trigger for the main LED control
const int PANEL_ENABLE_PIN = 6;

// START_BUTTON_PIN is the main 'go' button
const int START_BUTTON_PIN = A0;

// LATCH_PIN is pin 11 on the 74HC595, and might be labelled ST_CP or SRCLK
const int LATCH_PIN = 2;

// DATA_PIN is pin 12 on the 74HC595, and might be labelled SH_CP or RCLK
const int CLOCK_PIN = 3;

// DATA_PIN is pin 14 on the 74HC595, and might be labelled DS or SER
const int DATA_PIN = 4;

// digitPins are the four pins connected to the four anodes of the display, left to right
const int digitPins[4] = {15,14,10,16};

// Bit values for defining connections between the shift-register and the LED segments
const int SHIFT_PIN_1  =   1;
const int SHIFT_PIN_2  =   2;
const int SHIFT_PIN_3  =   4;
const int SHIFT_PIN_4  =   8;
const int SHIFT_PIN_5  =  16;
const int SHIFT_PIN_6  =  32;
const int SHIFT_PIN_7  =  64;
const int SHIFT_PIN_15 = 128;

const int BIT_A   = SHIFT_PIN_3;
const int BIT_B   = SHIFT_PIN_1;
const int BIT_C   = SHIFT_PIN_5;
const int BIT_D   = SHIFT_PIN_15;
const int BIT_E   = SHIFT_PIN_6;
const int BIT_F   = SHIFT_PIN_7;
const int BIT_G   = SHIFT_PIN_2;
const int BIT_COL = SHIFT_PIN_4;


/* ***********************************************/
/* SETUP THE DISPLAY SYMBOLS                     */
/* ***********************************************/

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

/* ***********************************************/
/* SETUP THE PARAMETERS                          */
/* ***********************************************/
// How long the timer will run for.
int timer_seconds = 120;

// Refresh-period of the display
int refresh_millis = 100;


/* ***********************************************/
/* START                                         */
/* ***********************************************/
unsigned long clockStartTime = millis();
int digitBuffer[5] = {0}; // 0-3 are the digits, 4 is the colon
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
	
	// Get the bit-pattern to display.
	byte valueToShift = ~digit[digitBuffer[digitScan]];
	
	// See if we need to turn on the colon or not.
	if(digitBuffer[4] == 1)
	{
		valueToShift = valueToShift || BIT_COL;
	}
	
	// Turn on the current digit to display.
	digitalWrite(digitPins[digitScan], HIGH);

	// Turn on the segments to display.
	digitalWrite(LATCH_PIN, LOW);  
	shiftOut(DATA_PIN, CLOCK_PIN, MSBFIRST, valueToShift);
	digitalWrite(LATCH_PIN, HIGH);
	
	// Move on to the next digit on the next cycle.
	digitScan++;
	if(digitScan > 3)
	{
		digitScan = 0;
	}	
}


unsigned long clock_running_millis = 0;
unsigned int seconds_on_the_clock = 0;
bool display_colon = true;
bool alarm_activated = false;

void loop() 
{
	// Calculate how long the clock has been running.
	clock_running_millis = (millis() - clockStartTime);
	
	// Update how much time is left on the clock.
	seconds_on_the_clock = timer_seconds - (clock_running_millis / 1000);
	if(seconds_on_the_clock < 0) {
		alarm_activated = true;
		seconds_on_the_clock = 0;
	}

	// Determine if the colon should be on or off
	if(clock_running_millis % 500 < 250)
	{
		digitBuffer[4] = 1;
	}
	else
	{
		digitBuffer[4] = 0;
	}
	
	// Refresh the clock.
	static unsigned long last_update = 0;
	int minutesPart = 0;
	int secondsPart = 0;
	if(last_update + refresh_millis < millis())
	{
		minutesPart = seconds_on_the_clock / 60;
		secondsPart = seconds_on_the_clock % 60;

		digitBuffer[0] = minutesPart / 10;
		digitBuffer[1] = minutesPart % 10;
		digitBuffer[2] = secondsPart / 10;
		digitBuffer[3] = minutesPart % 10;
		updateDisp();
		
		last_update = millis();
	}
}
