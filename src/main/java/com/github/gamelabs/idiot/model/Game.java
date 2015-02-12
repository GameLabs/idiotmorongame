package com.github.gamelabs.idiot.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import lombok.Data;

import com.github.gamelabs.idiot.enums.GameType;

@Entity
@Data
public class Game extends AbstractEntity {
	@OneToOne
	Player player;

	@Enumerated(EnumType.STRING)
	GameType type;
	int time_played;
	int score;

	@OneToMany(mappedBy="game")
	List<GamePuzzle> puzzles;
}
