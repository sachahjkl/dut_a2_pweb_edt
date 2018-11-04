-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 04 nov. 2018 à 20:51
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
-- Base de données :  `pweb18_`
--

-- --------------------------------------------------------

--
-- Structure de la table `completude`
--

DROP TABLE IF EXISTS `completude`;
CREATE TABLE IF NOT EXISTS `completude` (
  `id_complet` int(11) NOT NULL AUTO_INCREMENT,
  `id_period` int(11) NOT NULL,
  `id_mat` int(11) DEFAULT NULL,
  `id_prof` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_complet`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `completude`
--

INSERT INTO `completude` (`id_complet`, `id_period`, `id_mat`, `id_prof`) VALUES
(1, 2, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `contrainte`
--

DROP TABLE IF EXISTS `contrainte`;
CREATE TABLE IF NOT EXISTS `contrainte` (
  `id_cont` int(11) NOT NULL AUTO_INCREMENT,
  `bPositive` tinyint(4) NOT NULL DEFAULT '0',
  `id_mat` int(11) DEFAULT NULL,
  `id_prof` int(11) DEFAULT NULL,
  `id_salle` int(11) DEFAULT NULL,
  `type_cont` text COLLATE utf8_bin NOT NULL,
  `valeur` text CHARACTER SET latin1,
  PRIMARY KEY (`id_cont`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `contrainte`
--

INSERT INTO `contrainte` (`id_cont`, `bPositive`, `id_mat`, `id_prof`, `id_salle`, `type_cont`, `valeur`) VALUES
(1, 0, 1, 3, NULL, 'jour', '{\"mardi\":[14,18.30], \n\"mercredi\":[8,18.30]}'),
(2, 1, 1, 3, NULL, 'creneau', '{\"M\":[2]}'),
(3, 0, NULL, NULL, NULL, 'vacances', '{\"Toussaint\":[1540767600,1541178000]}\n'),
(4, 0, NULL, NULL, 6, 'reservation', '{\"Akhaton\":[1574982000,1575048600]}');

-- --------------------------------------------------------

--
-- Structure de la table `creneau`
--

DROP TABLE IF EXISTS `creneau`;
CREATE TABLE IF NOT EXISTS `creneau` (
  `id_creneau` int(11) NOT NULL AUTO_INCREMENT,
  `tDeb` int(11) NOT NULL,
  `tFin` int(11) NOT NULL,
  `id_edth` int(11) NOT NULL,
  `id_mat` int(11) NOT NULL,
  `id_prof` int(11) NOT NULL,
  `id_grpe` int(11) NOT NULL,
  `id_salle` int(11) NOT NULL,
  PRIMARY KEY (`id_creneau`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `creneau`
--

INSERT INTO `creneau` (`id_creneau`, `tDeb`, `tFin`, `id_edth`, `id_mat`, `id_prof`, `id_grpe`, `id_salle`) VALUES
(1, 1539604800, 1539615600, 6, 17, 5, 11, 7),
(3, 1539687620, 1539765000, 6, 16, 6, 11, 9),
(4, 1539777600, 1539788400, 6, 9, 4, 11, 10),
(5, 1539604800, 1539615600, 6, 1, 2, 10, 11),
(6, 1539676800, 1539680400, 6, 1, 2, 9, 11),
(7, 1539763200, 1539766800, 6, 1, 2, 12, 1),
(8, 1539790200, 1539801000, 6, 1, 2, 11, 1);

-- --------------------------------------------------------

--
-- Structure de la table `edth`
--

DROP TABLE IF EXISTS `edth`;
CREATE TABLE IF NOT EXISTS `edth` (
  `id_edth` int(11) NOT NULL AUTO_INCREMENT,
  `tDeb` int(11) NOT NULL,
  `label` text COLLATE utf8_bin NOT NULL,
  `bCourant` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_edth`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `edth`
--

INSERT INTO `edth` (`id_edth`, `tDeb`, `label`, `bCourant`) VALUES
(1, 1536537600, '1', 1),
(2, 1537142400, '2', 1),
(3, 1537747200, '3', 1),
(4, 1538352000, '4', 1),
(5, 1538956800, '5', 1),
(6, 1539561600, '6', 1),
(7, 1540166400, '7', 1),
(8, 1541379600, 'DST C', 1),
(9, 1541984400, '1', 1),
(10, 1542589200, '2', 1),
(11, 1543194000, '3', 1),
(12, 1543798800, '4', 1),
(13, 1544403600, '5', 1),
(14, 1545008400, '6', 1),
(15, 1546822800, '7', 1),
(16, 1547427600, 'DST D', 1);

-- --------------------------------------------------------

--
-- Structure de la table `edtperiod`
--

DROP TABLE IF EXISTS `edtperiod`;
CREATE TABLE IF NOT EXISTS `edtperiod` (
  `id_period` int(11) NOT NULL AUTO_INCREMENT,
  `id_promo` int(11) NOT NULL,
  `label` text COLLATE utf8_bin NOT NULL,
  `tDeb` int(11) NOT NULL,
  `tFin` int(11) NOT NULL,
  PRIMARY KEY (`id_period`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `edtperiod`
--

INSERT INTO `edtperiod` (`id_period`, `id_promo`, `label`, `tDeb`, `tFin`) VALUES
(1, 1, 'C', 1513292400, 1540656000),
(2, 1, 'D', 1541977200, 1548025200);

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `id_etu` int(11) NOT NULL AUTO_INCREMENT,
  `id_promo` int(11) NOT NULL,
  `id_grpe` int(11) NOT NULL,
  `genre` text COLLATE utf8_bin NOT NULL,
  `nom` text COLLATE utf8_bin NOT NULL,
  `prenom` text COLLATE utf8_bin NOT NULL,
  `email` text COLLATE utf8_bin NOT NULL,
  `login_etu` text COLLATE utf8_bin NOT NULL,
  `pass_etu` text COLLATE utf8_bin NOT NULL,
  `matricule` text COLLATE utf8_bin NOT NULL,
  `date_etu` date NOT NULL,
  `urlPhoto` text COLLATE utf8_bin NOT NULL,
  `bConnect` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_etu`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`id_etu`, `id_promo`, `id_grpe`, `genre`, `nom`, `prenom`, `email`, `login_etu`, `pass_etu`, `matricule`, `date_etu`, `urlPhoto`, `bConnect`) VALUES
(1, 1, 1, 'Melle', 'Dahmani', 'Djaouida', 'ddahmani@parisdescartes.fr', 'ddahmani', '098f6bcd4621d373cade4e832627b4f6', '12345678', '2018-09-10', '', 0),
(2, 1, 1, 'M', 'Karl', 'Bernard', 'bernard.karl@parisdescartes.fr', 'bkarl', '098f6bcd4621d373cade4e832627b4f6', '40004000', '2018-09-10', '', 0),
(3, 1, 2, 'Melle', 'Mozart', 'lea', 'lea.mozart@parisdescartes.fr', 'lmozart', '098f6bcd4621d373cade4e832627b4f6', '10001000', '2018-09-10', '', 0),
(4, 1, 4, 'M', 'Vincens', 'Bernard', 'bernard.vincens@parisdescartes.fr', 'bvincens', '098f6bcd4621d373cade4e832627b4f6', '12345678', '2018-09-10', '', 0),
(5, 1, 5, 'M', 'Lauzanne', 'Alain', 'alauzanne@parisdescartes.fr', 'alauzanne', '098f6bcd4621d373cade4e832627b4f6', '22345678', '2018-09-10', './userdata/profile_pictures/22345678.png', 1),
(6, 1, 6, 'Melle', 'Rey', 'Annie', 'arey@parisdecartes.fr', 'arey', '098f6bcd4621d373cade4e832627b4f6', '32345678', '2018-09-10', '', 0),
(7, 1, 6, 'M', 'Tao', 'minh', 'mtao@parisdescartes.fr', 'mtao', '098f6bcd4621d373cade4e832627b4f6', '10001000', '2018-09-10', '', 0),
(8, 1, 7, 'M', 'Berger', 'Paul', 'pberger@parisdescartes.fr', 'pberger', '098f6bcd4621d373cade4e832627b4f6', '70000000', '2018-09-10', '', 0),
(9, 1, 8, 'Melle', 'Franceschinis', 'Octavia', 'ofranceschinis', 'ofrance', '098f6bcd4621d373cade4e832627b4f6', '46546545', '2018-09-10', './userdata/profile_pictures/46546545.png', 0),
(10, 1, 4, 'Melle', 'test', 'test', 'test@', 'test', '098f6bcd4621d373cade4e832627b4f6', '20000000', '2018-09-10', './userdata/profile_pictures/20000000.jpg', 0);

-- --------------------------------------------------------

--
-- Structure de la table `etu_grps`
--

DROP TABLE IF EXISTS `etu_grps`;
CREATE TABLE IF NOT EXISTS `etu_grps` (
  `id_etu` int(11) NOT NULL,
  `id_grpe` int(11) NOT NULL,
  UNIQUE KEY `index_etuGrp` (`id_etu`,`id_grpe`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `etu_grps`
--

INSERT INTO `etu_grps` (`id_etu`, `id_grpe`) VALUES
(1, 1),
(1, 9),
(2, 1),
(2, 9),
(3, 2),
(3, 9),
(4, 4),
(4, 10),
(5, 5),
(5, 11),
(6, 6),
(6, 11),
(7, 6),
(7, 11),
(8, 7),
(8, 12),
(9, 8),
(9, 12),
(10, 4),
(10, 10);

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

DROP TABLE IF EXISTS `formation`;
CREATE TABLE IF NOT EXISTS `formation` (
  `id_form` int(4) NOT NULL AUTO_INCREMENT,
  `nom` text COLLATE utf8_bin NOT NULL,
  `label` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_form`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `formation`
--

INSERT INTO `formation` (`id_form`, `nom`, `label`) VALUES
(1, 'DUT INFO - formation initiale', 'DUT INFO'),
(3, 'Licence PRO Métier de l\'informatique \r\nparcours IOT - apprentissage', 'LPIOT'),
(4, 'Licence PRO Métier de l\'informatique \r\nparcours ERP - formation apprentissage', 'LPERP_A'),
(5, 'Licence PRO Métier de l\'informatique \r\nparcours ERP - formation initiale', 'LPERP_I');

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

DROP TABLE IF EXISTS `groupe`;
CREATE TABLE IF NOT EXISTS `groupe` (
  `id_grpe` int(11) NOT NULL AUTO_INCREMENT,
  `id_promo` int(11) NOT NULL,
  `type_grpe` text COLLATE utf8_bin NOT NULL,
  `num_grpe` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_grpe`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `groupe`
--

INSERT INTO `groupe` (`id_grpe`, `id_promo`, `type_grpe`, `num_grpe`) VALUES
(1, 1, 'mono', '201'),
(2, 1, 'mono', '202'),
(3, 1, 'mono', '203'),
(4, 1, 'mono', '204'),
(5, 1, 'mono', '205'),
(6, 1, 'mono', '206'),
(7, 1, 'mono', '207'),
(8, 1, 'mono', '208'),
(9, 1, 'bi', '201-202'),
(10, 1, 'bi', '203-204'),
(11, 1, 'bi', '205-206'),
(12, 1, 'bi', '207-208'),
(13, 1, 'promo', 'promo'),
(14, 1, '1/2promo', '1/2'),
(15, 1, '1/2promo', '2/2');

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

DROP TABLE IF EXISTS `matiere`;
CREATE TABLE IF NOT EXISTS `matiere` (
  `id_mat` int(4) NOT NULL AUTO_INCREMENT,
  `id_ue` int(11) NOT NULL,
  `id_mod` int(4) NOT NULL,
  `id_period` int(11) NOT NULL,
  `nom` text COLLATE utf8_bin NOT NULL,
  `label` text COLLATE utf8_bin NOT NULL,
  `couleur` text COLLATE utf8_bin NOT NULL,
  `themes` text COLLATE utf8_bin NOT NULL,
  `typeEns` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_mat`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `matiere`
--

INSERT INTO `matiere` (`id_mat`, `id_ue`, `id_mod`, `id_period`, `nom`, `label`, `couleur`, `themes`, `typeEns`) VALUES
(1, 1, 1, 1, 'Programmation WEB côté Serveur (M3104)', 'PWEB MVC', '#1DE124', '{\n\"web\":\"Client Serveur HTTP\", \n\"pattern\":\"MVC\",\n\"Langage\":\"PHP\"\n}\n', '{\n\"A\":[\"promo\", 1.5],\n\'M\':[\"bi\",3]\n}'),
(2, 1, 1, 2, 'Programmation WEB côté Serveur - JAVA (M3104-2)', 'PWEB JAVA', '', '{\n\"Systeme WEB\":\"Client Serveur HTTP\", \n\"Langage\":\"JAVA\"\n}\n', '{\n\"A\":[\"promo\",1.5],\n\"M\":[\"bi\",3]\n}'),
(9, 1, 1, 1, 'Algorithmique avancée', 'AAV', '', '{\"complexite\": \"tri\"}', '{\n\"A\":[\"promo\",1.5],\n\"T\":[\"bi\",1.5],\n\"M\":[\"mono\",1.5]\n}'),
(14, 2, 1, 1, 'Anglais', 'ANG', '', '{\"theme\" : \"vocabulaire\"}', '{\"M\":[\"mono\",1.5]}'),
(15, 2, 1, 1, 'Expression Communication', 'EC', '', '{\n\"expression\":\"écriture de rapport de stage\",\n\"communication\":\"soutenance orale\"\n}', '{\n\"T\":[\"bi\",1.5]\n}'),
(16, 1, 1, 1, 'Modélisation Objet', 'MO', '', '{\"modele\" : \"UML\"}', '{\"A\":[\"promo\",1.5],\n\'M\':[\"bi\",3]\n}'),
(17, 2, 1, 1, 'PROBA STAT', 'PS', '', '{\"proba\": [\"espace\"], \n\"stat\": [\"régression\"]}', '{ \"A\":[\"promo\",1.5], \"M\":[\"bi\",3] }');

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `id_msg` int(11) NOT NULL AUTO_INCREMENT,
  `typeMsg` int(11) NOT NULL,
  `id_src` int(11) NOT NULL,
  `id_dest` int(11) NOT NULL,
  `contenu` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_msg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `prof`
--

DROP TABLE IF EXISTS `prof`;
CREATE TABLE IF NOT EXISTS `prof` (
  `id_prof` int(11) NOT NULL AUTO_INCREMENT,
  `genre` text COLLATE utf8_bin NOT NULL,
  `nom` text COLLATE utf8_bin NOT NULL,
  `prenom` text COLLATE utf8_bin NOT NULL,
  `email` text COLLATE utf8_bin NOT NULL,
  `label` text COLLATE utf8_bin NOT NULL,
  `login_prof` text COLLATE utf8_bin NOT NULL,
  `pass_prof` text COLLATE utf8_bin NOT NULL,
  `date_prof` date NOT NULL,
  `urlPhoto` text COLLATE utf8_bin NOT NULL,
  `couleur` text COLLATE utf8_bin NOT NULL,
  `bConnect` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_prof`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `prof`
--

INSERT INTO `prof` (`id_prof`, `genre`, `nom`, `prenom`, `email`, `label`, `login_prof`, `pass_prof`, `date_prof`, `urlPhoto`, `couleur`, `bConnect`) VALUES
(2, 'M', 'Ilié', 'Jean-Michel', 'jmilie@parisdescartes.fr', 'JMI', 'jmilie', '098f6bcd4621d373cade4e832627b4f6', '2018-09-12', './userdata/profile_pictures/.png', '#aab6fe', 0),
(3, 'M', 'Foughali', 'Karim', 'kfoughali@gmail.com', 'KF', 'kfoughali', '098f6bcd4621d373cade4e832627b4f6', '2018-01-12', '', '#0002E1', 0),
(4, 'M', 'Kurtz', 'Camille', 'ckurtz@parisdescartes.fr', 'CK', 'ckurtz', '098f6bcd4621d373cade4e832627b4f6', '2018-09-09', '', '#c5e1a5', 0),
(5, 'M', 'Sortais', 'Michel', 'msortais@parisdescartes.fr', 'MS', 'msortais', '098f6bcd4621d373cade4e832627b4f6', '2018-09-10', '', '#ffffcf', 0),
(6, 'M', 'Ouziri', 'Mourad', 'mouziri@parisdescartes.fr', 'MO', 'mouziri', '098f6bcd4621d373cade4e832627b4f6', '2018-09-10', '', '#ffab91', 0),
(7, 'Mme', 'Dirani', 'Hélène', 'hdirani@parisdescartes.fr', 'HD', 'hdirani', '098f6bcd4621d373cade4e832627b4f6', '2018-09-10', '', '', 0),
(8, 'M', 'Poitrenaud', 'Denis', 'dpoitrenaud', 'DP', 'dpoitrenaud', '098f6bcd4621d373cade4e832627b4f6', '2018-09-10', '', '', 0),
(9, 'Mme', 'Marechal', 'Laurence', 'lmarechal@parisdescartes.fr', 'LM', 'lmarechal', '098f6bcd4621d373cade4e832627b4f6', '2018-09-10', '', '', 0),
(10, 'M', 'Oliviero', 'Philippe', 'poliviero@parisdescartes.fr', 'PhO', 'poliviero', '098f6bcd4621d373cade4e832627b4f6', '2018-09-10', '', '', 0),
(255, 'M', 'test', 'test', 'test@test.com', 'test', 'test', '098f6bcd4621d373cade4e832627b4f6', '2018-10-02', '', 'test', 0);

-- --------------------------------------------------------

--
-- Structure de la table `prof_roles`
--

DROP TABLE IF EXISTS `prof_roles`;
CREATE TABLE IF NOT EXISTS `prof_roles` (
  `id_role` int(11) NOT NULL AUTO_INCREMENT,
  `objet` text COLLATE utf8_bin NOT NULL,
  `id_objet` int(11) NOT NULL,
  `bResp` tinyint(4) NOT NULL DEFAULT '0',
  `id_prof` int(11) NOT NULL,
  `label` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `prof_roles`
--

INSERT INTO `prof_roles` (`id_role`, `objet`, `id_objet`, `bResp`, `id_prof`, `label`) VALUES
(1, 'edt', 0, 1, 8, 'Responsable EDT - DUT 1 DUT 2'),
(6, 'matiere', 1, 1, 2, 'Responsable PWEB'),
(7, 'matiere', 9, 1, 4, 'Responsable AAV'),
(8, 'matiere', 14, 1, 9, 'Responsable ANG'),
(9, 'matiere', 10, 1, 7, 'Responsable EC'),
(10, 'matiere', 16, 1, 6, 'Responsable MO'),
(12, 'matiere', 17, 1, 1, 'Responsable PROBA STAT'),
(13, 'matiere', 1, 0, 1, 'Intervenant PWEB'),
(14, 'matiere', 1, 0, 3, 'Intervenant PWEB'),
(15, 'matiere', 9, 0, 4, 'Intervenant AAV'),
(16, 'matiere', 17, 0, 5, 'Intervenant PROBA STAT'),
(17, 'matiere', 14, 0, 9, 'Intervenant ANG'),
(18, 'matiere', 16, 0, 6, 'Intervenant MO'),
(19, 'matiere', 15, 0, 10, 'Intervenant EC');

-- --------------------------------------------------------

--
-- Structure de la table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
CREATE TABLE IF NOT EXISTS `promotion` (
  `id_promo` tinyint(4) NOT NULL,
  `id_form` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `label` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_promo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `promotion`
--

INSERT INTO `promotion` (`id_promo`, `id_form`, `num`, `label`) VALUES
(1, 1, 2018, 'INFOA1 2018'),
(2, 1, 2018, 'INFOA2 2018'),
(3, 2, 2018, 'LPIOT 2018'),
(4, 3, 2018, 'LPERP-A 2018'),
(5, 4, 2018, 'LPERP-I 2018');

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

DROP TABLE IF EXISTS `salle`;
CREATE TABLE IF NOT EXISTS `salle` (
  `id_salle` int(11) NOT NULL AUTO_INCREMENT,
  `nom` text COLLATE utf8_bin NOT NULL,
  `label` text COLLATE utf8_bin NOT NULL,
  `batiment` text COLLATE utf8_bin NOT NULL,
  `type_salle` text COLLATE utf8_bin NOT NULL,
  `nb_postes` int(11) NOT NULL,
  PRIMARY KEY (`id_salle`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `salle`
--

INSERT INTO `salle` (`id_salle`, `nom`, `label`, `batiment`, `type_salle`, `nb_postes`) VALUES
(1, 'B1-12', 'B1-12', 'Blériot\niut-Paris', 'M', 25),
(2, 'IOT WIFI 1', 'B2-15', 'Blériot\nIUT-Paris', 'M', 25),
(3, 'V1-11', 'V1-11', 'Versailles-\nIUT Paris', 'M', 30),
(4, 'Daumart', 'A-1', 'iut-paris', 'A', 200),
(5, 'IOT WIFI 2', 'V1-11', 'iut-Paris', 'M', 30),
(6, 'Olympe de Gouge', 'A-2', 'iut-paris', 'A', 200),
(7, 'B2-12', 'B2-12', 'Blériot\r\niut-Paris', 'T', 22),
(8, 'B2-17', 'B2-17', 'Blériot\r\niut-Paris', 'T', 22),
(9, 'B0-13', 'B0-13', 'Blériot\r\niut-Paris', 'M', 22),
(10, 'B1-17', 'B1-17', 'Blériot\r\niut-Paris', 'M', 22),
(11, 'B0-3', 'B0-3', 'Blériot\r\niut-Paris', 'M', 22);

-- --------------------------------------------------------

--
-- Structure de la table `uemodule`
--

DROP TABLE IF EXISTS `uemodule`;
CREATE TABLE IF NOT EXISTS `uemodule` (
  `id_uemod` int(11) NOT NULL AUTO_INCREMENT,
  `id_form` int(11) NOT NULL,
  `classif` text COLLATE utf8_bin NOT NULL,
  `nom` text COLLATE utf8_bin NOT NULL,
  `label` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_uemod`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `uemodule`
--

INSERT INTO `uemodule` (`id_uemod`, `id_form`, `classif`, `nom`, `label`) VALUES
(1, 1, 'ue', 'Informatique avancée', '31'),
(2, 1, 'ue', 'Culture scientifique, sociale et humaine avancées', '32'),
(3, 1, 'module', 'Programmation Web côté serveur', '3104'),
(4, 1, 'module', 'Algorithmique avancée', '3103'),
(5, 1, 'module', 'Conception et programmation objet avancées', '3105'),
(6, 1, 'module', 'Probabilités et statistiques', '3201'),
(7, 1, 'module', 'Expression-Communication – Communication\r\nprofessionnelle', '3205'),
(8, 1, 'module', 'Collaborer en anglais', '3206');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
