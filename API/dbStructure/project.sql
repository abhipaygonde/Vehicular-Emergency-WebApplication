-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 17, 2018 at 03:39 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `EmergencyLog`
--

CREATE TABLE `EmergencyLog` (
  `id` int(50) NOT NULL,
  `ownerName` varchar(500) NOT NULL,
  `ownerAddress` varchar(500) NOT NULL,
  `mobNo` varchar(500) NOT NULL,
  `carNo` varchar(500) NOT NULL,
  `carModel` varchar(500) NOT NULL,
  `carColor` varchar(500) NOT NULL,
  `locLattitude` varchar(500) NOT NULL,
  `locLongitude` varchar(500) NOT NULL,
  `emergencyType` varchar(500) NOT NULL,
  `timeDate` varchar(200) NOT NULL,
  `rescueCenterId` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `EmergencyLog`
--

INSERT INTO `EmergencyLog` (`id`, `ownerName`, `ownerAddress`, `mobNo`, `carNo`, `carModel`, `carColor`, `locLattitude`, `locLongitude`, `emergencyType`, `timeDate`, `rescueCenterId`) VALUES
(1, 'Ramesh Patil', 'asd', '342', '12', '12', 'ASd', '123', '321', 'asd', 'asd', 'asd12');

-- --------------------------------------------------------

--
-- Table structure for table `Hospital`
--

CREATE TABLE `Hospital` (
  `id` int(50) NOT NULL,
  `hospitalName` varchar(500) NOT NULL,
  `locLattitude` varchar(500) NOT NULL,
  `locLongitude` varchar(500) NOT NULL,
  `contactNo` varchar(500) NOT NULL,
  `address` varchar(500) NOT NULL,
  `city` varchar(500) NOT NULL,
  `pincode` varchar(500) NOT NULL,
  `state` varchar(500) NOT NULL,
  `workingTime` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `PoliceStation`
--

CREATE TABLE `PoliceStation` (
  `id` int(50) NOT NULL,
  `branchName` varchar(500) NOT NULL,
  `locLattitude` varchar(500) NOT NULL,
  `locLongitude` varchar(500) NOT NULL,
  `address` varchar(500) NOT NULL,
  `city` varchar(500) NOT NULL,
  `pincode` varchar(500) NOT NULL,
  `state` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `EmergencyLog`
--
ALTER TABLE `EmergencyLog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Hospital`
--
ALTER TABLE `Hospital`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `PoliceStation`
--
ALTER TABLE `PoliceStation`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `EmergencyLog`
--
ALTER TABLE `EmergencyLog`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Hospital`
--
ALTER TABLE `Hospital`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PoliceStation`
--
ALTER TABLE `PoliceStation`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
