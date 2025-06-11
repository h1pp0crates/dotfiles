//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
    {"󰋊  ", "df -h / | awk 'NR==2 {print $4}'", 25, 0},

    {"", "bash $HOME/dwmblocks/wether.sh", 60, 0},

    {"   ", "free -m | awk '/^Mem:/ {print $3 \" MB\"}'",	1,		0}, 

    {"   ", "top -bn1 | grep \"Cpu(s)\" | awk '{print $2 + $4 \"%\"}'", 1, 0},

    {"   ", "echo \"$(($(cat /sys/class/thermal/thermal_zone9/temp) / 1000))°C\"", 1, 0},

	{"   ", "echo \"$($HOME/dwmblocks/vol.sh)%\"", 0, 10},
    
    {"    ", "nmcli -f in-use,signal dev wifi | grep '*' | awk '{print $2}'", 5, 0},
    
	{"  ", "echo \"$(cat /sys/class/power_supply/BAT0/capacity)%\"", 2, 0},
		
	{"   ", "date '+%b %d (%a) %I:%M%p'",					5,		0},

	
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
