-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 05 avr. 2019 à 18:16
-- Version du serveur :  5.7.23
-- Version de PHP :  7.0.32

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
  `ticket_id` varchar(30) CHARACTER SET latin1 NOT NULL,
  `t_id` int(11) NOT NULL COMMENT 'theater id',
  `user_id` int(11) NOT NULL,
  `show_id` int(11) NOT NULL,
  `screen_id` int(11) NOT NULL,
  `no_seats` int(3) NOT NULL COMMENT 'number of seats',
  `amount` int(5) NOT NULL,
  `ticket_date` date NOT NULL,
  `date` date NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tbl_bookings`
--

INSERT INTO `tbl_bookings` (`book_id`, `ticket_id`, `t_id`, `user_id`, `show_id`, `screen_id`, `no_seats`, `amount`, `ticket_date`, `date`, `status`) VALUES
(11, 'BKID525', 4, 2, 3, 3, 1, 75, '2017-05-22', '2017-05-22', 1),
(12, 'BKID947', 4, 2, 1, 3, 3, 21, '2019-04-05', '2019-04-05', 1),
(13, 'BKID301', 3, 2, 5, 1, 1, 5, '2019-04-05', '2019-04-05', 1),
(14, 'BKID760', 3, 4, 19, 1, 1, 5, '2019-04-05', '2019-04-05', 1),
(15, 'BKID218', 3, 2, 7, 1, 2, 10, '2019-04-05', '2019-04-05', 1),
(16, 'BKID146', 3, 4, 20, 1, 10, 50, '2019-04-05', '2019-04-05', 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `tbl_login`
--

DROP TABLE IF EXISTS `tbl_login`;
CREATE TABLE IF NOT EXISTS `tbl_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `username` varchar(50) CHARACTER SET latin1 NOT NULL COMMENT 'email',
  `password` varchar(50) CHARACTER SET latin1 NOT NULL,
  `user_type` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tbl_login`
--

INSERT INTO `tbl_login` (`id`, `user_id`, `username`, `password`, `user_type`) VALUES
(1, 0, 'admin', 'password', 0),
(2, 3, 'theatre', 'password', 1),
(3, 4, 'theatre2', 'password', 1),
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
  `t_id` int(11) NOT NULL COMMENT 'theatre id',
  `movie_name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `cast` varchar(500) CHARACTER SET latin1 NOT NULL,
  `desc` varchar(1000) CHARACTER SET latin1 NOT NULL,
  `release_date` date NOT NULL,
  `image` varchar(200) CHARACTER SET latin1 NOT NULL,
  `video_url` varchar(200) CHARACTER SET latin1 NOT NULL,
  `status` int(1) NOT NULL COMMENT '0 means active ',
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tbl_movie`
--

INSERT INTO `tbl_movie` (`movie_id`, `t_id`, `movie_name`, `cast`, `desc`, `release_date`, `image`, `video_url`, `status`) VALUES
(1, 3, 'Arnold le magnifque', 'Arnold Schwarzenegger', 'Ce film suit la progression d\'Arnold Schwarzenegger vers son 6e titre de Mr. Olympia, à 28 ans.', '2018-01-01', 'images/arnold_le_magnifique_poster.jpg', 'https://www.youtube.com/watch?v=rq45GnjuIlE', 0),
(2, 3, 'Coach Carter', 'Samuel L. Jackson', 'L\'histoire vraie de Ken Carter, l\'entraîneur de basket d\'une &eacutequipe de basket-ball de lyc&eacutee, qui devint c&eacutelèbre en 1999 après avoir renvoy&eacute ses joueurs à leurs chères &eacutetudes, d&eacuteclarant forfait 2 matchs de suite alors que l\'&eacutequipe &eacutetait invaincue, parce que ces derniers n\'avaient pas obtenu des r&eacutesultats scolaires suffisants.', '2018-05-12', 'images/coach_carter_poster.jpg', 'https://www.youtube.com/watch?v=znyAnWUYf2g', 0),
(3, 3, 'Creed', 'Sylvester Stalone, Michael B. Jordan', 'Adonis Johnson n\'a jamais connu son père, le c&eacutelèbre champion du monde poids lourd Apollo Creed d&eacutec&eacuted&eacute avant sa naissance. Pourtant, il a la boxe dans le sang et d&eacutecide d\'être entraîn&eacute par le meilleur de sa cat&eacutegorie. À Philadelphie, il retrouve la trace de Rocky Balboa, que son père avait affront&eacute autrefois, et lui demande de devenir son entraîneur. D\'abord r&eacuteticent, l\'ancien champion d&eacutecèle une force in&eacutebranlable chez Adonis et finit par accepter', '2015-05-12', 'images/creed_poster.jpg', 'https://www.youtube.com/watch?v=Uv554B7YHk4', 0),
(5, 3, 'Invictus', 'Morgan Freeman, Matt Demon', 'En 1995, l\'Afrique du Sud organise la coupe du monde de rugby à XV. Nelson Mandela commence son mandat en tant que président du pays. Contre l\'opinion de ses partisans, il sent dans l\'événement sportif la possibilité de créer un sentiment d\'union nationale derrière l\'équipe des Springboks, symbole durant plusieurs décennies des Blancs d\'Afrique du Sud, de leur domination et de l\'apartheid (1948-1991). « One team, one country » (« une équipe, un pays »).', '2017-05-12', 'images/invictus_poster.jpg', 'https://www.youtube.com/watch?v=Vhl2Zl_QQhE', 0);

-- --------------------------------------------------------

--
-- Structure de la table `tbl_news`
--

DROP TABLE IF EXISTS `tbl_news`;
CREATE TABLE IF NOT EXISTS `tbl_news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `cast` varchar(100) CHARACTER SET latin1 NOT NULL,
  `news_date` date NOT NULL,
  `description` varchar(200) CHARACTER SET latin1 NOT NULL,
  `attachment` varchar(200) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tbl_news`
--

INSERT INTO `tbl_news` (`news_id`, `name`, `cast`, `news_date`, `description`, `attachment`) VALUES
(6, 'Million Dollar Baby', 'Clint Estawood, Morgan Freeman', '2019-06-01', 'Rejet&eacute depuis longtemps par sa fille, lentraîneur Frankie Dunn sest repli&eacute sur lui-même et vit dans un d&eacutesert affectif. Le jour où Maggie Fitzgerald, 31 ans, pousse la porte de son g', 'news_images/million_dollar_baby_poster.jpg'),
(7, 'The Art Of Flight', 'Travis Rice', '2019-06-15', 'A mi-chemin entre le documentaire et le road movie, ce film est centr&eacute sur Travis Rice, v&eacuteritable l&eacutegende du snowboard, et ses amis, repoussant sans cesse les limites des sports extr', 'news_images/the_art_of_flight_poster.jpg'),
(8, 'Tyson', 'Mike Tyson', '2019-10-05', 'A travers des images darchives et son t&eacutemoignage, Mike Tyson retrace sa carrière. De ses premiers souvenirs denfance jusquà ses dilemmes actuels, lathlète controvers&eacute revient sur son enfan', 'news_images/tyson_poster.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `tbl_registration`
--

DROP TABLE IF EXISTS `tbl_registration`;
CREATE TABLE IF NOT EXISTS `tbl_registration` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET latin1 NOT NULL,
  `email` varchar(50) CHARACTER SET latin1 NOT NULL,
  `phone` varchar(12) CHARACTER SET latin1 NOT NULL,
  `age` int(2) NOT NULL,
  `gender` varchar(10) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tbl_registration`
