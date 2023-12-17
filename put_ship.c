#include "battleship.h"
void put_ship(Cell gameBoard[][COLS], WaterCraft ship, 
	                     Coordinate position, int direction) {
	int i = ship.length - 1;

	for (i = 0; i < ship.length; i++) {
		if (direction == HORIZONTAL) 
			gameBoard [position.row][position.column + i].symbol = ship.symbol;
		else 
			gameBoard [position.row + i][position.column].symbol = ship.symbol;
	}
}