-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2023 at 09:28 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.3.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laundry_3`
--

-- --------------------------------------------------------

--
-- Table structure for table `checkout_kilos`
--

CREATE TABLE `checkout_kilos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kd_invoice` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kd_paket` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `berat_barang` int(11) NOT NULL,
  `metode_pembayaran` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga_paket` bigint(20) NOT NULL,
  `harga_antar` bigint(20) NOT NULL DEFAULT 0,
  `harga_total` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `checkout_kilos`
--

INSERT INTO `checkout_kilos` (`id`, `kd_invoice`, `kd_paket`, `berat_barang`, `metode_pembayaran`, `harga_paket`, `harga_antar`, `harga_total`, `created_at`, `updated_at`) VALUES
(1, 'I0001', 'PK001', 1, 'outlet', 5000, 0, 5000, '2023-06-07 05:49:39', '2023-06-07 05:49:39'),
(3, 'I0003', 'PK001', 1, 'rumah', 5000, 0, 5000, '2023-06-08 15:31:30', '2023-06-08 15:31:30'),
(5, 'I0004', 'PK007', 2, 'rumah', 14000, 0, 14000, '2023-06-17 11:27:50', '2023-06-17 11:27:50'),
(6, 'I0005', 'PK009', 1, 'rumah', 8000, 0, 8000, '2023-06-17 12:02:09', '2023-06-17 12:02:09'),
(7, 'I0006', 'PK011', 1, 'outlet', 9000, 1000, 10000, '2023-06-17 12:13:41', '2023-06-17 12:13:41'),
(8, 'I0007', 'PK002', 4, 'rumah', 24000, 0, 24000, '2023-06-17 12:27:20', '2023-06-17 12:27:20'),
(10, 'I0008', 'PK005', 3, 'outlet', 21000, 0, 21000, '2023-06-17 13:13:51', '2023-06-17 13:13:51'),
(11, 'I0009', 'PK005', 1, 'rumah', 7000, 0, 7000, '2023-06-20 09:38:19', '2023-06-20 09:38:19'),
(12, 'I0010', 'PK005', 2, 'rumah', 14000, 0, 14000, '2023-06-20 10:37:56', '2023-06-20 10:37:56'),
(13, 'I0011', 'PK005', 3, 'rumah', 21000, 0, 21000, '2023-06-20 22:54:30', '2023-06-20 22:54:30'),
(14, 'I0012', 'PK011', 3, 'outlet', 27000, 0, 27000, '2023-06-20 23:01:33', '2023-06-20 23:01:33');

-- --------------------------------------------------------

--
-- Table structure for table `checkout_satus`
--

CREATE TABLE `checkout_satus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kd_invoice` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kd_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah_barang` int(11) NOT NULL,
  `metode_pembayaran` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga_barang` bigint(20) NOT NULL,
  `harga_antar` bigint(20) NOT NULL DEFAULT 0,
  `harga_total` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_03_31_075733_create_outlet_table', 1),
(5, '2020_04_01_152610_create_paket_kilo_table', 1),
(6, '2020_04_01_152619_create_paket_satu_table', 1),
(7, '2020_04_03_101118_create_pelanggan_table', 1),
(8, '2020_04_08_220339_create_checkout_kilo_table', 1),
(9, '2020_04_08_220348_create_checkout_satu_table', 1),
(10, '2020_04_08_221537_create_transaksi_table', 1),
(11, '2020_04_08_223620_create_struk_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `outlets`
--

CREATE TABLE `outlets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hotline` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `outlets`
--

INSERT INTO `outlets` (`id`, `nama`, `alamat`, `hotline`, `email`, `created_at`, `updated_at`) VALUES
(1, 'SafaQua Batam', 'Kota Batam, Kepulauan Riau', '08123', 'safaquabatam@gmail.com', '2023-06-06 23:43:41', '2023-06-07 04:04:22'),
(2, 'SafaQua Pekanbaru', 'Kota Pekanbaru, Riau', '08456', 'safaquapekanbaru@gmail.com', '2023-06-06 23:59:36', '2023-06-07 04:04:57'),
(3, 'SafaQua Jakarta', 'Provinsi DKI Jakarta', '08789', 'safaquajakarta@gmail.com', '2023-06-07 04:08:18', '2023-06-07 04:08:18'),
(4, 'SafaQua Bandung', 'Kota Bandung, Provinsi Jawa Barat', '081234567890', 'safaquabandung@gmail.com', '2023-06-09 04:48:34', '2023-06-09 04:48:34');

-- --------------------------------------------------------

--
-- Table structure for table `paket_kilos`
--

CREATE TABLE `paket_kilos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kd_paket` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_paket` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga_paket` bigint(20) NOT NULL,
  `min_berat_paket` int(11) NOT NULL,
  `antar_jemput_paket` tinyint(1) NOT NULL DEFAULT 0,
  `id_outlet` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `paket_kilos`
--

INSERT INTO `paket_kilos` (`id`, `kd_paket`, `nama_paket`, `harga_paket`, `min_berat_paket`, `antar_jemput_paket`, `id_outlet`, `created_at`, `updated_at`) VALUES
(1, 'PK001', 'Air Mineral', 6000, 1, 1, 1, '2023-06-07 05:46:50', '2023-06-12 21:10:28'),
(3, 'PK002', 'Air Mineral', 6000, 1, 1, 2, '2023-06-12 21:10:12', '2023-06-12 21:10:12'),
(4, 'PK003', 'Air Mineral', 6000, 1, 1, 3, '2023-06-12 21:45:22', '2023-06-12 21:45:22'),
(6, 'PK004', 'Air Mineral', 6000, 1, 1, 4, '2023-06-12 21:57:03', '2023-06-12 22:00:40'),
(7, 'PK005', 'Bio Energi', 7000, 1, 1, 1, '2023-06-12 22:17:15', '2023-06-12 22:17:15'),
(8, 'PK006', 'Bio Energi', 7000, 1, 1, 2, '2023-06-12 22:17:35', '2023-06-12 22:17:35'),
(9, 'PK007', 'Bio Energi', 7000, 1, 1, 3, '2023-06-12 22:20:04', '2023-06-12 22:20:04'),
(10, 'PK008', 'Bio Energi', 7000, 1, 1, 4, '2023-06-12 22:20:28', '2023-06-12 22:20:28'),
(11, 'PK009', 'Hexagonal Alkali', 8000, 1, 1, 1, '2023-06-12 22:20:54', '2023-06-12 22:20:54'),
(12, 'PK010', 'Hexagonal Alkali', 8000, 1, 0, 2, '2023-06-12 22:21:17', '2023-06-12 22:33:01'),
(13, 'PK011', 'Reverse Osmosis', 9000, 1, 0, 3, '2023-06-12 22:21:42', '2023-06-12 22:21:42');

-- --------------------------------------------------------

--
-- Table structure for table `paket_satus`
--

CREATE TABLE `paket_satus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kd_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ket_barang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `harga_barang` bigint(20) NOT NULL,
  `id_outlet` int(11) NOT NULL,
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
-- Table structure for table `pelanggans`
--