--

INSERT INTO `tbl_registration` (`user_id`, `name`, `email`, `phone`, `age`, `gender`) VALUES
(2, 'rahul', 'rahulreghunath11@gmail.com', '9037500119', 23, 'gender'),
(3, 'vishnu', 'vishnut300@gmail.com', '8156820497', 22, 'gender'),
(4, 'Patrick', 'Patrick@gmail.com', '9037500119', 18, 'gender');

-- --------------------------------------------------------

--
-- Structure de la table `tbl_screens`
--

DROP TABLE IF EXISTS `tbl_screens`;
CREATE TABLE IF NOT EXISTS `tbl_screens` (
  `screen_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_id` int(11) NOT NULL COMMENT 'theatre id',
  `screen_name` varchar(110) CHARACTER SET latin1 NOT NULL,
  `seats` int(11) NOT NULL COMMENT 'number of seats',
  `charge` int(11) NOT NULL,
  PRIMARY KEY (`screen_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tbl_screens`
--

INSERT INTO `tbl_screens` (`screen_id`, `t_id`, `screen_name`, `seats`, `charge`) VALUES
(1, 3, 'Salle 1', 100, 5),
(2, 3, 'Salle 2', 150, 6),
(3, 4, 'Salle 2', 125, 7),
(4, 4, 'Salle 1', 100, 5);

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
  `status` int(11) NOT NULL COMMENT '1 means show available',
  `r_status` int(11) NOT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tbl_shows`
--

INSERT INTO `tbl_shows` (`s_id`, `st_id`, `theatre_id`, `movie_id`, `start_date`, `status`, `r_status`) VALUES
(19, 2, 3, 5, '2019-04-05', 1, 1),
(20, 1, 3, 3, '2019-04-05', 1, 1),
(21, 3, 3, 2, '2019-04-05', 1, 1),
(22, 4, 3, 1, '2019-04-05', 1, 1),
(23, 5, 3, 1, '2019-04-05', 1, 1),
(24, 6, 3, 2, '2019-04-05', 1, 1),
(25, 7, 3, 3, '2019-04-05', 1, 1),
(26, 8, 3, 5, '2019-04-05', 1, 1),
(27, 15, 4, 1, '2019-04-05', 1, 1),
(28, 16, 4, 2, '2019-04-05', 1, 1),
(29, 17, 4, 3, '2019-04-05', 1, 1),
(30, 18, 4, 5, '2019-04-05', 1, 1),
(31, 12, 4, 1, '2019-04-05', 1, 1),
(32, 11, 4, 2, '2019-04-05', 1, 1),
(33, 10, 4, 3, '2019-04-05', 1, 1),
(34, 9, 4, 1, '2019-04-05', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `tbl_show_time`
--

DROP TABLE IF EXISTS `tbl_show_time`;
CREATE TABLE IF NOT EXISTS `tbl_show_time` (
  `st_id` int(11) NOT NULL AUTO_INCREMENT,
  `screen_id` int(11) NOT NULL,
  `name` varchar(40) CHARACTER SET latin1 NOT NULL COMMENT 'noon,second,etc',
  `start_time` time NOT NULL,
  PRIMARY KEY (`st_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tbl_show_time`
--

INSERT INTO `tbl_show_time` (`st_id`, `screen_id`, `name`, `start_time`) VALUES
(1, 1, 'Matin (10h)', '10:00:00'),
(2, 1, 'Dejeuner (14h)', '14:00:00'),
(3, 1, 'Après-midi (18h)', '18:00:00'),
(4, 1, 'Soirée (21h)', '21:00:00'),
(5, 2, 'Matin (10h)', '10:00:00'),
(6, 2, 'Dejeuner (14h)', '14:00:00'),
(7, 2, 'Après-midi (18h)', '18:00:00'),
(8, 2, 'Soirée (21h)', '21:00:00'),
(9, 3, 'Matin (10h)', '10:00:00'),
(10, 3, 'Dejeuner (14h)', '14:00:00'),
(11, 3, 'Après-midi (18h)', '18:00:00'),
(12, 3, 'Soirée (21h)', '21:00:00'),
(15, 4, 'Matin (10h)', '10:00:00'),
(16, 4, 'Dejeuner (14h)', '14:00:00'),
(17, 4, 'Après-midi (18h)', '18:00:00'),
(18, 4, 'Soirée (21h)', '21:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `tbl_theatre`
--

DROP TABLE IF EXISTS `tbl_theatre`;
CREATE TABLE IF NOT EXISTS `tbl_theatre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `address` varchar(100) CHARACTER SET latin1 NOT NULL,
  `place` varchar(100) CHARACTER SET latin1 NOT NULL,
  `state` varchar(50) CHARACTER SET latin1 NOT NULL,
  `pin` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tbl_theatre`
--

INSERT INTO `tbl_theatre` (`id`, `name`, `address`, `place`, `state`, `pin`) VALUES
(3, 'GOB Centre', '2 Rue Georges Ledormeur', 'Tarbes', 'Occitanie', 65000),
(4, 'GOB Gare', '14 Rue Victor Hugo', 'Tarbes', 'Occitanie', 65000);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
