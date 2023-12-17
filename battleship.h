#ifndef BATTLESHIP_H
#define BATTLESHIP_H

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <ctype.h>

#define ROWS 10
#define COLS 10

#define NUM_OF_SHIPS  5

#define HORIZONTAL    0
#define VERTICAL      1

#define PLAYER_ONE    0
#define PLAYER_TWO    1


#define WATER         '~'
#define HIT           '*'
#define MISS          'm'

#define CARRIER       'c'
#define BATTLESHIP    'b'
#define CRUISER       'q'
#define SUBMARINE     's'
#define DESTROYER     'd'

#define NORTH 0
#define SOUTH 1
#define WEST  2
#define EAST  3

typedef enum {
	CARRIER_L    = 5, 
	BATTLESHIP_L = 4,
	CRUISER_L    = 3, 
	SUBMARINE_L  = 3,
	DESTROYER_L  = 2
} ShipType;

typedef enum {
	FALSE, TRUE
} Boolean;

typedef struct watercraft {
	char   symbol;
	short  length;
	char   *name;
} WaterCraft;

typedef struct stats {
	int        numHits;
	int        numMisses;
	int        totalShots;
	double     hitMissRatio;
} Stats;

typedef struct coordinate {
	int        row;
	int        column;
} Coordinate;

typedef struct cell {
	char       symbol; 
	Coordinate position;
} Cell;

extern void welcome(void);
extern void update (Cell gameBoard[][COLS], Coordinate target);
extern Boolean string_to_pos (Coordinate position[], char *stringPosition, int length);
extern void random_place_ships (Cell gameBoard[][COLS], WaterCraft ship[]);
extern int random_num (int low, int high);
extern void put_ship(Cell gameBoard[][COLS], WaterCraft ship, Coordinate position, int direction);
extern void print_game_board (Cell gameBoard [][COLS], Boolean test);
extern void message (char *message);
extern void manually_place_ships (Cell gameBoard[][COLS], WaterCraft ship[]);
extern Boolean location_valid (Cell gameBoard[][COLS], Coordinate position, int direction, int length);
extern Boolean is_winner (Stats players[], int player);
extern void init_gameboard (Cell gameBoard[][COLS]);
extern Coordinate get_target (void);
extern Coordinate generate_position (int direction, int length);
extern Boolean check_sunk (short sunkShip[][NUM_OF_SHIPS], short player, char shipSymbol);
extern short check_shot (Cell gameBoard[][COLS], Coordinate target);
extern void check_cardinal (Boolean cardinals[], int bound, int direction);


#endif