--
-- Table structure for table `game`
--

CREATE TABLE IF NOT EXISTS `game` (
  `game_nr` int(11) NOT NULL,
  `game_type` smallint(11) NOT NULL,
  `player_name` varchar(256) NOT NULL,
  `time_played` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL
);

--
-- Table structure for table `game_puzzle`
--

CREATE TABLE IF NOT EXISTS `game_puzzle` (
  `game_nr` int(11) NOT NULL,
  `puzzle_name` varchar(256) NOT NULL,
  `played` tinyint(1) DEFAULT NULL,
  `won` tinyint(1) DEFAULT NULL,
  `time_score` int(11) DEFAULT NULL
);

--
-- Table structure for table `game_types`
--

CREATE TABLE IF NOT EXISTS `game_types` (
  `type` smallint(6) NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` varchar(1024) NOT NULL
);

--
-- Table structure for table `player`
--

CREATE TABLE IF NOT EXISTS `player` (
  `identification_hash` varchar(1024) NOT NULL,
  `identification_type` smallint(6) NOT NULL,
  `player_name` varchar(256) NOT NULL,
  `join_date` date NOT NULL
);

--
-- Table structure for table `puzzle`
--

CREATE TABLE IF NOT EXISTS `puzzle` (
  `name` varchar(256) NOT NULL,
  `location` varchar(1024) NOT NULL
);

--
-- Table structure for table `rank`
--

CREATE TABLE IF NOT EXISTS `rank` (
  `puzzle_name` varchar(256) NOT NULL,
  `game_type` smallint(6) NOT NULL,
  `rank_score` int(11) NOT NULL
);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `game`
--
ALTER TABLE `game`
 ADD PRIMARY KEY (`game_nr`,`player_name`), ADD KEY `player_name` (`player_name`);

--
-- Indexes for table `game_puzzle`
--
ALTER TABLE `game_puzzle`
 ADD PRIMARY KEY (`game_nr`,`puzzle_name`), ADD KEY `puzzle_name` (`puzzle_name`);

--
-- Indexes for table `game_types`
--
ALTER TABLE `game_types`
 ADD PRIMARY KEY (`type`), ADD UNIQUE KEY `name` (`name`), ADD UNIQUE KEY `name_2` (`name`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
 ADD PRIMARY KEY (`player_name`);

--
-- Indexes for table `puzzle`
--
ALTER TABLE `puzzle`
 ADD PRIMARY KEY (`name`);

--
-- Indexes for table `rank`
--
ALTER TABLE `rank`
 ADD PRIMARY KEY (`puzzle_name`,`game_type`), ADD KEY `game_type` (`game_type`);

--
-- Constraints for table `game`
--
ALTER TABLE `game`
ADD CONSTRAINT `game_ibfk_1` FOREIGN KEY (`player_name`) REFERENCES `player` (`player_name`) ON UPDATE CASCADE;

--
-- Constraints for table `game_puzzle`
--
ALTER TABLE `game_puzzle`
ADD CONSTRAINT `game_puzzle_ibfk_1` FOREIGN KEY (`game_nr`) REFERENCES `game` (`game_nr`) ON UPDATE CASCADE,
ADD CONSTRAINT `game_puzzle_ibfk_2` FOREIGN KEY (`puzzle_name`) REFERENCES `puzzle` (`name`) ON UPDATE CASCADE;

--
-- Constraints for table `rank`
--
ALTER TABLE `rank`
ADD CONSTRAINT `rank_ibfk_1` FOREIGN KEY (`puzzle_name`) REFERENCES `puzzle` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `rank_ibfk_2` FOREIGN KEY (`game_type`) REFERENCES `game_types` (`type`) ON DELETE CASCADE ON UPDATE CASCADE;
