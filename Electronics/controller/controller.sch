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
LIBS:components
LIBS:controller-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "1 dec 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CONN_2 P3
U 1 1 547C79D3
P 5200 1250
F 0 "P3" V 5150 1250 40  0000 C CNN
F 1 "PANEL_2" V 5250 1250 40  0000 C CNN
F 2 "Connect:bornier2" H 5200 1250 60  0001 C CNN
F 3 "" H 5200 1250 60  0000 C CNN
	1    5200 1250
	1    0    0    1   
$EndComp
$Comp
L GND #PWR01
U 1 1 547C8399
P 4400 2500
F 0 "#PWR01" H 4400 2500 30  0001 C CNN
F 1 "GND" H 4400 2430 30  0001 C CNN
F 2 "" H 4400 2500 60  0000 C CNN
F 3 "" H 4400 2500 60  0000 C CNN
	1    4400 2500
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR02
U 1 1 547C83A8
P 4800 1000
F 0 "#PWR02" H 4800 950 20  0001 C CNN
F 1 "+12V" H 4800 1100 30  0000 C CNN
F 2 "" H 4800 1000 60  0000 C CNN
F 3 "" H 4800 1000 60  0000 C CNN
	1    4800 1000
	1    0    0    -1  
$EndComp
$Comp
L CONN_2 P4
U 1 1 547C8F92
P 5200 1650
F 0 "P4" V 5150 1650 40  0000 C CNN
F 1 "PANEL_1" V 5250 1650 40  0000 C CNN
F 2 "Connect:bornier2" H 5200 1650 60  0001 C CNN
F 3 "" H 5200 1650 60  0000 C CNN
	1    5200 1650
	1    0    0    1   
$EndComp
$Comp
L R R1
U 1 1 547CA019
P 4200 2050
F 0 "R1" V 4280 2050 40  0000 C CNN
F 1 "10k" V 4207 2051 40  0000 C CNN
F 2 "Discret:R3" V 4130 2050 30  0000 C CNN
F 3 "~" H 4200 2050 30  0000 C CNN
	1    4200 2050
	1    0    0    -1  
$EndComp
Text Label 9450 4100 0    60   ~ 0
D10
Text Label 7950 3300 2    60   ~ 0
D2
Text Label 7950 3400 2    60   ~ 0
D3
Text Label 7950 3500 2    60   ~ 0
D4
Text Label 7950 3600 2    60   ~ 0
D5
Text Label 7950 3700 2    60   ~ 0
D6
Text Label 7950 3800 2    60   ~ 0
D7
Text Label 7950 3900 2    60   ~ 0
D8
Text Label 9450 4000 0    60   ~ 0
D16
Text Label 9450 3900 0    60   ~ 0
D14
Text Label 9450 3800 0    60   ~ 0
D15
Text Label 4050 1600 2    60   ~ 0
D16
$Comp
L CONN_3 P5
U 1 1 547DF01E
P 7050 1400
F 0 "P5" V 7000 1400 50  0000 C CNN
F 1 "DIAL" V 7100 1400 40  0000 C CNN
F 2 "Connect:bornier3" H 7050 1400 60  0001 C CNN
F 3 "" H 7050 1400 60  0000 C CNN
	1    7050 1400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 547DF46B
P 6000 1450
F 0 "#PWR03" H 6000 1450 30  0001 C CNN
F 1 "GND" H 6000 1380 30  0001 C CNN
F 2 "" H 6000 1450 60  0000 C CNN
F 3 "" H 6000 1450 60  0000 C CNN
	1    6000 1450
	1    0    0    -1  
$EndComp
Text Label 6000 950  2    60   ~ 0
D14
Text Label 6000 1850 2    60   ~ 0
D15
$Comp
L CONN_2 P6
U 1 1 547E058A
P 1350 1550
F 0 "P6" V 1300 1550 40  0000 C CNN
F 1 "POWER" V 1400 1550 40  0000 C CNN
F 2 "Connect:bornier2" H 1350 1550 60  0001 C CNN
F 3 "" H 1350 1550 60  0000 C CNN
	1    1350 1550
	-1   0    0    1   
