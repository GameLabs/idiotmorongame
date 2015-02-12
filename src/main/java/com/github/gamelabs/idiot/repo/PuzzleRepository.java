package com.github.gamelabs.idiot.repo;

import org.springframework.stereotype.Repository;

import com.github.gamelabs.idiot.model.Puzzle;

@Repository
public interface PuzzleRepository extends BaseRepository<Puzzle> {
	//Game findByName();
}
