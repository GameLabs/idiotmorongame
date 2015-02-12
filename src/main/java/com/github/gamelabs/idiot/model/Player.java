package com.github.gamelabs.idiot.model;

import java.util.Date;

import javax.persistence.Entity;

import com.github.gamelabs.idiot.enums.IdType;


@Entity
public class Player extends AbstractEntity {
	IdType identification_type;

	String identification_hash;
	
	String name;
	
	Date joined = new Date();
}
