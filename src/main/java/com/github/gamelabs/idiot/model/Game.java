package com.github.gamelabs.idiot.model;

import java.util.List;

import javax.persistence.Entity;

import com.github.gamelabs.idiot.enums.GameType;

@Entity
public class Game extends AbstractEntity {
	GameType type;
	Player player;
	int time_played;
	int score;
	
	List<GamePuzzle> gamePuzzles;
}
