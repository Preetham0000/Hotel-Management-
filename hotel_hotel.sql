-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 03, 2024 at 05:14 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel_hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
Create Database hotel_hotel;
--
USE hotel_hotel;

CREATE TABLE `booking` (
  `BID` int(11) NOT NULL,
  `CHECK_IN` date NOT NULL,
  `CHECK_OUT` date NOT NULL,
  `NO_OF_GUESTS` int(11) NOT NULL,
  `ROOM_TYPE` enum('single','deluxe','esuite','psuite') NOT NULL,
  `CID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`BID`, `CHECK_IN`, `CHECK_OUT`, `NO_OF_GUESTS`, `ROOM_TYPE`, `CID`) VALUES
(1, '2024-08-06', '2024-08-09', 2, '', 0),
(2, '2024-08-15', '2024-08-19', 5, '', 0),
(3, '2024-08-04', '2024-08-06', 2, '', 0),
(4, '2024-08-10', '2024-08-12', 8, '', 0),
(5, '2024-08-09', '2024-08-12', 5, '', 0),
(6, '2024-08-11', '2024-08-13', 2, '', 0),
(7, '2024-08-09', '2024-08-12', 1, '', 119),
(8, '2024-08-16', '2024-08-17', 6, '', 120),
(9, '2024-08-10', '2024-08-12', 1, '', 120),
(10, '2024-08-15', '2024-08-24', 1, '', 121),
(11, '2024-08-12', '2024-08-14', 1, '', 122),
(12, '2024-08-26', '2024-08-28', 1, '', 123),
(13, '2024-08-18', '2024-08-19', 1, '', 124),
(14, '2024-08-17', '2024-08-19', 1, '', 125),
(15, '2024-08-16', '2024-08-18', 1, '', 126),
(16, '2024-08-22', '2024-08-23', 1, 'single', 127),
(17, '2024-08-22', '2024-08-26', 1, 'single', 128),
(18, '2024-08-23', '2024-08-18', 1, 'single', 129),
(19, '2024-08-17', '2024-08-19', 1, 'single', 130),
(20, '2024-08-18', '2024-08-19', 1, 'single', 131),
(21, '2024-08-03', '2024-08-17', 1, 'single', 132),
(22, '2024-08-12', '2024-08-19', 1, 'single', 133),
(23, '2024-08-09', '2024-08-18', 1, 'deluxe', 134),
(24, '2024-08-26', '2024-08-29', 1, 'single', 135),
(25, '2024-08-12', '2024-08-11', 1, 'esuite', 136),
(26, '2024-08-31', '2024-08-25', 1, 'single', 137),
(27, '2024-08-12', '2024-08-17', 1, 'single', 137),
(28, '2024-08-24', '2024-08-26', 1, 'single', 137),
(29, '2024-08-16', '2024-08-19', 1, 'single', 138),
(30, '2024-08-03', '2024-08-04', 1, 'single', 0),
(31, '2024-08-05', '2024-08-04', 1, 'single', 0),
(32, '2024-08-17', '2024-08-19', 1, 'single', 0),
(33, '2024-08-10', '2024-08-12', 1, 'single', 0),
(34, '2024-08-18', '2024-08-12', 3, 'deluxe', 0),
(35, '2024-08-02', '2024-08-11', 1, 'single', 0);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CID` int(11) NOT NULL,
  `NAME` varchar(30) NOT NULL,
  `AGE` int(11) NOT NULL,
  `GENDER` enum('male','female','other') NOT NULL,
  `EMAIL` varchar(25) NOT NULL,
  `PHONE_NO` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CID`, `NAME`, `AGE`, `GENDER`, `EMAIL`, `PHONE_NO`) VALUES
(1, 'aaa', 12, '', 'xsasasa', 323321),
(2, 'wwwe', 45, '', 'eee@gmail.com', 3245),
(61, '', 0, '', '', 0),
(62, '', 0, '', '', 0),
(63, '', 0, '', '', 0),
(64, '', 0, '', '', 0),
(65, '', 0, '', '', 0),
(66, '', 0, '', '', 0),
(67, '', 0, '', '', 0),
(68, '', 0, '', '', 0),
(69, '', 0, '', '', 0),
(70, '', 0, '', '', 0),
(71, '', 0, '', '', 0),
(72, '', 0, '', '', 0),
(73, '', 0, '', '', 0),
(74, '', 0, '', '', 0),
(75, '', 0, '', '', 0),
(76, '', 0, '', '', 0),
(77, '', 0, '', '', 0),
(78, '', 0, '', '', 0),
(79, '', 0, '', '', 0),
(80, '', 0, '', '', 0),
(81, '', 0, '', '', 0),
(82, '', 0, '', '', 0),
(83, '', 0, '', '', 0),
(84, '', 0, '', '', 0),
(85, '', 0, '', '', 0),
(86, '', 0, '', '', 0),
(87, '', 0, '', '', 0),
(88, '', 0, '', '', 0),
(89, '', 0, '', '', 0),
(90, '', 0, '', '', 0),
(91, '', 0, '', '', 0),
(92, 'wwwe', 45, '', 'eee@gmail.com', 3245),
(93, 'rhhh', 45, '', 'eee@gmail.com', 1234435),
(94, 'asdfg', 43, '', 'werty@gmail.com', 3245),
(95, 'oikjh', 23, '', 'eee@gmail.com', 3245),
(96, 'dsfgg', 43, '', 'eee@gmail.com', 1234567),
(97, 'asdfg', 23, '', 'eee@gmail.com', 3245),
(98, 'swdxf', 45, '', 'werty@gmail.com', 123443),
(99, 'gfhjlk', 45, '', 'eee@gmail.com', 3245),
(100, 'hlkjhgf', 45, '', 'eee@gmail.com', 1234435),
(101, 'lokj', 45, '', 'eee@gmail.com', 1234435),
(102, 'riya', 43, '', 'riya@gmail.com', 867567981),
(103, 'tina', 23, '', 'dina@gmail.com', 2147483647),
(104, 'harrr', 56, '', 'har@gmail.com', 2147483647),
(105, 'raha', 34, '', 'raha@gmail.com', 1234435),
(106, 'xuv', 20, '', 'eee@gmail.com', 2147483647),
(107, 'arnold', 20, '', 'arnold@gmail.com', 879678567),
(108, 'arfan', 23, '', 'a@gmail.com', 2147483647),
(109, 'dfhjk', 45, '', 'dgfh@gmail.com', 2345768),
(110, 'tyuiou', 43, '', 'sfdgh@gmail.com', 57689),
(111, 'siuo', 23, '', 'yu@gmail.com', 1234435),
(112, 'wwwe', 20, '', 'eee@gmail.com', 1234435),
(113, 'ertyui', 23, '', 'eee@gmail.com', 1234435),
(114, 'wwwe', 23, '', 'eee@gmail.com', 2147483647),
(115, 'wwwe', 20, '', 'eee@gmail.com', 1234435),
(116, 'weroiy', 23, '', 'werty@gmail.com', 1234435),
(117, 'wwwe', 23, '', 'eee@gmail.com', 1234435),
(118, 'wwwe', 23, '', 'eee@gmail.com', 1234435),
(119, 'wwwe', 20, '', 'eee@gmail.com', 1234435),
(120, 'dsfgg', 23, '', 'eee@gmail.com', 1234435),
(121, 'wwwe', 23, '', 'eee@gmail.com', 1234435),
(122, 'swdxf', 12, '', 'eee@gmail.com', 1234567),
(123, 'dsfgg', 43, '', 'werty@gmail.com', 1234435),
(124, 'wwwe', 20, '', 'eee@gmail.com', 1234435),
(125, 'dsfgg', 45, '', 'eee@gmail.com', 1234),
(126, 'asdfg', 12, '', 'werty@gmail.com', 3245),
(127, 'swdxf', 23, 'female', 'eee@gmail.com', 3245),
(128, 'wwwe', 23, 'female', 'eee@gmail.com', 1234567),
(129, 'asdfg', 23, 'other', 'eee@gmail.com', 2147483647),
(130, 'wwwe', 23, 'female', 'eee@gmail.com', 3245),
(131, 'shiu', 45, 'male', 'shiu@gmail.com', 243567980),
(132, 'asdfg', 23, 'male', 'werty@gmail.com', 1234),
(133, 'wwwe', 20, 'female', 'eee@gmail.com', 1234),
(134, 'wwwe', 23, 'female', 'eee@gmail.com', 1234435),
(135, 'wwwe', 45, 'female', 'eee@gmail.com', 3245),
(136, 'dsfgg', 23, 'female', 'eee@gmail.com', 1234),
(137, 'asdfg', 43, 'female', 'werty@gmail.com', 1234),
(138, 'wwwe', 23, 'female', 'werty@gmail.com', 3245),
(139, 'wwwe', 20, 'female', 'eee@gmail.com', 3245),
(140, 'wwwe', 20, 'female', 'Preetham.233@gmail.com', 1234435),
(141, 'wwwe', 20, 'female', 'Preetham.233@gmail.com', 1234435),
(142, 'wwwe', 23, 'female', 'eee@gmail.com', 3245),
(143, 'Preetham', 20, 'male', 'Preetham.233@gmail.com', 1234435),
(144, 'dsfgg', 23, 'female', 'Preetham.233@gmail.com', 1234),
(145, 'wwwe', 20, 'male', 'eee@gmail.com', 3245),
(146, 'wwwe', 20, 'female', 'eee@gmail.com', 1234435),
(147, 'wwwe', 20, 'female', 'eee@gmail.com', 1234435),
(148, 'dsfgg', 45, 'other', 'werty@gmail.com', 3245),
(149, 'swdxf', 23, 'female', 'werty@gmail.com', 1234435);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `RID` int(11) NOT NULL,
  `CID` int(11) NOT NULL,
  `BID` int(11) NOT NULL,
  `RNO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`RID`, `CID`, `BID`, `RNO`) VALUES
