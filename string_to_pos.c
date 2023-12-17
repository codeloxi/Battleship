#include <stdio.h>
#include "battleship.h"
Boolean string_to_pos (Coordinate position[], char *stringPosition, int length) {
	Boolean flag = TRUE;
	char temp = '\0';
	int i = 0, j = 0, k = 1;

	if (strlen (stringPosition)/2 == length) {
		for (i = 0; i < length && flag; i++) {
			/* checks if each cell is a digit */
			if (isdigit (stringPosition[j]) && isdigit (stringPosition[k])) {
				position[i].row = stringPosition[j] - '0';
				position[i].column = stringPosition[k] - '0'; 

				j += 2;
				k += 2;
			} else {
				flag = FALSE;
			}
		}
	} else {
		flag = FALSE;
	}

	return flag;
}