-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2022 at 03:26 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_staditek_m11`
--

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `open_hour` time NOT NULL,
  `close_hour` time NOT NULL,
  `phone` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updates_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cashier`
--

CREATE TABLE `cashier` (
  `id` int(11) NOT NULL,
  `nik` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` enum('L','P') COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_trx`
--

CREATE TABLE `detail_trx` (
  `id_detail` int(11) NOT NULL,
  `header_id` int(11) NOT NULL,
  `goods_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `total_qty` int(11) NOT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `detail_trx`
--

INSERT INTO `detail_trx` (`id_detail`, `header_id`, `goods_name`, `total_qty`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 'Aqua', 1, 5000, '2022-11-28 02:01:40', NULL),
(2, 1, 'Roti', 1, 5000, '2022-11-28 02:01:40', NULL),
(3, 2, 'Roti', 3, 5000, '2022-11-28 02:03:00', NULL),
(4, 3, 'Eskrim', 2, 10000, '2022-11-28 02:04:03', NULL),
(6, 3, 'Ciki', 4, 5000, '2022-11-28 02:04:52', NULL),
(7, 4, 'Sabun Biore', 1, 30000, '2022-11-28 02:06:01', NULL),
(8, 4, 'Eskrim', 1, 10000, '2022-11-28 02:06:01', NULL),
(9, 4, 'Pulpen', 1, 20000, '2022-11-28 02:07:25', NULL),
(10, 4, 'Permen', 2, 5000, '2022-11-28 02:09:54', NULL),
(11, 4, 'Coklat', 2, 10000, '2022-11-28 02:10:15', NULL),
(12, 5, 'Kinder Joy', 1, 18000, '2022-11-28 02:11:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `goods`
--

CREATE TABLE `goods` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `stock` int(11) NOT NULL,
  `brand` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `uom` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `header_trx`
--

CREATE TABLE `header_trx` (
  `id_header` int(11) NOT NULL,
  `trx_info_id` int(11) NOT NULL,
  `datetime_trx` datetime NOT NULL,
  `total_paid` double NOT NULL,
  `discount` double NOT NULL,
  `total` int(11) NOT NULL,
  `charge` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `header_trx`
--

INSERT INTO `header_trx` (`id_header`, `trx_info_id`, `datetime_trx`, `total_paid`, `discount`, `total`, `charge`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-11-28 02:52:50', 10000, 2000, 8000, 2000, '2022-11-28 01:56:14', NULL),
(2, 2, '2022-11-28 02:56:28', 20000, 0, 15000, 5000, '2022-11-28 01:56:48', NULL),
(3, 1, '2022-11-28 02:56:50', 20000, 0, 20000, 0, '2022-11-28 01:57:15', '2022-11-29 03:14:29'),
(4, 3, '2022-11-28 02:57:29', 100000, 5000, 90000, 10000, '2022-11-28 01:58:06', NULL),
(5, 3, '2022-11-28 02:58:15', 20000, 0, 18000, 2000, '2022-11-28 01:58:52', NULL),
(7, 1, '2022-11-28 14:54:39', 5000, 0, 5000, 0, '2022-11-28 07:55:01', NULL),
(9, 1, '2022-11-28 09:02:49', 9000000, 0, 9000000, 0, '2022-11-28 08:02:49', '2022-11-28 21:57:41'),
(10, 1, '2022-11-28 09:05:04', 6, 0, 2, 6, '2022-11-28 02:05:04', '2022-11-28 20:35:33'),
(11, 1, '2022-11-28 09:05:05', 100000, 0, 50000, 50000, '2022-11-29 02:01:25', '2022-11-28 20:01:25'),
(12, 1, '2022-11-29 05:02:07', 90000, 0, 90000, 0, '2022-11-28 22:02:07', NULL),
(13, 1, '2022-11-29 05:13:11', 90000, 0, 90000, 0, '2022-11-28 22:13:11', NULL),
(14, 1, '2022-11-29 05:13:11', 90000, 0, 90000, 0, '2022-11-28 22:13:11', NULL),
(15, 1, '2022-11-29 05:18:15', 90000, 0, 90000, 0, '2022-11-28 22:18:15', NULL),
(17, 1, '2022-11-29 05:18:46', 90000, 0, 90000, 0, '2022-11-28 22:18:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `trx_info`
--

CREATE TABLE `trx_info` (
  `id` int(11) NOT NULL,
  `branch_info` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `cashier_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `trx_info`
--

INSERT INTO `trx_info` (`id`, `branch_info`, `cashier_name`, `isActive`, `created_at`, `updated_at`) VALUES
(1, 'Bintaro 1', 'Gina', 1, '2022-11-28 01:52:09', NULL),
(2, 'Bintaro 2', 'Udin', 1, '2022-11-28 01:51:13', NULL),
(3, 'Bintaro 3', 'Mulan', 1, '2022-11-28 01:52:00', NULL),
(4, 'Bintaro 4', 'Fransisca', 1, '2022-11-28 01:52:00', NULL),
(5, 'Bintaro 5', 'Jeki', 1, '2022-11-28 01:52:33', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cashier`
--
ALTER TABLE `cashier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_trx`
--
ALTER TABLE `detail_trx`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `fk_trx_headers` (`header_id`);

--
-- Indexes for table `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `header_trx`
--
ALTER TABLE `header_trx`
  ADD PRIMARY KEY (`id_header`),
  ADD KEY `fk_trx_header` (`trx_info_id`);

--
-- Indexes for table `trx_info`
--
ALTER TABLE `trx_info`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cashier`
--
ALTER TABLE `cashier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_trx`
--
ALTER TABLE `detail_trx`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `goods`
--
ALTER TABLE `goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `header_trx`
--
ALTER TABLE `header_trx`
  MODIFY `id_header` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `trx_info`
--
ALTER TABLE `trx_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_trx`
--
ALTER TABLE `detail_trx`
  ADD CONSTRAINT `fk_trx_headers` FOREIGN KEY (`header_id`) REFERENCES `header_trx` (`id_header`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `header_trx`
--
ALTER TABLE `header_trx`
  ADD CONSTRAINT `fk_trx_header` FOREIGN KEY (`trx_info_id`) REFERENCES `trx_info` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
