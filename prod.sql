-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2025 at 04:35 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prod`
--

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `group_id` int(11) NOT NULL,
  `group_name` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Stores production group information (A, B, C)';

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`group_id`, `group_name`, `created_at`, `updated_at`) VALUES
(1, 'Group A', '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(2, 'Group B', '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(3, 'Group C', '2025-05-27 19:55:47', '2025-05-27 19:55:47');

-- --------------------------------------------------------

--
-- Table structure for table `hourly_ng_details`
--

CREATE TABLE `hourly_ng_details` (
  `hourly_ng_id` bigint(20) NOT NULL,
  `hourly_data_id` bigint(20) NOT NULL,
  `ng_type_id` int(11) NOT NULL,
  `ng_quantity` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Stores Not Good (defect) quantities for each hour';

--
-- Dumping data for table `hourly_ng_details`
--

INSERT INTO `hourly_ng_details` (`hourly_ng_id`, `hourly_data_id`, `ng_type_id`, `ng_quantity`) VALUES
(17, 25, 4, 1),
(18, 25, 6, 4),
(19, 26, 4, 2),
(20, 26, 6, 8),
(21, 27, 3, 5),
(22, 27, 6, 5);

-- --------------------------------------------------------

--
-- Table structure for table `hourly_production_data`
--

CREATE TABLE `hourly_production_data` (
  `hourly_data_id` bigint(20) NOT NULL,
  `report_id` bigint(20) NOT NULL,
  `time_period_start` time NOT NULL,
  `time_period_end` time NOT NULL,
  `planned_stop_minutes` int(11) DEFAULT 0,
  `model_id` int(11) DEFAULT NULL,
  `work_order_number` varchar(100) DEFAULT NULL,
  `recorded_model_cycle_time_seconds` decimal(10,2) NOT NULL COMMENT 'Cycle time of the model used for this hour record',
  `target_quantity` int(11) DEFAULT 0,
  `actual_quantity` int(11) DEFAULT 0,
  `cumulative_target_at_period_end` int(11) DEFAULT 0,
  `cumulative_actual_at_period_end` int(11) DEFAULT 0,
  `notes` text DEFAULT NULL COMMENT 'Corresponds to Keterangan field',
  `entry_timestamp` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Stores details from each row of the production table per hour';

--
-- Dumping data for table `hourly_production_data`
--

INSERT INTO `hourly_production_data` (`hourly_data_id`, `report_id`, `time_period_start`, `time_period_end`, `planned_stop_minutes`, `model_id`, `work_order_number`, `recorded_model_cycle_time_seconds`, `target_quantity`, `actual_quantity`, `cumulative_target_at_period_end`, `cumulative_actual_at_period_end`, `notes`, `entry_timestamp`) VALUES
(25, 6, '07:50:00', '08:00:00', 0, 2, '001', 30.00, 20, 15, 0, 0, NULL, '2025-05-28 05:15:33'),
(26, 6, '08:00:00', '09:00:00', 0, 2, '001', 30.00, 120, 100, 0, 0, NULL, '2025-05-28 05:15:33'),
(27, 6, '09:00:00', '10:00:00', 0, 2, '001', 30.00, 120, 110, 0, 0, NULL, '2025-05-28 05:15:33'),
(28, 6, '10:00:00', '11:00:00', 0, NULL, NULL, 0.00, 0, 0, 0, 0, NULL, '2025-05-28 05:15:33'),
(29, 6, '11:00:00', '12:00:00', 0, NULL, NULL, 0.00, 0, 0, 0, 0, NULL, '2025-05-28 05:15:33'),
(30, 6, '12:00:00', '13:00:00', 0, NULL, NULL, 0.00, 0, 0, 0, 0, NULL, '2025-05-28 05:15:33'),
(31, 6, '13:00:00', '14:00:00', 0, NULL, NULL, 0.00, 0, 0, 0, 0, NULL, '2025-05-28 05:15:33'),
(32, 6, '14:00:00', '15:00:00', 0, NULL, NULL, 0.00, 0, 0, 0, 0, NULL, '2025-05-28 05:15:33'),
(33, 6, '15:00:00', '16:00:00', 0, NULL, NULL, 0.00, 0, 0, 0, 0, NULL, '2025-05-28 05:15:33'),
(34, 6, '16:00:00', '17:00:00', 0, NULL, NULL, 0.00, 0, 0, 0, 0, NULL, '2025-05-28 05:15:33');

-- --------------------------------------------------------

--
-- Table structure for table `hourly_stoploss_details`
--

CREATE TABLE `hourly_stoploss_details` (
  `hourly_stoploss_id` bigint(20) NOT NULL,
  `hourly_data_id` bigint(20) NOT NULL,
  `stoploss_type_id` int(11) NOT NULL,
  `stoploss_minutes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Stores stoploss minutes and reasons for each hour';

