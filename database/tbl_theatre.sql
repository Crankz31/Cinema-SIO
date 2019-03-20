-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 17 mars 2019 à 22:33
-- Version du serveur :  5.7.23
-- Version de PHP :  7.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `sio_cinema`
--

-- --------------------------------------------------------

--
-- Structure de la table `tbl_theatre`
--

DROP TABLE IF EXISTS `tbl_theatre`;
CREATE TABLE IF NOT EXISTS `tbl_theatre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `state` varchar(50) NOT NULL,
  `pin` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `tbl_theatre`
--

INSERT INTO `tbl_theatre` (`id`, `name`, `address`, `place`, `state`, `pin`) VALUES
(3, 'GOMB CINEMA', '2 Rue Georges Ledormeur', 'Tarbes', 'Occitanie', 65000),
(4, 'GOMB CINEMA', '14 Rue Victor Hugo', 'Toulouse', 'Kerala', 691523);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
