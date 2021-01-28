-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 28, 2021 at 11:05 AM
-- Server version: 8.0.21
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `llna`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'PHP', 'php', '2020-08-17 06:36:00', '2020-08-17 06:36:00'),
(2, 'Laravel', 'laravel', '2020-08-17 06:36:00', '2020-08-17 06:36:00'),
(3, 'Vue', 'vue', '2020-08-17 06:36:00', '2020-08-17 06:36:00'),
(4, 'ReactJS', 'reactjs', '2020-08-17 06:36:00', '2020-08-17 06:36:00');

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` bigint UNSIGNED NOT NULL,
  `sender_id` bigint UNSIGNED NOT NULL,
  `receiver_id` bigint UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('sent','read') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `sender_id`, `receiver_id`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 'hi', 'sent', '2021-01-13 20:21:55', '2021-01-13 20:21:55'),
(2, 4, 1, 'hi', 'sent', '2021-01-13 20:40:47', '2021-01-13 20:40:47'),
(3, 4, 1, 'khong tra loi a', 'sent', '2021-01-13 20:43:49', '2021-01-13 20:43:49'),
(4, 4, 1, 'khong tra loi a', 'sent', '2021-01-13 20:46:00', '2021-01-13 20:46:00'),
(5, 4, 1, 'hello', 'sent', '2021-01-13 20:46:46', '2021-01-13 20:46:46'),
(6, 4, 1, 'gfbg', 'sent', '2021-01-13 20:51:10', '2021-01-13 20:51:10'),
(7, 4, 1, 'hello', 'sent', '2021-01-13 20:52:13', '2021-01-13 20:52:13'),
(8, 4, 1, 'hello', 'sent', '2021-01-13 20:52:20', '2021-01-13 20:52:20'),
(9, 4, 1, 'hello', 'sent', '2021-01-13 20:52:23', '2021-01-13 20:52:23'),
(10, 4, 1, 'test', 'sent', '2021-01-13 22:10:55', '2021-01-13 22:10:55'),
(11, 4, 1, 'test', 'sent', '2021-01-13 22:11:36', '2021-01-13 22:11:36'),
(12, 4, 1, 'test', 'sent', '2021-01-13 22:12:16', '2021-01-13 22:12:16'),
(13, 4, 1, 'test', 'sent', '2021-01-13 22:12:41', '2021-01-13 22:12:41'),
(14, 4, 1, 'vcv', 'sent', '2021-01-13 22:14:13', '2021-01-13 22:14:13'),
(15, 4, 1, 'gvfdv', 'sent', '2021-01-13 22:20:29', '2021-01-13 22:20:29'),
(16, 4, 1, 'gvfdv', 'sent', '2021-01-13 22:26:34', '2021-01-13 22:26:34'),
(17, 4, 1, 'gvfdv', 'sent', '2021-01-13 22:28:08', '2021-01-13 22:28:08'),
(18, 4, 1, 'gvfdv', 'sent', '2021-01-13 22:31:04', '2021-01-13 22:31:04'),
(19, 4, 1, 'gvfdv', 'sent', '2021-01-13 22:32:40', '2021-01-13 22:32:40'),
(20, 4, 1, 'gvfdv', 'sent', '2021-01-13 22:32:47', '2021-01-13 22:32:47'),
(21, 4, 1, 'hk', 'sent', '2021-01-13 22:35:30', '2021-01-13 22:35:30'),
(22, 4, 1, 'hk', 'sent', '2021-01-13 22:36:33', '2021-01-13 22:36:33'),
(23, 4, 1, 'hk', 'sent', '2021-01-13 22:39:26', '2021-01-13 22:39:26'),
(24, 4, 1, 'hk', 'sent', '2021-01-13 22:48:24', '2021-01-13 22:48:24'),
(25, 4, 1, 'hk', 'sent', '2021-01-13 22:56:44', '2021-01-13 22:56:44'),
(26, 4, 1, 'vfvf', 'sent', '2021-01-13 23:01:53', '2021-01-13 23:01:53'),
(27, 4, 1, '', 'sent', '2021-01-13 23:02:01', '2021-01-13 23:02:01'),
(28, 4, 1, 'hjkkj', 'sent', '2021-01-13 23:04:29', '2021-01-13 23:04:29'),
(29, 4, 1, 'hjkkj', 'sent', '2021-01-13 23:05:13', '2021-01-13 23:05:13'),
(30, 4, 1, 'hjkkj', 'sent', '2021-01-13 23:05:56', '2021-01-13 23:05:56'),
(31, 4, 1, 'hjkkj', 'sent', '2021-01-13 23:06:23', '2021-01-13 23:06:23'),
(32, 4, 1, 'hjkkj', 'sent', '2021-01-13 23:08:01', '2021-01-13 23:08:01'),
(33, 4, 1, 'hjkkj', 'sent', '2021-01-13 23:09:13', '2021-01-13 23:09:13'),
(34, 4, 1, 'hjkkj', 'sent', '2021-01-13 23:10:02', '2021-01-13 23:10:02'),
(35, 4, 1, 'hjkkj', 'sent', '2021-01-13 23:10:23', '2021-01-13 23:10:23'),
(36, 4, 1, 'hjkkj', 'sent', '2021-01-13 23:11:06', '2021-01-13 23:11:06'),
(37, 4, 1, 'hjkkj', 'sent', '2021-01-13 23:12:56', '2021-01-13 23:12:56'),
(38, 4, 1, 'hjkkj', 'sent', '2021-01-13 23:13:09', '2021-01-13 23:13:09'),
(39, 4, 1, 'hjkkj', 'sent', '2021-01-13 23:13:33', '2021-01-13 23:13:33'),
(40, 4, 1, 'hjkkj', 'sent', '2021-01-13 23:14:36', '2021-01-13 23:14:36'),
(41, 4, 1, 'hjkkj', 'sent', '2021-01-13 23:18:33', '2021-01-13 23:18:33'),
(42, 4, 1, 'hjkkj', 'sent', '2021-01-13 23:19:19', '2021-01-13 23:19:19'),
(43, 4, 1, 'hjkkj', 'sent', '2021-01-13 23:20:08', '2021-01-13 23:20:08'),
(44, 4, 1, 'hjkkj', 'sent', '2021-01-13 23:23:20', '2021-01-13 23:23:20'),
(45, 4, 1, 'hjkkj', 'sent', '2021-01-13 23:24:11', '2021-01-13 23:24:11'),
(46, 4, 1, 'hjkkj', 'sent', '2021-01-13 23:24:24', '2021-01-13 23:24:24'),
(47, 4, 1, 'hjkkj', 'sent', '2021-01-13 23:26:19', '2021-01-13 23:26:19'),
(48, 4, 1, 'hjkkj', 'sent', '2021-01-13 23:26:28', '2021-01-13 23:26:28'),
(49, 4, 1, 'hjkkj', 'sent', '2021-01-13 23:27:06', '2021-01-13 23:27:06'),
(50, 4, 1, 'hjkkj', 'sent', '2021-01-13 23:27:24', '2021-01-13 23:27:24'),
(51, 4, 1, 'hjkkj', 'sent', '2021-01-13 23:27:52', '2021-01-13 23:27:52'),
(52, 4, 1, 'hjkkj', 'sent', '2021-01-13 23:30:46', '2021-01-13 23:30:46'),
(53, 4, 1, 'hjkkj', 'sent', '2021-01-13 23:31:39', '2021-01-13 23:31:39'),
(54, 4, 1, 'vfvfdvbfv', 'sent', '2021-01-13 23:33:33', '2021-01-13 23:33:33'),
(55, 4, 1, 'vfvfdvbfv', 'sent', '2021-01-13 23:36:57', '2021-01-13 23:36:57'),
(56, 4, 1, 'vfvfdvbfv', 'sent', '2021-01-13 23:38:06', '2021-01-13 23:38:06'),
(57, 4, 1, 'vfvfdvbfv', 'sent', '2021-01-13 23:39:11', '2021-01-13 23:39:11'),
(58, 4, 1, 'vfvfdvbfv', 'sent', '2021-01-13 23:41:27', '2021-01-13 23:41:27'),
(59, 4, 1, 'mkl;l', 'sent', '2021-01-14 00:05:13', '2021-01-14 00:05:13'),
(60, 4, 1, 'cdcfd', 'sent', '2021-01-14 01:09:56', '2021-01-14 01:09:56'),
(61, 4, 1, 'cdcfdcdcd', 'sent', '2021-01-14 01:10:10', '2021-01-14 01:10:10'),
(62, 4, 1, 'cdcfdcdcd', 'sent', '2021-01-14 01:10:55', '2021-01-14 01:10:55'),
(63, 4, 1, 'vcvc', 'sent', '2021-01-14 01:11:34', '2021-01-14 01:11:34'),
(64, 4, 1, 'vcvc', 'sent', '2021-01-14 01:12:16', '2021-01-14 01:12:16'),
(65, 1, 4, 'dayt tra loiw day', 'sent', '2021-01-14 01:14:27', '2021-01-14 01:14:27'),
(66, 1, 4, 'cdscds', 'sent', '2021-01-14 01:15:06', '2021-01-14 01:15:06'),
(67, 4, 1, 'sao lau the', 'sent', '2021-01-14 01:15:40', '2021-01-14 01:15:40'),
(68, 1, 4, 'an com', 'sent', '2021-01-14 01:16:16', '2021-01-14 01:16:16'),
(69, 4, 1, 'test ting', 'sent', '2021-01-14 01:16:27', '2021-01-14 01:16:27'),
(70, 1, 4, 'ehhe', 'sent', '2021-01-14 01:17:04', '2021-01-14 01:17:04'),
(71, 1, 4, 'ok ok', 'sent', '2021-01-14 01:24:13', '2021-01-14 01:24:13'),
(72, 1, 4, 'hi', 'sent', '2021-01-17 19:01:32', '2021-01-17 19:01:32'),
(73, 1, 4, 'hi', 'sent', '2021-01-17 19:02:56', '2021-01-17 19:02:56'),
(74, 1, 4, 'hehe', 'sent', '2021-01-17 19:03:25', '2021-01-17 19:03:25'),
(75, 1, 4, 'hehe', 'sent', '2021-01-17 19:03:59', '2021-01-17 19:03:59'),
(76, 1, 4, '123456', 'sent', '2021-01-17 19:28:17', '2021-01-17 19:28:17');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_12_07_122845_create_oauth_providers_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2021_01_08_023953_add_avatar_column_to_users_table', 2),
(6, '2019_12_14_000001_create_personal_access_tokens_table', 3),
(7, '2021_01_11_013833_add_api_token_column_to_users_table', 4),
(9, '2021_01_11_031129_create_posts_table', 5),
(10, '2021_01_14_021033_create_chats_table', 6),
(11, '2021_01_14_053408_create_cache_table', 7),
(12, '2021_01_28_020919_create_categories_table', 8),
(13, '2021_01_28_021108_create_posts_categories_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_providers`
--

