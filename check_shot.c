#include <stdio.h>
#include "battleship.h"
short check_shot (Cell gameBoard[][COLS], Coordinate target) {
	int hit = -2;

	switch (gameBoard[target.row][target.column].symbol) {
		case WATER: 
			hit = 0;
			break;

		case CARRIER: 
		case BATTLESHIP:
		case CRUISER:
		case SUBMARINE:
		case DESTROYER:
			hit = 1;
			break;

		case HIT:
		case MISS:
		default:
			hit = -1;
			break;
	}	

	return hit;
}