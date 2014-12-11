EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:borniers
LIBS:cylindric
LIBS:controller-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Digit Board"
Date "07 December 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CONN_2 P3
U 1 1 54886453
P 4950 1200
F 0 "P3" V 4900 1200 40  0000 C CNN
F 1 "PANEL_2" V 5000 1200 40  0000 C CNN
F 2 "Connect:bornier2" H 4950 1200 60  0001 C CNN
F 3 "" H 4950 1200 60  0000 C CNN
	1    4950 1200
	1    0    0    1   
$EndComp
$Comp
L GND #PWR01
U 1 1 54886454
P 4150 2450
F 0 "#PWR01" H 4150 2450 30  0001 C CNN
F 1 "GND" H 4150 2380 30  0001 C CNN
F 2 "" H 4150 2450 60  0000 C CNN
F 3 "" H 4150 2450 60  0000 C CNN
	1    4150 2450
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR02
U 1 1 54886455
P 4550 950
F 0 "#PWR02" H 4550 900 20  0001 C CNN
F 1 "+12V" H 4550 1050 30  0000 C CNN
F 2 "" H 4550 950 60  0000 C CNN
F 3 "" H 4550 950 60  0000 C CNN
	1    4550 950 
	1    0    0    -1  
$EndComp
$Comp
L CONN_2 P2
U 1 1 54886456
P 4950 1600
F 0 "P2" V 4900 1600 40  0000 C CNN
F 1 "PANEL_1" V 5000 1600 40  0000 C CNN
F 2 "Connect:bornier2" H 4950 1600 60  0001 C CNN
F 3 "" H 4950 1600 60  0000 C CNN
	1    4950 1600
	1    0    0    1   
$EndComp
$Comp
L R R4
U 1 1 54886457
P 3950 2000
F 0 "R4" V 4030 2000 40  0000 C CNN
F 1 "10k" V 3957 2001 40  0000 C CNN
F 2 "Discret:R3" V 3880 2000 30  0000 C CNN
F 3 "~" H 3950 2000 30  0000 C CNN
	1    3950 2000
	1    0    0    -1  
$EndComp
Text Label 10450 2350 0    60   ~ 0
D10
Text Label 8950 1550 2    60   ~ 0
D2
Text Label 8950 1650 2    60   ~ 0
D3
Text Label 8950 1750 2    60   ~ 0
D4
Text Label 8950 1850 2    60   ~ 0
D5
Text Label 8950 1950 2    60   ~ 0
D6
Text Label 8950 2050 2    60   ~ 0
D7
Text Label 8950 2150 2    60   ~ 0
D8
Text Label 10450 2250 0    60   ~ 0
D16
Text Label 10450 2150 0    60   ~ 0
D14
Text Label 10450 2050 0    60   ~ 0
D15
Text Label 3800 1550 2    60   ~ 0
D6
$Comp
L GND #PWR03
U 1 1 54886459
P 5650 1400
F 0 "#PWR03" H 5650 1400 30  0001 C CNN
F 1 "GND" H 5650 1330 30  0001 C CNN
F 2 "" H 5650 1400 60  0000 C CNN
F 3 "" H 5650 1400 60  0000 C CNN
	1    5650 1400
	1    0    0    -1  
$EndComp
Text Label 5650 900  2    60   ~ 0
D9
Text Label 5650 1800 2    60   ~ 0
D8
$Comp
L CONN_2 P1
U 1 1 5488645A
P 1100 1500
F 0 "P1" V 1050 1500 40  0000 C CNN
F 1 "POWER" V 1150 1500 40  0000 C CNN
F 2 "Connect:bornier2" H 1100 1500 60  0001 C CNN
F 3 "" H 1100 1500 60  0000 C CNN
	1    1100 1500
	-1   0    0    1   
