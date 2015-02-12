package com.github.gamelabs.idiot.model;

import java.util.List;

import javax.persistence.Entity;

import lombok.Data;

import com.github.gamelabs.idiot.enums.GameType;

@Entity
@Data
public class Game extends AbstractEntity {
	GameType type;
	Player player;
	int time_played;
	int score;

	List<GamePuzzle> gamePuzzles;
}
