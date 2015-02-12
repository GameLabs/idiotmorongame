package com.github.gamelabs.idiot.model;

import javax.persistence.Entity;

@Entity
public class Puzzle extends AbstractEntity {
	String name;
	String description;
}
