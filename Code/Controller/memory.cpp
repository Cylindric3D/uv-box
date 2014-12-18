#include "Arduino.h"
#include <EEPROM.h>
#include "memory.h"


Memory::Memory()
{
	read();
}


int Memory::getClockSeconds()
{
	return _clockSeconds;
}


void Memory::setClockSeconds(int value)
{
	if(value != _clockSeconds)
		_dirtyBytes[Memory::CLOCK_ADDRESS] = true;

	_clockSeconds = value;
}


void Memory::initialise()
{
	Serial.println("Initialising memory.");
	// Write the identity block
	writeByte(0, 'P');
	writeByte(1, 'C');
	writeByte(2, 'B');
	
	// Write the default clock time
	setClockSeconds(120);
	
	// Save
	save();
}


void Memory::read()
{
	Serial.println("Reading memory.");
	char sigA = readByte(0);
	char sigB = readByte(1);
	char sigC = readByte(2);
	if(!(sigA == 'P' && sigB == 'C' && sigC == 'B'))
	{
		initialise();
	}
	
	_clockSeconds = readInt(Memory::CLOCK_ADDRESS);
}


void Memory::save()
{
	Serial.println("Writing memory.");
	if(_dirtyBytes[Memory::CLOCK_ADDRESS])
		writeInt(Memory::CLOCK_ADDRESS, _clockSeconds);

}


byte Memory::readByte(int address)
{
	return EEPROM.read(address);
}


void Memory::writeByte(int address, byte value)
{
	// Write to EEPROM.
	EEPROM.write(address, value);

	// Mark the memory location as clean.
	_dirtyBytes[address] = false;
}


void Memory::writeInt(int address, int value)
{
	byte lowByte = ((value >> 0) & 0xFF);
	byte highByte = ((value >> 8) & 0xFF);

	writeByte(address, lowByte);
	writeByte(address + 1, highByte);
}


unsigned int Memory::readInt(int address)
{
	byte lowByte = readByte(address);
	byte highByte = readByte(address + 1);

	return ((lowByte << 0) & 0xFF) + ((highByte << 8) & 0xFF00);
}