-- --------------------------------------------------------

--
-- Table structure for table `lines`
--

CREATE TABLE `lines` (
  `line_id` int(11) NOT NULL,
  `line_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Stores information about production lines';

--
-- Dumping data for table `lines`
--

INSERT INTO `lines` (`line_id`, `line_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'CCU', 'Connection Control Unit Assembly', '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(2, 'FUEL SENDER', 'Fuel Sender Assembly Line', '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(3, 'USB CHARGER', 'USB Charger Production', '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(4, 'SPEEDO DIGITAL SUB ASSY', 'Speedometer Digital Sub Assembly', '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(5, 'ANTIFOG AUTO SPRAY', 'Antifog Auto Spray Line', '2025-05-27 19:55:47', '2025-05-27 19:55:47');

-- --------------------------------------------------------

--
-- Table structure for table `models`
--

CREATE TABLE `models` (
  `model_id` int(11) NOT NULL,
  `line_id` int(11) NOT NULL COMMENT 'Model specific to a certain line',
  `model_name` varchar(100) NOT NULL,
  `standard_cycle_time_seconds` decimal(10,2) NOT NULL COMMENT 'Standard cycle time in seconds',
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Stores product model information';

--
-- Dumping data for table `models`
--

INSERT INTO `models` (`model_id`, `line_id`, `model_name`, `standard_cycle_time_seconds`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'CCU-K1ZG', 28.00, 'CCU Model K1ZG Variant Honda', '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(2, 1, 'CCU-K0FG', 30.00, 'CCU Model K0FG Variant Yamaha', '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(3, 2, 'FS-K1A-XYZ', 45.00, 'Fuel Sender Model K1A Type XYZ', '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(4, 2, 'FS-K2B-ABC', 50.00, 'Fuel Sender Model K2B Type ABC', '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(5, 3, 'USB-C-PD20W', 60.00, 'USB Type C PD 20W Charger', '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(6, 3, 'USB-A-QC3', 55.00, 'USB Type A QuickCharge 3.0 Charger', '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(7, 4, 'SPD-DGT-001', 120.00, 'Speedo Digital Model 001', '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(8, 5, 'ANTFG-SPRAY-V1', 40.00, 'Antifog Auto Spray Version 1', '2025-05-27 19:55:47', '2025-05-27 19:55:47');

-- --------------------------------------------------------

--
-- Table structure for table `ng_types`
--

CREATE TABLE `ng_types` (
  `ng_type_id` int(11) NOT NULL,
  `ng_type_name` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Stores types of Not Good (defect) products';

--
-- Dumping data for table `ng_types`
--

INSERT INTO `ng_types` (`ng_type_id`, `ng_type_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'PCB Terbalik', 'Pemasangan PCB terbalik dari orientasi seharusnya', '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(2, 'Wire Terbalik', 'Kabel terpasang pada pin yang salah atau terbalik polaritas', '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(3, 'Nilai Voltage NG', 'Hasil tes output voltase tidak sesuai standar toleransi', '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(4, 'NG Material', 'Material komponen cacat dari supplier atau proses sebelumnya', '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(5, 'Solder Kurang Matang', 'Hasil solderan tidak sempurna, menyebabkan koneksi buruk', '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(6, 'Baret/Scratch', 'Cacat fisik pada permukaan produk', '2025-05-27 19:55:47', '2025-05-27 19:55:47');

-- --------------------------------------------------------

--
-- Table structure for table `personnel`
--

CREATE TABLE `personnel` (
  `personnel_id` int(11) NOT NULL,
  `employee_id_number` varchar(50) NOT NULL COMMENT 'e.g., NIK Karyawan',
  `full_name` varchar(150) NOT NULL,
  `role` enum('Sub Leader','Operator') NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Stores information about employees (Sub Leaders, Operators)';

--
-- Dumping data for table `personnel`
--

INSERT INTO `personnel` (`personnel_id`, `employee_id_number`, `full_name`, `role`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'SL001', 'Ahmad Subagja', 'Sub Leader', 1, '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(2, 'SL002', 'Budi Santoso', 'Sub Leader', 1, '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(3, 'SL003', 'Citra Dewi', 'Sub Leader', 1, '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(4, 'OP001', 'Eko Prasetyo', 'Operator', 1, '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(5, 'OP002', 'Fitriani Lestari', 'Operator', 1, '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(6, 'OP003', 'Gunawan Wibowo', 'Operator', 1, '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(7, 'OP004', 'Hesti Rahayu', 'Operator', 1, '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(8, 'OP005', 'Indra Kusuma', 'Operator', 1, '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(9, 'OP006', 'Joko Susilo', 'Operator', 1, '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(10, 'OP007', 'Kartika Sari', 'Operator', 1, '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(11, 'OP008', 'Lia Anggraini', 'Operator', 1, '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(12, 'OP009', 'Muhammad Rizky', 'Operator', 1, '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(13, 'OP010', 'Nadia Putri', 'Operator', 1, '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(14, 'OP011', 'Putu Gede', 'Operator', 1, '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(15, 'OP012', 'Rina Amelia', 'Operator', 1, '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(16, 'OP013', 'Siti Aminah', 'Operator', 1, '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(17, 'OP014', 'Tono Martono', 'Operator', 1, '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(18, 'OP015', 'Umar Abdullah', 'Operator', 1, '2025-05-27 19:55:47', '2025-05-27 19:55:47');

-- --------------------------------------------------------

--
-- Table structure for table `production_reports`
--

CREATE TABLE `production_reports` (
  `report_id` bigint(20) NOT NULL,
  `report_date` date NOT NULL,
  `line_id` int(11) NOT NULL,
  `shift_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `recorded_sub_leader_id` int(11) NOT NULL COMMENT 'Sub Leader recorded at the start of the shift',
  `system_created_at` timestamp NULL DEFAULT current_timestamp() COMMENT 'Timestamp of report creation in system',
  `system_updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('Draft','Submitted','Approved') DEFAULT 'Draft',
  `submitted_by_user_id` int(11) DEFAULT NULL COMMENT 'FK to a Users table, if user authentication is implemented'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Header information for each daily production report';

--
-- Dumping data for table `production_reports`
--

INSERT INTO `production_reports` (`report_id`, `report_date`, `line_id`, `shift_id`, `group_id`, `recorded_sub_leader_id`, `system_created_at`, `system_updated_at`, `status`, `submitted_by_user_id`) VALUES
(6, '2025-05-28', 1, 1, 1, 3, '2025-05-28 05:15:33', '2025-05-28 05:15:33', 'Submitted', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `report_operator_assignments`
--

CREATE TABLE `report_operator_assignments` (
  `assignment_id` bigint(20) NOT NULL,
  `report_id` bigint(20) NOT NULL,
  `operator_id` int(11) NOT NULL,
  `assigned_timestamp` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tracks operators assigned to a specific report (3-12 operators)';

-- --------------------------------------------------------

--
-- Table structure for table `report_personnel_changes_log`
--

CREATE TABLE `report_personnel_changes_log` (
  `log_id` bigint(20) NOT NULL,
  `report_id` bigint(20) NOT NULL,
  `personnel_type_changed` enum('Sub Leader','Operator') NOT NULL,
  `original_personnel_name` varchar(150) DEFAULT NULL COMMENT 'Nama personel asli, jika diganti dari input manual/non-sistem',
  `new_personnel_id` int(11) NOT NULL,
  `reason_for_change` text DEFAULT NULL,
  `change_recorded_at` timestamp NULL DEFAULT current_timestamp(),
  `effective_time_period` varchar(50) DEFAULT NULL COMMENT 'e.g., 09:00-10:00, when this change is effective'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Logs changes in Sub Leader or Operator during a shift';

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`permissions`)),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', '[\"manage_master_data\", \"manage_users\", \"input_production\"]', '2025-05-28 14:18:21', '2025-05-28 14:18:21'),
(2, 'Supervisor', '[\"manage_master_data\", \"input_production\"]', '2025-05-28 14:18:21', '2025-05-28 14:18:21'),
(3, 'Operator', '[\"input_production\"]', '2025-05-28 14:18:21', '2025-05-28 14:18:21');

-- --------------------------------------------------------

--
-- Table structure for table `shifts`
--

CREATE TABLE `shifts` (
  `shift_id` int(11) NOT NULL,
  `shift_name` varchar(100) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `description` varchar(255) DEFAULT NULL COMMENT 'e.g., 07:50-17:00',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Stores production shift information';

--
-- Dumping data for table `shifts`
--

INSERT INTO `shifts` (`shift_id`, `shift_name`, `start_time`, `end_time`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Non Shift', '07:50:00', '17:00:00', 'Non Shift (07:50-17:00)', '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(2, 'Shift 1', '07:00:00', '15:00:00', 'Shift 1 (07:00-15:00)', '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(3, 'Shift 2', '15:00:00', '22:40:00', 'Shift 2 (15:00-22:40)', '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(4, 'Shift 3', '22:40:00', '06:40:00', 'Shift 3 (22:40-06:40) Next Day', '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(5, 'Shift 1 Long', '07:00:00', '19:00:00', 'Shift 1 Long (07:00-19:00)', '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(6, 'Shift 2 Long', '19:00:00', '07:00:00', 'Shift 2 Long (19:00-07:00) Next Day', '2025-05-27 19:55:47', '2025-05-27 19:55:47');

-- --------------------------------------------------------

--
-- Table structure for table `stoploss_types`
--

CREATE TABLE `stoploss_types` (
  `stoploss_type_id` int(11) NOT NULL,
  `stoploss_type_name` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Stores types of production stoploss reasons';

--
-- Dumping data for table `stoploss_types`
--

INSERT INTO `stoploss_types` (`stoploss_type_id`, `stoploss_type_name`, `description`, `created_at`, `updated_at`) VALUES
(1, '5S', 'Kegiatan 5S/kebersihan area kerja', '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(2, 'Meeting Pagi', 'Briefing atau meeting koordinasi awal shift', '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(3, 'Trouble Mesin', 'Mesin produksi mengalami gangguan atau kerusakan', '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(4, 'Trouble Jig', 'Jig atau fixture alat bantu produksi bermasalah', '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(5, 'Tunggu Material', 'Menunggu suplai material atau komponen', '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(6, 'Mati Listrik', 'Pemadaman supply listrik', '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(7, 'Dandory', 'Persiapan atau setup pergantian model/produk', '2025-05-27 19:55:47', '2025-05-27 19:55:47'),
(8, 'Trial', 'Proses trial produk baru atau perbaikan', '2025-05-27 19:55:47', '2025-05-27 19:55:47');

-- --------------------------------------------------------

--
-- Table structure for table `subleader_line_responsibilities`
--

CREATE TABLE `subleader_line_responsibilities` (
  `responsibility_id` int(11) NOT NULL,
  `sub_leader_id` int(11) NOT NULL,
  `line_id` int(11) NOT NULL,
  `assigned_date` date NOT NULL COMMENT 'Tanggal mulai tanggung jawab',
  `ended_date` date DEFAULT NULL COMMENT 'Tanggal akhir tanggung jawab, jika ada',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Maps Sub Leaders to the Lines they are responsible for';

--
-- Dumping data for table `subleader_line_responsibilities`
--

INSERT INTO `subleader_line_responsibilities` (`responsibility_id`, `sub_leader_id`, `line_id`, `assigned_date`, `ended_date`, `created_at`) VALUES
(1, 1, 1, '2024-01-01', NULL, '2025-05-27 19:55:47'),
(2, 1, 2, '2024-01-01', NULL, '2025-05-27 19:55:47'),
(3, 2, 3, '2024-02-01', NULL, '2025-05-27 19:55:47'),
(4, 3, 4, '2024-03-01', NULL, '2025-05-27 19:55:47'),
(5, 3, 1, '2025-01-01', NULL, '2025-05-27 19:55:47');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password_hash`, `full_name`, `role_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Administrator', 1, 1, '2025-05-28 14:18:51', '2025-05-28 14:18:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`group_id`),
  ADD UNIQUE KEY `group_name_UNIQUE` (`group_name`);

--
-- Indexes for table `hourly_ng_details`
--
ALTER TABLE `hourly_ng_details`
  ADD PRIMARY KEY (`hourly_ng_id`),
  ADD UNIQUE KEY `uq_hourly_data_ng_type` (`hourly_data_id`,`ng_type_id`),
  ADD KEY `fk_Hourly_NG_Hourly_Data_idx` (`hourly_data_id`),
  ADD KEY `fk_Hourly_NG_NG_Types_idx` (`ng_type_id`);

--
-- Indexes for table `hourly_production_data`
--
ALTER TABLE `hourly_production_data`
  ADD PRIMARY KEY (`hourly_data_id`),
  ADD KEY `fk_Hourly_Prod_Data_Reports_idx` (`report_id`),
  ADD KEY `fk_Hourly_Prod_Data_Models_idx` (`model_id`);

--
-- Indexes for table `hourly_stoploss_details`
--
ALTER TABLE `hourly_stoploss_details`
  ADD PRIMARY KEY (`hourly_stoploss_id`),
  ADD UNIQUE KEY `uq_hourly_data_stoploss_type` (`hourly_data_id`,`stoploss_type_id`),
  ADD KEY `fk_Hourly_Stoploss_Hourly_Data_idx` (`hourly_data_id`),
  ADD KEY `fk_Hourly_Stoploss_Stoploss_Types_idx` (`stoploss_type_id`);

--
-- Indexes for table `lines`
--
ALTER TABLE `lines`
  ADD PRIMARY KEY (`line_id`),
  ADD UNIQUE KEY `line_name_UNIQUE` (`line_name`);

--
-- Indexes for table `models`
--
ALTER TABLE `models`
  ADD PRIMARY KEY (`model_id`),
  ADD UNIQUE KEY `uq_line_model_name` (`line_id`,`model_name`),
  ADD KEY `fk_Models_Lines_idx` (`line_id`);

--
-- Indexes for table `ng_types`
--
ALTER TABLE `ng_types`
  ADD PRIMARY KEY (`ng_type_id`),
  ADD UNIQUE KEY `ng_type_name_UNIQUE` (`ng_type_name`);

--
-- Indexes for table `personnel`
--
ALTER TABLE `personnel`
  ADD PRIMARY KEY (`personnel_id`),
  ADD UNIQUE KEY `employee_id_number_UNIQUE` (`employee_id_number`);

--
-- Indexes for table `production_reports`
--
ALTER TABLE `production_reports`
  ADD PRIMARY KEY (`report_id`),
  ADD UNIQUE KEY `uq_report_date_line_shift_group` (`report_date`,`line_id`,`shift_id`,`group_id`),
  ADD KEY `fk_Production_Reports_Lines_idx` (`line_id`),
  ADD KEY `fk_Production_Reports_Shifts_idx` (`shift_id`),
  ADD KEY `fk_Production_Reports_Groups_idx` (`group_id`),
  ADD KEY `fk_Production_Reports_Personnel_idx` (`recorded_sub_leader_id`);

--
-- Indexes for table `report_operator_assignments`
--
ALTER TABLE `report_operator_assignments`
  ADD PRIMARY KEY (`assignment_id`),
  ADD UNIQUE KEY `uq_report_operator` (`report_id`,`operator_id`),
  ADD KEY `fk_Report_Op_Assign_Reports_idx` (`report_id`),
  ADD KEY `fk_Report_Op_Assign_Personnel_idx` (`operator_id`);

--
-- Indexes for table `report_personnel_changes_log`
--
ALTER TABLE `report_personnel_changes_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `fk_Report_Pers_Change_Reports_idx` (`report_id`),
  ADD KEY `fk_Report_Pers_Change_Personnel_idx` (`new_personnel_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `shifts`
--
ALTER TABLE `shifts`
  ADD PRIMARY KEY (`shift_id`),
  ADD UNIQUE KEY `shift_name_UNIQUE` (`shift_name`);

--
-- Indexes for table `stoploss_types`
--
ALTER TABLE `stoploss_types`
  ADD PRIMARY KEY (`stoploss_type_id`),
  ADD UNIQUE KEY `stoploss_type_name_UNIQUE` (`stoploss_type_name`);

--
-- Indexes for table `subleader_line_responsibilities`
--
ALTER TABLE `subleader_line_responsibilities`
  ADD PRIMARY KEY (`responsibility_id`),
  ADD UNIQUE KEY `uq_subleader_line_date` (`sub_leader_id`,`line_id`,`assigned_date`),
  ADD KEY `fk_SubLeader_Line_Personnel_idx` (`sub_leader_id`),
  ADD KEY `fk_SubLeader_Line_Lines_idx` (`line_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hourly_ng_details`
--
ALTER TABLE `hourly_ng_details`
  MODIFY `hourly_ng_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `hourly_production_data`
--
ALTER TABLE `hourly_production_data`
  MODIFY `hourly_data_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `hourly_stoploss_details`
--
ALTER TABLE `hourly_stoploss_details`
  MODIFY `hourly_stoploss_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lines`
--
ALTER TABLE `lines`
  MODIFY `line_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `models`
--
ALTER TABLE `models`
  MODIFY `model_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `ng_types`
--
ALTER TABLE `ng_types`
  MODIFY `ng_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personnel`
--
ALTER TABLE `personnel`
  MODIFY `personnel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `production_reports`
--
ALTER TABLE `production_reports`
  MODIFY `report_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `report_operator_assignments`
--
ALTER TABLE `report_operator_assignments`
  MODIFY `assignment_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `report_personnel_changes_log`
--
ALTER TABLE `report_personnel_changes_log`
  MODIFY `log_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shifts`
--
ALTER TABLE `shifts`
  MODIFY `shift_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `stoploss_types`
--
ALTER TABLE `stoploss_types`
  MODIFY `stoploss_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `subleader_line_responsibilities`
--
ALTER TABLE `subleader_line_responsibilities`
  MODIFY `responsibility_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hourly_ng_details`
--
ALTER TABLE `hourly_ng_details`
  ADD CONSTRAINT `fk_Hourly_NG_Hourly_Data` FOREIGN KEY (`hourly_data_id`) REFERENCES `hourly_production_data` (`hourly_data_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Hourly_NG_NG_Types` FOREIGN KEY (`ng_type_id`) REFERENCES `ng_types` (`ng_type_id`) ON UPDATE CASCADE;

--
-- Constraints for table `hourly_production_data`
--
ALTER TABLE `hourly_production_data`
  ADD CONSTRAINT `fk_Hourly_Prod_Data_Models` FOREIGN KEY (`model_id`) REFERENCES `models` (`model_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Hourly_Prod_Data_Reports` FOREIGN KEY (`report_id`) REFERENCES `production_reports` (`report_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hourly_stoploss_details`
--
ALTER TABLE `hourly_stoploss_details`
  ADD CONSTRAINT `fk_Hourly_Stoploss_Hourly_Data` FOREIGN KEY (`hourly_data_id`) REFERENCES `hourly_production_data` (`hourly_data_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Hourly_Stoploss_Stoploss_Types` FOREIGN KEY (`stoploss_type_id`) REFERENCES `stoploss_types` (`stoploss_type_id`) ON UPDATE CASCADE;

--
-- Constraints for table `models`
--
ALTER TABLE `models`
  ADD CONSTRAINT `fk_Models_Lines` FOREIGN KEY (`line_id`) REFERENCES `lines` (`line_id`) ON UPDATE CASCADE;

--
-- Constraints for table `production_reports`
--
ALTER TABLE `production_reports`
  ADD CONSTRAINT `fk_Production_Reports_Groups` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Production_Reports_Lines` FOREIGN KEY (`line_id`) REFERENCES `lines` (`line_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Production_Reports_Personnel` FOREIGN KEY (`recorded_sub_leader_id`) REFERENCES `personnel` (`personnel_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Production_Reports_Shifts` FOREIGN KEY (`shift_id`) REFERENCES `shifts` (`shift_id`) ON UPDATE CASCADE;

--
-- Constraints for table `report_operator_assignments`
--
ALTER TABLE `report_operator_assignments`
  ADD CONSTRAINT `fk_Report_Op_Assign_Personnel` FOREIGN KEY (`operator_id`) REFERENCES `personnel` (`personnel_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Report_Op_Assign_Reports` FOREIGN KEY (`report_id`) REFERENCES `production_reports` (`report_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `report_personnel_changes_log`
--
ALTER TABLE `report_personnel_changes_log`
  ADD CONSTRAINT `fk_Report_Pers_Change_Personnel` FOREIGN KEY (`new_personnel_id`) REFERENCES `personnel` (`personnel_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Report_Pers_Change_Reports` FOREIGN KEY (`report_id`) REFERENCES `production_reports` (`report_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subleader_line_responsibilities`
--
ALTER TABLE `subleader_line_responsibilities`
  ADD CONSTRAINT `fk_SubLeader_Line_Lines` FOREIGN KEY (`line_id`) REFERENCES `lines` (`line_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_SubLeader_Line_Personnel` FOREIGN KEY (`sub_leader_id`) REFERENCES `personnel` (`personnel_id`) ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
