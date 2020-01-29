-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Hoszt: localhost
-- Létrehozás ideje: 2012. nov. 07. 13:44
-- Szerver verzió: 5.5.16
-- PHP verzió: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Adatbázis: `foldrajz`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet: `etnikum`
--

CREATE TABLE IF NOT EXISTS `etnikum` (
  `kod` int(11) NOT NULL,
  `megnevezes` varchar(30) DEFAULT NULL,
  `nyelv` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`kod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `etnikum`
--

INSERT INTO `etnikum` (`kod`, `megnevezes`, `nyelv`) VALUES
(1, 'németországi törökök', 'török'),
(2, 'szerbiai magyarok', 'magyar'),
(3, 'szlovákiai magyarok', 'magyar'),
(4, 'olaszországi románok', 'román'),
(5, 'angliai lengyelek', 'lengyel'),
(6, 'franciaországi lengyelek', 'lengyel'),
(7, 'németországi lengyelek', 'lengyel'),
(8, 'törökök', 'török'),
(9, 'németek', 'német'),
(10, 'magyarok', 'magyar'),
(11, 'magyarországi horvátok', 'horvát');

-- --------------------------------------------------------

--
-- Tábla szerkezet: `foldresz`
--

CREATE TABLE IF NOT EXISTS `foldresz` (
  `nev` varchar(20) NOT NULL,
  `terulet` int(11) DEFAULT NULL,
  PRIMARY KEY (`nev`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `foldresz`
--

INSERT INTO `foldresz` (`nev`, `terulet`) VALUES
('Afrika', 33419000),
('Ausztrália és Óceáni', 8510000),
('Ázsia', 44411000),
('Észak-Amerika', 21515000),
('Európa', 10508000),
('Közép- és Dél-Amerik', 20566000);

-- --------------------------------------------------------

--
-- Tábla szerkezet: `lakossag`
--

CREATE TABLE IF NOT EXISTS `lakossag` (
  `orszag_hivoszam` int(11) NOT NULL DEFAULT '0',
  `etnikum_kod` int(11) NOT NULL DEFAULT '0',
  `hany_fo` int(11) DEFAULT NULL,
  PRIMARY KEY (`orszag_hivoszam`,`etnikum_kod`),
  KEY `etnikum_kod` (`etnikum_kod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `lakossag`
--

INSERT INTO `lakossag` (`orszag_hivoszam`, `etnikum_kod`, `hany_fo`) VALUES
(1, 8, 1600000),
(2, 1, 300000),
(2, 7, 60000),
(2, 9, 1200000),
(3, 10, 1000000),
(3, 11, 40000);

-- --------------------------------------------------------

--
-- Tábla szerkezet: `orszag`
--

CREATE TABLE IF NOT EXISTS `orszag` (
  `hivoszam` int(11) NOT NULL,
  `orszag_neve` varchar(30) NOT NULL,
  `terulete` int(11) DEFAULT NULL,
  `hivatalos_nyelv` varchar(20) DEFAULT NULL,
  `gdp` int(11) DEFAULT NULL,
  `eghajlat` varchar(15) DEFAULT NULL,
  `foldresz_nev` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`hivoszam`),
  KEY `foldresz_nev` (`foldresz_nev`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `orszag`
--

INSERT INTO `orszag` (`hivoszam`, `orszag_neve`, `terulete`, `hivatalos_nyelv`, `gdp`, `eghajlat`, `foldresz_nev`) VALUES
(1, 'Törökország', 780000, 'török', 734, 'mediterrán', 'Európa'),
(2, 'Németország', 600000, 'német', 850, 'kontinentális', 'Európa'),
(3, 'Magyarország', 100000, 'magyar', 780, 'kontinentális', 'Európa'),
(4, 'Szerbia', 110000, 'szerb', 750, 'kontinentális', 'Európa'),
(5, 'Görögország', 450000, 'görög', 720, 'mediterrán', 'Európa');

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `lakossag`
--
ALTER TABLE `lakossag`
  ADD CONSTRAINT `lakossag_ibfk_1` FOREIGN KEY (`orszag_hivoszam`) REFERENCES `orszag` (`hivoszam`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lakossag_ibfk_2` FOREIGN KEY (`etnikum_kod`) REFERENCES `etnikum` (`kod`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `orszag`
--
ALTER TABLE `orszag`
  ADD CONSTRAINT `orszag_ibfk_1` FOREIGN KEY (`foldresz_nev`) REFERENCES `foldresz` (`nev`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;