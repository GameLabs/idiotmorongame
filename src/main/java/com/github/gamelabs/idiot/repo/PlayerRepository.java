package com.github.gamelabs.idiot.repo;

import org.springframework.stereotype.Repository;

import com.github.gamelabs.idiot.model.Player;

@Repository
public interface PlayerRepository extends BaseRepository<Player> {
	//Game findByName();
}
