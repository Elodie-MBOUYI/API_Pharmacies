-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 03 déc. 2022 à 14:19
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `pharmacy`
--

-- --------------------------------------------------------

-- Structure de la table `adresse`

CREATE TABLE `adresse` (
  `id_pharmacie` int(11) NOT NULL,
  `id_demande` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- Structure de la table `demandes`

CREATE TABLE `demandes` (
  `id_demande` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `nom_client` text(25) NOT NULL,
  `telephone` varchar(10) NOT NULL,
  `Ordonnance` varchar(200) NOT NULL,
  `message` varchar(500) NOT NULL,
  `id_statut` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `demandes`
--

INSERT INTO `demandes` (`id_demande`, `date`, `nom_client`, `telephone`, `Ordonnance`, `message`, `id_statut`) VALUES
(4, '2022-12-03 10:35:44', 'Rose MATA', '062456321', '', 'Blédine 800g', 1),
(5, '2022-12-03 13:26:59', 'Lucie Edith', '074523167', '', 'Dacryoserum', 1);

-- --------------------------------------------------------

--
-- Structure de la table `pharmacies`
--

CREATE TABLE `pharmacies` (
  `id_pharmacie` int(11) NOT NULL,
  `nom_pharmacie` varchar(300) NOT NULL,
  `adresse` varchar(300) NOT NULL,
  `tel_pharmacie` varchar(145) NOT NULL,
  `Id_users` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `pharmacies`
--

INSERT INTO `pharmacies` (`id_pharmacie`, `nom_pharmacie`, `adresse`, `tel_pharmacie`, `Id_users`) VALUES
(4, 'Pharmacie RADOCA', 'Rue boulevard Leon Mba', '01552462', 1),
(5, 'Pharmacie ANDREA', 'Rue cocotiers', '01245796', 1);

-- --------------------------------------------------------

--
-- Structure de la table `statut`
--

CREATE TABLE `statut` (
  `id_statut` int(11) NOT NULL,
  `libelle` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `statut`
--

INSERT INTO `statut` (`id_statut`, `libelle`) VALUES
(1, 'Terminé');

-- --------------------------------------------------------

--
-- Structure de la table `typeuser`
--

CREATE TABLE `typeuser` (
  `id_typeuser` int(11) NOT NULL,
  `libelle` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `typeuser`
--

INSERT INTO `typeuser` (`id_typeuser`, `libelle`) VALUES
(1, 'Pharmacien'),
(2, 'Administrateur général');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id_Users` int(11) NOT NULL,
  `id_typeuser` int(11) NOT NULL,
  `login` varchar(25) NOT NULL,
  `password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id_Users`, `id_typeuser`, `login`, `password`) VALUES
(1, 1, 'Evrard', 'hello1'),
(2, 2, 'Quentin', 'hello2');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD KEY `id_pharmacieFK` (`id_pharmacie`),
  ADD KEY `if_demandeFK` (`id_demande`);

--
-- Index pour la table `demandes`
--
ALTER TABLE `demandes`
  ADD PRIMARY KEY (`id_demande`),
  ADD KEY `id_statutFK` (`id_statut`);

--
-- Index pour la table `pharmacies`
--
ALTER TABLE `pharmacies`
  ADD PRIMARY KEY (`id_pharmacie`),
  ADD KEY `id_usersFK` (`Id_users`);

--
-- Index pour la table `statut`
--
ALTER TABLE `statut`
  ADD PRIMARY KEY (`id_statut`);

--
-- Index pour la table `typeuser`
--
ALTER TABLE `typeuser`
  ADD PRIMARY KEY (`id_typeuser`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_Users`),
  ADD KEY `id_typeuserFK` (`id_typeuser`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `demandes`
--
ALTER TABLE `demandes`
  MODIFY `id_demande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `pharmacies`
--
ALTER TABLE `pharmacies`
  MODIFY `id_pharmacie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `statut`
--
ALTER TABLE `statut`
  MODIFY `id_statut` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `typeuser`
--
ALTER TABLE `typeuser`
  MODIFY `id_typeuser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id_Users` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD CONSTRAINT `id_pharmacieFK` FOREIGN KEY (`id_pharmacie`) REFERENCES `pharmacies` (`id_pharmacie`),
  ADD CONSTRAINT `if_demandeFK` FOREIGN KEY (`id_demande`) REFERENCES `demandes` (`id_demande`);

--
-- Contraintes pour la table `demandes`
--
ALTER TABLE `demandes`
  ADD CONSTRAINT `id_statutFK` FOREIGN KEY (`id_statut`) REFERENCES `statut` (`id_statut`);

--
-- Contraintes pour la table `pharmacies`
--
ALTER TABLE `pharmacies`
  ADD CONSTRAINT `id_usersFK` FOREIGN KEY (`Id_users`) REFERENCES `users` (`id_Users`);

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `id_typeuserFK` FOREIGN KEY (`id_typeuser`) REFERENCES `typeuser` (`id_typeuser`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