$EndComp
$Comp
L LM317T U1
U 1 1 547E0874
P 2500 1500
F 0 "U1" H 2300 1700 40  0000 C CNN
F 1 "LM317T" H 2500 1700 40  0000 L CNN
F 2 "Power_Integrations:TO-220" H 2500 1600 30  0000 C CIN
F 3 "" H 2500 1500 60  0000 C CNN
	1    2500 1500
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR04
U 1 1 547E0971
P 2000 1200
F 0 "#PWR04" H 2000 1150 20  0001 C CNN
F 1 "+12V" H 2000 1300 30  0000 C CNN
F 2 "" H 2000 1200 60  0000 C CNN
F 3 "" H 2000 1200 60  0000 C CNN
	1    2000 1200
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG05
U 1 1 547E0B29
P 1800 1200
F 0 "#FLG05" H 1800 1295 30  0001 C CNN
F 1 "PWR_FLAG" H 1800 1380 30  0000 C CNN
F 2 "" H 1800 1200 60  0000 C CNN
F 3 "" H 1800 1200 60  0000 C CNN
	1    1800 1200
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 547E14EB
P 3000 1800
F 0 "R5" V 3080 1800 40  0000 C CNN
F 1 "330" V 3007 1801 40  0000 C CNN
F 2 "Discret:R3" V 2930 1800 30  0000 C CNN
F 3 "~" H 3000 1800 30  0000 C CNN
	1    3000 1800
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 547E156D
P 2650 2350
F 0 "R4" V 2730 2350 40  0000 C CNN
F 1 "1k" V 2657 2351 40  0000 C CNN
F 2 "Discret:R3" V 2580 2350 30  0000 C CNN
F 3 "~" H 2650 2350 30  0000 C CNN
	1    2650 2350
	0    1    1    0   
$EndComp
$Comp
L GND #PWR06
U 1 1 547E24A4
P 2050 2500
F 0 "#PWR06" H 2050 2500 30  0001 C CNN
F 1 "GND" H 2050 2430 30  0001 C CNN
F 2 "" H 2050 2500 60  0000 C CNN
F 3 "" H 2050 2500 60  0000 C CNN
	1    2050 2500
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG07
U 1 1 547E260E
P 1800 1700
F 0 "#FLG07" H 1800 1795 30  0001 C CNN
F 1 "PWR_FLAG" H 1800 1880 30  0000 C CNN
F 2 "" H 1800 1700 60  0000 C CNN
F 3 "" H 1800 1700 60  0000 C CNN
	1    1800 1700
	-1   0    0    1   
$EndComp
Text Notes 1050 800  0    60   ~ 0
Power
Text Notes 3800 800  0    60   ~ 0
Panel Control
Text Notes 5700 800  0    60   ~ 0
Dial Input
Text Notes 7500 1900 0    60   ~ 0
Arduino Pro Micro Headers
$Comp
L C C2
U 1 1 547E3123
P 6300 1600
F 0 "C2" H 6300 1700 40  0000 L CNN
F 1 "0.1uF" H 6306 1515 40  0000 L CNN
F 2 "Capacitors_ThroughHole:Capacitor4x3RM2.5" H 6338 1450 30  0001 C CNN
F 3 "" H 6300 1600 60  0000 C CNN
	1    6300 1600
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 547E3173
P 6300 1200
F 0 "C1" H 6300 1300 40  0000 L CNN
F 1 "0.1uF" H 6306 1115 40  0000 L CNN
F 2 "Capacitors_ThroughHole:Capacitor4x3RM2.5" H 6338 1050 30  0001 C CNN
F 3 "" H 6300 1200 60  0000 C CNN
	1    6300 1200
	1    0    0    -1  
$EndComp
$Comp
L CONN_2 P7
U 1 1 547E4594
P 8400 1300
F 0 "P7" V 8350 1300 40  0000 C CNN
F 1 "SWITCH" V 8450 1300 40  0000 C CNN
F 2 "Connect:bornier2" H 8400 1300 60  0001 C CNN
F 3 "" H 8400 1300 60  0000 C CNN
	1    8400 1300
	1    0    0    1   
$EndComp
Text Label 7950 950  2    60   ~ 0
D10
Text Notes 7500 800  0    60   ~ 0
Switch Input
$Comp
L 74HC595 U2
U 1 1 547E57E1
P 2750 3750
F 0 "U2" H 2900 4350 70  0000 C CNN
F 1 "74HC595" H 2750 3150 70  0000 C CNN
F 2 "Sockets_DIP:DIP-16__300" H 2750 3750 60  0001 C CNN
F 3 "" H 2750 3750 60  0000 C CNN
	1    2750 3750
	1    0    0    -1  
