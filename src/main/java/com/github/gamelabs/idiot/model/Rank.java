package com.github.gamelabs.idiot.model;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import lombok.Data;

import com.github.gamelabs.idiot.enums.GameType;

@Entity
@Data
public class Rank extends AbstractEntity {
	@OneToOne
	Puzzle puzzle;

	@Enumerated(EnumType.STRING)
	GameType gameType;
	int rank_score;
}
