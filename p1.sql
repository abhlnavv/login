-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2022 at 12:48 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `p1`
--

-- --------------------------------------------------------

--
-- Table structure for table `p1`
--

CREATE TABLE `p1` (
  `sno` int(3) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(22) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `dt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `p1`
--

INSERT INTO `p1` (`sno`, `name`, `email`, `phone`, `date`, `dt`) VALUES
(1, 'Abhinav', 'abhi@gmail.com', '8851265587', '2014-08-13', '2022-08-17 03:13:39'),
(2, 'Abhi', 'abhina@gmail.com', '888', '2222-02-22', '2022-08-17 10:26:21'),
(3, 'Abhi', 'abhina@gmail.com', '888', '2222-02-22', '2022-08-17 10:28:01'),
(4, '', '', '', '0000-00-00', '2022-08-17 10:29:16'),
(5, '', '', '', '0000-00-00', '2022-08-17 10:33:56'),
(6, '', '', '', '0000-00-00', '2022-08-17 10:34:02'),
(7, 'Abhi', 'abhina@gmail.com', '888', '0222-02-22', '2022-08-17 10:34:14'),
(8, 'Abhi', 'abhina@gmail.com', '888', '0222-02-22', '2022-08-17 10:34:31'),
(9, 'Abhi', 'abhina@gmail.com', '888', '0222-02-22', '2022-08-17 10:36:07'),
(10, 'Abhi', 'abhina@gmail.com', '888', '0222-02-22', '2022-08-17 10:36:25'),
(11, 'Abhi', 'abhina@gmail.com', '888', '0222-02-22', '2022-08-17 10:37:29'),
(12, 'Abhi', 'abhina@gmail.com', '888', '0222-02-22', '2022-08-17 10:38:13'),
(13, '', '', '', '0000-00-00', '2022-08-17 10:38:29'),
(14, 'Abhi', 'abhina@gmail.com', '888', '3333-03-31', '2022-08-17 10:38:48'),
(15, '', '', '', '0000-00-00', '2022-08-17 11:07:44'),
(16, 'Abhi', 'abhina@gmail.com', '888', '2222-02-22', '2022-08-17 11:08:03'),
(17, 'Abhi', 'abhina@gmail.com', '888', '2222-02-22', '2022-08-17 12:35:15'),
(18, 'Abhi', 'abhina@gmail.com', '888', '2222-02-22', '2022-08-17 12:35:19'),
(19, '', '', '', '0000-00-00', '2022-08-17 16:24:20'),
(20, '', '', '', '0000-00-00', '2022-08-18 10:13:44'),
(21, '', '', '', '0000-00-00', '2022-08-18 10:13:53'),
(22, 'Abhi', 'abhina@gmail.com', '888', '5555-05-05', '2022-08-18 10:14:25'),
(23, '', '', '', '0000-00-00', '2022-08-18 10:49:32'),
(24, '', '', '', '0000-00-00', '2022-08-18 17:35:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `p1`
--
ALTER TABLE `p1`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `p1`
--
ALTER TABLE `p1`
  MODIFY `sno` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
