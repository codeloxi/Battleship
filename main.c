#include "battleship.h"
	
int main(void){
	
	Stats players[2] = {{0, 0, 0, 0.0}, {0, 0, 0, 0.0}};
	
	Cell player_one_board[ROWS][COLS];
	Cell player_two_board[ROWS][COLS];
	
	Coordinate target; Coordinate target_temp; Coordinate target_origin;
	Coordinate target_CPU;
	
	WaterCraft ship[NUM_OF_SHIPS] = {{'c', 5, "Carrier"}, 
		                                 {'b', 4, "Battleship"}, 
		                                 {'q', 3, "Cruiser"}, 
		                                 {'s', 3, "Submarine"}, 
						 {'d', 2, "Destroyer"}};
	
	
	Boolean huntMode = TRUE;                     
	Boolean targetMode = FALSE;                 
	Boolean flipper = TRUE;	           
	Boolean cardinals[4] = {TRUE, TRUE, TRUE, TRUE}; 
	Boolean hasAShipSunked = FALSE; 
	
	short sunkShip[2][NUM_OF_SHIPS] = {{5, 4, 3, 3, 2},{5, 4, 3, 3, 2}};
	
	short player = 0; short shot = 0; int option = 0; int north = 0; int south = 0;
	int east = 0; int west = 0; int i = 0; int count = 1;
	char ship_symbol = '\0';
	
	
	welcome();
	init_gameboard(player_one_board);
	init_gameboard(player_two_board);
	
	printf("Do you want to place your own ships manually or have the computer randomly select?\n");
	printf("Enter 1 for Manual - 2 for random: ");
	scanf("%d",&option);
	switch(option){
		case 1: manually_place_ships(player_one_board, ship);
			break;
		case 2: random_place_ships(player_one_board, ship);
			break;
	}	
	random_place_ships(player_two_board, ship);
	player = random_num(0,1);
	printf("Player %d was chosen to go first\n", player + 1);
	system("cls");
	while(TRUE){
		switch(player){
			case PLAYER_ONE:
				printf("Player two's board\n");
				print_game_board(player_two_board, FALSE);
				printf("Player one's turn\n");
					
				do{
					target = get_target();
					shot = check_shot(player_two_board, target);
					if(shot == -1)
						printf("Enter another target\n");
					
				}while(shot == -1);
				ship_symbol = player_two_board[target.row][target.column].symbol;
				break;
	
			case PLAYER_TWO:
				printf("Player ones's board\n");
				print_game_board(player_one_board, TRUE);
				printf("CPU's turn\n");
				
				if(hasAShipSunked){
					hasAShipSunked = FALSE;
					targetMode = FALSE;
					huntMode = TRUE;
				}
				
				if (targetMode) {
						
						target = target_CPU;
	
						do {
							if (cardinals[NORTH]) {        
								target.row = north;
							} else if (cardinals[SOUTH]) { 
								target.row = south;
							} else if (cardinals[WEST]) {  
								target.column = west;
							} else if (cardinals[EAST]) {  
								target.column = east;
							} else if (!cardinals[NORTH] && !cardinals[SOUTH] && 
							           !cardinals[WEST]  && !cardinals[EAST]  && 
									   !hasAShipSunked) {
								
								target = target_origin;
								target_temp = target;
	
								north = target.row - count;
								target_temp.row = north;
	
								
								if (check_shot (player_one_board, target_temp) != -1 && north >= 0) {
									cardinals[NORTH] = TRUE;
								}
	
								target_temp = target;
								south = target.row + count;
								target_temp.row = south;
	
								
								if (check_shot (player_one_board, target_temp) != -1 && south <= 9) {
									cardinals[SOUTH] = TRUE;
								}
	
								target_temp = target;
								west = target.column - count;
								target_temp.column = west;
	
								
								if (check_shot (player_one_board, target_temp) != -1 && west >= 0) {
									cardinals[WEST] = TRUE;
								}
	
								target_temp = target;
								east = target.column + count;
								target_temp.column = east;
	
					
								if (check_shot (player_one_board, target_temp) != -1 && east <= 9) {
									cardinals[EAST] = TRUE;
								}
								count++;
	
							} else  {
								targetMode = FALSE;
								huntMode = TRUE;
								break;
							}
							
							
							shot = check_shot (player_one_board, target);
	
						} while (shot == -1 && targetMode == TRUE);
	
						
						if (shot == 1 && huntMode == FALSE) {
							for (i = 0; i < 4; i++) {
								if (flipper == FALSE)
									cardinals[i] = FALSE;
	
								if (cardinals[i] == flipper) 
									flipper = FALSE;
							}
						} else {
							for (i = 0; i < 4; i++) {
								if (flipper == TRUE && cardinals[i] != FALSE) {
									cardinals[i] = FALSE;
									break;
								}
							}
						}
	
						
						flipper = TRUE;
				}
	
				if(huntMode){
					count = 1;
						flipper = TRUE;
						for (i = 0; i < 4; i++)
							cardinals[i] = TRUE;
	
						do {
							target.row = random_num (0, 9);
							target.column = random_num (0, 9);
	
							shot = check_shot (player_one_board, target);
						} while (shot == -1);
	
						
						if (shot == 1) target_origin = target;
					
					
				}
				if (shot == 1) {
	
						if (!cardinals[NORTH] && !cardinals[SOUTH] && 
							!cardinals[WEST]  && !cardinals[EAST]  && 
							!hasAShipSunked) { target = target_origin; }
	
						
						huntMode = FALSE;
						targetMode = TRUE;
						target_CPU = target;
	
						if (cardinals[NORTH] == TRUE) {  
							north = (target_CPU.row - 1);
							check_cardinal (cardinals, north, NORTH);
							target_temp = target;
							target_temp.row = north;
							if (check_shot (player_one_board, target_temp) == -1)
								cardinals[NORTH] = FALSE;
						}
						
						if (cardinals[SOUTH] == TRUE) { 
							south = target_CPU.row + 1;
							check_cardinal (cardinals, south, SOUTH);
							target_temp = target;
							target_temp.row = south;
							if (check_shot (player_one_board, target_temp) == -1)
								cardinals[SOUTH] = FALSE;
						}
	
						if (cardinals[WEST] == TRUE) {  
							west  = target_CPU.column - 1;
							check_cardinal (cardinals, west, WEST);
							target_temp = target;
							target_temp.column = west;
							if (check_shot (player_one_board, target_temp) == -1)
								cardinals[WEST] = FALSE;
						}
	
						if (cardinals[EAST] == TRUE) {   
							east  = target_CPU.column + 1;
							check_cardinal (cardinals, east, EAST);
							target_temp = target;
							target_temp.column = east;
							if (check_shot (player_one_board, target_temp) == -1)
								cardinals[EAST] = FALSE;
						}
					}
	
				
					ship_symbol = player_one_board[target.row][target.column].symbol;
					break;
	}
	
		if(shot == 1){
			printf("%d, %d is a hit\n", target.row, target.column);
			players[player].numHits++;
	
			if(player == 1)
				hasAShipSunked = check_sunk(sunkShip, !player, ship_symbol);
			else
				check_sunk(sunkShip, !player, ship_symbol);
		}else{
			printf("%d, %d is a miss\n", target.row, target.column);
			players[player].numMisses++;	
		}
		if (player == 0)
			update(player_two_board, target);
		else
			update(player_one_board, target);
	
		if(is_winner(players, player)){
			printf("Player %d wins!!!!!\n", player + 1);
			break;
		}
		
		player = !player;
	}
	
	
	
	printf("STATS\n");
	printf("Player 1: %d hits, %d misses, %d total shots\n",players[0].numHits, players[0].numMisses, players[0].totalShots);
	printf("Player 2: %d hits, %d misses, %d total shots\n",players[1].numHits, players[1].numMisses, players[1].totalShots);
	
	
	
	
	
	return 0;
}