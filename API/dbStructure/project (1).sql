-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2018 at 06:28 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

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
-- Table structure for table `carworkshop`
--

CREATE TABLE `carworkshop` (
  `id` int(50) NOT NULL,
  `centerName` varchar(500) NOT NULL,
  `locLatitude` varchar(500) NOT NULL,
  `locLongitude` varchar(500) NOT NULL,
  `contactNo` varchar(250) NOT NULL,
  `address` varchar(500) NOT NULL,
  `city` varchar(500) NOT NULL,
  `pincode` varchar(500) NOT NULL,
  `state` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `carworkshop`
--

INSERT INTO `carworkshop` (`id`, `centerName`, `locLatitude`, `locLongitude`, `contactNo`, `address`, `city`, `pincode`, `state`) VALUES
(1, 'Lonavala Branch', '45.54', '65.25558', '\"Mobile\" : \"9876543212\", \"phone\" : \"656566\"', 'jhdsgf', 'Lonavala', '410401', 'Maharashtra');

-- --------------------------------------------------------

--
-- Table structure for table `civiloffice`
--

CREATE TABLE `civiloffice` (
  `id` int(50) NOT NULL,
  `centerName` varchar(500) NOT NULL,
  `locLatitude` varchar(500) NOT NULL,
  `locLongitude` varchar(500) NOT NULL,
  `contactNo` varchar(250) NOT NULL,
  `address` varchar(500) NOT NULL,
  `city` varchar(500) NOT NULL,
  `pincode` varchar(500) NOT NULL,
  `state` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `demo`
--

CREATE TABLE `demo` (
  `id` int(50) NOT NULL,
  `value` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `demo`
--

INSERT INTO `demo` (`id`, `value`) VALUES
(1, 555),
(2, 555),
(3, 555),
(4, 555),
(5, 555),
(6, 555),
(7, 555),
(8, 555),
(9, 555),
(10, 555),
(11, 555),
(12, 555),
(13, 555),
(14, 555),
(15, 555),
(16, 555),
(17, 555),
(18, 555),
(19, 555),
(20, 555),
(21, 555),
(22, 555),
(23, 555);

-- --------------------------------------------------------

--
-- Table structure for table `emergencylog`
--

CREATE TABLE `emergencylog` (
  `id` int(50) NOT NULL,
  `ownerName` varchar(500) NOT NULL,
  `ownerAddress` varchar(500) NOT NULL,
  `mobNo` varchar(500) NOT NULL,
  `carNo` varchar(500) NOT NULL,
  `carModel` varchar(500) NOT NULL,
  `carColor` varchar(500) NOT NULL,
  `locLatitude` varchar(500) NOT NULL,
  `locLongitude` varchar(500) NOT NULL,
  `emergencyType` varchar(500) NOT NULL,
  `timeDate` varchar(200) NOT NULL,
  `responded` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emergencylog`
--

INSERT INTO `emergencylog` (`id`, `ownerName`, `ownerAddress`, `mobNo`, `carNo`, `carModel`, `carColor`, `locLatitude`, `locLongitude`, `emergencyType`, `timeDate`, `responded`) VALUES
(1, 'Rajat Bhai', 'hdsbgfs', '9876543212', 'jhdsf', 'skhdbf', 'green', '14.4444', '56.6565', 'Mechanical', '14:14:14', 'No'),
(2, 'Rajat Bhai', 'hdsbgfs', '9876543212', 'jhdsf', 'skhdbf', 'green', '45.54', '65.25558', 'Mechanical', '14:14:14', 'Yes'),
(3, 'Rajat Bhai', 'hdsbgfs', '9876543212', 'jhdsf', 'skhdbf', 'green', '45.54', '65.25558', 'Mechanical', '14:14:14', 'Yes'),
(4, 'Rajat Bhai', 'hdsbgfs', '9876543212', 'jhdsf', 'skhdbf', 'green', '45.54', '65.25558', 'Mechanical', '14:14:14', 'Yes'),
(5, 'Rajat Bhai', 'hdsbgfs', '9876543212', 'jhdsf', 'skhdbf', 'green', '45.54', '65.25558', 'Accident', '14:14:14', 'Yes'),
(6, 'Rajat Bhai', 'hdsbgfs', '9876543212', 'jhdsf', 'skhdbf', 'green', '45.54', '65.25558', 'Accident', '14:14:14', 'Yes'),
(7, 'Rajat Bhai', 'hdsbgfs', '9876543212', 'jhdsf', 'skhdbf', 'green', '14.24', '65.25', 'Accident', '14:14:14', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `id` int(50) NOT NULL,
  `centerName` varchar(500) NOT NULL,
  `locLatitude` varchar(500) NOT NULL,
  `locLongitude` varchar(500) NOT NULL,
  `contactNo` varchar(500) NOT NULL,
  `address` varchar(500) NOT NULL,
  `city` varchar(500) NOT NULL,
  `pincode` varchar(500) NOT NULL,
  `state` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`id`, `centerName`, `locLatitude`, `locLongitude`, `contactNo`, `address`, `city`, `pincode`, `state`) VALUES
(1, 'sahara hospital', '18.55', '52.333333', '\"Mobile\" : \"987654321\", \"Phone\" : \"\"', 'dnfjdsnf', 'Lonavala', '410401', 'Maharashtra'),
(2, 'Shiv Hospital', '15.55', '35.333', '\"Mobile\" : \"9876543212\", \"Phone\" : \"123123\"', 'ashd', 'jdsfh', '410401', 'hsdgfhgsd'),
(3, 'Ram Hospital', '45.554', '5.545', '\"Mobile\" : \"9898989898\", \"Phone\" : \"787878\"', 'nasbd', 'hksbdf', '454545', 'sagdhgashdg'),
(4, 'ajay hospital', '14.4444', '56.6565', '\"Mobile\" : \"9876543212\", \"Phone\" : \"156454\"', 'ashdbahksdb kjbjkb', 'Lonavala', '410401', 'Maharashtra'),
(5, 'Ajay hosp', '14.24', '65.25', '\"Mobile\" : \"9898989898\", \"Phone\" : \"7898789\"', 'askjd', 'jn', '410401', 'Maharashtra'),
(6, 'askjd', '45.2', '54.56', '\"Mobile\" : \"7878787878\", \"Phone\" : \"87878787\"', 'ashdb', 'asjbd', '455555', 'jsdh');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `rescueid` varchar(500) NOT NULL,
  `response` varchar(20) NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `message`, `rescueid`, `response`) VALUES
(1, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"12:12:12\",\r\n                                                \"destination\" : {\"lat\" : 18.7478016, \"lng\" : 73.420467},\r\n                                                \"source\" : {\"lat\" : 18.7462268, \"lng\" : 73.4188684},\r\n                                                \"travelTime\" : \"5 km\", \"distance\" : \"20 Minute\", \"location\" : \"Kusgaon Budruk\",\r\n                                                \"ownerName\" : \"Satish Patil\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}\r\n\r\n', 'hosp1', 'Rejected'),
(2, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7478016, \"lng\" : 73.420467},\r\n                                                \"source\" : {\"lat\" : 18.7462268, \"lng\" : 73.4188684},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Rajat Bhai\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}\r\n\r\n', 'hosp1', 'Accepted'),
(3, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : \"14.4444\", \"lng\" : \"56.6565\"},\r\n                                                \"source\" : {\"lat\" : 14.4444, \"lng\" : 56.6565},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Rajat Bhai\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'hosp1', 'Accepted'),
(4, '{\"emergencyType\": \"Mechanical\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : \"45.54\", \"lng\" : \"65.25558\"},\r\n                                                \"source\" : {\"lat\" : 45.54, \"lng\" : 65.25558},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Rajat Bhai\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'hosp4', 'Timeout'),
(5, '{\"emergencyType\": \"Mechanical\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : \"45.54\", \"lng\" : \"65.25558\"},\r\n                                                \"source\" : {\"lat\" : 45.54, \"lng\" : 65.25558},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Rajat Bhai\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'cws1', 'Accepted'),
(6, '{\"emergencyType\": \"Mechanical\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : \"45.54\", \"lng\" : \"65.25558\"},\r\n                                                \"source\" : {\"lat\" : 45.54, \"lng\" : 65.25558},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Rajat Bhai\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'cws1', 'Accepted'),
(7, '{\"emergencyType\": \"Mechanical\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : \"45.54\", \"lng\" : \"65.25558\"},\r\n                                                \"source\" : {\"lat\" : 45.54, \"lng\" : 65.25558},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Rajat Bhai\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'cws1', 'Accepted'),
(8, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : \"45.54\", \"lng\" : \"65.25558\"},\r\n                                                \"source\" : {\"lat\" : 45.54, \"lng\" : 65.25558},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Rajat Bhai\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(9, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : \"45.54\", \"lng\" : \"65.25558\"},\r\n                                                \"source\" : {\"lat\" : 45.54, \"lng\" : 65.25558},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Rajat Bhai\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(10, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : \"14.24\", \"lng\" : \"65.25\"},\r\n                                                \"source\" : {\"lat\" : 14.24, \"lng\" : 65.25},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Rajat Bhai\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'hosp5', 'Accepted'),
(11, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : \"45.54\", \"lng\" : \"65.25558\"},\r\n                                                \"source\" : {\"lat\" : 45.54, \"lng\" : 65.25558},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Rajat Bhai\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(12, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : \"45.54\", \"lng\" : \"65.25558\"},\r\n                                                \"source\" : {\"lat\" : 45.54, \"lng\" : 65.25558},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Rajat Bhai\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(13, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : \"45.54\", \"lng\" : \"65.25558\"},\r\n                                                \"source\" : {\"lat\" : 45.54, \"lng\" : 65.25558},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Rajat Bhai\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(14, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : \"45.54\", \"lng\" : \"65.25558\"},\r\n                                                \"source\" : {\"lat\" : 45.54, \"lng\" : 65.25558},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Rajat Bhai\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(15, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : \"45.54\", \"lng\" : \"65.25558\"},\r\n                                                \"source\" : {\"lat\" : 45.54, \"lng\" : 65.25558},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Rajat Bhai\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(16, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : \"45.54\", \"lng\" : \"65.25558\"},\r\n                                                \"source\" : {\"lat\" : 45.54, \"lng\" : 65.25558},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Rajat Bhai\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(17, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : \"45.54\", \"lng\" : \"65.25558\"},\r\n                                                \"source\" : {\"lat\" : 45.54, \"lng\" : 65.25558},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Rajat Bhai\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(18, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : \"45.54\", \"lng\" : \"65.25558\"},\r\n                                                \"source\" : {\"lat\" : 45.54, \"lng\" : 65.25558},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Rajat Bhai\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(19, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : \"45.54\", \"lng\" : \"65.25558\"},\r\n                                                \"source\" : {\"lat\" : 45.54, \"lng\" : 65.25558},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Rajat Bhai\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(20, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : \"45.54\", \"lng\" : \"65.25558\"},\r\n                                                \"source\" : {\"lat\" : 45.54, \"lng\" : 65.25558},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Rajat Bhai\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(21, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : \"45.54\", \"lng\" : \"65.25558\"},\r\n                                                \"source\" : {\"lat\" : 45.54, \"lng\" : 65.25558},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Rajat Bhai\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(22, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : \"45.54\", \"lng\" : \"65.25558\"},\r\n                                                \"source\" : {\"lat\" : 45.54, \"lng\" : 65.25558},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Rajat Bhai\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(23, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : \"45.54\", \"lng\" : \"65.25558\"},\r\n                                                \"source\" : {\"lat\" : 45.54, \"lng\" : 65.25558},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Rajat Bhai\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(24, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : \"45.54\", \"lng\" : \"65.25558\"},\r\n                                                \"source\" : {\"lat\" : 45.54, \"lng\" : 65.25558},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Rajat Bhai\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(25, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : \"45.54\", \"lng\" : \"65.25558\"},\r\n                                                \"source\" : {\"lat\" : 45.54, \"lng\" : 65.25558},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Bhai\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(26, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : \"45.54\", \"lng\" : \"65.25558\"},\r\n                                                \"source\" : {\"lat\" : 45.54, \"lng\" : 65.25558},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Rajat Patel\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(27, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(28, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : \"45.54\", \"lng\" : \"65.25558\"},\r\n                                                \"source\" : {\"lat\" : 45.54, \"lng\" : 65.25558},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Bhai\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(29, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : \"45.54\", \"lng\" : \"65.25558\"},\r\n                                                \"source\" : {\"lat\" : 45.54, \"lng\" : 65.25558},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Bhai\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(30, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : \"45.54\", \"lng\" : \"65.25558\"},\r\n                                                \"source\" : {\"lat\" : 45.54, \"lng\" : 65.25558},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Bhai\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(31, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(32, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(33, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(34, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(35, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(36, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(37, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'hosp1', 'Rejected'),
(38, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(39, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(40, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(41, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(42, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(43, '{\"emergencyType\": \"Medical\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(44, '{\"emergencyType\": \"Medical\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(45, '{\"emergencyType\": \"Medical\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(46, '{\"emergencyType\": \"Medical\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(47, '{\"emergencyType\": \"Medical\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(48, '{\"emergencyType\": \"type1\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(49, '{\"emergencyType\": \"type2\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(50, '{\"emergencyType\": \"type3\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(51, '{\"emergencyType\": \"type3\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(52, '{\"emergencyType\": \"type4\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(53, '{\"emergencyType\": \"type5\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(54, '{\"emergencyType\": \"type5\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(55, '{\"emergencyType\": \"type6\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(56, '{\"emergencyType\": \"type7\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(57, '{\"emergencyType\": \"type8\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(58, '{\"emergencyType\": \"type9\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'ps1', 'Seen'),
(59, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'hosp1', 'Rejected'),
(60, '{\"emergencyType\": \"Medical\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'hosp1', 'Rejected'),
(61, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'hosp1', 'Rejected'),
(62, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'hosp1', 'Rejected'),
(63, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'hosp1', 'Rejected'),
(64, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'hosp1', 'Rejected'),
(65, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'hosp1', 'Rejected'),
(66, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'hosp1', 'Rejected'),
(67, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'hosp1', 'Rejected'),
(68, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'hosp1', 'Rejected'),
(69, '{\"emergencyType\": \"Accident\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'hosp1', 'Accepted'),
(70, '{\"emergencyType\": \"Medical\", \"timeDate\" : \"14:14:14\",\r\n                                                \"destination\" : {\"lat\" : 18.7504653, \"lng\" : 73.4239142},\r\n                                                \"source\" : {\"lat\" : 18.7502472, \"lng\" : 73.4049079},\r\n                                                \"travelTime\" : \"\", \"distance\" : \"\", \"location\" : \"\",\r\n                                                \"ownerName\" : \"Vijay Rana\", \"mobNo\" : 9876543212, \"carNo\" : \"jhdsf\",\r\n                                                \"carModel\" : \"skhdbf\", \"carColor\" : \"green\", \"ownerAddress\" : \"hdsbgfs\"}', 'hosp1', 'Accepted');

-- --------------------------------------------------------

--
-- Table structure for table `policestation`
--

CREATE TABLE `policestation` (
  `id` int(50) NOT NULL,
  `centerName` varchar(500) NOT NULL,
  `locLatitude` varchar(500) NOT NULL,
  `locLongitude` varchar(500) NOT NULL,
  `contactNo` varchar(250) NOT NULL,
  `address` varchar(500) NOT NULL,
  `city` varchar(500) NOT NULL,
  `pincode` varchar(500) NOT NULL,
  `state` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `policestation`
--

INSERT INTO `policestation` (`id`, `centerName`, `locLatitude`, `locLongitude`, `contactNo`, `address`, `city`, `pincode`, `state`) VALUES
(1, 'Lonavala Branch', '45.54', '65.25558', '\"Mobile\" : \"9876543212\", \"phone\" : \"656566\"', 'jhdsgf', 'Lonavala', '410401', 'Maharashtra');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `unique_key` varchar(6) NOT NULL,
  `keyactive` tinyint(1) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `useractive` datetime NOT NULL,
  `rescuetype` varchar(50) NOT NULL,
  `rescueid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`unique_key`, `keyactive`, `username`, `password`, `useractive`, `rescuetype`, `rescueid`) VALUES
('as4555', 1, 'ajay123', 'asasas', '0000-00-00 00:00:00', 'hospital', 1),
('fda123', 0, '', '', '0000-00-00 00:00:00', 'hospital', 0),
('zxzxzx', 1, 'sachin456', 'sachin456', '2018-05-04 06:09:09', 'policestation', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carworkshop`
--
ALTER TABLE `carworkshop`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `civiloffice`
--
ALTER TABLE `civiloffice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `demo`
--
ALTER TABLE `demo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `emergencylog`
--
ALTER TABLE `emergencylog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `policestation`
--
ALTER TABLE `policestation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `unique_key` (`unique_key`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carworkshop`
--
ALTER TABLE `carworkshop`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `civiloffice`
--
ALTER TABLE `civiloffice`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `demo`
--
ALTER TABLE `demo`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `emergencylog`
--
ALTER TABLE `emergencylog`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `hospital`
--
ALTER TABLE `hospital`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `policestation`
--
ALTER TABLE `policestation`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
