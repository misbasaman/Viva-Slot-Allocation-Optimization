-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 18, 2018 at 02:37 PM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

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
-- Table structure for table `insertdatetime`
--

DROP TABLE IF EXISTS `insertdatetime`;
CREATE TABLE IF NOT EXISTS `insertdatetime` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_event` datetime DEFAULT NULL,
  `end_event` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `markerUserName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `marker_fk` (`markerUserName`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `insertdatetime`
--

INSERT INTO `insertdatetime` (`id`, `start_event`, `end_event`, `title`, `markerUserName`) VALUES
(5, '2018-04-04 11:00:00', '2018-04-04 13:30:00', 'Testing cal4', 'thomas1'),
(7, '2018-04-04 10:30:00', '2018-04-04 11:00:00', 'neil1', 'neil123'),
(8, '2018-04-04 09:30:00', '2018-04-04 10:00:00', 'testingCal5', 'thomas1'),
(9, '2018-04-05 09:30:00', '2018-04-05 12:30:00', 'TestingCal1', 'thomas1'),
(10, '2018-04-05 10:30:00', '2018-04-05 13:00:00', 'neil2', 'neil123'),
(11, '2018-04-05 13:30:00', '2018-04-05 14:30:00', 'not much busy', 'thomas1'),
(12, '2018-04-06 10:00:00', '2018-04-06 12:00:00', 'nervo1', 'nervo1'),
(13, '2018-04-06 10:00:00', '2018-04-06 12:00:00', 'neil1234', 'neil123'),
(17, '2018-04-06 14:30:00', '2018-04-06 16:30:00', 'test time neil', 'neil123'),
(18, '2018-04-05 09:30:00', '2018-04-05 10:30:00', 'nervo1', NULL),
(19, '2018-04-05 09:30:00', '2018-04-05 10:30:00', 'nervo1', NULL),
(20, '2018-04-05 10:00:00', '2018-04-05 11:00:00', 'nervo2', 'nervo1'),
(21, '2018-04-06 15:00:00', '2018-04-06 16:30:00', 'nervo3', 'nervo1'),
(22, '2018-04-16 10:00:00', '2018-04-16 13:00:00', 'Availability - Nervo - 1', 'nervo1'),
(23, '2018-04-17 14:00:00', '2018-04-17 16:00:00', 'Availability - Nervo - 2', 'nervo1'),
(24, '2018-04-18 15:30:00', '2018-04-18 17:00:00', 'Availability - Nervo - 3', 'nervo1'),
(25, '2018-04-19 10:00:00', '2018-04-19 13:00:00', 'Availability - Nervo - 4', 'nervo1'),
(26, '2018-04-19 14:30:00', '2018-04-19 17:00:00', 'Availability - Nervo - 5', 'nervo1'),
(27, '2018-04-20 09:30:00', '2018-04-20 12:00:00', 'Availability - Nervo - 6', 'nervo1'),
(28, '2018-04-16 09:30:00', '2018-04-16 15:00:00', 'Availability - Thomas-1', 'thomas1'),
(29, '2018-04-17 12:00:00', '2018-04-17 16:00:00', 'Availability - Thomas-2', 'thomas1'),
(30, '2018-04-18 10:30:00', '2018-04-18 12:30:00', 'Availability - Thomas-3', 'thomas1'),
(31, '2018-04-19 14:30:00', '2018-04-19 17:00:00', 'Availability - Thomas-4', 'thomas1'),
(32, '2018-04-20 11:00:00', '2018-04-20 13:00:00', 'Availability - Thomas-5', 'thomas1'),
(33, '2018-04-16 09:00:00', '2018-04-16 13:00:00', 'Availability - Neil-1', 'neil1'),
(34, '2018-04-17 14:30:00', '2018-04-17 16:30:00', 'Availability - Neil-2', 'neil1'),
(35, '2018-04-18 14:30:00', '2018-04-18 16:30:00', 'Availability - Neil-3', 'neil1'),
(36, '2018-04-19 10:00:00', '2018-04-19 13:00:00', 'Availability - Neil-4', 'neil1'),
(37, '2018-04-20 14:00:00', '2018-04-20 16:30:00', 'Availability - Neil-5', 'neil1'),
(38, '2018-04-16 12:30:00', '2018-04-16 14:30:00', 'Availability -Yi-1', 'yi1'),
(39, '2018-04-16 15:00:00', '2018-04-16 16:30:00', 'Availability -Yi-2', 'yi1'),
(40, '2018-04-17 10:00:00', '2018-04-17 13:00:00', 'Availability -Yi-3', 'yi1'),
(41, '2018-04-18 12:00:00', '2018-04-18 13:00:00', 'Availability -Yi-4', 'yi1'),
(42, '2018-04-18 14:00:00', '2018-04-18 17:00:00', 'Availability -Yi-5', 'yi1'),
(43, '2018-04-19 09:00:00', '2018-04-19 13:00:00', 'Availability -Yi-6', 'yi1'),
(44, '2018-04-19 14:00:00', '2018-04-19 15:30:00', 'Availability -Yi-7', 'yi1'),
(45, '2018-04-20 11:00:00', '2018-04-20 13:30:00', 'Availability -Yi-8', 'yi1'),
(46, '2018-04-16 09:30:00', '2018-04-16 12:30:00', 'Availability -Mike-1', 'mike1'),
(47, '2018-04-17 09:00:00', '2018-04-17 10:30:00', 'Availability -Mike-2', 'mike1'),
(48, '2018-04-17 14:30:00', '2018-04-17 16:30:00', 'Availability -Mike-3', 'mike1'),
(49, '2018-04-18 12:00:00', '2018-04-18 13:00:00', 'Availability -Mike-4', 'mike1'),
(50, '2018-04-18 14:00:00', '2018-04-18 17:00:00', 'Availability -Mike-5', 'mike1'),
(51, '2018-04-19 09:00:00', '2018-04-19 17:00:00', 'Availability -Mike-6', 'mike1'),
(53, '2018-04-20 09:00:00', '2018-04-20 10:00:00', 'Availability -Mike-7', 'mike1'),
(54, '2018-04-20 13:30:00', '2018-04-20 17:00:00', 'Availability -Mike-8', 'mike1'),
(55, '2018-04-16 13:30:00', '2018-04-16 15:30:00', 'Availability -Nicole-1', 'nicole1'),
(56, '2018-04-17 09:30:00', '2018-04-17 12:30:00', 'Availability -Nicole-2', 'nicole1'),
(57, '2018-04-17 14:30:00', '2018-04-17 15:30:00', 'Availability -Nicole-3', 'nicole1'),
(58, '2018-04-18 15:00:00', '2018-04-18 17:00:00', 'Availability -Nicole-4', 'nicole1'),
(59, '2018-04-19 13:00:00', '2018-04-19 14:30:00', 'Availability -Nicole-5', 'nicole1'),
(60, '2018-04-19 16:00:00', '2018-04-19 17:00:00', 'Availability -Nicole-6', 'nicole1'),
(61, '2018-04-20 10:00:00', '2018-04-20 11:30:00', 'Availability -Nicole-7', 'nicole1'),
(62, '2018-04-20 14:00:00', '2018-04-20 16:00:00', 'Availability -Nicole-8', 'nicole1'),
(63, '2018-04-16 12:00:00', '2018-04-16 15:30:00', 'Availability -Kareem-1', 'kareem1'),
(64, '2018-04-17 09:00:00', '2018-04-17 11:00:00', 'Availability -Kareem-2', 'kareem1'),
(65, '2018-04-17 13:00:00', '2018-04-17 14:00:00', 'Availability -Kareem-3', 'kareem1'),
(66, '2018-04-17 16:00:00', '2018-04-17 17:00:00', 'Availability -Kareem-4', 'kareem1'),
(67, '2018-04-18 10:00:00', '2018-04-18 11:30:00', 'Availability -Kareem-5', 'kareem1'),
(68, '2018-04-18 13:30:00', '2018-04-18 16:00:00', 'Availability -Kareem-6', 'kareem1'),
(69, '2018-04-19 10:00:00', '2018-04-19 17:00:00', 'Availability -Kareem-7', 'kareem1'),
(70, '2018-04-20 13:30:00', '2018-04-20 16:00:00', 'Availability -Kareem-8', 'kareem1'),
(83, '2018-06-01 14:00:00', '2018-06-01 16:00:00', 'Thomas- availability', 'thomas1'),
(84, '2018-06-04 10:00:00', '2018-06-04 13:00:00', 'Thomas- availability', 'thomas1'),
(85, '2018-06-04 14:00:00', '2018-06-04 17:00:00', 'Thomas- availability', 'thomas1'),
(86, '2018-06-05 10:00:00', '2018-06-05 17:00:00', 'Thomas- availability', 'thomas1'),
(87, '2018-06-06 14:00:00', '2018-06-06 15:00:00', 'Thomas- availability', 'thomas1'),
(88, '2018-06-06 16:00:00', '2018-06-06 17:00:00', 'Thomas- availability', 'thomas1'),
(89, '2018-06-07 13:00:00', '2018-06-07 17:00:00', 'Thomas- availability', 'thomas1'),
(90, '2018-06-08 14:00:00', '2018-06-08 16:00:00', 'Thomas- availability', 'thomas1'),
(91, '2018-06-11 10:00:00', '2018-06-11 13:00:00', 'Thomas- availability', 'thomas1'),
(92, '2018-06-11 14:00:00', '2018-06-11 17:00:00', 'Thomas- availability', 'thomas1'),
(93, '2018-06-12 10:00:00', '2018-06-12 17:00:00', 'Thomas- availability', 'thomas1'),
(94, '2018-06-13 14:00:00', '2018-06-13 15:00:00', 'Thomas- availability', 'thomas1'),
(95, '2018-06-13 16:00:00', '2018-06-13 17:00:00', 'Thomas- availability', 'thomas1'),
(96, '2018-06-14 13:00:00', '2018-06-14 17:00:00', 'Thomas- availability', 'thomas1'),
(97, '2018-06-15 14:00:00', '2018-06-15 16:00:00', 'Thomas- availability', 'thomas1'),
(98, '2018-06-18 10:00:00', '2018-06-18 13:00:00', 'Thomas- availability', 'thomas1'),
(99, '2018-06-18 14:00:00', '2018-06-18 17:00:00', 'Thomas- availability', 'thomas1'),
(100, '2018-06-19 10:00:00', '2018-06-19 17:00:00', 'Thomas- availability', 'thomas1'),
(101, '2018-06-20 14:00:00', '2018-06-20 15:00:00', 'Thomas- availability', 'thomas1'),
(102, '2018-06-20 16:00:00', '2018-06-20 17:00:00', 'Thomas- availability', 'thomas1'),
(103, '2018-06-21 13:00:00', '2018-06-21 17:00:00', 'Thomas- availability', 'thomas1'),
(104, '2018-06-22 14:00:00', '2018-06-22 16:00:00', 'Thomas- availability', 'thomas1'),
(105, '2018-06-25 10:00:00', '2018-06-25 13:00:00', 'Thomas- availability', 'thomas1'),
(106, '2018-06-25 14:00:00', '2018-06-25 17:00:00', 'Thomas- availability', 'thomas1'),
(107, '2018-06-26 10:00:00', '2018-06-26 17:00:00', 'Thomas- availability', 'thomas1'),
(108, '2018-06-27 14:00:00', '2018-06-27 15:00:00', 'Thomas- availability', 'thomas1'),
(109, '2018-06-27 16:00:00', '2018-06-27 17:00:00', 'Thomas- availability', 'thomas1'),
(110, '2018-06-28 13:00:00', '2018-06-28 17:00:00', 'Thomas- availability', 'thomas1'),
(111, '2018-06-29 14:00:00', '2018-06-29 16:00:00', 'Thomas- availability', 'thomas1'),
(112, '2018-06-01 14:00:00', '2018-06-01 16:00:00', 'Nervo - Availability', 'nervo1'),
(113, '2018-06-04 12:30:00', '2018-06-04 17:00:00', 'Nervo - Availability', 'nervo1'),
(114, '2018-06-05 10:00:00', '2018-06-05 13:00:00', 'Nervo - Availability', 'nervo1'),
(115, '2018-06-05 14:00:00', '2018-06-05 16:00:00', 'Nervo - Availability', 'nervo1'),
(116, '2018-06-06 11:00:00', '2018-06-06 17:00:00', 'Nervo - Availability', 'nervo1'),
(117, '2018-06-07 13:00:00', '2018-06-07 15:00:00', 'Nervo - Availability', 'nervo1'),
(118, '2018-06-08 14:00:00', '2018-06-08 16:00:00', 'Nervo - Availability', 'nervo1'),
(119, '2018-06-11 12:30:00', '2018-06-11 17:00:00', 'Nervo - Availability', 'nervo1'),
(120, '2018-06-12 10:00:00', '2018-06-12 13:00:00', 'Nervo - Availability', 'nervo1'),
(121, '2018-06-12 14:00:00', '2018-06-12 16:00:00', 'Nervo - Availability', 'nervo1'),
(122, '2018-06-13 11:00:00', '2018-06-13 17:00:00', 'Nervo - Availability', 'nervo1'),
(123, '2018-06-14 13:00:00', '2018-06-14 15:00:00', 'Nervo - Availability', 'nervo1'),
(124, '2018-06-15 14:00:00', '2018-06-15 16:00:00', 'Nervo - Availability', 'nervo1'),
(125, '2018-06-18 12:30:00', '2018-06-18 17:00:00', 'Nervo - Availability', 'nervo1'),
(126, '2018-06-19 10:00:00', '2018-06-19 13:00:00', 'Nervo - Availability', 'nervo1'),
(127, '2018-06-19 14:00:00', '2018-06-19 16:00:00', 'Nervo - Availability', 'nervo1'),
(128, '2018-06-20 11:00:00', '2018-06-20 17:00:00', 'Nervo - Availability', 'nervo1'),
(129, '2018-06-21 13:00:00', '2018-06-21 15:00:00', 'Nervo - Availability', 'nervo1'),
(130, '2018-06-22 14:00:00', '2018-06-22 16:00:00', 'Nervo - Availability', 'nervo1'),
(131, '2018-06-25 12:30:00', '2018-06-25 17:00:00', 'Nervo - Availability', 'nervo1'),
(132, '2018-06-26 10:00:00', '2018-06-26 13:00:00', 'Nervo - Availability', 'nervo1'),
(133, '2018-06-26 14:00:00', '2018-06-26 16:00:00', 'Nervo - Availability', 'nervo1'),
(134, '2018-06-27 11:00:00', '2018-06-27 17:00:00', 'Nervo - Availability', 'nervo1'),
(135, '2018-06-28 13:00:00', '2018-06-28 15:00:00', 'Nervo - Availability', 'nervo1'),
(136, '2018-06-29 14:00:00', '2018-06-29 16:00:00', 'Nervo - Availability', 'nervo1'),
(139, '2018-06-01 10:00:00', '2018-06-01 17:00:00', 'Neil - Availability', 'neil1'),
(140, '2018-06-04 10:00:00', '2018-06-04 12:00:00', 'Neil - Availability', 'neil1'),
(141, '2018-06-04 15:00:00', '2018-06-04 17:00:00', 'Neil - Availability', 'neil1'),
(142, '2018-06-05 12:00:00', '2018-06-05 13:00:00', 'Neil - Availability', 'neil1'),
(143, '2018-06-05 15:30:00', '2018-06-05 16:30:00', 'Neil - Availability', 'neil1'),
(144, '2018-06-06 10:30:00', '2018-06-06 14:30:00', 'Neil - Availability', 'neil1'),
(145, '2018-06-06 15:30:00', '2018-06-06 17:00:00', 'Neil - Availability', 'neil1'),
(146, '2018-06-08 10:00:00', '2018-06-08 17:00:00', 'Neil - Availability', 'neil1'),
(147, '2018-06-07 10:30:00', '2018-06-07 16:30:00', 'Neil - Availability', 'neil1'),
(148, '2018-06-11 10:00:00', '2018-06-11 12:00:00', 'Neil - Availability', 'neil1'),
(149, '2018-06-11 15:00:00', '2018-06-11 17:00:00', 'Neil - Availability', 'neil1'),
(150, '2018-06-12 12:00:00', '2018-06-12 13:00:00', 'Neil - Availability', 'neil1'),
(151, '2018-06-12 15:30:00', '2018-06-12 16:30:00', 'Neil - Availability', 'neil1'),
(152, '2018-06-13 10:30:00', '2018-06-13 14:30:00', 'Neil - Availability', 'neil1'),
(153, '2018-06-13 15:30:00', '2018-06-13 16:30:00', 'Neil - Availability', 'neil1'),
(154, '2018-06-14 10:30:00', '2018-06-14 16:30:00', 'Neil - Availability', 'neil1'),
(155, '2018-06-15 10:00:00', '2018-06-15 17:00:00', 'Neil - Availability', 'neil1'),
(156, '2018-06-18 10:00:00', '2018-06-18 12:00:00', 'Neil - Availability', 'neil1'),
(157, '2018-06-18 15:00:00', '2018-06-18 17:00:00', 'Neil - Availability', 'neil1'),
(158, '2018-06-19 12:00:00', '2018-06-19 13:00:00', 'Neil - Availability', 'neil1'),
(159, '2018-06-19 15:30:00', '2018-06-19 16:30:00', 'Neil - Availability', 'neil1'),
(160, '2018-06-20 10:30:00', '2018-06-20 14:30:00', 'Neil - Availability', 'neil1'),
(161, '2018-06-20 15:30:00', '2018-06-20 17:00:00', 'Neil - Availability', 'neil1'),
(162, '2018-06-21 10:30:00', '2018-06-21 16:30:00', 'Neil - Availability', 'neil1'),
(163, '2018-06-22 10:00:00', '2018-06-22 17:00:00', 'Neil - Availability', 'neil1'),
(164, '2018-06-25 10:00:00', '2018-06-25 12:00:00', 'Neil - Availability', 'neil1'),
(165, '2018-06-25 15:00:00', '2018-06-25 17:00:00', 'Neil - Availability', 'neil1'),
(166, '2018-06-26 12:00:00', '2018-06-26 13:00:00', 'Neil - Availability', 'neil1'),
(167, '2018-06-26 15:30:00', '2018-06-26 16:30:00', 'Neil - Availability', 'neil1'),
(168, '2018-06-27 10:30:00', '2018-06-27 14:30:00', 'Neil - Availability', 'neil1'),
(169, '2018-06-27 15:30:00', '2018-06-27 17:00:00', 'Neil - Availability', 'neil1'),
(170, '2018-06-28 10:30:00', '2018-06-28 16:30:00', 'Neil - Availability', 'neil1'),
(171, '2018-06-29 10:00:00', '2018-06-29 17:00:00', 'Neil - Availability', 'neil1'),
(172, '2018-06-01 14:30:00', '2018-06-01 16:30:00', 'Yi - Availability', 'yi1'),
(173, '2018-06-04 10:30:00', '2018-06-04 15:30:00', 'Yi - Availability', 'yi1'),
(174, '2018-06-05 13:30:00', '2018-06-05 17:00:00', 'Yi - Availability', 'yi1'),
(175, '2018-06-06 10:00:00', '2018-06-06 17:00:00', 'Yi - Availability', 'yi1'),
(176, '2018-06-07 11:00:00', '2018-06-07 16:30:00', 'Yi - Availability', 'yi1'),
(177, '2018-06-08 14:30:00', '2018-06-08 16:30:00', 'Yi - Availability', 'yi1'),
(178, '2018-06-11 10:30:00', '2018-06-11 15:30:00', 'Yi - Availability', 'yi1'),
(179, '2018-06-12 13:30:00', '2018-06-12 17:00:00', 'Yi - Availability', 'yi1'),
(180, '2018-06-13 10:00:00', '2018-06-13 17:00:00', 'Yi - Availability', 'yi1'),
(181, '2018-06-14 11:30:00', '2018-06-14 16:30:00', 'Yi - Availability', 'yi1'),
(182, '2018-06-15 14:30:00', '2018-06-15 16:30:00', 'Yi - Availability', 'yi1'),
(183, '2018-06-18 10:30:00', '2018-06-18 15:30:00', 'Yi - Availability', 'yi1'),
(184, '2018-06-19 13:30:00', '2018-06-19 17:00:00', 'Yi - Availability', 'yi1'),
(185, '2018-06-20 10:00:00', '2018-06-20 17:00:00', 'Yi - Availability', 'yi1'),
(186, '2018-06-21 11:00:00', '2018-06-21 16:30:00', 'Yi - Availability', 'yi1'),
(187, '2018-06-22 14:30:00', '2018-06-22 16:30:00', 'Yi - Availability', 'yi1'),
(188, '2018-06-25 10:30:00', '2018-06-25 15:30:00', 'Yi - Availability', 'yi1'),
(189, '2018-06-26 13:30:00', '2018-06-26 17:00:00', 'Yi - Availability', 'yi1'),
(190, '2018-06-27 10:00:00', '2018-06-27 17:00:00', 'Yi - Availability', 'yi1'),
(191, '2018-06-28 11:00:00', '2018-06-28 16:30:00', 'Yi - Availability', 'yi1'),
(192, '2018-06-29 14:30:00', '2018-06-29 16:30:00', 'Yi - Availability', 'yi1'),
(194, '2018-06-01 09:00:00', '2018-06-01 16:00:00', 'Mike - Availability', 'mike1'),
(195, '2018-06-04 09:00:00', '2018-06-04 13:30:00', 'Mike - Availability', 'mike1'),
(196, '2018-06-05 10:00:00', '2018-06-05 17:00:00', 'Mike - Availability', 'mike1'),
(197, '2018-06-06 09:30:00', '2018-06-06 17:00:00', 'Mike - Availability', 'mike1'),
(198, '2018-06-07 11:30:00', '2018-06-07 15:30:00', 'Mike - Availability', 'mike1'),
(199, '2018-06-08 09:00:00', '2018-06-08 16:00:00', 'Mike - Availability', 'mike1'),
(200, '2018-06-11 09:00:00', '2018-06-11 13:30:00', 'Mike - Availability', 'mike1'),
(201, '2018-06-12 10:00:00', '2018-06-12 17:00:00', 'Mike - Availability', 'mike1'),
(202, '2018-06-13 09:30:00', '2018-06-13 17:00:00', 'Mike - Availability', 'mike1'),
(203, '2018-06-14 11:30:00', '2018-06-14 15:30:00', 'Mike - Availability', 'mike1'),
(204, '2018-06-15 09:00:00', '2018-06-15 16:00:00', 'Mike - Availability', 'mike1'),
(205, '2018-06-18 09:00:00', '2018-06-18 13:30:00', 'Mike - Availability', 'mike1'),
(206, '2018-06-19 10:00:00', '2018-06-19 17:00:00', 'Mike - Availability', 'mike1'),
(207, '2018-06-20 09:30:00', '2018-06-20 17:00:00', 'Mike - Availability', 'mike1'),
(208, '2018-06-21 11:00:00', '2018-06-21 15:30:00', 'Mike - Availability', 'mike1'),
(209, '2018-06-22 09:00:00', '2018-06-22 16:00:00', 'Mike - Availability', 'mike1'),
(210, '2018-06-25 09:00:00', '2018-06-25 13:30:00', 'Mike - Availability', 'mike1'),
(211, '2018-06-26 10:00:00', '2018-06-26 17:00:00', 'Mike - Availability', 'mike1'),
(212, '2018-06-27 09:30:00', '2018-06-27 17:00:00', 'Mike - Availability', 'mike1'),
(213, '2018-06-28 11:30:00', '2018-06-28 15:30:00', 'Mike - Availability', 'mike1'),
(214, '2018-06-29 09:00:00', '2018-06-29 16:00:00', 'Mike - Availability', 'mike1'),
(216, '2018-06-01 10:00:00', '2018-06-01 17:00:00', 'Nicole - Availability', 'nicole1'),
(217, '2018-06-04 12:30:00', '2018-06-04 16:30:00', 'Nicole - Availability', 'nicole1'),
(218, '2018-06-05 09:00:00', '2018-06-05 17:00:00', 'Nicole - Availability', 'nicole1'),
(219, '2018-06-06 14:30:00', '2018-06-06 16:30:00', 'Nicole - Availability', 'nicole1'),
(220, '2018-06-07 13:00:00', '2018-06-07 17:00:00', 'Nicole - Availability', 'nicole1'),
(221, '2018-06-08 10:00:00', '2018-06-08 17:00:00', 'Nicole - Availability', 'nicole1'),
(222, '2018-06-11 12:30:00', '2018-06-11 16:30:00', 'Nicole - Availability', 'nicole1'),
(223, '2018-06-12 09:00:00', '2018-06-12 17:00:00', 'Nicole - Availability', 'nicole1'),
(224, '2018-06-13 14:30:00', '2018-06-13 16:30:00', 'Nicole - Availability', 'nicole1'),
(225, '2018-06-14 13:00:00', '2018-06-14 17:00:00', 'Nicole - Availability', 'nicole1'),
(226, '2018-06-15 10:00:00', '2018-06-15 17:00:00', 'Nicole - Availability', 'nicole1'),
(227, '2018-06-18 12:30:00', '2018-06-18 16:30:00', 'Nicole - Availability', 'nicole1'),
(228, '2018-06-19 09:00:00', '2018-06-19 17:00:00', 'Nicole - Availability', 'nicole1'),
(229, '2018-06-20 14:30:00', '2018-06-20 16:30:00', 'Nicole - Availability', 'nicole1'),
(230, '2018-06-21 13:00:00', '2018-06-21 17:00:00', 'Nicole - Availability', 'nicole1'),
(231, '2018-06-22 10:00:00', '2018-06-22 17:00:00', 'Nicole - Availability', 'nicole1'),
(232, '2018-06-25 12:30:00', '2018-06-25 16:30:00', 'Nicole - Availability', 'nicole1'),
(233, '2018-06-26 09:00:00', '2018-06-26 17:00:00', 'Nicole - Availability', 'nicole1'),
(234, '2018-06-27 14:30:00', '2018-06-27 16:30:00', 'Nicole - Availability', 'nicole1'),
(235, '2018-06-28 13:00:00', '2018-06-28 17:00:00', 'Nicole - Availability', 'nicole1'),
(236, '2018-06-29 10:00:00', '2018-06-29 17:00:00', 'Nicole - Availability', 'nicole1'),
(237, '2018-06-01 10:00:00', '2018-06-01 17:00:00', 'Kareem - Availability', 'kareem1'),
(238, '2018-06-04 09:00:00', '2018-06-04 17:00:00', 'Kareem - Availability', 'kareem1'),
(239, '2018-06-05 09:30:00', '2018-06-05 14:30:00', 'Kareem - Availability', 'kareem1'),
(240, '2018-06-06 10:30:00', '2018-06-06 16:30:00', 'Kareem - Availability', 'kareem1'),
(241, '2018-06-07 12:00:00', '2018-06-07 17:00:00', 'Kareem - Availability', 'kareem1'),
(242, '2018-06-08 10:00:00', '2018-06-08 17:00:00', 'Kareem - Availability', 'kareem1'),
(243, '2018-06-11 09:00:00', '2018-06-11 17:00:00', 'Kareem - Availability', 'kareem1'),
(244, '2018-06-12 09:30:00', '2018-06-12 14:30:00', 'Kareem - Availability', 'kareem1'),
(245, '2018-06-13 10:30:00', '2018-06-13 16:30:00', 'Kareem - Availability', 'kareem1'),
(246, '2018-06-14 12:00:00', '2018-06-14 17:00:00', 'Kareem - Availability', 'kareem1'),
(247, '2018-06-15 10:00:00', '2018-06-15 17:00:00', 'Kareem - Availability', 'kareem1'),
(248, '2018-06-18 09:00:00', '2018-06-18 17:00:00', 'Kareem - Availability', 'kareem1'),
(249, '2018-06-19 09:30:00', '2018-06-19 14:30:00', 'Kareem - Availability', 'kareem1'),
(250, '2018-06-20 10:30:00', '2018-06-20 16:30:00', 'Kareem - Availability', 'kareem1'),
(251, '2018-06-21 12:00:00', '2018-06-21 17:00:00', 'Kareem - Availability', 'kareem1'),
(252, '2018-06-22 10:00:00', '2018-06-22 17:00:00', 'Kareem - Availability', 'kareem1'),
(253, '2018-06-25 09:00:00', '2018-06-25 17:00:00', 'Kareem - Availability', 'kareem1'),
(254, '2018-06-26 09:30:00', '2018-06-26 14:30:00', 'Kareem - Availability', 'kareem1'),
(255, '2018-06-27 10:30:00', '2018-06-27 16:30:00', 'Kareem - Availability', 'kareem1'),
(256, '2018-06-28 12:00:00', '2018-06-28 17:00:00', 'Kareem - Availability', 'kareem1'),
(257, '2018-06-29 10:00:00', '2018-06-29 17:00:00', 'Kareem - Availability', 'kareem1');

-- --------------------------------------------------------

--
-- Table structure for table `relation`
--

DROP TABLE IF EXISTS `relation`;
CREATE TABLE IF NOT EXISTS `relation` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `susername` varchar(100) DEFAULT NULL,
  `marker1` varchar(100) DEFAULT NULL,
  `marker2` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`rid`),
  KEY `susername` (`susername`),
  KEY `marker1` (`marker1`),
  KEY `marker2` (`marker2`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `relation`
--

INSERT INTO `relation` (`rid`, `susername`, `marker1`, `marker2`) VALUES
(1, 'saurav1', 'nervo1', 'thomas1'),
(6, 'zaini1', 'nervo1', 'neil1'),
(7, 'sachin1', 'neil1', 'thomas1'),
(8, 'misba1', 'yi1', 'mike1'),
(9, 'mili1', 'mike1', 'nicole1'),
(10, 'mandira1', 'nicole1', 'kareem1'),
(11, 'prashil1', 'kareem1', 'nervo1'),
(12, 'jhonny1', 'nervo1', 'kareem1'),
(13, 'jenny1', 'yi1', 'nicole1'),
(14, 'saurav1', 'nervo1', 'thomas1'),
(15, 'jacob1', 'thomas1', 'nicole1'),
(16, 'vishal1', 'neil1', 'mike1'),
(17, 'alveera1', 'yi1', 'kareem1'),
(18, 'suraj1', 'mike1', 'thomas1'),
(19, 'dave1', 'neil1', 'thomas1'),
(20, 'john1', 'yi1', 'nervo1');

-- --------------------------------------------------------

--
-- Table structure for table `student_preferences`
--

DROP TABLE IF EXISTS `student_preferences`;
CREATE TABLE IF NOT EXISTS `student_preferences` (
  `prefId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `start_event` datetime DEFAULT NULL,
  `end_event` datetime DEFAULT NULL,
  `pref_order` int(11) NOT NULL,
  `Assigned` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`prefId`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_preferences`
--

INSERT INTO `student_preferences` (`prefId`, `username`, `start_event`, `end_event`, `pref_order`, `Assigned`) VALUES
(53, 'suraj1', '2018-04-17 14:30:00', '2018-04-17 15:30:00', 1, 0),
(54, 'suraj1', '2018-04-16 10:30:00', '2018-04-16 11:30:00', 2, 0),
(55, 'suraj1', '2018-04-16 11:30:00', '2018-04-16 12:30:00', 3, 1),
(91, 'jacob1', '2018-04-17 14:30:00', '2018-04-17 15:30:00', 1, 1),
(92, 'jacob1', '2018-04-19 16:00:00', '2018-04-19 17:00:00', 2, 0),
(93, 'jacob1', '2018-04-16 13:30:00', '2018-04-16 14:30:00', 3, 0),
(94, 'saurav1', '2018-04-16 11:00:00', '2018-04-16 12:00:00', 1, 0),
(95, 'saurav1', '2018-04-05 10:00:00', '2018-04-05 11:00:00', 2, 1),
(96, 'saurav1', '2018-04-16 12:00:00', '2018-04-16 13:00:00', 3, 0),
(97, 'jenny1', '2018-04-17 10:00:00', '2018-04-17 11:00:00', 1, 0),
(98, 'jenny1', '2018-04-18 16:00:00', '2018-04-18 17:00:00', 2, 0),
(99, 'jenny1', '2018-04-17 11:00:00', '2018-04-17 12:00:00', 3, 0),
(100, 'sachin1', '2018-04-16 11:30:00', '2018-04-16 12:30:00', 1, 0),
(101, 'sachin1', '2018-04-16 09:30:00', '2018-04-16 10:30:00', 2, 0),
(102, 'sachin1', '2018-04-17 14:30:00', '2018-04-17 15:30:00', 3, 0),
(103, 'misba1', '2018-04-19 11:00:00', '2018-04-19 12:00:00', 1, 0),
(104, 'misba1', '2018-04-19 09:00:00', '2018-04-19 10:00:00', 2, 0),
(105, 'misba1', '2018-04-18 14:00:00', '2018-04-18 15:00:00', 3, 0),
(106, 'mili1', '2018-04-18 15:00:00', '2018-04-18 16:00:00', 1, 1),
(107, 'mili1', '2018-04-19 13:00:00', '2018-04-19 14:00:00', 2, 0),
(108, 'mili1', '2018-04-17 09:30:00', '2018-04-17 10:30:00', 3, 0),
(109, 'vishal1', '2018-04-16 09:30:00', '2018-04-16 10:30:00', 1, 1),
(110, 'vishal1', '2018-04-16 10:30:00', '2018-04-16 11:30:00', 2, 0),
(111, 'vishal1', '2018-04-18 14:30:00', '2018-04-18 15:30:00', 3, 0),
(112, 'mandira1', '2018-04-16 14:30:00', '2018-04-16 15:30:00', 1, 0),
(113, 'mandira1', '2018-04-17 09:30:00', '2018-04-17 10:30:00', 2, 0),
(114, 'mandira1', '2018-04-19 13:00:00', '2018-04-19 14:00:00', 3, 0),
(115, 'alveera1', '2018-04-16 12:30:00', '2018-04-16 13:30:00', 1, 0),
(116, 'alveera1', '2018-04-19 10:00:00', '2018-04-19 11:00:00', 2, 0),
(117, 'alveera1', '2018-04-19 14:00:00', '2018-04-19 15:00:00', 3, 0),
(118, 'prashil1', '2018-04-19 14:30:00', '2018-04-19 15:30:00', 1, 0),
(119, 'prashil1', '2018-04-19 15:30:00', '2018-04-19 16:30:00', 2, 0),
(120, 'prashil1', '2018-04-19 11:00:00', '2018-04-19 12:00:00', 3, 0),
(121, 'jhonny1', '2018-04-19 10:00:00', '2018-04-19 11:00:00', 1, 0),
(122, 'jhonny1', '2018-04-19 11:00:00', '2018-04-19 12:00:00', 2, 0),
(123, 'jhonny1', '2018-04-19 15:30:00', '2018-04-19 16:30:00', 3, 1),
(124, 'dave1', '2018-04-16 09:30:00', '2018-04-16 10:30:00', 1, 0),
(125, 'dave1', '2018-04-16 11:30:00', '2018-04-16 12:30:00', 2, 0),
(126, 'dave1', '2018-04-17 14:30:00', '2018-04-17 15:30:00', 3, 0),
(127, 'john1', '2018-04-18 15:30:00', '2018-04-18 16:30:00', 1, 0),
(128, 'john1', '2018-04-19 10:00:00', '2018-04-19 11:00:00', 2, 0),
(129, 'john1', '2018-04-19 14:30:00', '2018-04-19 15:30:00', 3, 0),
(130, 'zaini1', '2018-04-17 14:30:00', '2018-04-17 15:30:00', 1, 0),
(131, 'zaini1', '2018-04-18 15:30:00', '2018-04-18 16:30:00', 2, 1),
(132, 'zaini1', '2018-06-04 16:00:00', '2018-06-04 17:00:00', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(100) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `Stu_image` varchar(200) DEFAULT NULL,
  `email_id` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `fname`, `lname`, `password`, `type`, `lastlogin`, `Stu_image`, `email_id`) VALUES
('alveera1', 'alveera', 'khan', '18b9c52ac78c2f41fa02d4cd88414a8f', 'Student', '2018-05-08 08:11:09', './images/single.png', 'ms931@student.le.ac.uk'),
('dave1', 'Dave', 'Paul', '70b9f55c5b2ab6ab9e5a3fed086f1ce7', 'Student', '2018-05-08 08:14:01', './images/single.png', 'ms931@student.le.ac.uk'),
('jacob1', 'jacob', 'brown', '2d0e88a0c91399493596004c796ca5b4', 'Student', '2018-05-08 07:59:54', './images/single.png', 'ms931@student.le.ac.uk'),
('jenny1', 'jenny', 'white', '067fccb09c1d91f4f0c5d6d21d5355d9', 'Student', '2018-05-08 07:58:24', './images/single.png', 'ms931@student.le.ac.uk'),
('jhonny1', 'Jhonny', 'Wise', 'd4296647390408a1d9ba11dbe62af4eb', 'Student', '2018-05-08 08:13:28', './images/single.png', 'ms931@student.le.ac.uk'),
('john1', 'John', 'beth', '6e0b7076126a29d5dfcbd54835387b7b', 'Student', '2018-05-08 08:14:40', './images/single.png', 'ms931@student.le.ac.uk'),
('kareem1', 'Kareem', 'Mualla', 'f2ccaea1456081dd7ab409bea5fcd4ed', 'Marker', '2018-05-10 05:32:17', NULL, 'ms931@student.le.ac.uk'),
('khalendar1', 'khalendar', 'shah', '0b47f49072d99dd102ba2923fd4d2aea', 'Student', NULL, './images/single.png', 'ms931@student.le.ac.uk'),
('mandira1', 'mandira', 'bedi', '7c66e90e3b27b9b8a3bc5f5c73d6552c', 'Student', '2018-05-13 08:55:38', './images/single.png', 'ms931@student.le.ac.uk'),
('mike1', 'Mike', 'Smart', '4c3e1ec04215f69d6a8e9c023c9e4572', 'Marker', '2018-05-13 12:22:52', NULL, 'ms931@student.le.ac.uk'),
('mili1', 'milli', 'storm', '677c76dd3876f4b1c68a3df52bb2d7d8', 'Student', '2018-05-08 08:09:08', './images/single.png', 'ms931@student.le.ac.uk'),
('misba1', 'misba', 'saman', 'fb25ba7317f2765cee82f2181fccedd0', 'Student', '2018-05-08 07:59:09', './images/single.png', 'ms931@student.le.ac.uk'),
('neil1', 'Neil', 'White', '45a8b52fc710de3eb38231aace506833', 'Marker', '2018-05-13 11:54:28', NULL, 'ms931@student.le.ac.uk'),
('nervo1', 'Nervo', 'Verdezoto', '4977ba03956d003e0e0248f23abee087', 'Marker', '2018-05-15 03:54:43', '', 'ms931@student.le.ac.uk'),
('nicole1', 'Nicole', 'White', '96cee49cfcb7ce7242660592c21e42f4', 'Marker', '2018-05-10 05:24:49', NULL, 'ms931@student.le.ac.uk'),
('prashil1', 'Prashil', 'Mistry', '6cc29d3aa2068b25c4a845ad59175ae5', 'Student', '2018-05-08 08:12:10', './images/single.png', NULL),
('sachin1', 'sachin', 'tendulkar', 'e3afd8ad12667b18793aa2be02f841db', 'Student', '2018-05-08 07:57:44', './images/single.png', NULL),
('saurav1', 'saurav', 'ganguli', 'cafe8c205b216d181372b253fe095a21', 'Student', '2018-05-14 07:45:39', './images/single.png', NULL),
('suraj1', 'Suraj', 'Patil', '8127a1ad276367223d9d0a2d264e4b2e', 'Student', '2018-05-08 08:12:57', './images/single.png', NULL),
('thomas1', 'Thomas', 'Erlibach', '8766814f87d4790bd6c5f52d12b98da6', 'Marker', '2018-05-15 03:55:36', NULL, NULL),
('vishal1', 'vishal', 'shekar', '01e70ef35b60ca856a22d974811c9611', 'Student', '2018-05-08 08:09:48', './images/single.png', NULL),
('yi1', 'Yi', 'Hong', '761d686c90daf46e567f4620df322e31', 'Marker', '2018-05-10 05:11:17', NULL, NULL),
('zaini1', 'zaini', 'saher', '9db5c8a58af3463fc60fc71d9033081f', 'Student', '2018-05-15 03:30:20', './images/single.png', NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `relation`
--
ALTER TABLE `relation`
  ADD CONSTRAINT `relation_ibfk_1` FOREIGN KEY (`susername`) REFERENCES `users` (`username`),
  ADD CONSTRAINT `relation_ibfk_2` FOREIGN KEY (`marker1`) REFERENCES `users` (`username`),
  ADD CONSTRAINT `relation_ibfk_3` FOREIGN KEY (`marker2`) REFERENCES `users` (`username`);

--
-- Constraints for table `student_preferences`
--
ALTER TABLE `student_preferences`
  ADD CONSTRAINT `student_preferences_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