CREATE TABLE `pelanggans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kd_pelanggan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_pelanggan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jk_pelanggan` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_pelanggan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp_pelanggan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat_pelanggan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cek_member` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pelanggans`
--

INSERT INTO `pelanggans` (`id`, `kd_pelanggan`, `nama_pelanggan`, `jk_pelanggan`, `email_pelanggan`, `no_hp_pelanggan`, `alamat_pelanggan`, `cek_member`, `password`, `created_at`, `updated_at`) VALUES
(1, 'K0001', 'jak', 'L', 'jakaja@gmail.com', '083216549870', 'Legenda Malaka, Batam Centre', 'member', 'jakaja123', '2023-06-07 05:49:39', '2023-06-07 05:49:39'),
(2, 'K0002', 'gil', 'L', 'gil@gmail.com', '081234567890', 'Kp. Tua Batu Besar', 'non_member', 'gilaja123', '2023-06-08 15:31:30', '2023-06-08 15:31:30'),
(3, 'K0003', 'pelanggan test3', 'P', 'pelanggantest3@gmail.com', '081234567890', 'pelanggan test3', 'member', 'pelanggantest3aja', '2023-06-17 11:27:50', '2023-06-17 11:27:50'),
(4, 'K0004', 'pelanggan test 3', 'P', 'pelanggantest3@gmail.com', '081234567890', 'Labuh Baru, Pekanbaru', 'non_member', 'pelanggantest3aja', '2023-06-17 12:02:09', '2023-06-17 12:02:09');