$EndComp
Text Label 1550 3300 2    60   ~ 0
D2
Text Label 1550 3500 2    60   ~ 0
D4
Text Label 1550 3800 2    60   ~ 0
D3
$Comp
L GND #PWR08
U 1 1 547E6A47
P 1900 4050
F 0 "#PWR08" H 1900 4050 30  0001 C CNN
F 1 "GND" H 1900 3980 30  0001 C CNN
F 2 "" H 1900 4050 60  0000 C CNN
F 3 "" H 1900 4050 60  0000 C CNN
	1    1900 4050
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR09
U 1 1 547E6C8D
P 1250 3550
F 0 "#PWR09" H 1250 3640 20  0001 C CNN
F 1 "VCC" H 1250 3640 30  0000 C CNN
F 2 "" H 1250 3550 60  0000 C CNN
F 3 "" H 1250 3550 60  0000 C CNN
	1    1250 3550
	1    0    0    -1  
$EndComp
Text Label 3550 3500 0    60   ~ 0
B
Text Label 3550 3600 0    60   ~ 0
G
Text Label 3550 3800 0    60   ~ 0
F
Text Label 3550 3900 0    60   ~ 0
D
Text Label 3550 3700 0    60   ~ 0
C
Text Label 3550 4000 0    60   ~ 0
E
Text Label 3550 3400 0    60   ~ 0
A
$Comp
L R R2
U 1 1 547E9A46
P 3450 5000
F 0 "R2" V 3530 5000 40  0000 C CNN
F 1 "33R" V 3457 5001 40  0000 C CNN
F 2 "Discret:R3" V 3380 5000 30  0000 C CNN
F 3 "~" H 3450 5000 30  0000 C CNN
	1    3450 5000
	0    1    1    0   
$EndComp
$Comp
L R R3
U 1 1 547E9AE5
P 3450 5200
F 0 "R3" V 3530 5200 40  0000 C CNN
F 1 "33R" V 3457 5201 40  0000 C CNN
F 2 "Discret:R3" V 3380 5200 30  0000 C CNN
F 3 "~" H 3450 5200 30  0000 C CNN
	1    3450 5200
	0    1    1    0   
$EndComp
$Comp
L GND #PWR010
U 1 1 547EFD65
P 7800 1500
F 0 "#PWR010" H 7800 1500 30  0001 C CNN
F 1 "GND" H 7800 1430 30  0001 C CNN
F 2 "" H 7800 1500 60  0000 C CNN
F 3 "" H 7800 1500 60  0000 C CNN
	1    7800 1500
	1    0    0    -1  
$EndComp
Text Notes 1050 3050 0    60   ~ 0
Display
Text Notes 2050 3300 2    60   ~ 0
DS
Text Notes 2050 3500 2    60   ~ 0
SH_CP
Text Notes 2050 3800 2    60   ~ 0
ST_CP
NoConn ~ 3450 4200
$Comp
L DIL16 P8
U 1 1 548109B2
P 4600 5150
F 0 "P8" H 4600 5600 60  0000 C CNN
F 1 "LED_DISPLAY" V 4600 5150 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x08" H 4600 5150 60  0001 C CNN
F 3 "" H 4600 5150 60  0000 C CNN
	1    4600 5150
	1    0    0    -1  
$EndComp
$Comp
L R R11
U 1 1 5481161A
P 5500 5300
F 0 "R11" V 5580 5300 40  0000 C CNN
F 1 "33R" V 5507 5301 40  0000 C CNN
F 2 "Discret:R3" V 5430 5300 30  0000 C CNN
F 3 "~" H 5500 5300 30  0000 C CNN
	1    5500 5300
	0    1    1    0   
$EndComp
$Comp
L R R9
U 1 1 5481167E
P 5500 5100
F 0 "R9" V 5580 5100 40  0000 C CNN
F 1 "33R" V 5507 5101 40  0000 C CNN
F 2 "Discret:R3" V 5430 5100 30  0000 C CNN
F 3 "~" H 5500 5100 30  0000 C CNN
	1    5500 5100
	0    1    1    0   
