package com.github.gamelabs.idiot.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Data;

import com.github.gamelabs.idiot.enums.IdType;

@Entity
@Data
public class Player extends AbstractEntity {
	IdType identification_type;

	String identification_hash;

	String name;

	@Temporal(TemporalType.TIMESTAMP)
	Date joined = new Date();
	
	@OneToMany(mappedBy="player")
	List<Game> games;
}
