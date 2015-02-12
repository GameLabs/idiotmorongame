-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 12, 2015 at 09:16 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `idiotmorongame`
--

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

CREATE TABLE IF NOT EXISTS `game` (
  `game_nr` int(11) NOT NULL,
  `game_type` smallint(11) NOT NULL,
  `player_name` varchar(256) COLLATE latin1_general_ci NOT NULL,
  `time_played` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`game_nr`, `game_type`, `player_name`, `time_played`, `score`) VALUES
(0, 0, 'playerx', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `game_puzzle`
--

CREATE TABLE IF NOT EXISTS `game_puzzle` (
  `game_nr` int(11) NOT NULL,
  `puzzle_name` varchar(256) COLLATE latin1_general_ci NOT NULL,
  `played` tinyint(1) DEFAULT NULL,
  `won` tinyint(1) DEFAULT NULL,
  `time_score` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `game_puzzle`
--

INSERT INTO `game_puzzle` (`game_nr`, `puzzle_name`, `played`, `won`, `time_score`) VALUES
(0, 'testx', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `game_types`
--

CREATE TABLE IF NOT EXISTS `game_types` (
  `type` smallint(6) NOT NULL,
  `name` varchar(256) COLLATE latin1_general_ci NOT NULL,
  `description` varchar(1024) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `game_types`
--

INSERT INTO `game_types` (`type`, `name`, `description`) VALUES
(0, 'biggest idiot', 'Answer every question wrong and be the biggest idiot! Make sure you do select the wrong answers for a correct one shows you''re too smart for this game.');

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE IF NOT EXISTS `player` (
  `identification_hash` varchar(1024) COLLATE latin1_general_ci NOT NULL,
  `identification_type` smallint(6) NOT NULL,
  `player_name` varchar(256) COLLATE latin1_general_ci NOT NULL,
  `join_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`identification_hash`, `identification_type`, `player_name`, `join_date`) VALUES
('0', 0, 'playerx', '2015-02-12');

-- --------------------------------------------------------

--
-- Table structure for table `puzzle`
--

CREATE TABLE IF NOT EXISTS `puzzle` (
  `name` varchar(256) COLLATE latin1_general_ci NOT NULL,
  `location` varchar(1024) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `puzzle`
--

INSERT INTO `puzzle` (`name`, `location`) VALUES
('testx', 'test123');

-- --------------------------------------------------------

--
-- Table structure for table `rank`
--

CREATE TABLE IF NOT EXISTS `rank` (
  `puzzle_name` varchar(256) COLLATE latin1_general_ci NOT NULL,
  `game_type` smallint(6) NOT NULL,
  `rank_score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

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
-- Constraints for dumped tables
--

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