CREATE TABLE `oauth_providers` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refresh_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `slug`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(8, 'eFootball PES 2020 Chelsea Kits 2021 by AerialEdson', 'vrffdsvfgdv', 'efootball-pes-2020-chelsea-kits-2021-by-aerialedson', '1', 1, '2021-01-27 22:06:26', '2021-01-27 23:44:38'),
(9, 'eFootball PES 2020 Chelsea Kits 2021 by AerialEdson', 'vsvsvfs', 'efootball-pes-2020-chelsea-kits-2021-by-aerialedson', '0', 1, '2021-01-27 22:07:20', '2021-01-27 23:44:38'),
(10, 'vzsxvcxv', 'vcxzvcxv', 'vzsxvcxv', '0', 4, '2021-01-27 22:50:17', '2021-01-27 23:44:38'),
(11, 'vfsdvfsdgbvggb', 'bvfdgbgdbbgdb', 'vfsdvfsdgbvggb', '1', 4, '2021-01-27 23:23:37', '2021-01-27 23:44:38'),
(12, 'vfvbfdgbgdfv', 'bgvcxbcvxb', 'vfvbfdgbgdfv', '0', 1, '2021-01-27 23:25:42', '2021-01-27 23:44:38'),
(13, 'cdvcfdcsv', 'vfczvcfzsxvcx', 'cdvcfdcsv', '0', 1, '2021-01-27 23:31:22', '2021-01-27 23:44:38'),
(14, 'fjdosikfjdfiokc', 'v;\'f\\;gf[\'bv;gf[]', 'fjdosikfjdfiokc', '0', 1, '2021-01-27 23:38:28', '2021-01-27 23:44:38'),
(15, 'vdscv', 'vcxzvcxvcfx', 'vdscv', '0', 1, '2021-01-28 02:34:34', '2021-01-28 02:34:34');