-- --------------------------------------------------------

--
-- Table structure for table `struks`
--

CREATE TABLE `struks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kd_invoice` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga_total` bigint(20) NOT NULL,
  `harga_bayar` bigint(20) NOT NULL,
  `harga_kembali` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `struks`
--

INSERT INTO `struks` (`id`, `kd_invoice`, `harga_total`, `harga_bayar`, `harga_kembali`, `created_at`, `updated_at`) VALUES
(1, 'I0001', 5000, 5000, 0, '2023-06-07 05:49:39', '2023-06-07 05:49:39'),
(2, 'I0003', 5000, 5000, 0, '2023-06-13 00:07:25', '2023-06-13 00:07:25'),
(3, 'I0005', 8000, 9000, 1000, '2023-06-17 12:04:55', '2023-06-17 12:04:55'),
(4, 'I0006', 10000, 15000, 5000, '2023-06-17 12:13:40', '2023-06-17 12:13:40'),
(5, 'I0004', 14000, 15000, 1000, '2023-06-17 12:28:14', '2023-06-17 12:28:14'),
(6, 'I0008', 21000, 25000, 4000, '2023-06-17 13:13:50', '2023-06-17 13:13:50'),
(7, 'I0007', 24000, 30000, 6000, '2023-06-17 13:24:02', '2023-06-17 13:24:02'),
(8, 'I0007', 24000, 30000, 6000, '2023-06-17 13:24:03', '2023-06-17 13:24:03'),
(9, 'I0012', 27000, 50000, 23000, '2023-06-20 23:01:32', '2023-06-20 23:01:32'),
(10, 'I0011', 21000, 30000, 9000, '2023-06-20 23:21:02', '2023-06-20 23:21:02'),
(11, 'I0011', 21000, 30000, 9000, '2023-06-20 23:21:03', '2023-06-20 23:21:03'),
(12, 'I0010', 14000, 15000, 1000, '2023-06-20 23:21:12', '2023-06-20 23:21:12'),
(13, 'I0009', 7000, 10000, 3000, '2023-06-20 23:21:22', '2023-06-20 23:21:22');

-- --------------------------------------------------------

--
-- Table structure for table `transaksis`
--

CREATE TABLE `transaksis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_outlet` int(11) NOT NULL,
  `kd_invoice` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kd_pelanggan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_pemberian` date NOT NULL,
  `tgl_selesai` date DEFAULT NULL,
  `tgl_bayar` date DEFAULT NULL,
  `diskon` int(11) DEFAULT NULL,
  `pajak` bigint(20) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ket_bayar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kd_pegawai` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaksis`
--

