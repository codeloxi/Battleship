#include <stdio.h>
#include "battleship.h"
void print_game_board (Cell gameBoard [][COLS], Boolean test) {
	int i = 0, j = 0;

	printf ("  0 1 2 3 4 5 6 7 8 9\n");

	for (i = 0; i < ROWS; i++) {
		printf ("%d ", i);

		for (j = 0; j < COLS; j++) {
			if (test == TRUE) 
				printf ("%c ", gameBoard [i][j].symbol);
			else {
				switch (gameBoard [i][j].symbol) {
					case HIT:   printf ("%c ", HIT);   break;
					case MISS:  printf ("%c ", MISS);  break;
					case WATER: 
					default:    printf ("%c ", WATER); break;
				}
			}
		}
		
		putchar ('\n');
	}
}