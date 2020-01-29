-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 13, 2012 at 08:23 PM
-- Server version: 5.5.25a
-- PHP Version: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `travelstar`
--

-- --------------------------------------------------------

--
-- Table structure for table `felhasznalo`
--

CREATE TABLE IF NOT EXISTS `felhasznalo` (
  `id` int(11) NOT NULL,
  `felhasznalonev` varchar(128) NOT NULL,
  `nev` varchar(128) NOT NULL,
  `jelszo` varchar(128) NOT NULL,
  `email` varchar(256) NOT NULL,
  `szerepkor` int(11) NOT NULL,
  `bankkartya` char(16) NOT NULL,
  `kedvezmeny` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `felhasznalo`
--

INSERT INTO `felhasznalo` (`id`, `felhasznalonev`, `nev`, `jelszo`, `email`, `szerepkor`, `bankkartya`, `kedvezmeny`) VALUES
(1, 'nullas neve', 'nullas', 'nullas', 'nullas@0.com', 0, '0000000000', 0),
(2, 'egyes neve', 'egyes', 'egyes', 'egyes@1.com', 1, '1111111111', 0),
(3, 'kettes neve', 'kettes', 'kettes', 'kettes@2.com', 2, '2222222222', 0),
(4, 'asd sad', 'asd', 'asd', 'asd@asd.ads', 0, '12344234', 0),
(5, 'Cser Lajos', 'lajos', 'aaa', 'Cser.Lajos@stud.u-szeged.hu', 2, '1234567898765432', 1),
(6, 'Kovács Béla', 'bela', 'bela12', 'bela@bela.hu', 1, '4234323423244324', 0),
(7, 'Oltvanyi Nora', 'nori', 'nori2', 'nori@inf.u-szeged.hu', 0, '1234567898765432', 0),
(8, 'Kovacs Nora', 'nori2', 'nori12', 'nori@inf.u-szeged.hu', 0, '1234567898765432', 0),
(9, 'Gatya József', 'gatya', 'gatya', 'gatya@gatya.hu', 0, '1234567898765432', 0),
(10, 'Kovács István', 'pista', 'pista1', 'pista@freemail.hu', 0, '1234567891234567', 0),
(11, 'Molnár Veronika', 'mvera', 'vera75', 'mvera@gmail.com', 0, '1234987657348100', 0),
(12, 'Olasz Tilda', 'tilda', 'tilda922', 'otilda@gmail.com', 0, '1234567898765432', 0),
(13, 'Kis József', 'joska', 'jozsi123', 'joskagyerek@yahoo.com', 0, '1234123498765432', 0),
(14, 'Nagy Gabriella', 'gabriella', 'bebzboz', 'gabriella@yahoo.com', 0, '1234566668765432', 0),
(15, 'Vass Géza', 'vasi', 'gezu', 'vasgeza@freemail.hu', 1, '9874567898765332', 0),
(16, 'Fehér Sándor', 'fsanyi', 'whiteee', 'fsanyi@citromail.hu', 2, '1236547698765432', 1),
(17, 'Para Zita', 'zitacska', '123zita', 'zitapara@hotmail.com', 0, '1234567898719945', 1),
(18, 'Bojler Gyula', 'gyulus', 'babuka', 'gyuszi90@gmail.com', 1, '1233337890065432', 1),
(19, 'Erős Márk', 'marky', '43jb543fdfg', 'markeros@gmail.com', 0, '1234123898000402', 0),
(20, 'Kovács Aladár', 'kovi', 'alika5', 'aladar@gmail.com', 1, '1234444898765432', 0),
(21, 'Molnár Judit', 'judi', 'juditka1991', 'judit0@gmail.com', 2, '1235712898765432', 1),
(22, 'Kiss Elemér', 'kiselem', 'ekisse', 'kiselem@yahoo.com', 1, '1234412339876547', 0),
(23, 'Nagy Evelin', 'evi', 'asdasd', 'evelin@gmail.com', 2, '1231234898765678', 1),
(24, 'Bíró Bálint', 'birooo', 'balintbiro', 'balintbiro@freemail.hu', 2, '1265441208700436', 1),
(25, 'Gyenge Pista', 'pityu95', 'istvankiraly', 'istvan95@citromail.hu', 1, '1000440000765432', 0),
(26, 'Kreis Béla', 'kreis', 'gagyijelszo', 'bela.kreis@gmail.com', 1, '1288440178765123', 0),
(27, 'Pesti Piroska', 'piri123', 'piroskaneni', 'piroska@gmail.com', 2, '1651044801895432', 1),
(28, 'Magyar Emese', 'emesehun', '0nincsotletem0', 'mesi_m@stud.u-szeged.hu', 1, '1288440026761002', 0);

-- --------------------------------------------------------

--
-- Table structure for table `panasz`
--

CREATE TABLE IF NOT EXISTS `panasz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leiras` varchar(256) NOT NULL,
  `erkezett` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `megoldva` tinyint(1) NOT NULL DEFAULT '0',
  `felh_ID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `felh_ID` (`felh_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `turnus`
--

CREATE TABLE IF NOT EXISTS `turnus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indulasi_ido` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `indulasi_varos` varchar(256) NOT NULL,
  `ferohely` int(11) NOT NULL,
  `foglalt` int(11) NOT NULL,
  `utazas_id` int(11) NOT NULL,
  `mod_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mod_id` (`mod_id`),
  KEY `kulsk` (`utazas_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=127 ;

--
-- Dumping data for table `turnus`
--

INSERT INTO `turnus` (`id`, `indulasi_ido`, `indulasi_varos`, `ferohely`, `foglalt`, `utazas_id`, `mod_id`) VALUES
(1, '2012-07-09 09:00:00', 'Szeged', 20, 0, 1, 2),
(2, '2012-08-09 09:00:00', 'Szeged', 20, 0, 1, 2),
(3, '2012-11-13 17:30:39', 'Szeged', 20, 1, 1, 2),
(4, '2012-11-13 17:30:51', 'Szeged', 20, 1, 1, 2),
(5, '2012-11-13 17:31:01', 'Szeged', 30, 1, 3, 2),
(6, '2012-08-15 08:00:00', 'Szeged', 30, 0, 3, 2),
(7, '2012-11-13 17:31:16', 'Szeged', 30, 1, 3, 2),
(8, '2012-11-13 17:29:40', 'Szeged', 20, 1, 3, 1),
(9, '2012-11-13 17:32:35', 'Szeged', 20, 3, 3, 1),
(10, '2012-11-13 17:30:24', 'Szeged', 20, 1, 3, 1),
(11, '2012-06-20 17:00:00', 'Szeged', 25, 0, 13, 1),
(12, '2012-07-20 17:00:00', 'Szeged', 25, 0, 13, 1),
(13, '2012-08-20 17:00:00', 'Szeged', 25, 0, 13, 1),
(14, '2012-06-20 17:00:00', 'Szeged', 25, 0, 13, 2),
(15, '2012-07-20 17:00:00', 'Szeged', 25, 0, 13, 2),
(16, '2012-08-20 17:00:00', 'Szeged', 25, 0, 13, 2),
(17, '2012-07-20 17:00:00', 'Szeged', 25, 0, 13, 3),
(18, '2012-08-20 17:00:00', 'Szeged', 25, 0, 13, 3),
(19, '2012-08-03 14:00:00', 'Szeged', 20, 0, 21, 1),
(20, '2012-11-13 17:29:16', 'Szeged', 20, 1, 21, 1),
(21, '2012-10-03 14:00:00', 'Szeged', 20, 0, 21, 1),
(22, '2012-08-03 14:00:00', 'Szeged', 20, 0, 21, 3),
(23, '2012-11-13 17:30:02', 'Szeged', 20, 3, 21, 3),
(24, '2012-10-03 14:00:00', 'Szeged', 20, 0, 21, 3),
(25, '2012-08-04 11:00:00', 'Szeged', 20, 0, 31, 1),
(26, '2012-09-04 11:00:00', 'Szeged', 20, 0, 31, 1),
(27, '2012-10-04 11:00:00', 'Szeged', 20, 0, 31, 1),
(28, '2012-08-04 11:00:00', 'Szeged', 20, 0, 31, 2),
(29, '2012-09-04 11:00:00', 'Szeged', 20, 0, 31, 2),
(30, '2012-10-04 11:00:00', 'Szeged', 20, 0, 31, 2),
(31, '2012-08-04 11:00:00', 'Szeged', 20, 0, 31, 3),
(32, '2012-09-04 11:00:00', 'Szeged', 20, 0, 31, 3),
(33, '2012-10-04 11:00:00', 'Szeged', 20, 0, 31, 3),
(34, '2012-07-11 10:00:00', 'Szeged', 30, 0, 18, 1),
(35, '2012-08-11 10:00:00', 'Szeged', 30, 0, 18, 1),
(36, '2012-09-11 10:00:00', 'Szeged', 30, 0, 18, 1),
(37, '2012-07-11 10:00:00', 'Szeged', 30, 0, 18, 2),
(38, '2012-08-11 10:00:00', 'Szeged', 30, 0, 18, 2),
(39, '2012-09-11 10:00:00', 'Szeged', 30, 0, 18, 2),
(40, '2012-07-11 10:00:00', 'Szeged', 30, 0, 18, 3),
(41, '2012-08-11 10:00:00', 'Szeged', 30, 0, 18, 3),
(42, '2012-09-11 10:00:00', 'Szeged', 30, 0, 18, 3),
(43, '2013-07-09 09:00:00', 'Szeged', 20, 0, 1, 2),
(44, '2013-08-09 09:00:00', 'Szeged', 20, 0, 1, 2),
(45, '2013-09-09 09:00:00', 'Szeged', 20, 0, 1, 2),
(46, '2013-10-09 09:00:00', 'Szeged', 20, 0, 1, 2),
(47, '2013-07-15 08:00:00', 'Szeged', 30, 0, 3, 2),
(48, '2013-08-15 08:00:00', 'Szeged', 30, 0, 3, 2),
(49, '2013-09-15 08:00:00', 'Szeged', 30, 0, 3, 2),
(50, '2013-07-15 08:00:00', 'Szeged', 20, 0, 3, 1),
(51, '2013-08-15 08:00:00', 'Szeged', 20, 0, 3, 1),
(52, '2013-09-15 08:00:00', 'Szeged', 20, 0, 3, 1),
(53, '2013-06-20 17:00:00', 'Szeged', 25, 0, 13, 1),
(54, '2013-07-20 17:00:00', 'Szeged', 25, 0, 13, 1),
(55, '2013-08-20 17:00:00', 'Szeged', 25, 0, 13, 1),
(56, '2013-06-20 17:00:00', 'Szeged', 25, 0, 13, 2),
(57, '2013-07-20 17:00:00', 'Szeged', 25, 0, 13, 2),
(58, '2013-08-20 17:00:00', 'Szeged', 25, 0, 13, 2),
(59, '2013-07-20 17:00:00', 'Szeged', 25, 0, 13, 3),
(60, '2013-08-20 17:00:00', 'Szeged', 25, 0, 13, 3),
(61, '2013-08-03 14:00:00', 'Szeged', 20, 0, 21, 1),
(62, '2013-09-03 14:00:00', 'Szeged', 20, 0, 21, 1),
(63, '2013-10-03 14:00:00', 'Szeged', 20, 0, 21, 1),
(64, '2013-08-03 14:00:00', 'Szeged', 20, 0, 21, 3),
(65, '2013-09-03 14:00:00', 'Szeged', 20, 0, 21, 3),
(66, '2013-10-03 14:00:00', 'Szeged', 20, 0, 21, 3),
(67, '2013-08-04 11:00:00', 'Szeged', 20, 0, 31, 1),
(68, '2013-09-04 11:00:00', 'Szeged', 20, 0, 31, 1),
(69, '2013-10-04 11:00:00', 'Szeged', 20, 0, 31, 1),
(70, '2013-08-04 11:00:00', 'Szeged', 20, 0, 31, 2),
(71, '2013-09-04 11:00:00', 'Szeged', 20, 0, 31, 2),
(72, '2013-10-04 11:00:00', 'Szeged', 20, 0, 31, 2),
(73, '2013-08-04 11:00:00', 'Szeged', 20, 0, 31, 3),
(74, '2013-09-04 11:00:00', 'Szeged', 20, 0, 31, 3),
(75, '2013-10-04 11:00:00', 'Szeged', 20, 0, 31, 3),
(76, '2013-07-11 10:00:00', 'Szeged', 30, 0, 18, 1),
(77, '2013-08-11 10:00:00', 'Szeged', 30, 0, 18, 1),
(78, '2013-09-11 10:00:00', 'Szeged', 30, 0, 18, 1),
(79, '2013-07-11 10:00:00', 'Szeged', 30, 0, 18, 2),
(80, '2013-08-11 10:00:00', 'Szeged', 30, 0, 18, 2),
(81, '2013-09-11 10:00:00', 'Szeged', 30, 0, 18, 2),
(82, '2013-07-11 10:00:00', 'Szeged', 30, 0, 18, 3),
(83, '2013-08-11 10:00:00', 'Szeged', 30, 0, 18, 3),
(84, '2013-09-11 10:00:00', 'Szeged', 30, 0, 18, 3),
(85, '2014-07-09 09:00:00', 'Szeged', 20, 0, 1, 2),
(86, '2014-08-09 09:00:00', 'Szeged', 20, 0, 1, 2),
(87, '2014-09-09 09:00:00', 'Szeged', 20, 0, 1, 2),
(88, '2014-10-09 09:00:00', 'Szeged', 20, 0, 1, 2),
(89, '2014-07-15 08:00:00', 'Szeged', 30, 0, 3, 2),
(90, '2014-08-15 08:00:00', 'Szeged', 30, 0, 3, 2),
(91, '2014-09-15 08:00:00', 'Szeged', 30, 0, 3, 2),
(92, '2014-07-15 08:00:00', 'Szeged', 20, 0, 3, 1),
(93, '2014-08-15 08:00:00', 'Szeged', 20, 0, 3, 1),
(94, '2014-09-15 08:00:00', 'Szeged', 20, 0, 3, 1),
(95, '2014-06-20 17:00:00', 'Szeged', 25, 0, 13, 1),
(96, '2014-07-20 17:00:00', 'Szeged', 25, 0, 13, 1),
(97, '2014-08-20 17:00:00', 'Szeged', 25, 0, 13, 1),
(98, '2014-06-20 17:00:00', 'Szeged', 25, 0, 13, 2),
(99, '2014-07-20 17:00:00', 'Szeged', 25, 0, 13, 2),
(100, '2014-08-20 17:00:00', 'Szeged', 25, 0, 13, 2),
(101, '2014-07-20 17:00:00', 'Szeged', 25, 0, 13, 3),
(102, '2014-08-20 17:00:00', 'Szeged', 25, 0, 13, 3),
(103, '2014-08-03 14:00:00', 'Szeged', 20, 0, 21, 1),
(104, '2014-09-03 14:00:00', 'Szeged', 20, 0, 21, 1),
(105, '2014-10-03 14:00:00', 'Szeged', 20, 0, 21, 1),
(106, '2014-08-03 14:00:00', 'Szeged', 20, 0, 21, 3),
(107, '2014-09-03 14:00:00', 'Szeged', 20, 0, 21, 3),
(108, '2014-10-03 14:00:00', 'Szeged', 20, 0, 21, 3),
(109, '2014-08-04 11:00:00', 'Szeged', 20, 0, 31, 1),
(110, '2014-09-04 11:00:00', 'Szeged', 20, 0, 31, 1),
(111, '2014-10-04 11:00:00', 'Szeged', 20, 0, 31, 1),
(112, '2014-08-04 11:00:00', 'Szeged', 20, 0, 31, 2),
(113, '2014-09-04 11:00:00', 'Szeged', 20, 0, 31, 2),
(114, '2014-10-04 11:00:00', 'Szeged', 20, 0, 31, 2),
(115, '2014-08-04 11:00:00', 'Szeged', 20, 0, 31, 3),
(116, '2014-09-04 11:00:00', 'Szeged', 20, 0, 31, 3),
(117, '2014-10-04 11:00:00', 'Szeged', 20, 0, 31, 3),
(118, '2014-07-11 10:00:00', 'Szeged', 30, 0, 18, 1),
(119, '2014-08-11 10:00:00', 'Szeged', 30, 0, 18, 1),
(120, '2014-09-11 10:00:00', 'Szeged', 30, 0, 18, 1),
(121, '2014-07-11 10:00:00', 'Szeged', 30, 0, 18, 2),
(122, '2014-08-11 10:00:00', 'Szeged', 30, 0, 18, 2),
(123, '2014-09-11 10:00:00', 'Szeged', 30, 0, 18, 2),
(124, '2014-07-11 10:00:00', 'Szeged', 30, 0, 18, 3),
(125, '2014-08-11 10:00:00', 'Szeged', 30, 0, 18, 3),
(126, '2014-09-11 10:00:00', 'Szeged', 30, 0, 18, 3);

-- --------------------------------------------------------

--
-- Table structure for table `utazas`
--

CREATE TABLE IF NOT EXISTS `utazas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orszag` varchar(128) NOT NULL,
  `varos` varchar(128) NOT NULL,
  `alapar` int(11) NOT NULL,
  `tavolsag` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=123 ;

--
-- Dumping data for table `utazas`
--

INSERT INTO `utazas` (`id`, `orszag`, `varos`, `alapar`, `tavolsag`) VALUES
(1, 'Görögország', 'Athén', 110500, 1100),
(2, 'Görögország', 'Heraklion', 156000, 1700),
(3, 'Franciaország', 'Párizs', 120000, 1200),
(4, 'Görögország', 'Naxos', 110000, 1250),
(5, 'Görögország', 'Rodos', 130000, 1350),
(6, 'Görögország', 'Thessaloniki', 100000, 700),
(7, 'Franciaország', 'Bordeaux', 120000, 1650),
(8, 'Franciaország', 'Toulouse', 110000, 1570),
(9, 'Franciaország', 'Strasbourg', 80000, 970),
(10, 'Franciaország', 'Marseille', 100000, 1200),
(11, 'Franciaország', 'Montpelliere', 120000, 1475),
(12, 'Franciaország', 'Amiens', 100000, 1390),
(13, 'Olaszország', 'Roma', 120000, 780),
(14, 'Olaszország', 'Napoli', 95000, 770),
(15, 'Olaszország', 'Milano', 110000, 850),
(16, 'Olaszország', 'Monaco', 100000, 765),
(17, 'Olaszország', 'Bologna', 105000, 715),
(18, 'Olaszország', 'Firenze', 110000, 750),
(19, 'Olaszország', 'Bari', 90000, 630),
(20, 'Olaszország', 'Catania', 120000, 1060),
(21, 'Ausztria', 'Bécs', 70000, 360),
(22, 'Ausztria', 'Graz', 65000, 370),
(23, 'Ausztria', 'Innsbruck', 75000, 675),
(24, 'Ausztria', 'Linz', 70000, 500),
(25, 'Németország', 'München', 85000, 680),
(26, 'Németország', 'Augsburg', 80000, 740),
(27, 'Németország', 'Stuttgart', 90000, 870),
(28, 'Németország', 'Nürnberg', 80000, 765),
(29, 'Németország', 'Bremen', 95000, 900),
(30, 'Németország', 'Frankfurt', 85000, 790),
(31, 'Németország', 'Berlin', 100000, 850),
(32, 'Németország', 'Hamburg', 95000, 1090),
(33, 'Lengyelország', 'Krakow', 70000, 424),
(34, 'Lengyelország', 'Lublin', 75000, 583),
(35, 'Lengyelország', 'Poznan', 80000, 724),
(36, 'Lengyelország', 'Radom', 75000, 579),
(37, 'Lengyelország', 'Gdansk', 85000, 907),
(38, 'Lengyelország', 'Katowice', 70000, 455),
(39, 'Lengyelország', 'Szczecin', 85000, 892),
(40, 'Lengyelország', 'Gdynia', 85000, 925),
(41, 'Németország', 'Dusseldorf', 100000, 1127),
(42, 'Németország', 'Cologne', 95000, 1103),
(43, 'Németország', 'Dortmund', 100000, 1100),
(44, 'Németország', 'Essen', 95000, 1123),
(45, 'Németország', 'Dresden', 80000, 713),
(46, 'Németország', 'Duisburg', 95000, 1139),
(47, 'Németország', 'Bochum', 95000, 1112),
(48, 'Görögország', 'Kamari', 110000, 1300),
(49, 'Anglia', 'London', 110000, 1600),
(50, 'Anglia', 'Birmingham', 115000, 1738),
(51, 'Anglia', 'Leeds', 115000, 1760),
(52, 'Anglia', 'Sheffield', 110000, 1739),
(53, 'Anglia', 'Bradford', 110000, 1770),
(54, 'Anglia', 'Liverpool', 105000, 1836),
(55, 'Anglia', 'Manchester', 110000, 1790),
(56, 'Anglia', 'Cardiff', 105000, 1800),
(57, 'Anglia', 'Nottingham', 110000, 1705),
(58, 'Anglia', 'Leicester', 105000, 1690),
(59, 'Anglia', 'Sunderland', 110000, 1790),
(60, 'Anglia', 'Swansea', 100000, 1856),
(61, 'Anglia', 'Portsmouth', 105000, 1642),
(62, 'Anglia', 'York', 100000, 1736),
(63, 'Anglia', 'Southampton', 105000, 1666),
(64, 'Bulgária', 'Sofia', 60000, 469),
(65, 'Bulgária', 'Plovdiv', 65000, 570),
(66, 'Bulgária', 'Varna', 70000, 700),
(67, 'Bulgária', 'Burgas', 70000, 715),
(68, 'Bulgária', 'Ruse', 65000, 529),
(69, 'Bulgária', 'Stara Zagora', 105000, 608),
(70, 'Bulgária', 'Pleven', 55000, 472),
(71, 'Bulgária', 'Sliven', 60000, 630),
(72, 'Bulgária', 'Pernik', 55000, 465),
(73, 'Bulgária', 'Haskovo', 65000, 645),
(74, 'Bulgária', 'Gabrovo', 60000, 556),
(75, 'Szerbia', 'Belgrade', 50000, 160),
(76, 'Szerbia', 'Novi Sad', 50000, 114),
(77, 'Szerbia', 'Kragujevac', 60000, 255),
(78, 'Szerbia', 'Subotica', 20000, 42),
(79, 'Szerbia', 'Leskovac', 70000, 388),
(80, 'Szerbia', 'Kraljevo', 60000, 284),
(81, 'Szerbia', 'Zrenjanin', 30000, 98),
(82, 'Szerbia', 'Smederevo', 45000, 186),
(83, 'Horvátország', 'Zagreb', 60000, 326),
(84, 'Horvátország', 'Split', 65000, 422),
(85, 'Horvátország', 'Rijeka', 65000, 459),
(86, 'Horvátország', 'Osijek', 45000, 138),
(87, 'Horvátország', 'Zadar', 65000, 454),
(88, 'Horvátország', 'Velika Gorica', 50000, 323),
(89, 'Horvátország', 'Pula', 65000, 517),
(90, 'Horvátország', 'Karlovac', 550000, 368),
(91, 'Horvátország', 'Dubrovnik', 60000, 433),
(92, 'Horvátország', 'Pag', 75000, 448),
(93, 'Horvátország', 'Rab', 75000, 454),
(94, 'Horvátország', 'Kampor', 70000, 465),
(95, 'Spanyolország', 'Madrid', 120000, 2032),
(96, 'Spanyolország', 'Barcelona', 100000, 1540),
(97, 'Spanyolország', 'Valencia', 110000, 1833),
(98, 'Spanyolország', 'Seville', 125000, 2372),
(99, 'Spanyolország', 'Zaragoza', 110000, 1760),
(100, 'Spanyolország', 'Malaga', 115000, 2297),
(101, 'Spanyolország', 'Murcia', 105000, 1976),
(102, 'Spanyolország', 'Palma', 100000, 1607),
(103, 'Spanyolország', 'Las Palmas', 145000, 3700),
(104, 'Spanyolország', 'Bilbao', 100000, 1870),
(105, 'Spanyolország', 'Alicante', 100000, 1908),
(106, 'Spanyolország', 'Cordoba', 120000, 2251),
(107, 'Spanyolország', 'Valladolid', 110000, 2052),
(108, 'Spanyolország', 'Vigo', 120000, 2336),
(109, 'Spanyolország', 'Gijon', 115000, 2053),
(110, 'Spanyolország', 'Granada', 110000, 2207),
(111, 'Spanyolország', 'Oviedo', 110000, 2070),
(112, 'Spanyolország', 'Badalona', 100000, 1532),
(113, 'Portugália', 'Lisbon', 120000, 2532),
(114, 'Portugália', 'Porto ', 120000, 2370),
(115, 'Portugália', ' Amadora ', 125000, 2539),
(116, 'Portugália', 'Braga', 120000, 2343),
(117, 'Portugália', 'Setubal', 125000, 2525),
(118, 'Portugália', 'Coimbra', 120000, 2403),
(119, 'Portugália', 'Loures', 125000, 2529),
(120, 'Portugália', 'Funchal', 140000, 3490),
(121, 'Portugália', 'Queluz', 12000, 2540),
(122, 'Horvátország', 'Suha Punta', 75000, 470);

-- --------------------------------------------------------

--
-- Table structure for table `utazasi_mod`
--

CREATE TABLE IF NOT EXISTS `utazasi_mod` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nev` varchar(256) NOT NULL,
  `ar` int(11) NOT NULL,
  `jarulekos_koltseg` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `utazasi_mod`
--

INSERT INTO `utazasi_mod` (`id`, `nev`, `ar`, `jarulekos_koltseg`) VALUES
(1, 'busz', 15000, 10000),
(2, 'repülő', 10000, 12000),
(3, 'vonat', 15000, 7000),
(4, 'autó', 20000, 15000);

-- --------------------------------------------------------

--
-- Table structure for table `utazik`
--

CREATE TABLE IF NOT EXISTS `utazik` (
  `felh_ID` int(11) NOT NULL,
  `turnus_id` int(11) NOT NULL,
  `fizetve` tinyint(1) NOT NULL,
  KEY `turnus_id` (`turnus_id`),
  KEY `felh_ID` (`felh_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `utazik`
--

INSERT INTO `utazik` (`felh_ID`, `turnus_id`, `fizetve`) VALUES
(28, 23, 1),
(11, 23, 1),
(14, 20, 1),
(2, 8, 1),
(3, 23, 1),
(28, 10, 0),
(3, 3, 0),
(4, 4, 1),
(5, 5, 1),
(6, 7, 1),
(8, 9, 0),
(11, 9, 1),
(16, 9, 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `panasz`
--
ALTER TABLE `panasz`
  ADD CONSTRAINT `panasz_ibfk_1` FOREIGN KEY (`felh_ID`) REFERENCES `felhasznalo` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `turnus`
--
ALTER TABLE `turnus`
  ADD CONSTRAINT `turnus_ibfk_1` FOREIGN KEY (`utazas_id`) REFERENCES `utazas` (`id`),
  ADD CONSTRAINT `turnus_ibfk_2` FOREIGN KEY (`mod_id`) REFERENCES `utazasi_mod` (`id`);

--
-- Constraints for table `utazik`
--
ALTER TABLE `utazik`
  ADD CONSTRAINT `utazik_ibfk_1` FOREIGN KEY (`turnus_id`) REFERENCES `turnus` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `utazik_ibfk_2` FOREIGN KEY (`felh_ID`) REFERENCES `felhasznalo` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
