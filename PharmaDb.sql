CREATE DATABASE pharmacies;

-- Objet utilisateur et attributs

CREATE TABLE `utilisateur` (
  `id_Utilisateur` int PRIMARY KEY AUTO_INCREMENT,
  `nom` varchar(150) NOT NULL,
  `adresse` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL
) ENGINE=Innodb DEFAULT CHARSET=utf8;


-- Objet  pharmacie de  garde à Port-Gentil et attributs

CREATE TABLE `pharmgard` (
  `id_pharmgard` int PRIMARY KEY AUTO_INCREMENT,
  `nom_pharmgard` varchar(25) NOT NULL,
  `telephone` varchar(10) NOT NULL
) ENGINE=Innodb DEFAULT CHARSET=utf8;


-- Objet  pharmacie sollicitée et attributs

CREATE TABLE `pharmacies` (
  `id_PharmacieChoisie` int PRIMARY KEY AUTO_INCREMENT,
  `id_pharmgard` int(9) NOT NULL,
  `PharmacieChoisie` varchar(300) NOT NULL,
  `produits` varchar(300) NOT NULL,
  FOREIGN KEY (`id_pharmgard`) REFERENCES pharmgard(`id_pharmgard`),
  KEY `produits`(`produits`)
) ENGINE=Innodb DEFAULT CHARSET=utf8;

-- Objet  produits disponible et attributs

CREATE TABLE `produits` (
  `id_produits` int PRIMARY KEY AUTO_INCREMENT,
   `propriétés`  varchar (20) NOT NULL,
   `produits`  varchar (20) NOT NULL,
   `description`  varchar (20) NOT NULL,
   `prix` float NOT NULL, 
   FOREIGN KEY (`produits`) REFERENCES pharmacies(`produits`)
) ENGINE=Innodb DEFAULT CHARSET=utf8;

-- Objet  requête directe vers la pharmacie partenaire

CREATE TABLE `requete` (
  `id_requete` int PRIMARY KEY AUTO_INCREMENT,
  `id_Utilisateur` int(9) NOT NULL,
  `requete` varchar(10) NOT NULL,
  FOREIGN KEY (`id_Utilisateur`) REFERENCES utilisateur(`id_Utilisateur`)
) ENGINE=Innodb DEFAULT CHARSET=utf8;


-- Objet  redirection directe vers les services en ligne de la pharmacie partenaire

CREATE TABLE `redirection` (
  `id_redirection` int PRIMARY KEY AUTO_INCREMENT,
  `nom_pharmacie` varchar(300) NOT NULL,
   `telephone` int(50) NOT NULL,
  `nom_application` varchar(50) NOT NULL,
  `id_Utilisateur` int(50) NOT NULL,
   FOREIGN KEY (`id_Utilisateur`) REFERENCES utilisateur(`id_Utilisateur`)
) ENGINE=Innodb DEFAULT CHARSET=utf8;

-- insertion des valeurs dans la table produits

INSERT INTO `produits` (`id_produits`, `propriétés`, `produits`, `description`,`prix`,) VALUES
(NULL, 'Propriété', 'Doliprane 1000mg',  'xjkllllmmm',  '4500 Fcfa')
(NULL, 'Propriété', 'Doliprane 1000mg',  'xjkllllmmm',  '4500 Fcfa')
(NULL, 'Propriété', 'Doliprane 1000mg',  'xjkllllmmm',  '4500 Fcfa')
(NULL, 'Propriété', 'Doliprane 1000mg',  'xjkllllmmm',  '4500 Fcfa')

-- insertion des valeurs dans la table pharmacie de garde


INSERT INTO `` (`id_Pharmgard`, `nom_pharmgard`, `téléphone`) VALUES
(NULL, 'Pharmacie Centrale','066232114')
(NULL, 'Pharmacie Centrale','066232114')
(NULL, 'Pharmacie Centrale','066232114')







