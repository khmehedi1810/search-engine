-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 13, 2023 at 02:57 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `search_engine`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_10_13_053536_create_search_data_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `search_data`
--

CREATE TABLE `search_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `search_value` varchar(250) DEFAULT NULL,
  `keywords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`keywords`)),
  `results` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`results`)),
  `search_time` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `search_data`
--

INSERT INTO `search_data` (`id`, `search_value`, `keywords`, `results`, `search_time`, `created_at`, `updated_at`) VALUES
(1, 'KH Hasan', '[\"KH\",\"Hasan\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 06:28:41', '2023-10-13 00:28:41', '2023-10-13 00:28:41'),
(2, 'Rabbil', '[\"Rabbil\"]', '[{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 06:29:25', '2023-10-13 00:29:25', '2023-10-13 00:29:25'),
(3, 'KH Hasan', '[\"KH\",\"Hasan\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 06:30:59', '2023-10-13 00:30:59', '2023-10-13 00:30:59'),
(4, 'Mia', '[\"Mia\"]', '[{\"id\":5,\"name\":\"karim Mia\",\"email\":\"karim@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":7,\"name\":\"Zakir Mia\",\"email\":\"zakir@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 06:31:30', '2023-10-13 00:31:30', '2023-10-13 00:31:30'),
(5, 'Kh Mehedi Hasan', '[\"Kh\",\"Mehedi\",\"Hasan\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 06:37:35', '2023-10-13 00:37:35', '2023-10-13 00:37:35'),
(6, 'Kh Hasan', '[\"Kh\",\"Hasan\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 06:40:41', '2023-10-13 00:40:41', '2023-10-13 00:40:41'),
(8, 'Hasan', '[\"Hasan\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 06:44:03', '2023-10-13 00:44:03', '2023-10-13 00:44:03'),
(9, 'Hasan', '[\"Hasan\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 06:56:03', '2023-10-13 00:56:03', '2023-10-13 00:56:03'),
(10, 'Hasan', '[\"Hasan\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 06:56:53', '2023-10-13 00:56:53', '2023-10-13 00:56:53'),
(11, 'Hasan', '[\"Hasan\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 06:58:05', '2023-10-13 00:58:05', '2023-10-13 00:58:05'),
(13, 'Hasan', '[\"Hasan\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 08:03:47', '2023-10-13 02:03:47', '2023-10-13 02:03:47'),
(14, 'Hasan', '[\"Hasan\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 08:08:03', '2023-10-13 02:08:03', '2023-10-13 02:08:03'),
(15, 'Hasan', '[\"Hasan\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 08:11:58', '2023-10-13 02:11:58', '2023-10-13 02:11:58'),
(16, 'hasan', '[\"hasan\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 08:12:39', '2023-10-13 02:12:39', '2023-10-13 02:12:39'),
(17, 'Hasan', '[\"Hasan\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 08:16:32', '2023-10-13 02:16:32', '2023-10-13 02:16:32'),
(19, 'Hasan', '[\"Hasan\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 08:18:53', '2023-10-13 02:18:53', '2023-10-13 02:18:53'),
(20, 'Hasan', '[\"Hasan\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 08:19:23', '2023-10-13 02:19:23', '2023-10-13 02:19:23'),
(21, 'Hasan', '[\"Hasan\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 08:20:22', '2023-10-13 02:20:22', '2023-10-13 02:20:22'),
(22, 'Hasan', '[\"Hasan\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 08:28:10', '2023-10-13 02:28:10', '2023-10-13 02:28:10'),
(23, 'hasan', '[\"hasan\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 08:28:34', '2023-10-13 02:28:34', '2023-10-13 02:28:34'),
(24, 'Hasan', '[\"Hasan\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 08:30:24', '2023-10-13 02:30:24', '2023-10-13 02:30:24'),
(25, 'Hasan', '[\"Hasan\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 08:34:08', '2023-10-13 02:34:08', '2023-10-13 02:34:08'),
(26, 'Hasan', '[\"Hasan\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 08:35:32', '2023-10-13 02:35:32', '2023-10-13 02:35:32'),
(27, 'Hasan', '[\"Hasan\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 08:37:57', '2023-10-13 02:37:57', '2023-10-13 02:37:57'),
(28, 'Hasan', '[\"Hasan\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 09:23:19', '2023-10-13 03:23:19', '2023-10-13 03:23:19'),
(29, 'Hasan ali', '[\"Hasan\",\"ali\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":6,\"name\":\"Ahmed Ali\",\"email\":\"ahmed@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 09:26:06', '2023-10-13 03:26:06', '2023-10-13 03:26:06'),
(30, 'Hasan ali', '[\"Hasan\",\"ali\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":6,\"name\":\"Ahmed Ali\",\"email\":\"ahmed@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 09:29:17', '2023-10-13 03:29:17', '2023-10-13 03:29:17'),
(31, 'Kh Ali', '[\"Kh\",\"Ali\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":6,\"name\":\"Ahmed Ali\",\"email\":\"ahmed@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 09:32:14', '2023-10-13 03:32:14', '2023-10-13 03:32:14'),
(32, 'KH Ali', '[\"KH\",\"Ali\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":6,\"name\":\"Ahmed Ali\",\"email\":\"ahmed@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 09:34:08', '2023-10-13 03:34:08', '2023-10-13 03:34:08'),
(33, 'KH ALi', '[\"KH\",\"ALi\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":6,\"name\":\"Ahmed Ali\",\"email\":\"ahmed@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 09:34:53', '2023-10-13 03:34:53', '2023-10-13 03:34:53'),
(34, 'Hasan ali', '[\"Hasan\",\"ali\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":6,\"name\":\"Ahmed Ali\",\"email\":\"ahmed@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 09:40:16', '2023-10-13 03:40:16', '2023-10-13 03:40:16'),
(35, 'Hasan ali', '[\"Hasan\",\"ali\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":6,\"name\":\"Ahmed Ali\",\"email\":\"ahmed@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 09:40:21', '2023-10-13 03:40:21', '2023-10-13 03:40:21'),
(36, 'Hasan ali', '[\"Hasan\",\"ali\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":6,\"name\":\"Ahmed Ali\",\"email\":\"ahmed@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 09:40:27', '2023-10-13 03:40:27', '2023-10-13 03:40:27'),
(37, 'Hasan ali', '[\"Hasan\",\"ali\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":6,\"name\":\"Ahmed Ali\",\"email\":\"ahmed@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 09:40:31', '2023-10-13 03:40:31', '2023-10-13 03:40:31'),
(38, 'Hasan KH Ali', '[\"Hasan\",\"KH\",\"Ali\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":6,\"name\":\"Ahmed Ali\",\"email\":\"ahmed@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 09:42:44', '2023-10-13 03:42:44', '2023-10-13 03:42:44'),
(39, 'Hasan KH Ali mia', '[\"Hasan\",\"KH\",\"Ali\",\"mia\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":5,\"name\":\"karim Mia\",\"email\":\"karim@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":6,\"name\":\"Ahmed Ali\",\"email\":\"ahmed@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":7,\"name\":\"Zakir Mia\",\"email\":\"zakir@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 09:42:52', '2023-10-13 03:42:52', '2023-10-13 03:42:52'),
(40, 'Hasan', '[\"Hasan\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 09:49:14', '2023-10-13 03:49:14', '2023-10-13 03:49:14'),
(41, 'Hasan', '[\"Hasan\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 09:57:05', '2023-10-13 03:57:05', '2023-10-13 03:57:05'),
(42, 'Hasan', '[\"Hasan\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 10:39:40', '2023-10-13 04:39:40', '2023-10-13 04:39:40'),
(43, 'Hasan', '[\"Hasan\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 10:57:18', '2023-10-13 04:57:18', '2023-10-13 04:57:18'),
(44, 'Hasan', '[\"Hasan\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 10:58:30', '2023-10-13 04:58:30', '2023-10-13 04:58:30'),
(45, 'KH Hasan Ali', '[\"KH\",\"Hasan\",\"Ali\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":6,\"name\":\"Ahmed Ali\",\"email\":\"ahmed@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 11:06:00', '2023-10-13 05:06:00', '2023-10-13 05:06:00'),
(46, 'KH Hasan Ali', '[\"KH\",\"Hasan\",\"Ali\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":6,\"name\":\"Ahmed Ali\",\"email\":\"ahmed@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 11:07:10', '2023-10-13 05:07:10', '2023-10-13 05:07:10'),
(47, 'KH Hasan Ali', '[\"KH\",\"Hasan\",\"Ali\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":6,\"name\":\"Ahmed Ali\",\"email\":\"ahmed@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-03T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 11:08:46', '2023-10-13 05:08:46', '2023-10-13 05:08:46'),
(48, 'Kh Hasan ali', '[\"Kh\",\"Hasan\",\"ali\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":6,\"name\":\"Ahmed Ali\",\"email\":\"ahmed@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-03T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 11:12:03', '2023-10-13 05:12:03', '2023-10-13 05:12:03'),
(49, 'Kh Hasan ali', '[\"Kh\",\"Hasan\",\"ali\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":6,\"name\":\"Ahmed Ali\",\"email\":\"ahmed@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-03T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 11:14:07', '2023-10-13 05:14:07', '2023-10-13 05:14:07'),
(50, 'KH Hasan ali', '[\"KH\",\"Hasan\",\"ali\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":6,\"name\":\"Ahmed Ali\",\"email\":\"ahmed@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-03T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 11:20:14', '2023-10-13 05:20:14', '2023-10-13 05:20:14'),
(51, 'Kh Hasan', '[\"Kh\",\"Hasan\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 11:39:22', '2023-10-13 05:39:22', '2023-10-13 05:39:22'),
(52, 'Kh Hasan ali', '[\"Kh\",\"Hasan\",\"ali\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":6,\"name\":\"Ahmed Ali\",\"email\":\"ahmed@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-03T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 11:39:28', '2023-10-13 05:39:28', '2023-10-13 05:39:28'),
(53, 'KH Hasan ali', '[\"KH\",\"Hasan\",\"ali\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":6,\"name\":\"Ahmed Ali\",\"email\":\"ahmed@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-03T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 11:59:58', '2023-10-13 05:59:58', '2023-10-13 05:59:58'),
(54, 'KH Hasan Ali', '[\"KH\",\"Hasan\",\"Ali\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":6,\"name\":\"Ahmed Ali\",\"email\":\"ahmed@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-03T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 12:13:34', '2023-10-13 06:13:34', '2023-10-13 06:13:34'),
(55, 'Kh Hasan ali', '[\"Kh\",\"Hasan\",\"ali\"]', '[{\"id\":1,\"name\":\"KH Mehei Hasan\",\"email\":\"mehedi@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":4,\"name\":\"Rabbil Hasan\",\"email\":\"rabbil@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-13T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"},{\"id\":6,\"name\":\"Ahmed Ali\",\"email\":\"ahmed@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2023-10-03T06:19:52.000000Z\",\"updated_at\":\"2023-10-13T06:19:52.000000Z\"}]', '2023-10-13 12:24:38', '2023-10-13 06:24:38', '2023-10-13 06:24:38');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'KH Mehei Hasan', 'mehedi@gmail.com', NULL, '$2y$10$F3yqcO8G5oS2YPgX.uk8VeWWB.iQUUG8MuK6USE6p.UwuaAtXKM96', NULL, '2023-10-13 00:19:52', '2023-10-13 00:19:52'),
(3, 'Md Hadiv', 'hasiv@gmail.com', NULL, '$2y$10$F3yqcO8G5oS2YPgX.uk8VeWWB.iQUUG8MuK6USE6p.UwuaAtXKM96', NULL, '2023-10-13 00:19:52', '2023-10-13 00:19:52'),
(4, 'Rabbil Hasan', 'rabbil@gmail.com', NULL, '$2y$10$F3yqcO8G5oS2YPgX.uk8VeWWB.iQUUG8MuK6USE6p.UwuaAtXKM96', NULL, '2023-10-13 00:19:52', '2023-10-13 00:19:52'),
(5, 'karim Mia', 'karim@gmail.com', NULL, '$2y$10$F3yqcO8G5oS2YPgX.uk8VeWWB.iQUUG8MuK6USE6p.UwuaAtXKM96', NULL, '2023-10-13 00:19:52', '2023-10-13 00:19:52'),
(6, 'Ahmed Ali', 'ahmed@gmail.com', NULL, '$2y$10$F3yqcO8G5oS2YPgX.uk8VeWWB.iQUUG8MuK6USE6p.UwuaAtXKM96', NULL, '2023-10-03 00:19:52', '2023-10-13 00:19:52'),
(7, 'Zakir Mia', 'zakir@gmail.com', NULL, '$2y$10$F3yqcO8G5oS2YPgX.uk8VeWWB.iQUUG8MuK6USE6p.UwuaAtXKM96', NULL, '2023-10-13 00:19:52', '2023-10-13 00:19:52'),
(8, 'Sumit Saha', 'sumit@gmail.com', NULL, '$2y$10$F3yqcO8G5oS2YPgX.uk8VeWWB.iQUUG8MuK6USE6p.UwuaAtXKM96', NULL, '2023-10-13 00:19:52', '2023-10-13 00:19:52'),
(9, 'Voilet Sea', 'voilert@gmail.com', NULL, '$2y$10$F3yqcO8G5oS2YPgX.uk8VeWWB.iQUUG8MuK6USE6p.UwuaAtXKM96', NULL, '2023-10-13 00:19:52', '2023-10-13 00:19:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `search_data`
--
ALTER TABLE `search_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `search_data`
--
ALTER TABLE `search_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