$EndComp
$Comp
L LM317T U1
U 1 1 5488645B
P 2250 1450
F 0 "U1" H 2050 1650 40  0000 C CNN
F 1 "LM317T" H 2250 1650 40  0000 L CNN
F 2 "Power_Integrations:TO-220" H 2250 1550 30  0001 C CIN
F 3 "" H 2250 1450 60  0000 C CNN
	1    2250 1450
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR04
U 1 1 5488645C
P 1750 1150
F 0 "#PWR04" H 1750 1100 20  0001 C CNN
F 1 "+12V" H 1750 1250 30  0000 C CNN
F 2 "" H 1750 1150 60  0000 C CNN
F 3 "" H 1750 1150 60  0000 C CNN
	1    1750 1150
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG05
U 1 1 5488645D
P 1550 1150
F 0 "#FLG05" H 1550 1245 30  0001 C CNN
F 1 "PWR_FLAG" H 1550 1330 30  0000 C CNN
F 2 "" H 1550 1150 60  0000 C CNN
F 3 "" H 1550 1150 60  0000 C CNN
	1    1550 1150
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 5488645E
P 2750 1750
F 0 "R3" V 2830 1750 40  0000 C CNN
F 1 "330" V 2757 1751 40  0000 C CNN
F 2 "Discret:R3" V 2680 1750 30  0001 C CNN
F 3 "~" H 2750 1750 30  0000 C CNN
	1    2750 1750
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 5488645F
P 2400 2300
F 0 "R2" V 2480 2300 40  0000 C CNN
F 1 "1k" V 2407 2301 40  0000 C CNN
F 2 "Discret:R3" V 2330 2300 30  0001 C CNN
F 3 "~" H 2400 2300 30  0000 C CNN
	1    2400 2300
	0    1    1    0   
$EndComp
$Comp
L GND #PWR06
U 1 1 54886460
P 1800 2450
F 0 "#PWR06" H 1800 2450 30  0001 C CNN
F 1 "GND" H 1800 2380 30  0001 C CNN
F 2 "" H 1800 2450 60  0000 C CNN
F 3 "" H 1800 2450 60  0000 C CNN
	1    1800 2450
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG07
U 1 1 54886461
P 1550 1650
F 0 "#FLG07" H 1550 1745 30  0001 C CNN
F 1 "PWR_FLAG" H 1550 1830 30  0000 C CNN
F 2 "" H 1550 1650 60  0000 C CNN
F 3 "" H 1550 1650 60  0000 C CNN
	1    1550 1650
	-1   0    0    1   
$EndComp
Text Notes 800  750  0    60   ~ 0
Power
Text Notes 3550 750  0    60   ~ 0
Panel Control
Text Notes 5350 750  0    60   ~ 0
Dial Input
Text Notes 8450 750  0    60   ~ 0
Arduino Pro Micro Headers
$Comp
L C C2
U 1 1 54886462
P 5950 1550
F 0 "C2" H 5950 1650 40  0000 L CNN
F 1 "0.1uF" H 5956 1465 40  0000 L CNN
F 2 "Capacitors_ThroughHole:Capacitor4x3RM2.5" H 5988 1400 30  0001 C CNN
F 3 "" H 5950 1550 60  0000 C CNN
	1    5950 1550
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 54886463
P 5950 1150
F 0 "C1" H 5950 1250 40  0000 L CNN
F 1 "0.1uF" H 5956 1065 40  0000 L CNN
F 2 "Capacitors_ThroughHole:Capacitor4x3RM2.5" H 5988 1000 30  0001 C CNN
F 3 "" H 5950 1150 60  0000 C CNN
	1    5950 1150
	1    0    0    -1  
$EndComp
Text Label 7400 1150 2    60   ~ 0
A0
Text Notes 7150 750  0    60   ~ 0
Switch Input
$Comp
L 74HC595 U2
U 1 1 54886465
P 2500 3700
F 0 "U2" H 2500 4300 70  0000 C CNN
F 1 "74HC595" H 2500 3100 70  0000 C CNN
F 2 "Sockets_DIP:DIP-16__300" H 2500 3700 60  0001 C CNN
F 3 "" H 2500 3700 60  0000 C CNN
	1    2500 3700
	1    0    0    -1  
