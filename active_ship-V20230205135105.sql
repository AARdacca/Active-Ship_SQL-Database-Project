-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2022 at 06:41 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testproject09`
--

-- --------------------------------------------------------

--
-- Table structure for table `authority`
--

CREATE TABLE `authority` (
  `name` varchar(80) NOT NULL,
  `country` varchar(50) NOT NULL,
  `organization` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `authority`
--

INSERT INTO `authority` (`name`, `country`, `organization`) VALUES
('Chinese State', 'China', 'National'),
('Finnish state', 'Finland', 'National'),
('France Naval Group', 'France', 'National'),
('GreenCompass Marine S.A.', 'Taiwan', 'Marine Corporation'),
('HMM', 'South Korea', 'Container Shipping'),
('KDB', 'South Korea', 'Bank'),
('Maersk Line', 'Denmark', 'Container shipping'),
('Royal Caribbean Group', 'USA', 'Cruise Holding Company'),
('Royal Navy', 'UK', 'Naval Corporation'),
('Samsung Electronics', 'South Korea', 'Electronics'),
('US Navy', 'USA', 'Naval Corporation');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `maker_name` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `owner` varchar(80) NOT NULL DEFAULT 'Various Countries (by shared)',
  `num_of_ships_made` int(255) NOT NULL,
  `year` smallint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`maker_name`, `country`, `owner`, `num_of_ships_made`, `year`) VALUES
('Aircraft Carrier Alliance', 'UK', 'Royal Navy', 200, 2003),
('Chantiers de l\'Atlantique', 'France', 'France Naval Group', 160, 1862),
('CSSC', 'China', 'Chinese State', 310, 1998),
('Daewoo Shipbuilding & Marine Engineering', 'South Korea', 'KDB', 154, 2000),
('Meyer Turku', 'Finland', 'Finnish state', 700, 1795),
('Newport News Shipbuilding', 'USA', 'US Navy', 30, 1886),
('Samsung Heavy Industries', 'South Korea', 'Samsung Electronics', 50, 1969);

-- --------------------------------------------------------

--
-- Table structure for table `nation`
--

CREATE TABLE `nation` (
  `country` varchar(50) NOT NULL,
  `region` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nation`
--

INSERT INTO `nation` (`country`, `region`) VALUES
('China', 'Asia'),
('Denmark', 'Europe'),
('Egypt', 'Africa'),
('Finland', 'Europe'),
('France', 'Europe'),
('Malaysia', 'Asia'),
('Netherlands', 'Europe'),
('Panama', 'NA'),
('Saudi Arabia', 'Asia'),
('Singapore', 'Asia'),
('Sint Maarten', 'NA'),
('South Korea', 'Asia'),
('Taiwan', 'Asia'),
('The Bahamas', 'NA'),
('UK', 'Europe'),
('USA', 'NA');

-- --------------------------------------------------------

--
-- Table structure for table `ships`
--

