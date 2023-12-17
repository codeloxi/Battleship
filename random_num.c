#include <stdio.h>
#include "battleship.h"
int random_num (int low, int high) {
	if (low == 0)
		return rand () % ++high;
	
	if (low > 0)
		return rand () % ++high + low;
}