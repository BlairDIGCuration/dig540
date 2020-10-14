-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 14, 2020 at 07:25 PM
-- Server version: 10.3.25-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blairdig_Ancient Languages in Modern Times`
--

-- --------------------------------------------------------

--
-- Table structure for table `audio`
--

CREATE TABLE `audio` (
  `audio_id` int(8) NOT NULL,
  `audio_file` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `submitter_id` int(8) NOT NULL,
  `dialect_id` int(8) NOT NULL,
  `submission_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `translation` varchar(10000) COLLATE utf8_unicode_ci NOT NULL,
  `time_duration` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `date_recorded` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `language_level` date NOT NULL,
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `background` varchar(1000) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `audio`
--

INSERT INTO `audio` (`audio_id`, `audio_file`, `submitter_id`, `dialect_id`, `submission_type`, `translation`, `time_duration`, `date_recorded`, `language_level`, `description`, `background`) VALUES
(2, 'Demo_2', 1, 14, 'Sentence', 'My name is Blair Mueller.', '15 seconds', '10/14/2020', '0000-00-00', 'This is my first time speaking a dialect of the Ancient Egyptian language, so I kept it simple. ', 'My background is in modern Mandarin, so I have little experience speaking Ancient Egyptian dialects, but I look forward to practicing. '),
(1, 'Demo_1', 1, 17, 'Sentence', 'My name is Blair Mueller. ', '10 seconds', '10/14/2020', '0000-00-00', 'My first attempt to speak classical Hittite. I tried to make a brief introduction. ', 'I am new at speaking this language, but I found the pronunciation to be less difficult than the grammar. ');

-- --------------------------------------------------------

--
-- Table structure for table `culture`
--

