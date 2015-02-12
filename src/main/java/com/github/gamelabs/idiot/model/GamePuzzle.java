package com.github.gamelabs.idiot.model;

import javax.persistence.Entity;

@Entity
public class GamePuzzle {
	Game game;
	Puzzle puzzle;
	boolean played;
	boolean won;
	int time_score;
}