$EndComp
$Comp
L R R8
U 1 1 548116AA
P 5500 5000
F 0 "R8" V 5580 5000 40  0000 C CNN
F 1 "33R" V 5507 5001 40  0000 C CNN
F 2 "Discret:R3" V 5430 5000 30  0000 C CNN
F 3 "~" H 5500 5000 30  0000 C CNN
	1    5500 5000
	0    1    1    0   
$EndComp
$Comp
L R R7
U 1 1 548116D7
P 5500 4900
F 0 "R7" V 5580 4900 40  0000 C CNN
F 1 "33R" V 5507 4901 40  0000 C CNN
F 2 "Discret:R3" V 5430 4900 30  0000 C CNN
F 3 "~" H 5500 4900 30  0000 C CNN
	1    5500 4900
	0    1    1    0   
$EndComp
$Comp
L R R6
U 1 1 54811717
P 5500 4800
F 0 "R6" V 5580 4800 40  0000 C CNN
F 1 "33R" V 5507 4801 40  0000 C CNN
F 2 "Discret:R3" V 5430 4800 30  0000 C CNN
F 3 "~" H 5500 4800 30  0000 C CNN
	1    5500 4800
	0    1    1    0   
$EndComp
Text Label 3200 5200 2    60   ~ 0
E
Text Label 5750 5300 0    60   ~ 0
F
Text Label 5750 5100 0    60   ~ 0
C
Text Label 5750 5000 0    60   ~ 0
A
Text Label 5750 4900 0    60   ~ 0
G
Text Label 5750 4800 0    60   ~ 0
B
$Comp
L R R10
U 1 1 5481239E
P 5500 5200
F 0 "R10" V 5580 5200 40  0000 C CNN
F 1 "33R" V 5507 5201 40  0000 C CNN
F 2 "Discret:R3" V 5430 5200 30  0000 C CNN
F 3 "~" H 5500 5200 30  0000 C CNN
	1    5500 5200
	0    1    1    0   
$EndComp
Connection ~ 4400 2400
Wire Wire Line
	4400 2400 4400 2500
Wire Wire Line
	4200 2400 4600 2400
Wire Wire Line
	4800 1550 4850 1550
Wire Wire Line
	4750 1750 4850 1750
Wire Wire Line
	4800 1000 4800 1550
Wire Wire Line
	4800 1150 4850 1150
Connection ~ 4800 1150
Wire Wire Line
	4750 1750 4750 1350
Connection ~ 4750 1350
Connection ~ 4200 1600
Wire Wire Line
	4200 2300 4200 2400
Wire Wire Line
	6000 1850 6550 1850
Wire Wire Line
	6550 1850 6550 1500
Wire Wire Line
	6000 1400 6700 1400
Wire Wire Line
	1700 1450 2100 1450
Connection ~ 1900 1450
Wire Wire Line
	1800 1200 2000 1200
Wire Wire Line
	1900 1450 1900 1200
Connection ~ 1900 1200
Wire Wire Line
	2900 1450 3200 1450
Wire Wire Line
	3000 1450 3000 1550
Connection ~ 3000 1450
Wire Wire Line
	2500 1750 2500 2100
Wire Wire Line
	2500 2100 3000 2100
Wire Wire Line
	3000 2050 3000 2350
Connection ~ 3000 2100
Wire Wire Line
	2400 2350 2050 2350
Wire Wire Line
	2050 1650 2050 2500
Wire Wire Line
	1700 1650 2050 1650
Wire Wire Line
	3000 2350 2900 2350
Connection ~ 2050 2350
Wire Wire Line
	1800 1700 1800 1650
Connection ~ 1800 1650
Wire Wire Line
	3200 1450 3200 1350
Wire Notes Line
	1050 800  1050 2750
Wire Notes Line
	1050 2750 3500 2750
Wire Notes Line
	3500 2750 3500 800 
Wire Notes Line
	3500 800  1050 800 
Wire Notes Line
	3800 800  3800 2600
Wire Notes Line
	3800 2600 5400 2600
Wire Notes Line
	5400 2600 5400 800 
Wire Notes Line
	5400 800  3800 800 
Wire Notes Line
	5700 800  7200 800 
Wire Notes Line
	5700 1950 5700 800 
Wire Notes Line
	7500 1900 10000 1900
Wire Notes Line
	10000 1900 10000 4650
Wire Notes Line
	10000 4650 7500 4650
Wire Notes Line
	7500 4650 7500 1900
Wire Wire Line
	6550 1500 6700 1500
Wire Wire Line
	6700 1300 6550 1300