-- --------------------------------------------------------

--
-- Table structure for table `posts_categories`
--

CREATE TABLE `posts_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts_categories`
--

INSERT INTO `posts_categories` (`id`, `post_id`, `category_id`) VALUES
(5, 10, 1),
(8, 12, 3),
(9, 12, 4),
(10, 13, 1),
(11, 13, 2),
(12, 13, 3),
(13, 13, 4),
(14, 14, 2),
(16, 8, 3),
(17, 15, 1),
(18, 15, 2),
(19, 15, 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'User 0', 'user@dev', 'public/avatars/x2rgysivIeyqflwgrVp8zuQaRW9g1mLGV3GJrt6n.jpeg', NULL, '$2y$10$UYjQhqCOoJkKchq4V2bT5.I2kSwnxmBotyre2pUrbmQHx3mMGT28C', NULL, '2021-01-07 19:22:55', '2021-01-28 01:38:33'),
(4, 'User 1', 'user1@dev', NULL, NULL, '$2y$10$lrs5b2DiBIR0aoStpeG80eTYxDdKVx4HjrwW87l39PcfdGvzNAQQ6', NULL, '2021-01-13 19:05:58', '2021-01-13 19:05:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD UNIQUE KEY `cache_key_unique` (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chats_sender_id_index` (`sender_id`),
  ADD KEY `chats_receiver_id_index` (`receiver_id`),
  ADD KEY `chats_sender_id_receiver_id_index` (`sender_id`,`receiver_id`);

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
-- Indexes for table `oauth_providers`
--
ALTER TABLE `oauth_providers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_providers_user_id_foreign` (`user_id`),
  ADD KEY `oauth_providers_provider_user_id_index` (`provider_user_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_index` (`user_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `posts_categories`
--
ALTER TABLE `posts_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_categories_post_id_index` (`post_id`),
  ADD KEY `posts_categories_category_id_index` (`category_id`);

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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `oauth_providers`
--
ALTER TABLE `oauth_providers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `posts_categories`
--
ALTER TABLE `posts_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `chats_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chats_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `oauth_providers`
--
ALTER TABLE `oauth_providers`
  ADD CONSTRAINT `oauth_providers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts_categories`
--
ALTER TABLE `posts_categories`
  ADD CONSTRAINT `posts_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_categories_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