$EndComp
Text Label 1300 3250 2    60   ~ 0
D4
Text Label 1300 3450 2    60   ~ 0
D2
Text Label 1300 3750 2    60   ~ 0
D3
$Comp
L GND #PWR08
U 1 1 54886466
P 1650 4000
F 0 "#PWR08" H 1650 4000 30  0001 C CNN
F 1 "GND" H 1650 3930 30  0001 C CNN
F 2 "" H 1650 4000 60  0000 C CNN
F 3 "" H 1650 4000 60  0000 C CNN
	1    1650 4000
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR09
U 1 1 54886467
P 1000 3500
F 0 "#PWR09" H 1000 3590 20  0001 C CNN
F 1 "VCC" H 1000 3590 30  0000 C CNN
F 2 "" H 1000 3500 60  0000 C CNN
F 3 "" H 1000 3500 60  0000 C CNN
	1    1000 3500
	1    0    0    -1  
$EndComp
Text Label 3350 3350 0    60   ~ 0
B
Text Label 3350 3750 0    60   ~ 0
C
Text Label 3350 3850 0    60   ~ 0
E
Text Label 3350 3950 0    60   ~ 0
F
Text Label 3350 3250 0    60   ~ 0
D
Text Label 3350 3450 0    60   ~ 0
G
Text Label 3350 3550 0    60   ~ 0
A
$Comp
L R R8
U 1 1 54886468
P 5650 5250
F 0 "R8" V 5730 5250 40  0000 C CNN
F 1 "33R" V 5657 5251 40  0000 C CNN
F 2 "Discret:R3" V 5580 5250 30  0001 C CNN
F 3 "~" H 5650 5250 30  0000 C CNN
	1    5650 5250
	0    1    1    0   
$EndComp
$Comp
L R R9
U 1 1 54886469
P 5650 5350
F 0 "R9" V 5730 5350 40  0000 C CNN
F 1 "33R" V 5657 5351 40  0000 C CNN
F 2 "Discret:R3" V 5580 5350 30  0001 C CNN
F 3 "~" H 5650 5350 30  0000 C CNN
	1    5650 5350
	0    1    1    0   
$EndComp
$Comp
L GND #PWR010
U 1 1 5488646A
P 8100 1250
F 0 "#PWR010" H 8100 1250 30  0001 C CNN
F 1 "GND" H 8100 1180 30  0001 C CNN
F 2 "" H 8100 1250 60  0000 C CNN
F 3 "" H 8100 1250 60  0000 C CNN
	1    8100 1250
	1    0    0    -1  
$EndComp
Text Notes 800  3000 0    60   ~ 0
Display
Text Notes 1800 3250 2    60   ~ 0
DS
Text Notes 1800 3450 2    60   ~ 0
SH_CP
Text Notes 1800 3750 2    60   ~ 0
ST_CP
NoConn ~ 3200 4150
$Comp
L R R6
U 1 1 5488646C
P 5650 5050
F 0 "R6" V 5730 5050 40  0000 C CNN
F 1 "33R" V 5657 5051 40  0000 C CNN
F 2 "Discret:R3" V 5580 5050 30  0001 C CNN
F 3 "~" H 5650 5050 30  0000 C CNN
	1    5650 5050
	0    1    1    0   
$EndComp
$Comp
L R R7
U 1 1 5488646D
P 5650 5150
F 0 "R7" V 5730 5150 40  0000 C CNN
F 1 "33R" V 5657 5151 40  0000 C CNN
F 2 "Discret:R3" V 5580 5150 30  0001 C CNN
F 3 "~" H 5650 5150 30  0000 C CNN
	1    5650 5150
	0    1    1    0   
$EndComp
$Comp
L R R10
U 1 1 5488646E
P 5650 5450
F 0 "R10" V 5730 5450 40  0000 C CNN
F 1 "33R" V 5657 5451 40  0000 C CNN
F 2 "Discret:R3" V 5580 5450 30  0001 C CNN
F 3 "~" H 5650 5450 30  0000 C CNN
	1    5650 5450
	0    1    1    0   