Wire Wire Line
	6550 1300 6550 950 
Wire Wire Line
	6550 950  6000 950 
Wire Wire Line
	6000 1400 6000 1450
Connection ~ 6300 1400
Wire Wire Line
	6300 1800 6300 1850
Connection ~ 6300 1850
Wire Wire Line
	6300 1000 6300 950 
Connection ~ 6300 950 
Wire Notes Line
	7200 800  7200 1950
Wire Notes Line
	7200 1950 5700 1950
Wire Wire Line
	8050 1400 7800 1400
Wire Wire Line
	8050 1200 7950 1200
Wire Wire Line
	7950 1200 7950 950 
Wire Notes Line
	7500 800  8600 800 
Wire Notes Line
	8600 800  8600 1600
Wire Notes Line
	8600 1600 7500 1600
Wire Notes Line
	7500 1600 7500 800 
Wire Wire Line
	2050 3300 1550 3300
Wire Wire Line
	1550 3500 2050 3500
Wire Wire Line
	1550 3800 2050 3800
Wire Wire Line
	1900 3900 2050 3900
Wire Wire Line
	1900 3900 1900 4050
Wire Wire Line
	2050 3600 1250 3600
Wire Wire Line
	1250 3600 1250 3550
Wire Wire Line
	3450 3400 3900 3400
Wire Wire Line
	3450 3500 3900 3500
Wire Wire Line
	3450 3600 3900 3600
Wire Wire Line
	3450 3700 3900 3700
Wire Wire Line
	3450 3800 3900 3800
Wire Wire Line
	3450 3900 3900 3900
Wire Wire Line
	3450 4000 3900 4000
Wire Wire Line
	7800 1400 7800 1500
Wire Notes Line
	1050 3050 1050 6050
Wire Notes Line
	1050 6050 6800 6050
Wire Notes Line
	6800 6050 6800 3050
Wire Notes Line
	6800 3050 1050 3050
Wire Wire Line
	4250 4800 4050 4800
Wire Wire Line
	4250 4900 4050 4900
Wire Wire Line
	4250 5000 3700 5000
Wire Wire Line
	4250 5200 3700 5200
Wire Wire Line
	4250 5100 3800 5100
Wire Wire Line
	4250 5300 4050 5300
Wire Wire Line
	4250 5500 4050 5500
Wire Wire Line
	4950 4800 5250 4800
Wire Wire Line
	4950 4900 5250 4900
Wire Wire Line
	4950 5000 5250 5000
Wire Wire Line
	4950 5100 5250 5100
Wire Wire Line
	4950 5300 5250 5300
Wire Wire Line
	4950 5200 5250 5200
Wire Wire Line
	5750 4800 5950 4800
Wire Wire Line
	5750 4900 5950 4900
Wire Wire Line
	5750 5000 5950 5000
Wire Wire Line
	5750 5100 5950 5100
Wire Wire Line
	5750 5300 5950 5300
Wire Wire Line
	3200 5000 3050 5000
Entry Wire Line
	3900 3400 4000 3500
Entry Wire Line
	3900 3500 4000 3600
Entry Wire Line
	3900 3600 4000 3700
Entry Wire Line
	3900 3700 4000 3800
Entry Wire Line
	3900 3800 4000 3900
Entry Wire Line
	5950 4800 6050 4900
Entry Wire Line
	5950 4900 6050 5000
Entry Wire Line
	5950 5000 6050 5100
Entry Wire Line
	3900 3900 4000 4000
Entry Wire Line
	3900 4000 4000 4100
Entry Wire Line
	5950 5100 6050 5200
Entry Wire Line
	5950 5300 6050 5400
Wire Wire Line
	3200 5200 3050 5200
Entry Wire Line
	2950 4900 3050 5000
Entry Wire Line
	2950 5100 3050 5200
NoConn ~ 4950 5400
Wire Bus Line
	2950 4550 6050 4550
Wire Bus Line
	2950 4550 2950 5100
Wire Bus Line
	6050 4550 6050 5400
