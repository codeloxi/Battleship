#include <stdio.h>
#include "battleship.h"
void random_place_ships (Cell gameBoard[][COLS], WaterCraft ship[]) {
	Coordinate position;
	int direction = -1;
	int i = 0;

	for (i = 0; i < NUM_OF_SHIPS; i++) {
		while (TRUE) {
			direction = random_num (0, 1); 
			position = generate_position (direction, ship[i].length);

			if (location_valid (gameBoard, position, direction, ship[i].length)) break;
		}

		put_ship (gameBoard, ship[i], position, direction);
	}
}