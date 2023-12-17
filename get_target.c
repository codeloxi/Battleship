#include <stdio.h>
#include "battleship.h"
Coordinate get_target (void) {
	Coordinate target;

	fflush (stdin);

	printf ("Enter Target (ex. - 3 4): ");
	scanf ("%d %d", &target.row, &target.column);

	return target;
}