(1, 0, 1, 0),
(2, 0, 2, 0),
(3, 0, 3, 0),
(4, 0, 4, 0),
(5, 0, 5, 0),
(6, 0, 6, 0),
(7, 119, 7, 0),
(8, 120, 8, 0),
(9, 120, 9, 0),
(10, 121, 10, 0),
(11, 122, 11, 0),
(12, 123, 12, 0),
(13, 124, 13, 0),
(14, 125, 14, 0),
(15, 126, 15, 0),
(16, 127, 16, 0),
(17, 128, 17, 0),
(18, 129, 18, 0),
(19, 130, 19, 0),
(20, 131, 20, 0),
(21, 132, 21, 0),
(22, 133, 22, 0),
(23, 134, 23, 0),
(24, 135, 24, 0),
(25, 136, 25, 0),
(26, 137, 26, 0),
(27, 137, 27, 0),
(28, 137, 28, 0),
(29, 138, 29, 0),
(30, 144, 30, 1),
(31, 145, 31, 1),
(32, 146, 32, 1),
(33, 147, 33, 1),
(34, 148, 34, 2),
(35, 149, 35, 1);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `RNO` int(11) NOT NULL,
  `TYPE` varchar(30) NOT NULL,
  `CAPACITY` int(11) NOT NULL,
  `PRICE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`RNO`, `TYPE`, `CAPACITY`, `PRICE`) VALUES
(1, 'Single', 2, 2500),
(2, 'Deluxe', 3, 4000),
(3, 'Executive suite', 4, 5500),
(4, 'Presidency suite', 6, 6800);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`BID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CID`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`RID`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`RNO`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `BID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `RID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `RNO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;
Select * from booking;
Select * from room;
Select * from reservation;
Select * from customer;
