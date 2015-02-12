package com.github.gamelabs.idiot.repo;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.NoRepositoryBean;

import com.github.gamelabs.idiot.model.AbstractEntity;

@NoRepositoryBean
public interface BaseRepository<T extends AbstractEntity> extends JpaRepository<T, UUID>{
	// No methods yet
}
