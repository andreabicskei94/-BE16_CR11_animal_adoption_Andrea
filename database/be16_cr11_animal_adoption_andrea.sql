-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2022 at 01:45 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `be16_cr11_animal_adoption_andrea`
--
CREATE DATABASE IF NOT EXISTS `be16_cr11_animal_adoption_andrea` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `be16_cr11_animal_adoption_andrea`;

-- --------------------------------------------------------

--
-- Table structure for table `adoption`
--

CREATE TABLE `adoption` (
  `id` int(11) NOT NULL,
  `fk_pet_id` int(11) NOT NULL,
  `fk_user_id` int(11) NOT NULL,
  `adopt_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `animals`
--

CREATE TABLE `animals` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `breed` varchar(30) NOT NULL,
  `age` int(11) NOT NULL,
  `type` varchar(30) NOT NULL,
  `description` varchar(30) NOT NULL,
  `hobbies` varchar(30) NOT NULL,
  `location` varchar(30) NOT NULL,
  `status` enum('avaliable','adopted') DEFAULT 'avaliable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `animals`
--

INSERT INTO `animals` (`id`, `name`, `picture`, `breed`, `age`, `type`, `description`, `hobbies`, `location`, `status`) VALUES
(1, 'Arthur', 'arthur.jpg', 'Scottish Shorthair', 9, 'M', 'Mackerel-Tabby color', 'Sleeping all day', 'Kittekat street 20', 'avaliable'),
(2, 'Rosie', 'rosie.jpg', 'Sphynx', 3, 'S', 'Skin', 'Making everybody uncomfy with ', 'Hellycat street 15.', 'avaliable'),
(3, 'Robert', 'robert2.jpg', 'American Pit Bull Terrier', 10, 'L', 'Very lovely, but with no trust', 'Barking at the pigeons', 'Wakkwakk street 30.', 'avaliable'),
(4, 'Linda', 'linda.jpg', 'Angora Shorthair', 1, 'M', 'White fluffy', 'Terrorizing the shelter worker', 'Miu Street 2.', 'avaliable'),
(5, 'Black Jack ', 'jack_black.jpg', 'Hamster', 2, 'XS', 'No words for this little monst', 'Building a castle of apple-pie', 'Dark Street 30.', 'avaliable'),
(6, 'Melissa', 'melissa.jpg', 'Goldfish', 1, 'XXS', 'A little orange princess', 'Making wishes', 'Ocean Drive 11', 'avaliable'),
(7, 'Oliver', 'oliver2.jpg', 'Dachshund', 5, 'S', 'Little, energetic, long fur', 'Digging holes in the garden', 'Duck Street 25.', 'avaliable'),
(8, 'Billie', 'billie.jpg', 'German Shepherd', 2, 'XL', 'A real bad boy', 'Running. ALL. THE. Time.', 'Black Street 20', 'avaliable'),
(9, 'Ellie', 'ellie.jpg', 'Mini Rabbit', 1, 'XS', 'Little cuteness', 'Living her best life with the ', 'Orange Street 63', 'avaliable'),
(10, 'Suzy', 'suzy.jpg', 'Goldie', 1, 'L', 'A kid who needs a mommy', 'Running on the hills', 'Gold Street 10', 'avaliable');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `address` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` enum('user','adm') NOT NULL DEFAULT 'user',
  `date_of_birth` date DEFAULT NULL,
  `telnumber` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `picture`, `address`, `email`, `password`, `status`, `date_of_birth`, `telnumber`) VALUES
(1, 'Kathy', 'Doe', 'kati.jpg', 'Berry Street 30., Vienna, 1236', 'kati@gmail.com', '1234523', 'adm', '1994-07-21', 0),
(2, 'Lili', 'Red', 'lili.jpg', 'Holly Street 62', 'lili@gmail.com', '3622336', 'user', '1980-02-18', 0),
(8, 'Andrea', 'Bicskei', 'avatar.png', '', 'andrea.bcsk@gmail.com', '779c3dbb3c8019cbf34123832f1f9cb79d4887c4cb7fe0173bb471ca1772ba20', 'user', '1994-08-07', 0),
(9, 'Beata', 'Black', 'avatar.png', '', 'bea@gmail.com', '29d00c9635cc4fbd8f9e93b56bebdd95b37f2bba8070cc9cb38b20240c066532', 'user', '1970-01-08', 0),
(10, 'Emilia', 'Yellow', 'avatar.png', '', 'emi@gmail.com', '3127c24e4f74360b95a050ede8609439e4fe0726512da8d2d34564b19c9733bb', 'adm', '1980-06-02', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adoption`
--
ALTER TABLE `adoption`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pet_id` (`fk_pet_id`),
  ADD KEY `fk_user_id` (`fk_user_id`);

--
-- Indexes for table `animals`
--
ALTER TABLE `animals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adoption`
--
ALTER TABLE `adoption`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `animals`
--
ALTER TABLE `animals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adoption`
--
ALTER TABLE `adoption`
  ADD CONSTRAINT `adoption_ibfk_1` FOREIGN KEY (`fk_pet_id`) REFERENCES `animals` (`id`),
  ADD CONSTRAINT `adoption_ibfk_2` FOREIGN KEY (`fk_user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
