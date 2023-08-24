//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {

/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"[ ",  "mynettraf",  1,  16}, 
	{"",  "mycpu", 5,  4},
	{"",  "myram", 5,  4},
	{"",  "myinternet", 5,  4},
	{"",  "mybattery", 2,  4},
	{"",  "myvolume", 1,  10},
	{"",  "myclock",  60, 1},
  
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " ][ ";
static unsigned int delimLen = 5;
