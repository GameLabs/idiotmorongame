package com.github.gamelabs.idiot.model;

import javax.persistence.Entity;

import lombok.Data;

import com.github.gamelabs.idiot.enums.GameType;

@Entity
@Data
public class Puzzle extends AbstractEntity {
	String name;
	String description;
}
