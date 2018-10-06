-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 03 Octobre 2018 à 12:09
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `pweb18`
--

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

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
  `bConnect` tinyint(1) NOT NULL,
  `bEDT` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_etu`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=11 ;

--
-- Contenu de la table `etudiant`
--

INSERT INTO `etudiant` (`id_etu`, `id_promo`, `id_grpe`, `genre`, `nom`, `prenom`, `email`, `login_etu`, `pass_etu`, `matricule`, `date_etu`, `bConnect`, `bEDT`) VALUES
(1, 1, 1, 'Melle', 'Dahmani', 'Djaouida', 'ddahmani@parisdescartes.fr', 'ddahmani', '*B21D70FFCE8B3C8622A4C886A7A2F5C213912954', '12345678', '2018-09-10', 0, 0),
(2, 1, 1, 'M', 'Karl', 'Bernard', 'bernard.karl@parisdescartes.fr', 'bkarl', '*B64D2DC5BB06AEAD6D5F0DBC01F6FB8D6AC6CA00', '40004000', '2018-09-10', 0, 0),
(3, 1, 2, 'Melle', 'Mozart', 'lea', 'lea.mozart@parisdescartes.fr', 'lmozart', '*3D0D46868FDDF27F76B5F10DE31DB98318493F0D', '10001000', '2018-09-10', 0, 0),
(4, 1, 3, 'M', 'Vincens', 'Bernard', 'bernard.vincens@parisdescartes.fr', 'bvincens', 'dc58ed24df48496f0a04ae624abe7286e61f0299', '12345678', '2018-09-10', 0, 0),
(5, 1, 5, 'M', 'Lauzanne', 'Alain', 'alauzanne@parisdescartes.fr', 'alauzanne', 'cba74be83fd19dd61dee1ec1994c09e530e1678a', '22345678', '2018-09-10', 1, 0),
(6, 1, 6, 'Melle', 'Rey', 'Annie', 'arey@parisdecartes.fr', 'arey', 'b65f2b9a5ca896d9b91ac617950f876fe9020017', '32345678', '2018-09-10', 0, 0),
(7, 1, 6, 'M', 'Tao', 'minh', 'mtao@parisdescartes.fr', 'mtao', '*9DB4046E7187F79A01021185A9F9BA924149871B', '10001000', '2018-09-10', 0, 0),
(8, 1, 7, 'M', 'Berger', 'Paul', 'pberger@parisdescartes.fr', 'pberger', '*A38C94F5CFA7532683B719FA7B83C04485426A37', '70000000', '2018-09-10', 0, 0),
(9, 1, 8, 'Melle', 'Franceschinis', 'Octavia', 'ofranceschinis', 'ofrance', '*54678C481DA1C66E803E78FDF765195A24B2CD22', '', '2018-09-10', 0, 0),
(10, 1, 2, 'M', 'test', 'test', 'test@', 'test', 'test', '20000', '2018-09-10', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `etu_grps`
--

CREATE TABLE IF NOT EXISTS `etu_grps` (
  `id_etu` int(11) NOT NULL,
  `id_grpe` int(11) NOT NULL,
  UNIQUE KEY `index_etuGrp` (`id_etu`,`id_grpe`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `etu_grps`
--

INSERT INTO `etu_grps` (`id_etu`, `id_grpe`) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 5),
(6, 5),
(7, 6),
(8, 8),
(9, 7),
(10, 2);

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

CREATE TABLE IF NOT EXISTS `formation` (
  `id_form` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nom` text NOT NULL,
  `label` text NOT NULL,
  PRIMARY KEY (`id_form`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `formation`
--

INSERT INTO `formation` (`id_form`, `nom`, `label`) VALUES
(1, 'DUT INFO - formation initiale - 1ère année', 'DUT1'),
(2, 'DUT INFO - formation initiale - 1ère année', 'DUT2'),
(3, 'Licence PRO Métier de l''informatique \r\nparcours IOT - apprentissage', 'LPIOT'),
(4, 'Licence PRO Métier de l''informatique \r\nparcours ERP - formation apprentissage', 'LPERP_A'),
(5, 'Licence PRO Métier de l''informatique \r\nparcours ERP - formation initiale', 'LPERP_I');

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

CREATE TABLE IF NOT EXISTS `groupe` (
  `id_grpe` int(11) NOT NULL AUTO_INCREMENT,
  `type_grpe` text COLLATE utf8_bin NOT NULL,
  `num_grpe` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_grpe`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=16 ;

--
-- Contenu de la table `groupe`
--

INSERT INTO `groupe` (`id_grpe`, `type_grpe`, `num_grpe`) VALUES
(1, 'mono', '201'),
(2, 'mono', '202'),
(3, 'mono', '203'),
(4, 'mono', '204'),
(5, 'mono', '205'),
(6, 'mono', '206'),
(7, 'mono', '207'),
(8, 'mono', '208'),
(9, 'bi', '201-202'),
(10, 'bi', '203-204'),
(11, 'bi', '205-206'),
(12, 'bi', '207-208'),
(13, 'promo', 'promo'),
(14, '1/2promo', '1/2'),
(15, '1/2promo', '2/2');

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

CREATE TABLE IF NOT EXISTS `matiere` (
  `id_mat` int(4) NOT NULL AUTO_INCREMENT,
  `id_form` int(4) NOT NULL,
  `nom` text NOT NULL,
  `label` text NOT NULL,
  `themes` text NOT NULL,
  `typeEns` text NOT NULL,
  `bEDT` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_mat`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Contenu de la table `matiere`
--

INSERT INTO `matiere` (`id_mat`, `id_form`, `nom`, `label`, `themes`, `typeEns`, `bEDT`) VALUES
(1, 1, 'Programmation WEB côté Serveur (M3104)', 'PWEB', '{\n''web'':''Client Serveur HTTP'', \n''pattern'':''MVC'',\n''Langage'':''PHP''\n}\n', '{\n''A'':''promo'',\n''M'':''bi''\n}', 0),
(2, 1, 'Programmation WEB côté Serveur - JAVA (M3104-2)', 'PWEB JAVA', '{\r\n''Systeme WEB'':''Client Serveur HTTP'', \r\n''Langage'':''JAVA''\r\n}\r\n', '{\n''A'':''promo'',\n''M'':''bi''\n}', 0),
(9, 1, 'Algorithmique avancée', 'AAV', '{''proba'': [''espace''], ''stat'': ''régression''}', '{\r\n''A'':''promo'',\r\n''T'':''bi'',\r\n''M'':''mono''\r\n}', 0),
(14, 1, 'Anglais', 'ANG', 'vocabulaire', '{M:mono}', 0),
(15, 1, 'Expression Communication', 'EC', '{\r\n''expression'':''écriture de rapport de stage'',\r\n''communication:''soutenance orale''\r\n}', '{''T'':''bi''\r\n}', 0);

-- --------------------------------------------------------

--
-- Structure de la table `professeur`
--

CREATE TABLE IF NOT EXISTS `professeur` (
  `id_prof` int(11) NOT NULL AUTO_INCREMENT,
  `genre` text COLLATE utf8_bin NOT NULL,
  `nom` text COLLATE utf8_bin NOT NULL,
  `prenom` text COLLATE utf8_bin NOT NULL,
  `email` text COLLATE utf8_bin NOT NULL,
  `label` text COLLATE utf8_bin NOT NULL,
  `login_prof` text COLLATE utf8_bin NOT NULL,
  `pass_prof` text COLLATE utf8_bin NOT NULL,
  `date_prof` date NOT NULL,
  `bConnect` tinyint(1) NOT NULL,
  `bEDT` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_prof`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=13 ;

--
-- Contenu de la table `professeur`
--

INSERT INTO `professeur` (`id_prof`, `genre`, `nom`, `prenom`, `email`, `label`, `login_prof`, `pass_prof`, `date_prof`, `bConnect`, `bEDT`) VALUES
(2, 'M', 'Ilié', 'Jean-Michel', 'jmilie@parisdescartes.fr', 'JMI', 'jmilie', '1f96593fca60f453f71d8b75f4afc17835769762', '2018-09-12', 0, 0),
(3, 'M', 'Foughali', 'Karim', 'kfoughali@gmail.com', 'KF', 'kfoughali', 'ecf66de73808530b5e5dc5462cfd074d085fa89c', '2018-01-12', 0, 0),
(4, 'M', 'Kurtz', 'Camille', 'ckurtz@parisdescartes.fr', 'CK', 'ckurtz', 'ed9b1bd745d9a724280d8374184de26b0718960b', '2018-09-09', 0, 0),
(5, 'M', 'Sortais', 'Michel', 'msortais@parisdescartes.fr', 'MS', 'msortais', '*69358EEA623E244E978C10364CA96398D642E1BE', '2018-09-10', 0, 0),
(6, 'M', 'Ouziri', 'Mourad', 'mouziri@parisdescartes.fr', 'MO', 'mouziri', '*F07FBB4086D1DF19106B375B6E5D7A11BB485C2E', '2018-09-10', 0, 0),
(7, 'Mme', 'Dirani', 'Hélène', 'hdirani@parisdescartes.fr', 'HD', 'hdirani', '*81DD599CAA08EA3C67AB17DD86AB3094216B1EC4', '2018-09-10', 0, 0),
(8, 'M', 'Poitrenaud', 'Denis', 'dpoitrenaud', 'DP', 'dpoitrenaud', '*A6C32F3A9310014F2B06BDCCD1752D9C47A73A38', '2018-09-10', 0, 0),
(9, 'Mme', 'MARECHAL', 'Laurence', 'lmarechal@parisdescartes.fr', 'LM', 'lmarechal', '*0DFC2E234404E6A97CC9456A8DD457521BF77C97', '2018-09-10', 0, 0),
(10, 'M', 'Oliviero', 'Philippe', 'poliviero@parisdescartes.fr', 'PhO', 'poliviero', '*2CED6004642B247385E3DEEF9ECF1D4007AC2492', '2018-09-10', 0, 0),
(11, 'M', 'Bienvenu', 'Julien', 'jbienvenu@parisdescartes.fr', 'JB', 'jbienvenu', '*7F304E7ED5F68993BC99529294E1A22E1DC251DB', '2019-10-09', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `resultat`
--

CREATE TABLE IF NOT EXISTS `resultat` (
  `id_res` int(11) NOT NULL AUTO_INCREMENT,
  `id_test` int(11) NOT NULL,
  `id_etu` int(11) NOT NULL,
  `id_quest` int(11) NOT NULL,
  `id_rep` int(11) NOT NULL,
  PRIMARY KEY (`id_res`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=10 ;

--
-- Contenu de la table `resultat`
--

INSERT INTO `resultat` (`id_res`, `id_test`, `id_etu`, `id_quest`, `id_rep`) VALUES
(1, 1, 1, 2, 4),
(2, 1, 1, 2, 5),
(3, 1, 1, 2, 6),
(4, 1, 2, 2, 6),
(5, 1, 2, 2, 7),
(6, 1, 2, 2, 8),
(7, 1, 5, 2, 4),
(8, 1, 5, 2, 5),
(9, 1, 5, 2, 6);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
