package com.github.gamelabs.idiot.model;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;

import lombok.Data;

@Entity
@Data
public class GamePuzzle extends AbstractEntity{
	@ManyToOne
	Game game;
	@ManyToOne
	Puzzle puzzle;

	boolean played;
	boolean won;
	int time_score;
}
