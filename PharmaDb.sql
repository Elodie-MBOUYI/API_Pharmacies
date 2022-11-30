CREATE DATABASE pharmacy;

-- La table utilisateur et attributs

CREATE TABLE `utilisateur` (
  `id_Utilisateur` int PRIMARY KEY AUTO_INCREMENT,
  `nom` varchar(150) NOT NULL,
  `telephone` varchar(45) NOT NULL,
  `message` varchar(145) NOT NULL
) ENGINE=Innodb DEFAULT CHARSET=utf8;

-- La table pharmacie centrale et attributs

CREATE TABLE `pharm_centrale` (
  `id_pharmacie` int PRIMARY KEY AUTO_INCREMENT,
  `id_utilisateur` int(25) NOT NULL,
  `id_produits` int(25) NOT NULL,
   `catégorie`  varchar (20) NOT NULL,
   `nom_produits`  varchar (20) NOT NULL,
   `description`  varchar (20) NOT NULL,
   `prix` float NOT NULL, 
   FOREIGN KEY (`id_Utilisateur`) REFERENCES utilisateur(`id_Utilisateur`)
) ENGINE=Innodb DEFAULT CHARSET=utf8;

-- La table de la liste des pharmacies de Port-Gentil et attributs

CREATE TABLE `pharmacies` (
  `id_pharmacies` int PRIMARY KEY AUTO_INCREMENT,
  `id_pharmacie` int(9) NOT NULL,
  `nom_pharmacie` varchar(300) NOT NULL,
  `adresse` varchar(300) NOT NULL,
  `tel_pharmacie` varchar(145) NOT NULL,
   FOREIGN KEY (`id_pharmacie`) REFERENCES pharm_centrale(`id_pharmacie`)
) ENGINE=Innodb DEFAULT CHARSET=utf8;


-- La table des pharmacies de  garde à Port-Gentil et attributs

CREATE TABLE `pharmgard` (
  `id_pharmgard` int PRIMARY KEY AUTO_INCREMENT,
  `id_pharmacies` int(9) NOT NULL,
  `nom_pharmacie` varchar(25) NOT NULL,
  `telephone` varchar(10) NOT NULL,
  FOREIGN KEY (`id_pharmacies`) REFERENCES pharmacies(`id_pharmacies`)
) ENGINE=Innodb DEFAULT CHARSET=utf8;

-- La table de la pharmacie de garde et attributs

CREATE TABLE `pharm_banco` (
  `id_pharmacie` int PRIMARY KEY AUTO_INCREMENT,
  `id_pharmgard` int(25) NOT NULL,
  `id_utilisateur` int(25) NOT NULL,
  `id_produits` int(25) NOT NULL,
   `catégorie`  varchar (20) NOT NULL,
   `nom_produits`  varchar (20) NOT NULL,
   `description`  varchar (20) NOT NULL,
   `prix` float NOT NULL, 
   FOREIGN KEY (`id_pharmgard`) REFERENCES pharmgard(`id_pharmgard`)
) ENGINE=Innodb DEFAULT CHARSET=utf8;


-- insertion des valeurs dans la table produits

INSERT INTO `pharmgard` (`id_pharmgard`, `id_pharmacies`, `nom_pharmacie`, `telephone`) VALUES
(NULL, '1', 'Pharmacie Banco',  '00123245'),
(NULL, '2', 'Pharmacie Radoca',  '00123245'),
(NULL, '3', 'Pharmacie Centrale',  '00123245'),
(NULL, '4', 'Pharmacie Andréa',  '00123245')


-- insertion des valeurs dans la table pharmacie de garde


INSERT INTO `pharmacies` (`id_Pharmacies`, `id_Pharmacie`, `nom_pharmacie`,`adresse`,`tel_pharmacie`) VALUES
(NULL, '1','bqnco','lqlaset','066232114')
(NULL, '1','bqnco','lqlaset','066232114')
(NULL, '1','bqnco','lqlaset','066232114')





