-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Serveur: 127.0.0.1
-- Généré le : Jeu 03 Août 2023 à 12:38
-- Version du serveur: 5.5.10
-- Version de PHP: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `gest_school`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `username` varchar(30) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `admin`
--


-- --------------------------------------------------------

--
-- Structure de la table `bulletin`
--

CREATE TABLE IF NOT EXISTS `bulletin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note` int(10) NOT NULL,
  `idEleve` int(11) NOT NULL,
  `idclasse` int(11) NOT NULL,
  `idMatiere` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idclasse` (`idclasse`),
  KEY `idMatiere` (`idMatiere`),
  KEY `idEleve` (`idEleve`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `bulletin`
--


-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

CREATE TABLE IF NOT EXISTS `classe` (
  `idclasse` int(11) NOT NULL AUTO_INCREMENT,
  `nomclasse` varchar(50) NOT NULL,
  `capacite` int(30) NOT NULL,
  `scolarite` int(30) NOT NULL,
  `idEnseignant` int(11) NOT NULL,
  PRIMARY KEY (`idclasse`),
  KEY `idEnseignant` (`idEnseignant`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `classe`
--


-- --------------------------------------------------------

--
-- Structure de la table `eleves`
--

CREATE TABLE IF NOT EXISTS `eleves` (
  `idEleve` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `sexe` varchar(50) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `date_de_naissance` date NOT NULL,
  `lieu_de_naissance` varchar(50) NOT NULL,
  `nom_tuteur` varchar(50) NOT NULL,
  `tel_tuteur` int(30) NOT NULL,
  PRIMARY KEY (`idEleve`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `eleves`
--

INSERT INTO `eleves` (`idEleve`, `nom`, `prenom`, `sexe`, `adresse`, `date_de_naissance`, `lieu_de_naissance`, `nom_tuteur`, `tel_tuteur`) VALUES
(1, 'TINE', 'Adama', '', 'Ngollar', '2017-05-08', 'Ngollar', 'Astou SENE', 775663906),
(2, 'FAYE', 'Aissatou', '', 'Grand Yoff', '2018-05-02', 'Dakar', 'Mame Thierno FAYE', 776833432);

-- --------------------------------------------------------

--
-- Structure de la table `emargement`
--

CREATE TABLE IF NOT EXISTS `emargement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(70) NOT NULL,
  `idEnseignant` int(11) NOT NULL,
  `idclasse` int(11) NOT NULL,
  `idMatiere` int(11) NOT NULL,
  `date` date NOT NULL,
  `heure` time NOT NULL,
  `tremestre` varchar(20) NOT NULL,
  `anneScolaire` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idMatiere` (`idMatiere`),
  KEY `idclasse` (`idclasse`),
  KEY `idEnseignant` (`idEnseignant`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `emargement`
--


-- --------------------------------------------------------

--
-- Structure de la table `emploidutemps`
--

CREATE TABLE IF NOT EXISTS `emploidutemps` (
  `jour` date NOT NULL,
  `hdebut` time NOT NULL,
  `hfin` time NOT NULL,
  `idMatiere` int(11) NOT NULL,
  `idSalle` int(11) NOT NULL,
  `idEnseignant` int(11) NOT NULL,
  PRIMARY KEY (`jour`),
  KEY `idMatiere` (`idMatiere`),
  KEY `idSalle` (`idSalle`),
  KEY `idEnseignant` (`idEnseignant`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `emploidutemps`
--


-- --------------------------------------------------------

--
-- Structure de la table `enseignant`
--

CREATE TABLE IF NOT EXISTS `enseignant` (
  `idEnseignant` int(11) NOT NULL AUTO_INCREMENT,
  `nomEnseignant` varchar(50) NOT NULL,
  `prenomEnseignant` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tel` int(20) NOT NULL,
  `nationnalite` varchar(50) NOT NULL,
  PRIMARY KEY (`idEnseignant`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `enseignant`
--


-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

CREATE TABLE IF NOT EXISTS `matiere` (
  `idMatiere` int(11) NOT NULL AUTO_INCREMENT,
  `nommatiere` varchar(50) NOT NULL,
  `volumeHoraire` time NOT NULL,
  `idclasse` int(11) NOT NULL,
  PRIMARY KEY (`idMatiere`),
  KEY `idclasse` (`idclasse`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `matiere`
--


-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

CREATE TABLE IF NOT EXISTS `salle` (
  `idSalle` int(11) NOT NULL AUTO_INCREMENT,
  `nomSalle` varchar(50) NOT NULL,
  `capacite` int(11) NOT NULL,
  `idclasse` int(11) NOT NULL,
  PRIMARY KEY (`idSalle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `salle`
--


-- --------------------------------------------------------

--
-- Structure de la table `scolarite`
--

CREATE TABLE IF NOT EXISTS `scolarite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modePaiement` varchar(50) NOT NULL,
  `montantPaye` int(50) NOT NULL,
  `montantRestant` int(50) NOT NULL,
  `etatScolaire` varchar(50) NOT NULL,
  `idclasse` int(11) NOT NULL,
  `idEleve` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idEleve` (`idEleve`),
  KEY `idclasse` (`idclasse`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `scolarite`
--


--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `bulletin`
--
ALTER TABLE `bulletin`
  ADD CONSTRAINT `bulletin_ibfk_1` FOREIGN KEY (`idclasse`) REFERENCES `classe` (`idclasse`),
  ADD CONSTRAINT `bulletin_ibfk_2` FOREIGN KEY (`idMatiere`) REFERENCES `matiere` (`idMatiere`),
  ADD CONSTRAINT `bulletin_ibfk_3` FOREIGN KEY (`idEleve`) REFERENCES `eleves` (`idEleve`);

--
-- Contraintes pour la table `classe`
--
ALTER TABLE `classe`
  ADD CONSTRAINT `classe_ibfk_1` FOREIGN KEY (`idEnseignant`) REFERENCES `enseignant` (`idEnseignant`);

--
-- Contraintes pour la table `emargement`
--
ALTER TABLE `emargement`
  ADD CONSTRAINT `emargement_ibfk_1` FOREIGN KEY (`idMatiere`) REFERENCES `matiere` (`idMatiere`),
  ADD CONSTRAINT `emargement_ibfk_2` FOREIGN KEY (`idclasse`) REFERENCES `classe` (`idclasse`),
  ADD CONSTRAINT `emargement_ibfk_3` FOREIGN KEY (`idEnseignant`) REFERENCES `enseignant` (`idEnseignant`);

--
-- Contraintes pour la table `emploidutemps`
--
ALTER TABLE `emploidutemps`
  ADD CONSTRAINT `emploidutemps_ibfk_1` FOREIGN KEY (`idMatiere`) REFERENCES `gestionschool`.`matiere` (`idMatiere`),
  ADD CONSTRAINT `emploidutemps_ibfk_10` FOREIGN KEY (`idMatiere`) REFERENCES `gestionschool`.`matiere` (`idMatiere`),
  ADD CONSTRAINT `emploidutemps_ibfk_11` FOREIGN KEY (`idSalle`) REFERENCES `gestionschool`.`salle` (`idSalle`),
  ADD CONSTRAINT `emploidutemps_ibfk_12` FOREIGN KEY (`idEnseignant`) REFERENCES `gestionschool`.`enseignant` (`idEnseignant`),
  ADD CONSTRAINT `emploidutemps_ibfk_13` FOREIGN KEY (`idMatiere`) REFERENCES `gestionschool`.`matiere` (`idMatiere`),
  ADD CONSTRAINT `emploidutemps_ibfk_14` FOREIGN KEY (`idSalle`) REFERENCES `gestionschool`.`salle` (`idSalle`),
  ADD CONSTRAINT `emploidutemps_ibfk_15` FOREIGN KEY (`idEnseignant`) REFERENCES `gestionschool`.`enseignant` (`idEnseignant`),
  ADD CONSTRAINT `emploidutemps_ibfk_16` FOREIGN KEY (`idMatiere`) REFERENCES `gestionschool`.`matiere` (`idMatiere`),
  ADD CONSTRAINT `emploidutemps_ibfk_17` FOREIGN KEY (`idSalle`) REFERENCES `gestionschool`.`salle` (`idSalle`),
  ADD CONSTRAINT `emploidutemps_ibfk_18` FOREIGN KEY (`idEnseignant`) REFERENCES `gestionschool`.`enseignant` (`idEnseignant`),
  ADD CONSTRAINT `emploidutemps_ibfk_19` FOREIGN KEY (`idMatiere`) REFERENCES `gestionschool`.`matiere` (`idMatiere`),
  ADD CONSTRAINT `emploidutemps_ibfk_2` FOREIGN KEY (`idSalle`) REFERENCES `gestionschool`.`salle` (`idSalle`),
  ADD CONSTRAINT `emploidutemps_ibfk_20` FOREIGN KEY (`idSalle`) REFERENCES `gestionschool`.`salle` (`idSalle`),
  ADD CONSTRAINT `emploidutemps_ibfk_21` FOREIGN KEY (`idEnseignant`) REFERENCES `gestionschool`.`enseignant` (`idEnseignant`),
  ADD CONSTRAINT `emploidutemps_ibfk_22` FOREIGN KEY (`idMatiere`) REFERENCES `gestionschool`.`matiere` (`idMatiere`),
  ADD CONSTRAINT `emploidutemps_ibfk_23` FOREIGN KEY (`idSalle`) REFERENCES `gestionschool`.`salle` (`idSalle`),
  ADD CONSTRAINT `emploidutemps_ibfk_24` FOREIGN KEY (`idEnseignant`) REFERENCES `gestionschool`.`enseignant` (`idEnseignant`),
  ADD CONSTRAINT `emploidutemps_ibfk_25` FOREIGN KEY (`idMatiere`) REFERENCES `gestionschool`.`matiere` (`idMatiere`),
  ADD CONSTRAINT `emploidutemps_ibfk_26` FOREIGN KEY (`idSalle`) REFERENCES `gestionschool`.`salle` (`idSalle`),
  ADD CONSTRAINT `emploidutemps_ibfk_27` FOREIGN KEY (`idEnseignant`) REFERENCES `gestionschool`.`enseignant` (`idEnseignant`),
  ADD CONSTRAINT `emploidutemps_ibfk_28` FOREIGN KEY (`idMatiere`) REFERENCES `matiere` (`idMatiere`),
  ADD CONSTRAINT `emploidutemps_ibfk_29` FOREIGN KEY (`idSalle`) REFERENCES `salle` (`idSalle`),
  ADD CONSTRAINT `emploidutemps_ibfk_3` FOREIGN KEY (`idEnseignant`) REFERENCES `gestionschool`.`enseignant` (`idEnseignant`),
  ADD CONSTRAINT `emploidutemps_ibfk_30` FOREIGN KEY (`idEnseignant`) REFERENCES `enseignant` (`idEnseignant`),
  ADD CONSTRAINT `emploidutemps_ibfk_4` FOREIGN KEY (`idMatiere`) REFERENCES `gestionschool`.`matiere` (`idMatiere`),
  ADD CONSTRAINT `emploidutemps_ibfk_5` FOREIGN KEY (`idSalle`) REFERENCES `gestionschool`.`salle` (`idSalle`),
  ADD CONSTRAINT `emploidutemps_ibfk_6` FOREIGN KEY (`idEnseignant`) REFERENCES `gestionschool`.`enseignant` (`idEnseignant`),
  ADD CONSTRAINT `emploidutemps_ibfk_7` FOREIGN KEY (`idMatiere`) REFERENCES `gestionschool`.`matiere` (`idMatiere`),
  ADD CONSTRAINT `emploidutemps_ibfk_8` FOREIGN KEY (`idSalle`) REFERENCES `gestionschool`.`salle` (`idSalle`),
  ADD CONSTRAINT `emploidutemps_ibfk_9` FOREIGN KEY (`idEnseignant`) REFERENCES `gestionschool`.`enseignant` (`idEnseignant`);

--
-- Contraintes pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD CONSTRAINT `matiere_ibfk_1` FOREIGN KEY (`idclasse`) REFERENCES `gestionschool`.`classe` (`idclasse`);

--
-- Contraintes pour la table `scolarite`
--
ALTER TABLE `scolarite`
  ADD CONSTRAINT `scolarite_ibfk_1` FOREIGN KEY (`idclasse`) REFERENCES `classe` (`idclasse`),
  ADD CONSTRAINT `scolarite_ibfk_2` FOREIGN KEY (`idclasse`) REFERENCES `classe` (`idclasse`),
  ADD CONSTRAINT `scolarite_ibfk_3` FOREIGN KEY (`idEleve`) REFERENCES `eleves` (`idEleve`),
  ADD CONSTRAINT `scolarite_ibfk_4` FOREIGN KEY (`idclasse`) REFERENCES `classe` (`idclasse`);