$EndComp
$Comp
L R R11
U 1 1 5488646F
P 5650 5550
F 0 "R11" V 5730 5550 40  0000 C CNN
F 1 "33R" V 5657 5551 40  0000 C CNN
F 2 "Discret:R3" V 5580 5550 30  0001 C CNN
F 3 "~" H 5650 5550 30  0000 C CNN
	1    5650 5550
	0    1    1    0   
$EndComp
$Comp
L R R5
U 1 1 54886470
P 5650 4950
F 0 "R5" V 5730 4950 40  0000 C CNN
F 1 "33R" V 5657 4951 40  0000 C CNN
F 2 "Discret:R3" V 5580 4950 30  0001 C CNN
F 3 "~" H 5650 4950 30  0000 C CNN
	1    5650 4950
	0    1    1    0   
$EndComp
$Comp
L R R1
U 1 1 54886471
P 1650 5350
F 0 "R1" V 1730 5350 40  0000 C CNN
F 1 "33R" V 1657 5351 40  0000 C CNN
F 2 "Discret:R3" V 1580 5350 30  0001 C CNN
F 3 "~" H 1650 5350 30  0000 C CNN
	1    1650 5350
	0    -1   -1   0   
$EndComp
Text Label 1750 5150 2    60   ~ 0
D10
Text Label 1750 5250 2    60   ~ 0
D16
Text Label 1750 5050 2    60   ~ 0
D14
Text Label 1750 4950 2    60   ~ 0
D15
$Comp
L Arduino_Pro_Micro U3
U 1 1 54886472
P 9700 1800
F 0 "U3" H 9350 2650 60  0000 C CNN
F 1 "Arduino_Pro_Micro" H 9700 950 60  0000 C CNN
F 2 "Cylindric:ArduinoProMicro" H 9675 1900 60  0001 C CNN
F 3 "" H 9675 1900 60  0000 C CNN
	1    9700 1800
	1    0    0    -1  
$EndComp
NoConn ~ 9100 1350
NoConn ~ 9100 1450
NoConn ~ 10300 1850
NoConn ~ 10300 1750
NoConn ~ 10300 1650
NoConn ~ 10300 1350
NoConn ~ 10300 1150
$Comp
L VCC #PWR011
U 1 1 54886474
P 2950 1300
F 0 "#PWR011" H 2950 1390 20  0001 C CNN
F 1 "VCC" H 2950 1390 30  0000 C CNN
F 2 "" H 2950 1300 60  0000 C CNN
F 3 "" H 2950 1300 60  0000 C CNN
	1    2950 1300
	1    0    0    -1  
$EndComp
$Comp
L MOSFET_N Q1
U 1 1 54886475
P 4250 1550
F 0 "Q1" H 4250 1402 40  0000 R CNN
F 1 "FET" H 4250 1700 40  0000 R CNN
F 2 "Transistors_TO-220:TO-220_FET-GDS_Vertical" H 4150 1650 25  0001 C CIN
F 3 "" H 4250 1550 60  0000 C CNN
	1    4250 1550
	1    0    0    -1  
$EndComp
Connection ~ 4150 2350
Wire Wire Line
	4150 2350 4150 2450
Wire Wire Line
	3950 2350 4350 2350
Wire Wire Line
	4550 1500 4600 1500
Wire Wire Line
	4500 1700 4600 1700
Wire Wire Line
	4550 950  4550 1500
Wire Wire Line
	4550 1100 4600 1100
Connection ~ 4550 1100
Wire Wire Line
	4500 1700 4500 1300
Connection ~ 4500 1300
Connection ~ 3950 1550
Wire Wire Line
	3950 2250 3950 2350
Wire Wire Line
	5650 1800 6550 1800
Wire Wire Line
	5650 1350 6200 1350
Wire Wire Line
	1450 1400 1850 1400
Connection ~ 1650 1400
Wire Wire Line
	1550 1150 1750 1150
Wire Wire Line
	1650 1400 1650 1150
Connection ~ 1650 1150
Wire Wire Line
	2650 1400 2950 1400
Wire Wire Line
	2750 1400 2750 1500
