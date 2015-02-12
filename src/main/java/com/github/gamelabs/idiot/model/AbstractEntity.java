package com.github.gamelabs.idiot.model;

import java.util.UUID;

import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
public abstract class AbstractEntity {
	@Id
	UUID uuid;

	@Override
	public abstract String toString();
	@Override
	public abstract boolean equals(Object obj);
	@Override
	public abstract int hashCode();
}
