-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 21, 2020 at 11:25 PM
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
  `id` int(8) NOT NULL,
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

INSERT INTO `audio` (`audio_id`, `audio_file`, `submitter_id`, `id`, `submission_type`, `translation`, `time_duration`, `date_recorded`, `language_level`, `description`, `background`) VALUES
(2, 'demo_2', 1, 3, 'Sentence', 'My name is Blair Mueller.', '15 seconds', '10/14/2020', '0000-00-00', 'This is my first time speaking a dialect of the Ancient Egyptian language, so I kept it simple. ', 'My background is in modern Mandarin, so I have little experience speaking Ancient Egyptian dialects, but I look forward to practicing. '),
(1, 'demo_1', 1, 8, 'Sentence', 'My name is Blair Mueller. ', '10 seconds', '10/14/2020', '0000-00-00', 'My first attempt to speak classical Hittite. I tried to make a brief introduction. ', 'I am new at speaking this language, but I found the pronunciation to be less difficult than the grammar. '),
(4, 'Demo_4', 3, 11, 'Sentence', 'It is a beautiful day outside.', '15 seconds', '10/13/2020', '0000-00-00', 'It is an inquisition about the weather. ', 'I have some experience reading this dialect, but none speaking it so far. '),
(3, 'demo_3', 2, 19, 'Sentence', 'What is your name?', '10 seconds', '10/14/2020', '0000-00-00', 'First try at speaking this dialect.', 'No experience with this language. ');

-- --------------------------------------------------------

--
-- Table structure for table `culture`
--

