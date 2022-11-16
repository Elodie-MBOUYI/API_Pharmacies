CREATE DATABASE pharmacies;

-- Objet utilisateur

CREATE TABLE `utilisateur` (
  `id_Utilisateur` int PRIMARY KEY  NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(75) NOT NULL,
  `Adresse` int(50) NOT NULL,
) ENGINE=Innodb DEFAULT CHARSET=utf8;

-- Objet liste des pharmacies de Port-Gentil

CREATE TABLE `Pharmacies` (
  `id_Pharmacies` int PRIMARY KEY AUTO_INCREMENT,
  `nom_Pharmacies` int(50) NOT NULL,
  `id_Utilisateur` int(50) NOT NULL,
  FOREIGN KEY (`id_Utilisateur`) REFERENCES utilisateur(`id_Utilisateur`)
) ENGINE=Innodb DEFAULT CHARSET=utf8;

-- Objet pharmacie programée de garde

CREATE TABLE `PharmaGarde` (
  `id_PharmaGarde` int PRIMARY KEY AUTO_INCREMENT,
  `nom_Pharma` int(50) NOT NULL,
  `Adresse` varchar(50) NOT NULL,
  `id_Utilisateur` int(50) NOT NULL,
  `Appel` varchar(50) NOT NULL,
  `What's app` varchar(50) NOT NULL,
  FOREIGN KEY (`id_Utilisateur`) REFERENCES utilisateur(`id_Utilisateur`)
) ENGINE=Innodb DEFAULT CHARSET=utf8;

-- Objet liste des produits pharmaceutiques.Toutes catégories confondues

CREATE TABLE `Produits` (
  `id_Produits` int PRIMARY KEY AUTO_INCREMENT,
  `nom_Produits` int(50) NOT NULL,
  `Catégorie` varchar(50) NOT NULL,
  `Description` varchar(50) NOT NULL,
  `id_Utilisateur` int(50) NOT NULL,
  `Prix` varchar(50) NOT NULL,
  FOREIGN KEY (`id_Utilisateur`) REFERENCES utilisateur(`id_Utilisateur`)
) ENGINE=Innodb DEFAULT CHARSET=utf8;

-- Objet des éventuels commandes des clients

CREATE TABLE `Commandes` (
  `id_Commandes` int PRIMARY KEY AUTO_INCREMENT,
  `id_Produits` int (20) NOT NULL,
  `quantité` int(50) NOT NULL,
  `date_commande` varchar(50) NOT NULL,
  `heure_récupération` varchar(50) NOT NULL,
  `id_Utilisateur` int(50) NOT NULL,
) ENGINE=Innodb DEFAULT CHARSET=utf8;

-- Objet liste d'achats effectués

CREATE TABLE `Achat` (
  `id_Achat` int PRIMARY KEY AUTO_INCREMENT,
  `date_Achat` varchar(50) NOT NULL,
  `id_Utilisateur` int(50) NOT NULL,
  `nom_Produits` varchar(50) NOT NULL,
  `quantité` varchar(50) NOT NULL,
) ENGINE=Innodb DEFAULT CHARSET=utf8;

-- Objet facture

CREATE TABLE `Facture` (
  `id_Facture` int PRIMARY KEY AUTO_INCREMENT,
  `id_Utilisateur` int(50) NOT NULL,
  `id_Achat` varchar(50) NOT NULL,
  `somme` varchar(50) NOT NULL,
) ENGINE=Innodb DEFAULT CHARSET=utf8;

-- Objet Ticket_Réservation

CREATE TABLE `Réservation` (
  `id_Réservation` int PRIMARY KEY AUTO_INCREMENT,
  `id_Utilisateur` int(50) NOT NULL,
  `id_Commande` int(50) NOT NULL,
  `Somme à payer` varchar(50) NOT NULL
) ENGINE=Innodb DEFAULT CHARSET=utf8;