Connection ~ 2750 1400
Wire Wire Line
	2250 1700 2250 2050
Wire Wire Line
	2250 2050 2750 2050
Wire Wire Line
	2750 2000 2750 2300
Connection ~ 2750 2050
Wire Wire Line
	2150 2300 1800 2300
Wire Wire Line
	1800 1600 1800 2450
Wire Wire Line
	1450 1600 1800 1600
Wire Wire Line
	2750 2300 2650 2300
Connection ~ 1800 2300
Wire Wire Line
	1550 1650 1550 1600
Connection ~ 1550 1600
Wire Wire Line
	2950 1400 2950 1300
Wire Notes Line
	800  750  800  2700
Wire Notes Line
	800  2700 3250 2700
Wire Notes Line
	3250 2700 3250 750 
Wire Notes Line
	3250 750  800  750 
Wire Notes Line
	3550 750  3550 2550
Wire Notes Line
	3550 2550 5150 2550
Wire Notes Line
	5150 2550 5150 750 
Wire Notes Line
	5150 750  3550 750 
Wire Notes Line
	5350 750  6850 750 
Wire Notes Line
	5350 1900 5350 750 
Wire Notes Line
	8450 750  10950 750 
Wire Notes Line
	10950 2800 8450 2800
Wire Wire Line
	5650 900  6550 900 
Wire Wire Line
	5650 1350 5650 1400
Connection ~ 5950 1350
Wire Wire Line
	5950 1750 5950 1800
Connection ~ 5950 1800
Wire Wire Line
	5950 950  5950 900 
Connection ~ 5950 900 
Wire Notes Line
	6850 750  6850 1900
Wire Notes Line
	6850 1900 5350 1900
Wire Notes Line
	7150 750  8250 750 
Wire Notes Line
	8250 750  8250 1550
Wire Notes Line
	8250 1550 7150 1550
Wire Notes Line
	7150 1550 7150 750 
Wire Wire Line
	1800 3250 1300 3250
Wire Wire Line
	1300 3450 1800 3450
Wire Wire Line
	1300 3750 1800 3750
Wire Wire Line
	1650 3850 1800 3850
Wire Wire Line
	1650 3850 1650 4000
Wire Wire Line
	1800 3550 1000 3550
Wire Wire Line
	1000 3550 1000 3500
Wire Wire Line
	3200 3350 3350 3350
Wire Wire Line
	3200 3450 3350 3450
Wire Wire Line
	3200 3550 3350 3550
Wire Wire Line
	3200 3650 3350 3650
Wire Wire Line
	3200 3750 3350 3750
Wire Wire Line
	3200 3850 3350 3850
Wire Wire Line
	3200 3950 3350 3950
Wire Wire Line
	9100 1550 8950 1550
Wire Wire Line
	8950 1650 9100 1650
Wire Wire Line
	8950 1750 9100 1750
Wire Wire Line
	8950 1850 9100 1850
Wire Wire Line
	8950 1950 9100 1950
Wire Wire Line
	8950 2050 9100 2050
Wire Wire Line
	8950 2150 9100 2150
Wire Wire Line
	10300 2350 10450 2350
Wire Wire Line
	10450 2250 10300 2250
Wire Wire Line
	10450 2150 10300 2150
Wire Wire Line
	10450 2050 10300 2050
Wire Wire Line
	4350 2350 4350 1750
Wire Wire Line
	4350 1350 4350 1300
Wire Wire Line
	4350 1300 4600 1300
Wire Wire Line
	3950 1750 3950 1550
Wire Wire Line
	3800 1550 4050 1550
Wire Wire Line
	3200 3250 3350 3250
Text Label 3350 3650 0    60   ~ 0
COL
Wire Notes Line
	10950 750  10950 2800
Wire Notes Line
	8450 2800 8450 750 
$Comp
L ATA3492BW LED_DISPLAY1
U 1 1 54886477
P 3600 5200
F 0 "LED_DISPLAY1" H 2600 5750 60  0000 C CNN
F 1 "ATA3492BW" H 2550 4650 60  0000 C CNN
F 2 "Cylindric:4_Digit-7_Segment_LED-ATA3492BW" H 2800 5200 60  0001 C CNN
F 3 "" H 2800 5200 60  0000 C CNN
	1    3600 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 4950 2000 4950
