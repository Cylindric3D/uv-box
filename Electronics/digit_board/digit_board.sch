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
LIBS:components
LIBS:digit_board-cache
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
L DIL16 P1
U 1 1 5483E895
P 4450 3500
F 0 "P1" H 4450 3950 60  0000 C CNN
F 1 "LED_DISPLAY" V 4450 3500 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x08" H 4450 3500 60  0001 C CNN
F 3 "" H 4450 3500 60  0000 C CNN
	1    4450 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 3150 3800 3150
Wire Wire Line
	4100 3250 3800 3250
Wire Wire Line
	4100 3450 3800 3450
Wire Wire Line
	4100 3650 3800 3650
Wire Wire Line
	4100 3850 3800 3850
Wire Wire Line
	4800 3150 5050 3150
Wire Wire Line
	4800 3250 5050 3250
Wire Wire Line
	4800 3350 5050 3350
Wire Wire Line
	4800 3450 5050 3450
Wire Wire Line
	4800 3650 5050 3650
Wire Wire Line
	4800 3550 5050 3550
$Comp
L ATA3492BW LED_DISPLAY1
U 1 1 5483E8CC
P 4300 2300
F 0 "LED_DISPLAY1" H 3300 2850 60  0000 C CNN
F 1 "ATA3492BW" H 3250 1750 60  0000 C CNN
F 2 "Cylindric:4DIG_7SEG_ATA3492BW" H 3500 2300 60  0001 C CNN
F 3 "" H 3500 2300 60  0000 C CNN
	1    4300 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 2050 2700 2050
Wire Wire Line
	2450 2150 2700 2150
Wire Wire Line
	2450 2250 2700 2250
Wire Wire Line
	2450 2350 2700 2350
Wire Wire Line
	2450 2450 2700 2450
Wire Wire Line
	2450 2550 2700 2550
Wire Wire Line
	6350 1850 6000 1850
Wire Wire Line
	6350 1950 6000 1950
Wire Wire Line
	6350 2050 6000 2050
Wire Wire Line
	6350 2150 6000 2150
Wire Wire Line
	6350 2250 6000 2250
Wire Wire Line
	6350 2350 6000 2350
Wire Wire Line
	6000 2450 6350 2450
Wire Wire Line
	6350 2550 6000 2550
Wire Wire Line
	6350 2650 6000 2650
Wire Wire Line
	6350 2750 6000 2750
Entry Wire Line
	6350 1850 6450 1950
Entry Wire Line
	6350 1950 6450 2050
Entry Wire Line
	6350 2050 6450 2150
Entry Wire Line
	6350 2150 6450 2250
Entry Wire Line
	6350 2250 6450 2350
Entry Wire Line
	6350 2350 6450 2450
Entry Wire Line
	6350 2450 6450 2550
Entry Wire Line
	6350 2550 6450 2650
Entry Wire Line
	6350 2650 6450 2750
Entry Wire Line
	6350 2750 6450 2850
Entry Wire Line
	2350 2150 2450 2050
Entry Wire Line
	2350 2250 2450 2150
Entry Wire Line
	2350 2350 2450 2250
Entry Wire Line
	2350 2450 2450 2350
Entry Wire Line
	2350 2550 2450 2450
Entry Wire Line
	2350 2650 2450 2550
Wire Bus Line
	2350 2100 2350 2650
Wire Bus Line
	2350 2650 2650 2950
Wire Bus Line
	2650 2950 6350 2950
Wire Bus Line
	6350 2950 6450 2850
Wire Bus Line
	6450 2850 6450 1850
Wire Wire Line
	4800 3750 5050 3750
Wire Wire Line
	4800 3850 5050 3850
Wire Wire Line
	4100 3350 3800 3350
Wire Wire Line
	4100 3550 3800 3550
Text Label 3800 3150 0    60   ~ 0
COL_AN
Text Label 6000 1950 0    60   ~ 0
COL_AN
Text Label 5050 3150 2    60   ~ 0
A
Text Label 5050 3350 2    60   ~ 0
E
Text Label 5050 3450 2    60   ~ 0
D
Text Label 5050 3550 2    60   ~ 0
F
Text Label 5050 3650 2    60   ~ 0
C
Text Label 5050 3750 2    60   ~ 0
G
Text Label 5050 3850 2    60   ~ 0
B
Text Label 6000 2050 0    60   ~ 0
A
Text Label 6000 2150 0    60   ~ 0
B
Text Label 6000 2250 0    60   ~ 0
C
Text Label 6000 2350 0    60   ~ 0
D
Text Label 6000 2450 0    60   ~ 0
E
Text Label 6000 2550 0    60   ~ 0
F
Text Label 6000 2650 0    60   ~ 0
G
Text Label 6000 2750 0    60   ~ 0
P
Text Label 3800 3550 0    60   ~ 0
P
Text Label 3800 3350 0    60   ~ 0
DEC_AN
Text Label 6000 1850 0    60   ~ 0
DEC_AN
Text Label 2700 2050 2    60   ~ 0
DIG1
Text Label 2700 2150 2    60   ~ 0
DIG2
Text Label 2700 2250 2    60   ~ 0
DIG3
Text Label 2700 2350 2    60   ~ 0
DIG4
Text Label 3800 3250 0    60   ~ 0
DIG4
Text Label 3800 3450 0    60   ~ 0
DIG3
Text Label 3800 3650 0    60   ~ 0
DIG2
Text Label 3800 3850 0    60   ~ 0
DIG1
Text Label 5050 3250 2    60   ~ 0
COL
Wire Wire Line
	4100 3750 3800 3750
Text Label 3800 3750 0    60   ~ 0
DEC
Text Label 2700 2550 2    60   ~ 0
DEC
Text Label 2700 2450 2    60   ~ 0
COL
Entry Wire Line
	5050 3150 5150 3050
Entry Wire Line
	5050 3250 5150 3150
Entry Wire Line
	5050 3350 5150 3250
Entry Wire Line
	5050 3450 5150 3350
Entry Wire Line
	5050 3550 5150 3450
Entry Wire Line
	5050 3650 5150 3550
Entry Wire Line
	5050 3750 5150 3650
Entry Wire Line
	5050 3850 5150 3750
Entry Wire Line
	3700 3050 3800 3150
Entry Wire Line
	3700 3150 3800 3250
Entry Wire Line
	3700 3250 3800 3350
Entry Wire Line
	3700 3350 3800 3450
Entry Wire Line
	3700 3450 3800 3550
Entry Wire Line
	3700 3550 3800 3650
Entry Wire Line
	3700 3650 3800 3750
Entry Wire Line
	3700 3750 3800 3850
Wire Bus Line
	3700 2950 3700 3850
Wire Bus Line
	5150 2950 5150 3850
Wire Notes Line
	2150 1600 2150 4050
Wire Notes Line
	2150 4050 6600 4050
Wire Notes Line
	6600 4050 6600 1600
Wire Notes Line
	6600 1600 2150 1600
Text Notes 2150 1600 0    60   ~ 0
Digit Board
$EndSCHEMATC
