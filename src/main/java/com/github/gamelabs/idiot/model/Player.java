package com.github.gamelabs.idiot.model;

import java.util.Date;

import javax.persistence.Entity;

import lombok.Data;

import com.github.gamelabs.idiot.enums.GameType;
import com.github.gamelabs.idiot.enums.IdType;

@Entity
@Data
public class Player extends AbstractEntity {
	IdType identification_type;

	String identification_hash;

	String name;

	Date joined = new Date();
}