INSERT INTO `transaksis` (`id`, `id_outlet`, `kd_invoice`, `kd_pelanggan`, `tgl_pemberian`, `tgl_selesai`, `tgl_bayar`, `diskon`, `pajak`, `status`, `ket_bayar`, `kd_pegawai`, `created_at`, `updated_at`) VALUES
(1, 1, 'I0001', 'K0001', '2023-06-07', '2023-06-08', '2023-06-07', 0, 0, 'diambil', 'dibayar', 'U0001', '2023-06-07 05:49:39', '2023-06-17 11:52:06'),
(3, 1, 'I0003', 'K0002', '2023-06-08', '2023-06-08', '2023-06-13', 0, 0, 'diambil', 'dibayar', 'U0001', '2023-06-08 15:31:29', '2023-06-17 12:10:55'),
(5, 3, 'I0004', 'K0003', '2023-06-17', '2023-06-17', '2023-06-17', 0, 0, 'diambil', 'dibayar', 'U0003', '2023-06-17 11:27:50', '2023-06-17 13:28:26'),
(6, 1, 'I0005', 'K0004', '2023-06-17', '2023-06-17', '2023-06-17', 0, 0, 'diambil', 'dibayar', 'U0001', '2023-06-17 12:02:09', '2023-06-17 12:05:44'),
(7, 3, 'I0006', 'K0003', '2023-06-17', '2023-06-17', '2023-06-17', 0, 0, 'diambil', 'dibayar', 'U0001', '2023-06-17 12:13:40', '2023-06-17 13:28:09'),
(8, 2, 'I0007', 'K0003', '2023-06-17', '2023-06-17', '2023-06-17', 0, 0, 'diambil', 'dibayar', 'U0001', '2023-06-17 12:27:20', '2023-06-17 13:28:18'),
(10, 1, 'I0008', 'K0001', '2023-06-17', '2023-06-17', '2023-06-17', 0, 0, 'diambil', 'dibayar', 'U0001', '2023-06-17 13:13:51', '2023-06-17 13:18:07'),
(11, 1, 'I0009', 'K0001', '2023-06-20', '2023-06-21', '2023-06-21', 0, 0, 'diambil', 'dibayar', 'U0001', '2023-06-20 09:38:19', '2023-06-20 23:22:24'),
(12, 1, 'I0010', 'K0003', '2023-06-20', '2023-06-20', '2023-06-21', 0, 0, 'diantar', 'dibayar', 'U0001', '2023-06-20 10:37:56', '2023-06-20 23:21:12'),
(13, 1, 'I0011', 'K0001', '2023-06-21', '2023-06-21', '2023-06-21', 0, 0, 'diambil', 'dibayar', 'U0001', '2023-06-20 22:54:30', '2023-06-20 23:22:31'),
(14, 3, 'I0012', 'K0001', '2023-06-21', '2023-06-21', '2023-06-21', 0, 0, 'diambil', 'dibayar', 'U0001', '2023-06-20 23:01:32', '2023-06-20 23:20:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kd_pengguna` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_outlet` int(11) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `kd_pengguna`, `name`, `role`, `avatar`, `username`, `email_verified_at`, `password`, `id_outlet`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'U0001', 'admin', 'admin', 'Screenshot (2029).png', 'admin', NULL, '$2y$10$30ilV.oYpMmwlWQ2DRo6wOtcyfxUA7cTxp/X.8HObCe64qOWuLEmK', 0, 'dNFrKcbnSrvsfBMyaoTu2u0Esy2rqW8jJqVMVDPDBwTZtGdPTDkCqLHzcmIQ', '2023-06-06 23:51:18', '2023-06-06 23:51:18'),
(3, 'U0002', 'Kasir Batam', 'kasir', '1.png', 'tes2', NULL, '$2y$10$xp90RLmaOlrxP1ihoXH2zuWPW14/U0eOF.2qq.EiW4D9KYMkRokiC', 1, 'NJtUHmmZpsd9bj2H0wph2JmzhbSTBYkIRzkzEMP1I7ABsQDCrrFEn5zutXM8', '2023-06-06 23:53:22', '2023-06-12 18:23:40'),
(5, 'U0003', 'Kasir Pekanbaru', 'kasir', 'Screenshot (1869).png', 'test3', NULL, '$2y$10$34lfQZSrnmWxKq42exiRlO4ZHGeBsBrFqxWZBep6iNnBPM2f2Qv0K', 1, 'hRBMHaOtzllT5S0UvcCOpuQ2Q9B7Vq4ykGQw3ZLiaPC6nDYKpZmDBXMBsBlK', '2023-06-07 03:54:38', '2023-06-07 04:10:51'),
(6, 'U0004', 'Kasir Jakarta', 'kasir', 'Screenshot (1975).png', 'test4', NULL, '$2y$10$C30g1CQPlo3X9sMSeOt8AO7PtvP/.wF9QrfdUjxeIubyhjh9KJUOK', 3, 'zO0dIPwaBCMMACattoBkZ5ZChMAgIvit5Y8IoEKgOCk0jxp5tiOs3mcUGYqe', '2023-06-07 03:58:44', '2023-06-07 05:36:38'),
(8, 'K0001', 'jak', 'member', 'default.png', 'jak', NULL, '$2y$10$yzZoD0ma5/AaueDHE4uBkuMkFpR9rOCTN3naDHxMOcFyDeeViHqty', 0, 'd11hFCXBy6g9wJDmfebcoFN72aabeNGSiNJo41DJFrnJJmUEnMZSM3z5AjKL', '2023-06-07 05:49:39', '2023-06-07 05:49:39'),
(9, 'K0002', 'gil', 'non_member', 'default.png', 'gil', NULL, '$2y$10$k27IXtyWa/aS7csUjp0I1enHi0fLp.UFxQUgHtvleXNCfJY4XtJDi', 0, 'uJZDevJfGaohHSDhk5Ho6Of0Fb3tyyc44Mq33E6L7p8MDPmDAj1vJRvUe1iJ', '2023-06-08 15:31:30', '2023-06-08 15:31:30'),
(10, 'U0005', 'Kasir Bandung', 'kasir', 'Screenshot (2022).png', 'tes5', NULL, '$2y$10$ptgXlTaEwzyQr2yP6As9tepoYl7iI049HWaeisVfdKDJ0w3403Vf6', 4, '5dZhLGpNr4JDOWjXY8PZlYh2TgFX2wCXcRzWNuacYf3onQ5zfZacjeXHY9gw', '2023-06-09 04:50:39', '2023-06-12 23:52:53'),
(12, 'K0003', 'pelanggan test3', 'member', 'default.png', 'pelanggan test3', NULL, '$2y$10$8NcxIMSa/JFXBmiHwPaKS.Wq.yZVMNA6Y5HpNynA6MiKXN/9uax9m', 0, 'O9SpL829jVJ7E2svt3Q7bedcTQKru6U2LgDJAvNrS8oI9qKYNlFxni7iQtA8', '2023-06-17 11:27:50', '2023-06-17 11:27:50'),
(13, 'K0004', 'pelanggan test 3', 'non_member', 'default.png', 'pelanggantest3', NULL, '$2y$10$0PMgBiYA1zb7PQPP9aeNNOS30Qk25i4AP1VKvFhiExdqSi8J4MfT.', 0, 'VqjzHXMjmqiYR4rdvi3QX8okM7O9jfqTfujDI2v5t34ryFh1EEFMBI0y0Cce', '2023-06-17 12:02:09', '2023-06-17 12:02:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `checkout_kilos`
--
ALTER TABLE `checkout_kilos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `checkout_satus`
--
ALTER TABLE `checkout_satus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `outlets`
--
ALTER TABLE `outlets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paket_kilos`
--
ALTER TABLE `paket_kilos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paket_satus`
--
ALTER TABLE `paket_satus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `pelanggans`
--
ALTER TABLE `pelanggans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `struks`
--
ALTER TABLE `struks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksis`
--
ALTER TABLE `transaksis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `checkout_kilos`
--
ALTER TABLE `checkout_kilos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `checkout_satus`
--
ALTER TABLE `checkout_satus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `outlets`
--
ALTER TABLE `outlets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `paket_kilos`
--
ALTER TABLE `paket_kilos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `paket_satus`
--
ALTER TABLE `paket_satus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pelanggans`
--
ALTER TABLE `pelanggans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `struks`
--
ALTER TABLE `struks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `transaksis`
--
ALTER TABLE `transaksis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
