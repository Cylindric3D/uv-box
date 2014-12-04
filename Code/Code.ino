// LATCH_PIN is pin 11 on the 74HC595, and might be labelled ST_CP or SRCLK
#define LATCH_PIN 4

// DATA_PIN is pin 12 on the 74HC595, and might be labelled SH_CP or RCLK
#define CLOCK_PIN 3

// DATA_PIN is pin 14 on the 74HC595, and might be labelled DS or SER
#define DATA_PIN 2


const int digitPins[4] = {6,7,8,9};
  
  
const byte digit[10] =      //seven segment digits in bits
{
  B00111111, //0
  B00000110, //1
  B01011011, //2
  B01001111, //3
  B01100110, //4
  B01101101, //5
  B01111101, //6
  B00000111, //7
  B01111111, //8
  B01101111   //9
};
int digitBuffer[4] = {0};
int digitScan = 0;
int flag=0;
int soft_scaler = 0;


// SIPO 1 (U2)
int led_neg_g = 1;           // U2 pin  1, LED pin 15
int led_neg_a = 2;           // U2 pin  2, LED pin 14 
int led_neg_c = 4;           // U2 pin  3, LED pin 13
int led_neg_colon = 8;   // U2 pin  4, LED pin 12
int led_neg_f = 16;         // U2 pin  5, LED pin 11
int led_pos_point = 32; // U2 pin  6, LED pin 10
int led_neg_point = 64; // U2 pin  7, LED pin  9
int led_neg_b = 128;       // U2 pin 15, LED pin 16

// SIPO 2 (U3)
int led_neg_p = 1;         // U3 pin  1, LED pin 7
int led_pos_d3 = 2;       // U3 pin  2, LED pin 6
int led_neg_e = 4;         // U3 pin  3, LED pin 5
int led_pos_colon = 8; // U3 pin  4, LED pin 4
int led_neg_d = 16;       // U3 pin  5, LED pin 3
int led_pos_d2 = 32;     // U3 pin  6, LED pin 2
int led_pos_d1 = 64;     // U3 pin  7, LED pin 1
int led_pos_d4 = 128;     // U3 pin 15, LED pin 8


void setup() {
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


void updateDisp(){
	for(byte j=0; j<4; j++)  
	{
		digitalWrite(digitPins[j], LOW);
	}
	
	digitalWrite(LATCH_PIN, LOW);  
	shiftOut(DATA_PIN, CLOCK_PIN, MSBFIRST, B11111111);
	digitalWrite(LATCH_PIN, HIGH);

	delayMicroseconds(10000);
	digitalWrite(digitPins[digitScan], HIGH); 

	digitalWrite(LATCH_PIN, LOW);  
	if(digitScan==2)
	{
		shiftOut(DATA_PIN, CLOCK_PIN, MSBFIRST, ~(digit[digitBuffer[digitScan]] | B10000000)); //print the decimal point on the 3rd digit
	}
	else
	{
		shiftOut(DATA_PIN, CLOCK_PIN, MSBFIRST, ~digit[digitBuffer[digitScan]]);
	}
	digitalWrite(LATCH_PIN, HIGH);
	digitScan++;
	
	if(digitScan>3) 
	{
		digitScan=0; 
	}
}


void loop() {
		//int shift1 = 0;
		//int shift2 = 0;

		// All the low pins need to start high
		//shift1 = 255;
		//shift2 = 255;
		
		// All the high pins need to go low
		//shift1 -= (led_pos_point);
		//shift2 -= (led_pos_colon + led_pos_d1 + led_pos_d2 + led_pos_d3 + led_pos_d4);
		
		// 88:8`8
		//shift2 = led_pos_point;
		//shift1 = (led_pos_d1 + led_pos_d2 + led_pos_d3 + led_pos_d4 + led_pos_colon);
		
		//digitalWrite(LATCH_PIN, LOW);
		//shiftOut(DATA_PIN, CLOCK_PIN, MSBFIRST, shift1);
		//shiftOut(DATA_PIN, CLOCK_PIN, MSBFIRST, shift2);
		//digitalWrite(LATCH_PIN, HIGH);
		//Serial.print(shift1); Serial.print(" "); Serial.println(shift2);

		for(int i = 0; i < 9999; i++)
		{
			digitBuffer[3] = i/1000;
			digitBuffer[2] = (i%1000)/100;
			digitBuffer[1] = (i%100)/10;
			digitBuffer[0] = (i%100)%10;
			Serial.print(digitBuffer[3]); Serial.print(".");
			Serial.print(digitBuffer[2]); Serial.print(".");
			Serial.print(digitBuffer[1]); Serial.print(".");
			Serial.print(digitBuffer[0]); Serial.println("");
			updateDisp();
			delay(100);
		}

		delay(200);

}
