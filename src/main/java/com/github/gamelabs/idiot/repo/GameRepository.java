package com.github.gamelabs.idiot.repo;

import org.springframework.stereotype.Repository;

import com.github.gamelabs.idiot.model.Game;

@Repository
public interface GameRepository extends BaseRepository<Game> {
	//Game findByName();
}