CREATE TABLE `culture` (
  `culture_id` int(8) NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `time_period` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `history` varchar(10000) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(10000) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `culture`
--

INSERT INTO `culture` (`culture_id`, `name`, `location`, `time_period`, `history`, `description`) VALUES
(1, 'Ancient Egyptian', 'Ancient Egypt', '5500-30 BCE', 'Ancient Egypt was one of the most powerful civilizations of the ancient world. There were 190 Pharaohs who ruled Ancient Egypt. The most famous among them included: Ramesses II (1279–1213 BC ), Cleopatra VII (51-30 BC), and Tutankhamun (c.1334-1325 BC).', 'Ancient Egypt relied heavily on the Nile River as a source of food, water, and transportation. Crops were grown and raw materials were mined and traded with other nations. Papyrus reeds that grew along the Nile river was also used to male both parchment and clothing. '),
(2, 'Hittite', 'Asia Minor/ Anatolia', '1600 --1178 BCE', 'The Kingdom of the Hittites began as an absolute monarchy during the Old Kingdom and turned into a constitutional monarchy during the Middle and New Kingdoms. The kings of the Hittites were usually renowned for their warrior prowess and one of the most famous to represent this theme was King Šuppiluliuma I (c. 1344–1322 BCE).', 'The Hittites were a multi-ethnic and multi-lingual society. The Hattic, Hurrian, Mesopotamian influences are clear in the art style, as well as, the mythology of the Hittite culture. '),
(3, 'Ancient Greek', 'Europe/ Mediterranean/Ancient Greece', '700-323 BCE', 'Ancient Greece can be divided into two time periods: Archaic Greece and Classical Greece. City states like Athens and Sparta and their differing ways of life have been studied at length. Herodotus, Socrates, and Plato were famous philosophers from this culture. ', 'Ancient Greece is responsible for democracy, the concept of a library, the Olympics among many other important contributions to modern society and culture. '),
(4, 'Ancient Roman', 'Europe/ Mediterranean/ Italy/ Northern Africa/ Near East ', '753 BCE-1453 CE', 'Ancient Rome\'s beginning is remembered through the story of \"Romulus and Remus.\" Throughout its existence, ancient Rome\'s government took several forms. First it was a Kingdom from 753–509 BCE. Then, Rome became the Roman Republic from 509–27 BC. Next, it became the Roman Empire from 27 BCE – 395 CE. Then, when the Roman Empire fell, it was split into two sections. One was the Western Roman Empire that lasted from 395–476 CE. The other was the Eastern Roman Empire which continued on significantly longer from  395 until 1453 CE. Many kings and emperors ruled the Ancient Roman civilization. Some more commonly known ones were: Gaius Julius Caesar, Augustus, Octavian, Commodus, Nero, and Caligula.', 'Ancient Rome was a dominant power in the ancient world. At its height, the Roman empire expanded to the size of 1.06 million sq miles. Pompeii is one of the best archeological sites for learning about daily life in Ancient Rome. '),
(5, 'Akkadian', 'Mesopotamia/ Levant/ Anatolia', ' 2334 – 2154 BCE', 'The second major empire of Mesopotamia. Sargon of Akkad, who ruled from c. 2334–2284 BCE, is one of the empire\'s most famous leaders. the Akkadian empire eventually fell to two nations: Assyria who attacked from the north and, a couple of centuries later, Babylonia, who attacked from the south. ', 'This empire gathered speakers of Assyrian, Babylonian, and Sumerian dialects and languages under one ruler. ');

-- --------------------------------------------------------

--
-- Table structure for table `dialect`
--

CREATE TABLE `dialect` (
  `dialect_id` int(8) NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `language_id` int(8) NOT NULL,
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dialect`
--

INSERT INTO `dialect` (`dialect_id`, `name`, `language_id`, `description`) VALUES
(1, 'Archaic Egyptian', 1, 'This dialect was spoken in Ancient Egypt  before 2600 BCE. '),
(2, 'Old Egyptian', 1, 'This dialect of the Old Kingdom was spoken between c. 2600 - 2000 BCE.'),
(3, 'Middle Egyptian', 1, 'This dialect is the most widely studied of the Ancient Egyptian language. It was primarily spoken during the Middle Kingdom and early New Kingdom from c. 2000 – 1350 BCE, but was still used as a literary form until the 4th century CE. '),
(4, 'Late Egyptian', 1, 'This dialect was spoken during the Later New Kingdom, which was primarily from the American Period to the Third Intermediate Period c. 1350 – 700 BCE.'),
(5, 'Demotic Egyptian', 1, 'This dialect was commonly spoken during the Late Period, Ptolemaic, and early Roman Egypt from c. 700 BCE – 400 CE.'),
(6, 'Coptic Egyptian', 1, 'This dialect was the commonly spoken during and after the Christianization of Egypt and continued to be used after c. 200 CE.'),
(7, 'Old Hittite', 2, ''),
(8, '(Classical) Hittite', 2, ''),
(9, 'Middle Hittite', 2, ''),
(10, 'Neo-Hittite', 2, ''),
(11, 'Attic Greek', 3, 'This is the dialect native to ancient Athens, a city-state of ancient Greece.'),
(12, 'Ionic Greek', 3, 'A subdialect of the Eastern dialect, or Attic-Ionic group, of the Ancient Greek language. '),
(13, 'Aeolic Greek', 3, 'A set of dialects of the Ancient Greek language that was primarily spoken in Boeotia, Thessaly, the island of Lesbos, and the Greek colonies in Anatolia.'),
(14, 'Arcadocypriot Greek', 3, 'This dialect was spoken in both Arcadia and Cyprus. It is assumed, because of their similarity, that Arcadocypriot is a linguistic descendent of the Mycenaean Greek dialect.'),
(15, 'Doric Greek', 3, 'This dialect of Ancient Greek was spoken in many places including: southern and eastern Peloponnese, Sicily, Epirus, Southern Italy, Crete, Rhodes. There were some islands on the Aegean Sea along with some cities on the southeast coast of Anatolia who also spoke this dialect.  '),
(16, 'Ancient Macedonian', 3, 'This dialect was spoken in the kingdom of Macedonia during the 1st millennium BCE.'),
(17, 'Kione Greek', 3, 'This dialect has several names including: the Alexandrian dialect, common Attic dialect, and Hellenistic dialect and was widely spread around the Mediterranean. It was spoken during the Hellenistic Period, in the Roman Empire, and the early Byzantine Empire. '),
(18, 'Old Latin', 4, 'A dialect of Latin that was spoken before about 100 BCE.'),
(19, 'Classical Latin', 4, 'This dialect was considered standard spoken language during the late Roman Republic and early Roman Empire between 75 BCE and the 3rd century CE. Modern speakers and students of Latin consider it to be the default version of the language.'),
(20, 'Vulgar Latin', 4, 'This dialect of Latin was commonly spoken throughout the Mediterranean region during and after the Classical Period of the Roman Empire. '),
(21, 'Assyrian', 5, 'This is the dialect of Akkadian that was spoken in northern Mesopotamia.'),
(22, 'Babylonian', 5, 'This is the dialect of Akkadian that was spoken in central and southern Mesopotamia'),
(23, 'Mariotic Akkadian', 5, 'This was the dialect of Akkadian that was spoken in the region of the Central Euphrates, more specifically in and around the city of Mari.'),
(24, 'Tell Beydar Akkadian', 5, 'This dialect of Akkadian could be found near Northern Syria, in and around Tell Beydar.'),
(25, 'Old Akkadian', 5, 'An Akkadian dialect spoken from 2500 to 1950 BCE.'),
(26, 'Old Babylonian ', 5, 'A dialect of Babylonian and subdialect of Akkadian that was spoken between 1950 and 1530 BC.'),
(27, 'Old Assyrian', 5, 'A dialect of Assyrian and subdialect of Akkadian that was spoken between 1950 and 1530 BC.'),
(28, 'Middle Babylonian', 5, 'A dialect of Babylonian and subdialect of Akkadian that was spoken between 1530 and 1000 BC.'),
(29, 'Neo-Babylonian', 5, 'A dialect of Babylonian and subdialect of Akkadian that was spoken between 1000 and 600 BC.'),
(30, 'Neo-Assyrian', 5, 'A dialect of Assyrian and subdialect of Akkadian that was spoke between 1000 and 600 BC.'),
(31, 'Middle Assyrian', 5, 'A dialect of Assyrian and subdialect of Akkadian that was spoken between 1530 and 1000 BC.'),
(32, 'Late Babylonian', 5, 'A dialect of Babylonian and subdialect of Akkadian that was spoken between 600 BC and 100 AD. '),
(33, 'eme-g̃ir Sumerian', 6, 'The standard variety of Sumerian.'),
(34, 'eme-sal Sumerian', 6, 'The name of this dialect means \"fine tongue\" or \"high-pitched voice,\" which might have something to do with how it was pronounced. '),
(35, 'eme-galam Sumerian', 6, 'The name of this Sumerian dialect means \"high tongue.\"'),
(36, 'eme-si-sa Sumerian', 6, 'The name of this Sumerian dialect means  \"straight tongue.\"'),
(37, 'eme-te-na Sumerian', 6, 'The name of this Sumerian dialect may mean \"oblique[?] tongue.\"');

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
(2, 'Hittite', 'Anatolia'),
(9, 'Hattic', 'Anatolia'),
(10, 'Luwian', 'Anatolia'),
(3, 'Ancient Greek', 'Greece/ Ancient Mediterranean'),
(4, 'Latin', 'Italy/ Mediterranean/ Europe/ Northern Africa/ Near East'),
(5, 'Akkadian', 'Near East'),
(6, 'Sumerian', 'Near East'),
(1, 'Ancient Egyptian Language', 'Northern Africa'),
(8, 'Norse', 'Northern Europe/ Scandanavia/ Areas Settled by the Norse'),
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
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 2),
(9, 2),
(10, 2);

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
(1, 'Blair Mueller', 'I have two Bachelor\'s Degrees in Anthropology and Asian Studies and two minor degrees in History and Mandarin. I am a at a Novice level with all of these ancient languages, but I am eager to learn. '),
(2, 'Jane Doe', 'I live in England and am earning my Master\'s degree at Cambridge. I am currently studying archeology and am required to become proficient at speaking at least 1 ancient language in order to graduate the program.'),
(3, 'John Doe', 'I am earning my Undergraduate degree in Archeology at the University of Northern Colorado. I look forward to studying the ancient Greek dialects to I can decipher primary resources for my research.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audio`
--
ALTER TABLE `audio`
  ADD PRIMARY KEY (`id`),
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
  ADD UNIQUE KEY `culture_id_2` (`culture_id`,`name`),
  ADD KEY `culture_id` (`culture_id`),
  ADD KEY `name` (`name`),
  ADD KEY `location` (`location`),
  ADD KEY `time_period` (`time_period`),
  ADD KEY `history` (`history`(1024)),
  ADD KEY `description` (`description`(1024));

--
-- Indexes for table `dialect`
--
ALTER TABLE `dialect`
  ADD UNIQUE KEY `dialect_id_2` (`dialect_id`,`name`),
  ADD KEY `dialect_id` (`dialect_id`),
  ADD KEY `name` (`name`),
  ADD KEY `language_id` (`language_id`),
  ADD KEY `history` (`description`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD UNIQUE KEY `language_id_2` (`language_id`,`name`),
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
  ADD UNIQUE KEY `submitter_id_2` (`submitter_id`,`name`),
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
  MODIFY `audio_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `culture`
--
ALTER TABLE `culture`
  MODIFY `culture_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `dialect`
--
ALTER TABLE `dialect`
  MODIFY `dialect_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `language_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `submitter`
--
ALTER TABLE `submitter`
  MODIFY `submitter_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `audio`
--
ALTER TABLE `audio`
  ADD CONSTRAINT `audio_ibfk_3` FOREIGN KEY (`id`) REFERENCES `dialect` (`dialect_id`),
  ADD CONSTRAINT `audio_ibfk_4` FOREIGN KEY (`submitter_id`) REFERENCES `submitter` (`submitter_id`);

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
