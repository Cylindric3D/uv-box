#ifndef Memory_h
#define Memory_h

class Memory
{
	public:
		// Constructor
		Memory();
		void save();
		int getClockSeconds();
		void setClockSeconds(int seconds);
		
	private:
		static const int CLOCK_ADDRESS = 3;
		static const int MEMORY_TOP = 3;
		int _clockSeconds;
		bool _dirtyBytes[4];
		
		void writeByte(int address, byte value);
		byte readByte(int address);
		
		void writeInt(int address, int value);
		unsigned int readInt(int address);
		void initialise();
		void read();

};

#endif