Wire Wire Line
	1750 5050 2000 5050
Wire Wire Line
	1750 5150 2000 5150
Wire Wire Line
	1750 5250 2000 5250
Wire Wire Line
	1900 5350 2000 5350
Wire Wire Line
	5300 4850 5500 4850
Wire Wire Line
	5400 4950 5300 4950
Wire Wire Line
	5400 5050 5300 5050
Wire Wire Line
	5400 5150 5300 5150
Wire Wire Line
	5400 5250 5300 5250
Wire Wire Line
	5300 5350 5400 5350
Wire Wire Line
	5400 5450 5300 5450
Wire Wire Line
	5400 5550 5300 5550
Text Label 6050 4950 0    60   ~ 0
A
Text Label 6050 5050 0    60   ~ 0
B
Text Label 6050 5150 0    60   ~ 0
C
Text Label 6050 5250 0    60   ~ 0
D
Text Label 6050 5350 0    60   ~ 0
E
Text Label 6050 5450 0    60   ~ 0
F
Text Label 6050 5550 0    60   ~ 0
G
Text Label 1300 5350 2    60   ~ 0
COL
Wire Wire Line
	1400 5350 1300 5350
Wire Wire Line
	5900 4950 6050 4950
Wire Wire Line
	5900 5050 6050 5050
Wire Wire Line
	5900 5150 6050 5150
Wire Wire Line
	5900 5350 6050 5350
Wire Wire Line
	5900 5450 6050 5450
Wire Wire Line
	5900 5550 6050 5550
Wire Wire Line
	5900 5250 6050 5250
NoConn ~ 5300 5650
NoConn ~ 5300 4750
NoConn ~ 2000 5450
Wire Wire Line
	5500 4850 5500 4650
$Comp
L VCC #PWR012
U 1 1 54889554
P 5500 4650
F 0 "#PWR012" H 5500 4740 20  0001 C CNN
F 1 "VCC" H 5500 4740 30  0000 C CNN
F 2 "" H 5500 4650 60  0000 C CNN
F 3 "" H 5500 4650 60  0000 C CNN
	1    5500 4650
	1    0    0    -1  
$EndComp
Wire Notes Line
	800  3000 6200 3000
Wire Notes Line
	6200 3000 6200 5950
Wire Notes Line
	6200 5950 800  5950
Wire Notes Line
	800  5950 800  3000
$Comp
L Encoder ENC1
U 1 1 5488F621
P 6500 1350
F 0 "ENC1" H 6375 1575 60  0000 C CNN
F 1 "Encoder" H 6500 1475 60  0000 C CNN
F 2 "Cylindric:ALPS_Encoder-EC12E2420404" H 6500 1400 60  0001 C CNN
F 3 "" H 6500 1400 60  0000 C CNN
	1    6500 1350
	0    1    1    0   
$EndComp
Wire Wire Line
	6550 900  6550 950 
Wire Wire Line
	6550 1800 6550 1750
$Comp
L SW_PUSH SW1
U 1 1 54890306
P 7700 1150
F 0 "SW1" H 7850 1260 50  0000 C CNN
F 1 "SW_PUSH" H 7700 1070 50  0000 C CNN
F 2 "Discret:SW_PUSH-12mm" H 7700 1150 60  0001 C CNN
F 3 "" H 7700 1150 60  0000 C CNN
	1    7700 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 1150 7250 1150
Wire Wire Line
	8000 1150 8100 1150
Wire Wire Line
	8100 1150 8100 1250
Wire Wire Line
	10300 1950 10450 1950
Text Label 10450 1950 0    60   ~ 0
A0
Text Label 4350 1300 2    60   ~ 0
12VGND
Wire Wire Line
	9100 2250 8950 2250
Text Label 8950 2250 2    60   ~ 0
D9
$EndSCHEMATC