NoConn ~ 4950 5500
NoConn ~ 4250 5400
Text Notes 4250 4800 2    39   ~ 0
DIG1
Text Label 4050 4800 2    60   ~ 0
D5
Text Label 4050 4900 2    60   ~ 0
D6
Text Notes 4250 4900 2    39   ~ 0
DIG2
Text Notes 4250 5000 2    39   ~ 0
SEG_D
Text Notes 4250 5100 2    39   ~ 0
COL+
Text Notes 4250 5200 2    39   ~ 0
SEG_E
Text Notes 4250 5300 2    39   ~ 0
DIG3
Text Notes 4250 5400 2    39   ~ 0
SEG_DP
Text Notes 4250 5500 2    39   ~ 0
DIG4
Text Label 3200 5000 2    60   ~ 0
D
Text Notes 4950 4800 0    39   ~ 0
SEG_B
Text Notes 4950 4900 0    39   ~ 0
SEG_G
Text Notes 4950 5000 0    39   ~ 0
SEG_A
Text Notes 4950 5100 0    39   ~ 0
SEG_C
Text Notes 4950 5200 0    39   ~ 0
COL-
Text Notes 4950 5300 0    39   ~ 0
SEG_F
Text Notes 4950 5400 0    39   ~ 0
POINT+
Text Notes 4950 5500 0    39   ~ 0
POINT-
Text Label 4050 5300 2    60   ~ 0
D7
Text Label 4050 5500 2    60   ~ 0
D8
Text Label 7950 4000 2    60   ~ 0
D9
Wire Wire Line
	3800 5100 3800 4900
Wire Wire Line
	5750 5200 5850 5200
Text Label 5750 5200 0    60   ~ 0
D9
NoConn ~ 3450 3300
Wire Bus Line
	4000 3500 4000 4550
$Comp
L Arduino_Pro_Micro U3
U 1 1 548327E2
P 8700 3550
F 0 "U3" H 8350 4400 60  0000 C CNN
F 1 "Arduino_Pro_Micro" H 8700 2700 60  0000 C CNN
F 2 "Cylindric:ArduinoProMicro" H 8675 3650 60  0001 C CNN
F 3 "" H 8675 3650 60  0000 C CNN
	1    8700 3550
	1    0    0    -1  
$EndComp
NoConn ~ 8100 3100
NoConn ~ 8100 3200
NoConn ~ 9300 3700
NoConn ~ 9300 3600
NoConn ~ 9300 3500
NoConn ~ 9300 3400
NoConn ~ 9300 3100
NoConn ~ 9300 2900
Wire Wire Line
	8100 3300 7950 3300
Wire Wire Line
	7950 3400 8100 3400
Wire Wire Line
	7950 3500 8100 3500
Wire Wire Line
	7950 3600 8100 3600
Wire Wire Line
	7950 3700 8100 3700
Wire Wire Line
	7950 3800 8100 3800
Wire Wire Line
	7950 3900 8100 3900
Wire Wire Line
	7950 4000 8100 4000
Wire Wire Line
	9300 4100 9450 4100
Wire Wire Line
	9450 4000 9300 4000
Wire Wire Line
	9450 3900 9300 3900
Wire Wire Line
	9450 3800 9300 3800
$Comp
L VCC #PWR011
U 1 1 54835234
P 3800 4900
F 0 "#PWR011" H 3800 4990 20  0001 C CNN
F 1 "VCC" H 3800 4990 30  0000 C CNN
F 2 "" H 3800 4900 60  0000 C CNN
F 3 "" H 3800 4900 60  0000 C CNN
	1    3800 4900
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR012
U 1 1 54836219
P 3200 1350
F 0 "#PWR012" H 3200 1440 20  0001 C CNN
F 1 "VCC" H 3200 1440 30  0000 C CNN
F 2 "" H 3200 1350 60  0000 C CNN
F 3 "" H 3200 1350 60  0000 C CNN
	1    3200 1350
	1    0    0    -1  
$EndComp
$Comp
L MOSFET_N Q1
U 1 1 54836FA2
P 4500 1600
F 0 "Q1" H 4500 1452 40  0000 R CNN
F 1 "BUZ11" H 4500 1750 40  0000 R CNN
F 2 "Transistors_TO-220:TO-220_FET-GDS_Vertical" H 4400 1700 25  0000 C CIN
F 3 "" H 4500 1600 60  0000 C CNN
	1    4500 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 2400 4600 1800
Wire Wire Line
	4600 1400 4600 1350
Wire Wire Line
	4600 1350 4850 1350
Wire Wire Line
	4200 1800 4200 1600
Wire Wire Line
	4050 1600 4300 1600
$EndSCHEMATC
