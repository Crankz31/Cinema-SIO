-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 06 mai 2019 à 06:27
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

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
-- Structure de la table `tbl_bookings`
--

DROP TABLE IF EXISTS `tbl_bookings`;
CREATE TABLE IF NOT EXISTS `tbl_bookings` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) NOT NULL,
  `t_id` int(11) NOT NULL COMMENT 'theater id',
  `user_id` int(11) NOT NULL,
  `show_id` int(11) NOT NULL,
  `screen_id` int(11) NOT NULL,
  `no_seats` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `ticket_date` date NOT NULL,
  `date` date NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`book_id`),
  KEY `t_id` (`t_id`),
  KEY `user_id` (`user_id`),
  KEY `show_id` (`show_id`),
  KEY `screen_id` (`screen_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tbl_bookings`
--

INSERT INTO `tbl_bookings` (`book_id`, `ticket_id`, `t_id`, `user_id`, `show_id`, `screen_id`, `no_seats`, `amount`, `ticket_date`, `date`, `status`) VALUES
(1, 117, 1, 2, 2, 1, 4, 8, '2019-05-09', '2019-05-05', 1);

-- --------------------------------------------------------

--
-- Structure de la table `tbl_contact`
--

DROP TABLE IF EXISTS `tbl_contact`;
CREATE TABLE IF NOT EXISTS `tbl_contact` (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` int(11) NOT NULL,
  `subject` varchar(1000) NOT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tbl_contact`
--

INSERT INTO `tbl_contact` (`contact_id`, `name`, `email`, `mobile`, `subject`) VALUES
(1, 'pierre', 'pierre@gmail.com', 635363412, 'J adore votre cinema'),
(2, 'Gregoire Bisso', 'gregoire.bisso@gmail.com', 635508881, ' Salutation'),
(3, 'Pierre', 'pierre@gmail.com', 525262785, ' Test'),
(4, 'jack', 'jack@gmail.com', 525263333, ' Bonjour');

-- --------------------------------------------------------

--
-- Structure de la table `tbl_login`
--

DROP TABLE IF EXISTS `tbl_login`;
CREATE TABLE IF NOT EXISTS `tbl_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(100) NOT NULL COMMENT 'email',
  `password` varchar(100) NOT NULL,
  `user_type` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tbl_login`
--

INSERT INTO `tbl_login` (`id`, `user_id`, `username`, `password`, `user_type`) VALUES
(1, NULL, 'admin', 'password', 0),
(2, 1, 'dupont@gmail.com', 'password', 2),
(3, 2, 'pierre@gmail.com', 'password', 2),
(4, NULL, 'GOB1', 'password', 1);

-- --------------------------------------------------------

--
-- Structure de la table `tbl_movie`
--

DROP TABLE IF EXISTS `tbl_movie`;
CREATE TABLE IF NOT EXISTS `tbl_movie` (
  `movie_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_id` int(11) NOT NULL COMMENT 'theater id',
  `movie_name` varchar(100) NOT NULL,
  `cast` varchar(500) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `release_date` date NOT NULL,
  `image` varchar(200) NOT NULL,
  `video_url` varchar(200) NOT NULL,
  `status` int(1) NOT NULL COMMENT '0 means active',
  PRIMARY KEY (`movie_id`),
  KEY `t_id` (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tbl_movie`
--

INSERT INTO `tbl_movie` (`movie_id`, `t_id`, `movie_name`, `cast`, `description`, `release_date`, `image`, `video_url`, `status`) VALUES
(1, 1, 'De l\'ombre à la lumière', 'Russell Crowe Renee Zellweger Paul Giamatti', 'Autrefois boxeur prometteur, Jim Braddock s\'est vu contraint d\'abandonner la compétition après une série de défaites. Alors que l\'Amérique sombre dans la Grande Dépression, Jim accepte n\'importe quel petit boulot pour faire vivre sa femme Mae et leurs enfants.', '2005-09-14', 'images/Ombre.jpg', 'https://www.youtube.com/watch?v=uaT0nB5EWuY', 0),
(2, 1, 'Le Grand Bain', 'Mathieu Amalric, Guillaume Canet, Benoit Poelvoorde', 'C\'est dans les couloirs de leur piscine municipale que Bertrand, Marcus, Simon, Laurent, Thierry et les autres s\'entraînent sous l\'autorité toute relative de Delphine, ancienne gloire des bassins. Ensemble, ils se sentent libres et utiles.', '2018-10-24', 'images/Grandbain.jpg', 'https://www.youtube.com/watch?v=YXmLl2brv6s', 0);

-- --------------------------------------------------------

--
-- Structure de la table `tbl_news`
--

DROP TABLE IF EXISTS `tbl_news`;
CREATE TABLE IF NOT EXISTS `tbl_news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `cast` varchar(1000) NOT NULL,
  `news_date` date NOT NULL,
  `description` varchar(1000) NOT NULL,
  `attachment` varchar(1000) NOT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tbl_news`
--

INSERT INTO `tbl_news` (`news_id`, `name`, `cast`, `news_date`, `description`, `attachment`) VALUES
(1, 'Million Dollar Baby', 'Clint Estawood, Morgan Freeman', '2005-05-23', 'Rejeté depuis longtemps par sa fille, l\'entraîneur Frankie Dunn s\'est replié sur lui-même et vit dans un désert affectif, en évitant toute relation qui pourrait accroître sa douleur et sa culpabilité.', 'news_images/MillionDollar.jpg'),
(2, 'RASTA ROCKETT', 'Leon Robinson, Doug E. Doug, John Candy', '1993-04-13', 'L\'histoire véridique de quatre Jamaïcains qui ont un rêve fou : obtenir une médaille d\'or dans une discipline olympique qui leur est totalement inconnue et impossible à pratiquer chez eux : le bobsleigh !', 'news_images/Rasta.jpg'),
(3, 'Fighter', 'Mark Wahlberg, Christian Bale, Amy Adams ', '2011-03-09', 'Micky Ward est un jeune boxeur dont la carrière stagne. Il va rencontrer Charlene, une femme au caractère bien trempé, qui va l\'aider à s\'affranchir de l\'influence négative de sa mère, qui gère maladroitement sa carrière, et de ses soeurs envahissantes.', 'news_images/fighter.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `tbl_registration`
--

DROP TABLE IF EXISTS `tbl_registration`;
CREATE TABLE IF NOT EXISTS `tbl_registration` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `age` int(2) NOT NULL,
  `gender` varchar(10) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tbl_registration`
--

INSERT INTO `tbl_registration` (`user_id`, `name`, `email`, `phone`, `age`, `gender`) VALUES
(1, 'Dupont', 'dupont@gmail.com', '0630303030', 30, 'gender'),
(2, 'Pierre', 'pierre@gmail.com', '0525263231', 40, 'gender');

-- --------------------------------------------------------

--
-- Structure de la table `tbl_screens`
--

DROP TABLE IF EXISTS `tbl_screens`;
CREATE TABLE IF NOT EXISTS `tbl_screens` (
  `screen_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_id` int(11) NOT NULL COMMENT 'theater id',
  `screen_name` varchar(100) NOT NULL,
  `seats` int(11) NOT NULL COMMENT 'number of seats',
  `charge` int(11) NOT NULL COMMENT 'price ticket',
  PRIMARY KEY (`screen_id`),
  KEY `t_id` (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tbl_screens`
--

INSERT INTO `tbl_screens` (`screen_id`, `t_id`, `screen_name`, `seats`, `charge`) VALUES
(1, 1, 'Salle1', 100, 2),
(2, 1, 'Salle2 ', 120, 3);

-- --------------------------------------------------------

--
-- Structure de la table `tbl_shows`
--

DROP TABLE IF EXISTS `tbl_shows`;
CREATE TABLE IF NOT EXISTS `tbl_shows` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `st_id` int(11) NOT NULL COMMENT 'show time id',
  `theatre_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `status` int(11) NOT NULL COMMENT '1 means show avaible',
  `r_status` int(11) NOT NULL,
  PRIMARY KEY (`s_id`),
  KEY `theatre_id` (`theatre_id`),
  KEY `st_id` (`st_id`),
  KEY `movie_id` (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tbl_shows`
--

INSERT INTO `tbl_shows` (`s_id`, `st_id`, `theatre_id`, `movie_id`, `start_date`, `status`, `r_status`) VALUES
(1, 2, 1, 1, '2019-05-14', 1, 1),
(2, 3, 1, 2, '2019-05-10', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `tbl_show_time`
--

DROP TABLE IF EXISTS `tbl_show_time`;
CREATE TABLE IF NOT EXISTS `tbl_show_time` (
  `st_id` int(11) NOT NULL AUTO_INCREMENT,
  `screen_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT 'après_midi, matin ...',
  `start_time` time NOT NULL,
  PRIMARY KEY (`st_id`),
  KEY `screen_id` (`screen_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tbl_show_time`
--

INSERT INTO `tbl_show_time` (`st_id`, `screen_id`, `name`, `start_time`) VALUES
(1, 1, 'Matin', '08:00:00'),
(2, 1, 'Après-midi', '14:00:00'),
(3, 1, 'Soirée', '20:00:00'),
(4, 2, 'Matin', '10:00:00'),
(5, 2, 'Après-midi', '15:00:00'),
(6, 2, 'Soirée', '22:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `tbl_theatre`
--

DROP TABLE IF EXISTS `tbl_theatre`;
CREATE TABLE IF NOT EXISTS `tbl_theatre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `place` varchar(1000) NOT NULL,
  `state` varchar(1000) NOT NULL,
  `pin` int(11) NOT NULL,
  `id_log` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_log` (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tbl_theatre`
--

INSERT INTO `tbl_theatre` (`id`, `name`, `address`, `place`, `state`, `pin`, `id_log`) VALUES
(1, 'GOB Tarbe', '7 rue de la gare', 'Tarbes, France', 'Hautes-PyrÃ©nÃ©es', 65000, 4);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `tbl_bookings`
--
ALTER TABLE `tbl_bookings`
  ADD CONSTRAINT `tbl_bookings_ibfk_1` FOREIGN KEY (`t_id`) REFERENCES `tbl_theatre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_bookings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tbl_registration` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_bookings_ibfk_3` FOREIGN KEY (`show_id`) REFERENCES `tbl_shows` (`s_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_bookings_ibfk_4` FOREIGN KEY (`screen_id`) REFERENCES `tbl_screens` (`screen_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD CONSTRAINT `tbl_login_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_registration` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `tbl_movie`
--
ALTER TABLE `tbl_movie`
  ADD CONSTRAINT `tbl_movie_ibfk_1` FOREIGN KEY (`t_id`) REFERENCES `tbl_theatre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `tbl_screens`
--
ALTER TABLE `tbl_screens`
  ADD CONSTRAINT `tbl_screens_ibfk_1` FOREIGN KEY (`t_id`) REFERENCES `tbl_theatre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `tbl_shows`
--
ALTER TABLE `tbl_shows`
  ADD CONSTRAINT `tbl_shows_ibfk_1` FOREIGN KEY (`theatre_id`) REFERENCES `tbl_theatre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_shows_ibfk_2` FOREIGN KEY (`st_id`) REFERENCES `tbl_show_time` (`st_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_shows_ibfk_3` FOREIGN KEY (`movie_id`) REFERENCES `tbl_movie` (`movie_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `tbl_show_time`
--
ALTER TABLE `tbl_show_time`
  ADD CONSTRAINT `tbl_show_time_ibfk_1` FOREIGN KEY (`screen_id`) REFERENCES `tbl_screens` (`screen_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `tbl_theatre`
--
ALTER TABLE `tbl_theatre`
  ADD CONSTRAINT `tbl_theatre_ibfk_1` FOREIGN KEY (`id_log`) REFERENCES `tbl_login` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
