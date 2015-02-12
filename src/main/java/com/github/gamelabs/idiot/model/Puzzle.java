package com.github.gamelabs.idiot.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.OneToMany;

import lombok.Data;

@Entity
@Data
public class Puzzle extends AbstractEntity {
	String name;
	String description;
	
	@OneToMany(mappedBy="puzzle")
	List<GamePuzzle> games;
}
