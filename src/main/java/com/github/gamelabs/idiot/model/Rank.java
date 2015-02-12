package com.github.gamelabs.idiot.model;

import javax.persistence.Entity;

import com.github.gamelabs.idiot.enums.GameType;

@Entity
public class Rank extends AbstractEntity {
	Puzzle puzzle;
	GameType gameType;
	int rank_score;
}