CREATE TABLE `ships` (
  `scrunity_id` int(50) NOT NULL,
  `name` varchar(80) NOT NULL,
  `type` varchar(50) NOT NULL,
  `manufacturer` varchar(50) NOT NULL,
  `flag_carrier` varchar(50) NOT NULL,
  `owner` varchar(80) NOT NULL,
  `age` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ships`
--

INSERT INTO `ships` (`scrunity_id`, `name`, `type`, `manufacturer`, `flag_carrier`, `owner`, `age`) VALUES
(1, 'Symphony of the Seas', 'Passenger', 'Chantiers de l\'Atlantique', 'USA', 'Royal Caribbean Group', 5),
(2, 'Mardi Gras', 'Passenger', 'Meyer Turku', 'USA', 'Finnish state', 2),
(3, 'Ever Ace', 'Cargo', 'Samsung Heavy Industries', 'Panama', 'GreenCompass Marine S.A.', 1),
(4, 'Harmony of the Seas', 'Passenger', 'Chantiers de l\'Atlantique', 'Panama', 'Royal Caribbean Group', 7.5),
(5, 'HMM Algeciras', 'Cargo', 'Daewoo Shipbuilding & Marine Engineering', 'Panama', 'HMM', 2.5),
(6, 'CMA CGM Jacques Saadé', 'Cargo', 'CSSC', 'France', 'Chinese State', 3),
(7, 'Madrid Maersk', 'Cargo', 'Daewoo Shipbuilding & Marine Engineering', 'Denmark', 'Maersk Line', 5.5),
(8, 'Nimitz Class', 'Navy', 'Newport News Shipbuilding', 'USA', 'US Navy', 47),
(9, 'USS John F. Kennedy (CVN-79)', 'Navy', 'Newport News Shipbuilding', 'USA', 'US Navy', 3.5),
(10, 'Queen Elizabeth Class', 'Navy', 'Aircraft Carrier Alliance', 'UK', 'Royal Navy', 5);

-- --------------------------------------------------------

--
-- Table structure for table `transport`
--

CREATE TABLE `transport` (
  `id` int(50) NOT NULL,
  `scrunity_id` int(50) NOT NULL,
  `from_loc` varchar(50) NOT NULL,
  `to_loc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transport`
--

INSERT INTO `transport` (`id`, `scrunity_id`, `from_loc`, `to_loc`) VALUES
(1, 1, 'USA', 'The Bahamas'),
(2, 1, 'USA', 'Sint Maarten'),
(3, 2, 'USA', 'The Bahamas'),
(4, 3, 'Taiwan', 'China'),
(5, 3, 'Taiwan', 'Malaysia'),
(6, 3, 'Taiwan', 'Egypt'),
(7, 4, 'USA', 'UK'),
(8, 4, 'USA', 'Saudi Arabia'),
(9, 5, 'China', 'Singapore'),
(10, 5, 'China', 'South Korea'),
(11, 6, 'China', 'Netherlands'),
(12, 6, 'China', 'Malaysia'),
(13, 6, 'China', 'South Korea'),
(14, 7, 'China', 'Malaysia'),
(15, 7, 'China', 'Netherlands');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `variation` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`variation`) VALUES
('Cargo'),
('Navy'),
('Passenger');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authority`
--
ALTER TABLE `authority`
  ADD PRIMARY KEY (`name`),
  ADD KEY `N9` (`country`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`maker_name`),
  ADD UNIQUE KEY `maker_name` (`maker_name`),
  ADD KEY `N11` (`owner`),
  ADD KEY `N12` (`country`);

--
-- Indexes for table `nation`
--
ALTER TABLE `nation`
  ADD PRIMARY KEY (`country`),
  ADD UNIQUE KEY `country` (`country`);

--
-- Indexes for table `ships`
--
ALTER TABLE `ships`
  ADD PRIMARY KEY (`scrunity_id`),
  ADD KEY `N1` (`flag_carrier`),
  ADD KEY `N3` (`owner`),
  ADD KEY `N2` (`manufacturer`),
  ADD KEY `N10` (`type`);

--
-- Indexes for table `transport`
--
ALTER TABLE `transport`
  ADD PRIMARY KEY (`id`),
  ADD KEY `N4` (`scrunity_id`),
  ADD KEY `N5` (`from_loc`),
  ADD KEY `N6` (`to_loc`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`variation`),
  ADD UNIQUE KEY `Variation` (`variation`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ships`
--
ALTER TABLE `ships`
  MODIFY `scrunity_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `transport`
--
ALTER TABLE `transport`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authority`
--
ALTER TABLE `authority`
  ADD CONSTRAINT `N9` FOREIGN KEY (`country`) REFERENCES `nation` (`country`);

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `N11` FOREIGN KEY (`owner`) REFERENCES `authority` (`name`),
  ADD CONSTRAINT `N12` FOREIGN KEY (`country`) REFERENCES `nation` (`country`);

--
-- Constraints for table `ships`
--
ALTER TABLE `ships`
  ADD CONSTRAINT `N1` FOREIGN KEY (`flag_carrier`) REFERENCES `nation` (`country`),
  ADD CONSTRAINT `N10` FOREIGN KEY (`type`) REFERENCES `type` (`Variation`),
  ADD CONSTRAINT `N2` FOREIGN KEY (`manufacturer`) REFERENCES `company` (`maker_name`),
  ADD CONSTRAINT `N3` FOREIGN KEY (`owner`) REFERENCES `authority` (`name`);

--
-- Constraints for table `transport`
--
ALTER TABLE `transport`
  ADD CONSTRAINT `N4` FOREIGN KEY (`scrunity_id`) REFERENCES `ships` (`scrunity_id`),
  ADD CONSTRAINT `N5` FOREIGN KEY (`from_loc`) REFERENCES `nation` (`country`),
  ADD CONSTRAINT `N6` FOREIGN KEY (`to_loc`) REFERENCES `nation` (`country`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
