package com.github.gamelabs.idiot.model;

import java.util.UUID;

import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
public abstract class AbstractEntity {
	@Id
	UUID uuid;
}
