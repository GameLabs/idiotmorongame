--
-- Table structure for table game
--

CREATE TABLE game (
  game_nr integer NOT NULL,
  game_type integer NOT NULL,
  player_name varchar(256) NOT NULL,
  time_played integer DEFAULT NULL,
  score integer DEFAULT NULL
);

--
-- Table structure for table game_puzzle
--

CREATE TABLE game_puzzle (
  game_nr integer NOT NULL,
  puzzle_name varchar(256) NOT NULL,
  played boolean DEFAULT NULL,
  won boolean DEFAULT NULL,
  time_score integer DEFAULT NULL
);

--
-- Table structure for table game_types
--

CREATE TABLE game_types (
  type integer NOT NULL,
  name varchar(256) NOT NULL,
  description varchar(256) NOT NULL
);

--
-- Table structure for table player
--

CREATE TABLE player (
  identification_hash varchar(256) NOT NULL,
  identification_type integer NOT NULL,
  player_name varchar(256) NOT NULL,
  join_date date NOT NULL
);

--
-- Table structure for table puzzle
--

CREATE TABLE puzzle (
  name varchar(256) NOT NULL,
  location varchar(256) NOT NULL
);

--
-- Table structure for table rank
--

CREATE TABLE rank (
  puzzle_name varchar(256) NOT NULL,
  game_type integer NOT NULL,
  rank_score integer NOT NULL
);

--
-- Indexes for dumped tables
--

--
-- Indexes for table game
--
ALTER TABLE game ADD PRIMARY KEY (game_nr,player_name);
ALTER TABLE game ADD FOREIGN KEY player_name (player_name);

--
-- Indexes for table game_puzzle
--
ALTER TABLE game_puzzle ADD PRIMARY KEY (game_nr,puzzle_name);
ALTER TABLE game_puzzle ADD FOREIGN KEY puzzle_name (puzzle_name);

--
-- Indexes for table game_types
--
ALTER TABLE game_types ADD PRIMARY KEY (type);
ALTER TABLE game_types ADD UNIQUE KEY name (name);

--
-- Indexes for table player
--
ALTER TABLE player ADD PRIMARY KEY (player_name);

--
-- Indexes for table puzzle
--
ALTER TABLE puzzle ADD PRIMARY KEY (name);

--
-- Indexes for table rank
--
ALTER TABLE rank ADD PRIMARY KEY (puzzle_name,game_type), ADD FOREIGN KEY game_type (game_type);

--
-- Constraints for table game
--
ALTER TABLE game ADD CONSTRAINT game_ibfk_1 FOREIGN KEY (player_name) REFERENCES player (player_name) ON UPDATE CASCADE;

--
-- Constraints for table game_puzzle
--
ALTER TABLE game_puzzle ADD CONSTRAINT game_puzzle_ibfk_1 FOREIGN KEY (game_nr) REFERENCES game (game_nr) ON UPDATE CASCADE;
ALTER TABLE game_puzzle ADD CONSTRAINT game_puzzle_ibfk_2 FOREIGN KEY (puzzle_name) REFERENCES puzzle (name) ON UPDATE CASCADE;

--
-- Constraints for table rank
--
ALTER TABLE rank ADD CONSTRAINT rank_ibfk_1 FOREIGN KEY (puzzle_name) REFERENCES puzzle (name) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE rank ADD CONSTRAINT rank_ibfk_2 FOREIGN KEY (game_type) REFERENCES game_types (type) ON DELETE CASCADE ON UPDATE CASCADE;
