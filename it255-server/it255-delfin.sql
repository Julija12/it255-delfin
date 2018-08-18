-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 18, 2018 at 08:11 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `it255-delfin`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategorija`
--

CREATE TABLE `kategorija` (
  `id` int(11) NOT NULL,
  `naziv` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategorija`
--

INSERT INTO `kategorija` (`id`, `naziv`) VALUES
(1, 'Kafa'),
(2, 'Brasno');

-- --------------------------------------------------------

--
-- Table structure for table `korpa`
--

CREATE TABLE `korpa` (
  `id` int(11) NOT NULL,
  `flag` int(11) NOT NULL COMMENT '1 - porudzbina u toku 2 - prurudzbina zavrsena',
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `korpa`
--

INSERT INTO `korpa` (`id`, `flag`, `user_id`) VALUES
(7, 2, 8),
(8, 2, 8),
(9, 2, 8),
(10, 2, 8),
(11, 2, 8),
(12, 2, 8),
(13, 2, 8),
(14, 2, 8),
(15, 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `narudzbina`
--

CREATE TABLE `narudzbina` (
  `id` int(11) NOT NULL,
  `kolicina` int(11) NOT NULL,
  `korpa_id` int(11) NOT NULL,
  `idProizvoda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `narudzbina`
--

INSERT INTO `narudzbina` (`id`, `kolicina`, `korpa_id`, `idProizvoda`) VALUES
(49, 1, 12, 9),
(53, 1, 14, 9);

-- --------------------------------------------------------

--
-- Table structure for table `proizvod`
--

CREATE TABLE `proizvod` (
  `id` int(11) NOT NULL,
  `ime` text NOT NULL,
  `cena` int(11) NOT NULL,
  `katID` int(11) NOT NULL,
  `url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `proizvod`
--

INSERT INTO `proizvod` (`id`, `ime`, `cena`, `katID`, `url`) VALUES
(1, 'Delfin', 250, 1, 'https://i.imgur.com/fSmscTH.jpg'),
(2, 'Domaca', 200, 1, 'https://i.imgur.com/evMHIRO.jpg'),
(3, 'Grand', 220, 1, 'https://i.imgur.com/PDxf9Nk.gif'),
(4, 'Bonito', 150, 1, 'https://i.imgur.com/bjMWlfa.jpg'),
(5, 'Doncafe', 250, 1, 'https://i.imgur.com/8vBOmPj.png'),
(6, 'Brazil', 100, 1, 'https://i.imgur.com/8UOmfGq.gif'),
(7, 'Belo kukuruzno ', 230, 2, 'https://i.imgur.com/emohDYs.jpg'),
(8, 'Integralno heljdino ', 260, 2, 'https://i.imgur.com/QBnsjc8.jpg'),
(9, 'Integralno speltino ', 220, 2, 'https://i.imgur.com/0p0geZw.jpg'),
(10, 'Integralno jecmeno ', 260, 2, 'https://i.imgur.com/ocku1gf.jpg'),
(11, 'Mesavina heljde i psenice', 245, 2, 'https://i.imgur.com/khpw4zx.jpg'),
(12, 'Integralno psenicno ', 250, 2, 'https://i.imgur.com/S7GHw3y.jpg'),
(13, 'Zuto kukuruzno ', 245, 2, 'https://i.imgur.com/FGWeElv.jpg'),
(14, 'Integralno ovseno', 220, 2, 'https://i.imgur.com/H31Ssrj.jpg'),
(15, 'Integralno razano', 260, 2, 'https://i.imgur.com/jm4YzNu.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `ID` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`ID`, `name`) VALUES
(0, 'User'),
(1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` text NOT NULL,
  `lastname` text NOT NULL,
  `address` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `role_id` int(11) NOT NULL,
  `token` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `address`, `email`, `password`, `role_id`, `token`) VALUES
(1, 'Julija', 'Cirkovic', 'Bulevar Oslobodjenja 164', 'julija.smek@gmail.com', '485aad759983ade7496c3c9397de6f9e', 1, 'bb1a52e852854df46179c488a182468babab5157'),
(2, 'Marija', 'Popovic', 'Jovana Ilica 65', 'marijapop@gmail.com', '474f5d4cac3a8cef024c0b4bece7a592', 0, '8bd275d1a7a2c9417580b3a929dd3539290e2d90'),
(3, 'Mina', 'Jovicic', 'Sanac 1', 'minajov@gmail.com', '308a29557d589f5e2c9d9b0975ff9c82', 0, '4ee3b6feba47f7b33ed7e8805472cd69cac8cabb'),
(4, 'Nikola', 'Ilic', 'Magistralni put 60', 'nikolailic@gmail.com', 'a646e457db47ad218d6d9d3ce325878b', 0, '4c1bac787bc55ff182a9f4d8587182b89599bce4'),
(5, 'Jovana', 'Mitrovic', 'Prote Ilije Purica', 'jovanamitrovic@gmail.com', 'd7c9aa725b1bdbf94b08502780f0341a', 0, '9577ff08ae02b8cb4b25915b06f33853c6cb46ba'),
(6, 'Tijana', 'Bikovic', 'Jovana Ilica 23', 'tijana.bik@gmail.com', 'fdf62033af972719ad19b4f32d06eaff', 0, '14da3ff778786634583d7a0482827bb07378d3b6'),
(7, 'Olivera', 'Rekovic', 'Magistralni put 69', 'olja.rekovic@gmail.com', '72b4f0c4253f6e663ebf8d5eb3a93a1d', 0, '5d46e164e18e892c096e1d4317669ca65ea7a18a'),
(8, 'Marijana', 'Batakovic', 'Bulevar Nikole Tesle 22', 'marijana@gmail.com', '426e84cd4c8594d739f130a110663781', 0, '87ed187d5284713194b371647a0593c7bff6efe4');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategorija`
--
ALTER TABLE `kategorija`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `korpa`
--
ALTER TABLE `korpa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `korpa_ibfk_1` (`user_id`);

--
-- Indexes for table `narudzbina`
--
ALTER TABLE `narudzbina`
  ADD PRIMARY KEY (`id`),
  ADD KEY `korpa_id` (`korpa_id`),
  ADD KEY `idProizvoda` (`idProizvoda`);

--
-- Indexes for table `proizvod`
--
ALTER TABLE `proizvod`
  ADD PRIMARY KEY (`id`),
  ADD KEY `katID` (`katID`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategorija`
--
ALTER TABLE `kategorija`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `korpa`
--
ALTER TABLE `korpa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `narudzbina`
--
ALTER TABLE `narudzbina`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `proizvod`
--
ALTER TABLE `proizvod`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `korpa`
--
ALTER TABLE `korpa`
  ADD CONSTRAINT `korpa_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `narudzbina`
--
ALTER TABLE `narudzbina`
  ADD CONSTRAINT `narudzbina_ibfk_1` FOREIGN KEY (`korpa_id`) REFERENCES `korpa` (`id`),
  ADD CONSTRAINT `narudzbina_ibfk_2` FOREIGN KEY (`idProizvoda`) REFERENCES `proizvod` (`id`);

--
-- Constraints for table `proizvod`
--
ALTER TABLE `proizvod`
  ADD CONSTRAINT `proizvod_ibfk_1` FOREIGN KEY (`katID`) REFERENCES `kategorija` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
