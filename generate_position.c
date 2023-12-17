#include <stdio.h>
#include "battleship.h"
Coordinate generate_position (int direction, int length) {
	Coordinate position;

	if (direction == HORIZONTAL) {
		position.row = random_num (0, ROWS);
		position.column = random_num (0, COLS - length);
	} else { 
		position.row = random_num (0, ROWS - length);
		position.column = random_num (0, COLS);
	}

	return position;
}