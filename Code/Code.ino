// LATCH_PIN is pin 11 on the 74HC595, and might be labelled ST_CP or SRCLK
#define LATCH_PIN 3

// DATA_PIN is pin 12 on the 74HC595, and might be labelled SH_CP or RCLK
#define CLOCK_PIN 4

// DATA_PIN is pin 14 on the 74HC595, and might be labelled DS or SER
#define DATA_PIN 2

const int digitPins[4] = {5,6,7,8};
 
  
const byte digit[10] =      //seven segment digits in bits
{
   //EDFCAGB
	B11111010, //0 
	B00010010, //1
	B11001110, //2
	B01011110, //3
	B00110110, //4
	B01111100, //5
	B11111100, //6
	B00011010, //7
	B11111110, //8
	B00111110  //9
};
int digitBuffer[4] = {0};
int digitScan = 0;
int flag=0;
int soft_scaler = 0;


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
	Serial.println("Starting LED Exposure Controller.");
}


void updateDisp() 
{
	for(byte j=0; j<4; j++)  
	{
		digitalWrite(digitPins[j], LOW);
	}
	
	digitalWrite(LATCH_PIN, LOW);  
	shiftOut(DATA_PIN, CLOCK_PIN, MSBFIRST, B11111111);
	digitalWrite(LATCH_PIN, HIGH);

	delayMicroseconds(50);
	digitalWrite(digitPins[digitScan], HIGH); 

	digitalWrite(LATCH_PIN, LOW);  
//	if(digitScan==2)
//	{
//		shiftOut(DATA_PIN, CLOCK_PIN, MSBFIRST, ~(digit[digitBuffer[digitScan]] | B10000000)); //print the decimal point on the 3rd digit
//	}
//	else
//	{
		shiftOut(DATA_PIN, CLOCK_PIN, MSBFIRST, ~digit[digitBuffer[digitScan]]);
//	}
	digitalWrite(LATCH_PIN, HIGH);
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