CREATE TABLE `culture` (
  `culture_id` int(8) NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `time_period` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `history` varchar(6500) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(6500) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `culture`
--

INSERT INTO `culture` (`culture_id`, `name`, `location`, `time_period`, `history`, `description`) VALUES
(5, 'Ancient Egyptian', 'Ancient Egypt/ Northern Africa', '5500-30BCE', 'Ancient Egypt was one of the most powerful empires of the ancient world and lasted under the rule of 190 Pharaohs. ', 'Ancient Egypt is located along the Nile River which allowed the empire to flourish with a reliable source of food and water along with an accessible trade route to the north and south. It also provided the ancient Egyptian people with papyrus for paper and cloth-making. '),
(6, 'Ancient Aryan', 'Indus River Valley', '1000-500BCE', 'This group of people helped develop Hinduism and the Sanskrit language. They did not have a centralized government, but each village had its own leader, or \"Raja.\" ', 'They took over the Indus Valley after the  collapse of the Harappan civilization. The Aryan people were known to be skilled warriors and might have caused the collapse of the Harappan people. They, like the previous occupants of the valley were nomadic herders who tended cattle. '),
(7, 'Akkadian', 'Mesopotamia, Levant, Anatolia', '2350-2150BCE', 'The Akkadian Empire took over the region after the fall of Sumer and lasted for only 100 years, but it\'s culture impacted the Near East for far longer. \r\nThe kings of this Empire were: \r\nSargon: 2334–2279BC\r\nRimush: 2278–2270\r\nManishtushu: 2269–2255\r\nNaram-sin: 2254–2218\r\nShar-Kali-Sharri: 2217–2193\r\nDudu: 2189–2169\r\nShu-turul: 2168–2154\r\n', 'During the 3rd millennium BC, a bilingualism of Sumerian and Akkadian developed in the region. '),
(8, 'Ancient Roman', 'Italy/ Europe/ Mediterranean/ Northern Africa/ Near East/ Middle East', '753BCE-1453CE', 'Ancient Rome\'s beginning is remembered through the legend of Romulus and Remus who founded the city of Rome. This culture has impacted the modern world through its linguistic, technological, literary, and architectural legacy.', 'As Roman culture expanded, it incorporated different ideas, philosophies, languages, and cultures into its own, but Latin and Greek were the two dominant languages throughout Roman culture. '),
(11, 'Assyrian', 'Near East/ Levant', '2500-605BC', 'The Assyrian Empire was a Mesopotamian kingdom and empire.', 'Some of its capitals were Assur and Ninevah.');

-- --------------------------------------------------------

--
-- Table structure for table `dialect`
--

CREATE TABLE `dialect` (
  `dialect_id` int(8) NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `language_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dialect`
--

INSERT INTO `dialect` (`dialect_id`, `name`, `language_id`) VALUES
(1, 'Classical Sanskrit', 7),
(2, 'Vedic Sanskrit', 7),
(3, 'Archaic Egyptian', 1),
(4, 'Assyrian', 5),
(5, 'Babylonian', 5),
(6, 'Mariotic', 5),
(7, 'Tell Baydar', 5),
(8, 'eme-g̃ir\r\n', 6),
(9, 'eme-sal\r\n', 6),
(10, 'eme-galam\r\n', 6),
(11, 'eme-si-sa \r\n', 6),
(12, 'eme-te-na\r\n', 6),
(13, 'Old Egyptian', 1),
(14, 'Middle Egyptian', 1),
(15, 'Enchroial Egyptian', 1),
(16, 'Old Hittite', 2),
(17, '(Classical) Hittite', 2),
(18, 'Middle Hittite', 2),
(19, 'Neo-Hittite', 2),
(20, 'Old Latin', 4),
(21, 'Classical Latin', 4),
(22, 'Gaulic Latin', 4),
(23, 'Late Latin', 4),
(24, 'Vulgar Latin', 4),
(25, 'Attic', 3),
(26, 'Ionic', 3),
(27, 'Aeolic', 3),
(28, 'Arcadocypriot', 3),
(29, 'Doric', 3),
(30, 'Ancient Macedonian', 3);

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `language_id` int(8) NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `region` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`language_id`, `name`, `region`) VALUES
(1, 'Ancient Egyptian Language', 'Northern Africa'),
(2, 'Hittite', 'Anatolia'),
(3, 'Ancient Greek', 'Greece/ Ancient Mediterranean'),
(4, 'Latin', 'Italy/ Mediterranean/ Europe/ Northern Africa/ Near East'),
(5, 'Akkadian', 'Near East'),
(6, 'Sumerian', 'Near East'),
(7, 'Sanskrit', 'Southeastern Asia');

-- --------------------------------------------------------

--
-- Table structure for table `language_culture`
--

CREATE TABLE `language_culture` (
  `language_id` int(8) NOT NULL,
  `culture_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `language_culture`
--

INSERT INTO `language_culture` (`language_id`, `culture_id`) VALUES
(1, 5),
(4, 8),
(5, 7),
(7, 6);

-- --------------------------------------------------------

--
-- Table structure for table `submitter`
--

CREATE TABLE `submitter` (
  `submitter_id` int(8) NOT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `background` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `submitter`
--

INSERT INTO `submitter` (`submitter_id`, `name`, `background`) VALUES
(1, 'Blair Mueller', 'I have two Bachelor\'s Degrees in Anthropology and Asian Studies and two minor degrees in History and Mandarin. I am a at a Novice level with all of these ancient languages, but I am eager to learn. ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audio`
--
ALTER TABLE `audio`
  ADD PRIMARY KEY (`dialect_id`),
  ADD KEY `audio_id` (`audio_id`),
  ADD KEY `audio_file` (`audio_file`),
  ADD KEY `submission_type` (`submission_type`),
  ADD KEY `translation` (`translation`(1024)),
  ADD KEY `time_duration` (`time_duration`),
  ADD KEY `date_recorded` (`date_recorded`),
  ADD KEY `language_level` (`language_level`),
  ADD KEY `description` (`description`),
  ADD KEY `background` (`background`),
  ADD KEY `submitter_id` (`submitter_id`);

--
-- Indexes for table `culture`
--
ALTER TABLE `culture`
  ADD KEY `location` (`location`),
  ADD KEY `time_period` (`time_period`),
  ADD KEY `history` (`history`(1024)),
  ADD KEY `description` (`description`(1024)),
  ADD KEY `name` (`name`),
  ADD KEY `culture_id` (`culture_id`);

--
-- Indexes for table `dialect`
--
ALTER TABLE `dialect`
  ADD KEY `name` (`name`),
  ADD KEY `language_id` (`language_id`),
  ADD KEY `dialect_id` (`dialect_id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD KEY `name` (`name`),
  ADD KEY `language_id` (`language_id`),
  ADD KEY `region` (`region`);

--
-- Indexes for table `language_culture`
--
ALTER TABLE `language_culture`
  ADD PRIMARY KEY (`language_id`,`culture_id`),
  ADD KEY `culture_id` (`culture_id`);

--
-- Indexes for table `submitter`
--
ALTER TABLE `submitter`
  ADD KEY `submitter_id` (`submitter_id`),
  ADD KEY `name` (`name`),
  ADD KEY `background` (`background`(768));

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audio`
--
ALTER TABLE `audio`
  MODIFY `audio_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `culture`
--
ALTER TABLE `culture`
  MODIFY `culture_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `dialect`
--
ALTER TABLE `dialect`
  MODIFY `dialect_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `language_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `submitter`
--
ALTER TABLE `submitter`
  MODIFY `submitter_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `audio`
--
ALTER TABLE `audio`
  ADD CONSTRAINT `audio_ibfk_1` FOREIGN KEY (`dialect_id`) REFERENCES `dialect` (`dialect_id`),
  ADD CONSTRAINT `audio_ibfk_2` FOREIGN KEY (`submitter_id`) REFERENCES `submitter` (`submitter_id`);

--
-- Constraints for table `dialect`
--
ALTER TABLE `dialect`
  ADD CONSTRAINT `dialect_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`);

--
-- Constraints for table `language_culture`
--
ALTER TABLE `language_culture`
  ADD CONSTRAINT `language_culture_ibfk_1` FOREIGN KEY (`culture_id`) REFERENCES `culture` (`culture_id`),
  ADD CONSTRAINT `language_culture_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
