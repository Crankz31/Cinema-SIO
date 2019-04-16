-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 16 avr. 2019 à 09:52
-- Version du serveur :  5.7.23
-- Version de PHP :  7.2.10

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tbl_login`
--

DROP TABLE IF EXISTS `tbl_login`;
CREATE TABLE IF NOT EXISTS `tbl_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL COMMENT 'email',
  `password` varchar(100) NOT NULL,
  `user_type` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tbl_login`
--

INSERT INTO `tbl_login` (`id`, `user_id`, `username`, `password`, `user_type`) VALUES
(1, 1, 'admin', 'password', 0),
(2, 5, 'theatre', 'password', 1),
(3, 6, 'theatre2', 'password', 1),
(12, 2, 'rahulreghunath11@gmail.com', 'rahul', 2),
(16, 3, 'vishnut300@gmail.com', 'vishnut300', 2),
(17, 4, 'Patrick@gmail.com', 'password', 2);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tbl_movie`
--

INSERT INTO `tbl_movie` (`movie_id`, `t_id`, `movie_name`, `cast`, `description`, `release_date`, `image`, `video_url`, `status`) VALUES
(1, 3, 'Arnold le magnifque', 'Arnold Schwarzenegger', 'Ce film suit la progression d\'Arnold Schwarzenegger vers son 6e titre de Mr. Olympia, à 28 ans.', '2018-01-01', 'images/arnold_le_magnifique_poster.jpg', 'https://www.youtube.com/watch?v=rq45GnjuIlE', 0),
(2, 4, 'Coach Carter', 'Samuel L. Jackson', 'L\'histoire vraie de Ken Carter, l\'entraîneur de basket d\'une &eacutequipe de basket-ball de lyc&eacutee, qui devint c&eacutelèbre en 1999 après avoir renvoy&eacute ses joueurs à leurs chères &eacutetudes, d&eacuteclarant forfait 2 matchs de suite alors que l\'&eacutequipe &eacutetait invaincue, parce que ces derniers n\'avaient pas obtenu des r&eacutesultats scolaires suffisants.', '2018-05-12', 'images/coach_carter_poster.jpg', 'https://www.youtube.com/watch?v=znyAnWUYf2g', 0),
(3, 3, 'Creed', 'Sylvester Stalone, Michael B. Jordan', 'Adonis Johnson n\'a jamais connu son père, le c&eacutelèbre champion du monde poids lourd Apollo Creed d&eacutec&eacuted&eacute avant sa naissance. Pourtant, il a la boxe dans le sang et d&eacutecide d\'être entraîn&eacute par le meilleur de sa cat&eacutegorie. À Philadelphie, il retrouve la trace de Rocky Balboa, que son père avait affront&eacute autrefois, et lui demande de devenir son entraîneur. D\'abord r&eacuteticent, l\'ancien champion d&eacutecèle une force in&eacutebranlable chez Adonis et finit par accepter', '2015-05-12', 'images/creed_poster.jpg', 'https://www.youtube.com/watch?v=Uv554B7YHk4', 0),
(5, 3, 'Invictus', 'Morgan Freeman, Matt Demon', 'En 1995, l\'Afrique du Sud organise la coupe du monde de rugby à XV. Nelson Mandela commence son mandat en tant que président du pays. Contre l\'opinion de ses partisans, il sent dans l\'événement sportif la possibilité de créer un sentiment d\'union nationale derrière l\'équipe des Springboks, symbole durant plusieurs décennies des Blancs d\'Afrique du Sud, de leur domination et de l\'apartheid (1948-1991). « One team, one country » (« une équipe, un pays »).', '2017-05-12', 'images/invictus_poster.jpg', 'https://www.youtube.com/watch?v=Vhl2Zl_QQhE', 0);

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
(1, 'The Art Of Flight', 'Travis Rice', '2019-04-18', 'A mi-chemin entre le documentaire et le road movie, \"The Art of Flight\" se centre sur Travis Rice, véritable légende du snowboard, et ses amis, repoussant sans cesse les limites des sports extrêmes dans les contrées les plus reculées et les plus dangereuses du monde.', 'news_images/the_art_of_flight_poster.jpg'),
(2, 'Million Dollar Baby', 'Clint Estawood, Morgan Freeman', '2019-06-01', 'Rejeté depuis longtemps par sa fille, l entraîneur Frankie Dunn s est replié sur lui-même et vit dans un désert affectif, en évitant toute relation qui pourrait accroître sa douleur et sa culpabilité.', 'news_images/million_dollar_baby_poster.jpg'),
(3, 'Tyson', 'Mike Tyson', '2019-10-05', 'A travers des images d archives et son témoignage, Mike Tyson retrace sa carrière. L athlète controversé revient sur son enfance difficile et son ascension professionnelle qui fera de lui le plus grand champion poids lourds de l Histoire de la boxe...', 'news_images/tyson_poster.jpg');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tbl_registration`
--

INSERT INTO `tbl_registration` (`user_id`, `name`, `email`, `phone`, `age`, `gender`) VALUES
(1, 'admin', 'admin', '0123456789', 23, 'gender'),
(2, 'rahul', 'rahulreghunath11@gmail.com', '9037500119', 23, 'gender'),
(3, 'vishnu', 'vishnut300@gmail.com', '8156820497', 22, 'gender'),
(4, 'Patrick', 'Patrick@gmail.com', '9037500119', 18, 'gender'),
(5, 'theatre', 'theatre', '0987456123', 22, 'gender'),
(6, 'theatre2', 'theatre2', '0321789456', 18, 'gender');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tbl_theatre`
--

INSERT INTO `tbl_theatre` (`id`, `name`, `address`, `place`, `state`, `pin`) VALUES
(3, 'GOB Centre', '2 Rue Georges Ledormeur', 'Tarbes', 'Occitanie', 65000),
(4, 'GOB Gare', '14 Rue Victor Hugo', 'Tarbes', 'Occitanie', 65000);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
