-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 07 août 2023 à 13:12
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestschool`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `USERNAME` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `EMAIL` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TEL` int DEFAULT NULL,
  `PASSWORD` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`USERNAME`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `bulletin`
--

DROP TABLE IF EXISTS `bulletin`;
CREATE TABLE IF NOT EXISTS `bulletin` (
  `IDBULLETIN` int NOT NULL AUTO_INCREMENT,
  `IDELEVE_BUL` int NOT NULL,
  `ANNEESCOLAIRE` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TRIMESTRE` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`IDBULLETIN`),
  KEY `IDELEVE_BUL` (`IDELEVE_BUL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

DROP TABLE IF EXISTS `classe`;
CREATE TABLE IF NOT EXISTS `classe` (
  `IDCLASSE` int NOT NULL AUTO_INCREMENT,
  `ID_SALLE` int NOT NULL,
  `NOMCLASSE` char(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NIVEAU` char(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ANNEACCADEMIQUE` char(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EFFECTIF` smallint DEFAULT NULL,
  PRIMARY KEY (`IDCLASSE`),
  KEY `ID_SALLE` (`ID_SALLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `detailsbulletin`
--

DROP TABLE IF EXISTS `detailsbulletin`;
CREATE TABLE IF NOT EXISTS `detailsbulletin` (
  `NUMERODETAILS` int NOT NULL AUTO_INCREMENT,
  `ID_BULLETIN` int NOT NULL,
  `NOTE` int DEFAULT NULL,
  PRIMARY KEY (`NUMERODETAILS`),
  KEY `ID_BULLETIN` (`ID_BULLETIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `eleve`
--

DROP TABLE IF EXISTS `eleve`;
CREATE TABLE IF NOT EXISTS `eleve` (
  `IDELEVE` int NOT NULL AUTO_INCREMENT,
  `MATRICULE` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `NOM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PRENOM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SEXE` char(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DATE_DE_NAISSANCE` date DEFAULT NULL,
  `LIEU_DE_NAISSANCE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ADRESSE` char(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PHOTO` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`IDELEVE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `emargement`
--

DROP TABLE IF EXISTS `emargement`;
CREATE TABLE IF NOT EXISTS `emargement` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_CLASSE` int NOT NULL,
  `ID_ENSEIGNANT` int NOT NULL,
  `ID_MATIERE` int NOT NULL,
  `HEURE` datetime DEFAULT NULL,
  `DATE` datetime DEFAULT NULL,
  `TRIMESTRE` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ANNEE` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_CLASSE` (`ID_CLASSE`,`ID_ENSEIGNANT`,`ID_MATIERE`),
  KEY `ID_ENSEIGNANT` (`ID_ENSEIGNANT`),
  KEY `ID_MATIERE` (`ID_MATIERE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `emploidutemps`
--

DROP TABLE IF EXISTS `emploidutemps`;
CREATE TABLE IF NOT EXISTS `emploidutemps` (
  `NUMEROEDT` int NOT NULL AUTO_INCREMENT,
  `ID_CLASSE_EMPT` int NOT NULL,
  `JOUR` char(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HDEBUT` datetime DEFAULT NULL,
  `HFIN` datetime DEFAULT NULL,
  PRIMARY KEY (`NUMEROEDT`),
  KEY `ID_CLASSE_EMPT` (`ID_CLASSE_EMPT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `enseignant`
--

DROP TABLE IF EXISTS `enseignant`;
CREATE TABLE IF NOT EXISTS `enseignant` (
  `IDENSEIGNANT` int NOT NULL AUTO_INCREMENT,
  `MATRICULE` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `NOMENSEIGNANT` char(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PRENNOMENSEIGNANT` char(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EMAIL` char(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TEL` smallint DEFAULT NULL,
  `NATIONNALITE` char(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PHOTO` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`IDENSEIGNANT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

DROP TABLE IF EXISTS `inscription`;
CREATE TABLE IF NOT EXISTS `inscription` (
  `NUMERO` int NOT NULL AUTO_INCREMENT,
  `IDELEVE_INSC` int NOT NULL,
  `DATE` datetime DEFAULT NULL,
  `MONTANTPAYE` smallint DEFAULT NULL,
  `DETAILS` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`NUMERO`),
  KEY `FK_ASSOCIATION_7` (`IDELEVE_INSC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

DROP TABLE IF EXISTS `matiere`;
CREATE TABLE IF NOT EXISTS `matiere` (
  `IDMATIERE` int NOT NULL AUTO_INCREMENT,
  `LIBELLE` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `COEFFICIENT` smallint DEFAULT NULL,
  `ID_CLASS_MAT` int NOT NULL,
  PRIMARY KEY (`IDMATIERE`),
  KEY `ID_CLASS_MAT` (`ID_CLASS_MAT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `paiementscoloarite`
--

DROP TABLE IF EXISTS `paiementscoloarite`;
CREATE TABLE IF NOT EXISTS `paiementscoloarite` (
  `IDPAIEMENT` int NOT NULL AUTO_INCREMENT,
  `NUMERO_INSC` int NOT NULL,
  `DATEPAIEMENT` datetime DEFAULT NULL,
  `MONTANTPAIEMENT` smallint DEFAULT NULL,
  `MOIS` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MOTIF` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MODEPAIEMENT` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`IDPAIEMENT`),
  KEY `NUMERO_INSC` (`NUMERO_INSC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

DROP TABLE IF EXISTS `salle`;
CREATE TABLE IF NOT EXISTS `salle` (
  `IDSALLE` int NOT NULL AUTO_INCREMENT,
  `NOMSALLE` char(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CAPACITE` smallint DEFAULT NULL,
  PRIMARY KEY (`IDSALLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `bulletin`
--
ALTER TABLE `bulletin`
  ADD CONSTRAINT `bulletin_ibfk_1` FOREIGN KEY (`IDELEVE_BUL`) REFERENCES `eleve` (`IDELEVE`);

--
-- Contraintes pour la table `classe`
--
ALTER TABLE `classe`
  ADD CONSTRAINT `classe_ibfk_1` FOREIGN KEY (`ID_SALLE`) REFERENCES `salle` (`IDSALLE`);

--
-- Contraintes pour la table `detailsbulletin`
--
ALTER TABLE `detailsbulletin`
  ADD CONSTRAINT `detailsbulletin_ibfk_1` FOREIGN KEY (`ID_BULLETIN`) REFERENCES `bulletin` (`IDBULLETIN`);

--
-- Contraintes pour la table `emargement`
--
ALTER TABLE `emargement`
  ADD CONSTRAINT `emargement_ibfk_1` FOREIGN KEY (`ID_ENSEIGNANT`) REFERENCES `enseignant` (`IDENSEIGNANT`),
  ADD CONSTRAINT `emargement_ibfk_2` FOREIGN KEY (`ID_MATIERE`) REFERENCES `matiere` (`IDMATIERE`),
  ADD CONSTRAINT `emargement_ibfk_3` FOREIGN KEY (`ID_CLASSE`) REFERENCES `classe` (`IDCLASSE`);

--
-- Contraintes pour la table `emploidutemps`
--
ALTER TABLE `emploidutemps`
  ADD CONSTRAINT `emploidutemps_ibfk_1` FOREIGN KEY (`ID_CLASSE_EMPT`) REFERENCES `classe` (`IDCLASSE`);

--
-- Contraintes pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD CONSTRAINT `matiere_ibfk_1` FOREIGN KEY (`ID_CLASS_MAT`) REFERENCES `classe` (`IDCLASSE`);

--
-- Contraintes pour la table `paiementscoloarite`
--
ALTER TABLE `paiementscoloarite`
  ADD CONSTRAINT `paiementscoloarite_ibfk_1` FOREIGN KEY (`NUMERO_INSC`) REFERENCES `inscription` (`NUMERO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
