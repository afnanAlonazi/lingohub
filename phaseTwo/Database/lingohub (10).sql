-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2024 at 04:40 AM
-- Server version: 11.3.2-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lingohub`
--

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `LanguageName` varchar(100) NOT NULL,
  `LanguageCode` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`LanguageName`, `LanguageCode`) VALUES
('Afrikaans', 'ZA'),
('Albanian', 'AL'),
('Arabic', 'SA'),
('Armenian', 'AM'),
('Basque', 'ES'),
('Bengali', 'BD'),
('Bulgarian', 'BG'),
('Cambodian', 'KH'),
('Catalan', 'ES'),
('Chinese (Mandarin)', 'CN'),
('Croatian', 'HR'),
('Czech', 'CZ'),
('Danish', 'DK'),
('Dutch', 'NL'),
('English', 'GB'),
('Estonian', 'EE'),
('Fiji', 'FJ'),
('Finnish', 'FI'),
('French', 'FR'),
('Georgian', 'GE'),
('German', 'DE'),
('Greek', 'GR'),
('Gujarati', 'IN'),
('Hebrew', 'IL'),
('Hindi', 'IN'),
('Hungarian', 'HU'),
('Icelandic', 'IS'),
('Indonesian', 'ID'),
('Irish', 'IE'),
('Italian', 'IT'),
('Japanese', 'JP'),
('Javanese', 'ID'),
('Korean', 'KR'),
('Latin', 'VA'),
('Latvian', 'LV'),
('Lithuanian', 'LT'),
('Macedonian', 'MK'),
('Malay', 'MY'),
('Malayalam', 'IN'),
('Maltese', 'MT'),
('Maori', 'NZ'),
('Marathi', 'IN'),
('Mongolian', 'MN'),
('Nepali', 'NP'),
('Norwegian', 'NO'),
('Persian', 'IR'),
('Polish', 'PL'),
('Portuguese', 'PT'),
('Punjabi', 'IN'),
('Quechua', 'PE'),
('Romanian', 'RO'),
('Russian', 'RU'),
('Samoan', 'WS'),
('Serbian', 'RS'),
('Slovak', 'SK'),
('Slovenian', 'SI'),
('Spanish', 'ES'),
('Swahili', 'TZ'),
('Swedish', 'SE'),
('Tamil', 'IN'),
('Tatar', 'RU'),
('Telugu', 'IN'),
('Thai', 'TH'),
('Tibetan', 'CN'),
('Tonga', 'TO'),
('Turkish', 'TR'),
('Ukrainian', 'UA'),
('Urdu', 'PK'),
('Uzbek', 'UZ'),
('Vietnamese', 'VN'),
('Welsh', 'GB'),
('Xhosa', 'ZA');

-- --------------------------------------------------------

--
-- Table structure for table `learner`
--

CREATE TABLE `learner` (
  `firstName` varchar(25) NOT NULL,
  `lastName` varchar(25) NOT NULL,
  `learnerID` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(25) NOT NULL,
  `city` varchar(30) NOT NULL,
  `photo` varchar(255) NOT NULL DEFAULT 'defultpic.jpg',
  `location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `partner`
--

CREATE TABLE `partner` (
  `firstName` varchar(25) NOT NULL,
  `lastName` varchar(25) NOT NULL,
  `partnerID` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` char(10) NOT NULL,
  `password` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `photo` varchar(255) NOT NULL DEFAULT 'defultpic.jpg',
  `bio` text NOT NULL,
  `gender` varchar(6) NOT NULL,
  `age` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `RequestID` int(11) NOT NULL,
  `LanguageName` varchar(100) NOT NULL,
  `learnerID` int(100) NOT NULL,
  `partnerID` int(11) NOT NULL,
  `level` varchar(30) NOT NULL,
  `preferredSchedule` datetime NOT NULL,
  `sessionDuration` varchar(100) NOT NULL,
  `status` varchar(25) NOT NULL DEFAULT 'pending',
  `comment` text NOT NULL DEFAULT 'no comment added',
  `post_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `reviewID` int(11) NOT NULL,
  `sessionID` int(11) NOT NULL,
  `learnerfname` varchar(25) NOT NULL,
  `learnLname` varchar(25) NOT NULL,
  `partnerID` int(11) NOT NULL,
  `comment` text NOT NULL,
  `rating` double NOT NULL,
  `posted_rate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `partnerEmail` varchar(100) NOT NULL,
  `langugeName` varchar(100) NOT NULL,
  `level` varchar(30) NOT NULL,
  `price` decimal(11,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `sessionID` int(11) NOT NULL,
  `RequestID_s` int(11) NOT NULL,
  `partnerID` int(11) NOT NULL,
  `learnerID` int(11) NOT NULL,
  `startTime` time NOT NULL,
  `language` varchar(25) NOT NULL,
  `Date` date NOT NULL,
  `duration` time NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`LanguageName`);

--
-- Indexes for table `learner`
--
ALTER TABLE `learner`
  ADD PRIMARY KEY (`learnerID`) USING BTREE,
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `partner`
--
ALTER TABLE `partner`
  ADD PRIMARY KEY (`partnerID`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`RequestID`),
  ADD KEY `delete_learner` (`learnerID`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`reviewID`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD UNIQUE KEY `partnerEmail` (`partnerEmail`,`langugeName`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`sessionID`),
  ADD KEY `delete_partner` (`partnerID`),
  ADD KEY `delete_leaner` (`learnerID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `learner`
--
ALTER TABLE `learner`
  MODIFY `learnerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `partner`
--
ALTER TABLE `partner`
  MODIFY `partnerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `RequestID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `reviewID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
  MODIFY `sessionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `delete_learner` FOREIGN KEY (`learnerID`) REFERENCES `learner` (`learnerID`);

--
-- Constraints for table `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `delete_leaner` FOREIGN KEY (`learnerID`) REFERENCES `learner` (`learnerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `delete_partner` FOREIGN KEY (`partnerID`) REFERENCES `partner` (`partnerID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
