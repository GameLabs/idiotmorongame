package com.github.gamelabs.idiot.repo;

import org.springframework.stereotype.Repository;

import com.github.gamelabs.idiot.model.GamePuzzle;

@Repository
public interface GamePuzzleRepository extends BaseRepository<GamePuzzle> {
	//Game findByName();
}
