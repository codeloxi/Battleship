#include <stdio.h>
#include "battleship.h"
Boolean location_valid (Cell gameBoard[][COLS], Coordinate position, 
				         int direction, int length) {
	int i = length - 1;
	Boolean is_valid = TRUE;

	for (i = 0; is_valid && i < length; i++) {
		if (direction == HORIZONTAL) {
			if (gameBoard [position.row][position.column + i].symbol != WATER &&
				(position.column + i) < COLS)
				is_valid = FALSE;
		} else { 
			if (gameBoard [position.row + i][position.column].symbol != WATER &&
				(position.row + i) < ROWS)
				is_valid = FALSE;
		}
	}

	return is_valid;
}