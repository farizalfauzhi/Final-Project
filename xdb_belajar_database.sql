-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2024 at 03:50 PM
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
-- Database: `xdb_belajar_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `master_kategori`
--

CREATE TABLE `master_kategori` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `deskripsi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `master_kategori`
--

INSERT INTO `master_kategori` (`id`, `nama`, `deskripsi`) VALUES
(1, 'Makanan Instan', 'Makanan instan dalam bentuk sachet atau kaleng'),
(2, 'Cemilan', 'Cemilan adalah makanan ringan biasanya dalam bentuk sachet atau bungkusan yg memiliki porsi kecil dan tidak membuat kenyang.'),
(3, 'Minuman', 'Minuman kemasan baik dalam bentuk, botol, kaleng, kotak.'),
(4, 'Keperluan Dapur', 'Bahan atau keperluan memasak');

-- --------------------------------------------------------

--
-- Table structure for table `master_produk`
--

CREATE TABLE `master_produk` (
  `id` int(11) NOT NULL,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `dibuat_oleh` int(11) NOT NULL,
  `dibuat_kapan` datetime NOT NULL,
  `diperbarui_oleh` int(11) DEFAULT NULL,
  `diperbarui_kapan` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `master_produk`
--

INSERT INTO `master_produk` (`id`, `kode`, `nama`, `deskripsi`, `id_kategori`, `dibuat_oleh`, `dibuat_kapan`, `diperbarui_oleh`, `diperbarui_kapan`) VALUES
(1, 'IDM-GOR', 'Indomie Goreng', 'Indomie Goreng Rasa Original', 1, 0, '2024-07-02 14:21:13', 0, '2024-07-02 14:21:13'),
(2, 'SP-BBR', 'Super Bubur', 'Bubur instan tinggal seduh dengan air panas', 1, 0, '2024-07-02 14:21:13', 0, '2024-07-02 14:21:13'),
(3, 'CTT-ORI', 'Chitato', 'Chitato rasa original', 2, 1, '2024-07-02 21:57:09', NULL, NULL),
(4, 'MYK-GOR', 'Minyak Goreng', 'Minyak sayur untuk menggoreng keperluan masakan', 4, 1, '2024-07-08 02:13:56', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stok`
--

CREATE TABLE `stok` (
  `id` int(11) NOT NULL,
  `kode_produk` varchar(10) NOT NULL,
  `stok_masuk` int(11) NOT NULL,
  `stok_keluar` int(11) NOT NULL,
  `stok_sisa` int(11) NOT NULL,
  `keterangan` varchar(500) DEFAULT NULL,
  `dibuat_oleh` int(11) NOT NULL,
  `dibuat_kapan` datetime NOT NULL,
  `diperbarui_oleh` int(11) NOT NULL,
  `diperbarui_kapan` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stok`
--

INSERT INTO `stok` (`id`, `kode_produk`, `stok_masuk`, `stok_keluar`, `stok_sisa`, `keterangan`, `dibuat_oleh`, `dibuat_kapan`, `diperbarui_oleh`, `diperbarui_kapan`) VALUES
(1, 'IDM-GOR', 100, 0, 100, 'Dari Pabrik Sidoarjo', 1, '2024-07-04 21:14:40', 0, '0000-00-00 00:00:00'),
(2, 'SP-BBR', 150, 0, 150, 'Dari Gudang Tanjung Priok', 1, '2024-07-04 21:14:59', 0, '0000-00-00 00:00:00'),
(3, 'IDM-GOR', 66, 0, 166, 'Barang Retur', 1, '2024-07-04 21:15:09', 0, '0000-00-00 00:00:00'),
(4, 'CTT-ORI', 300, 0, 300, 'Dari Gudang Cikarang', 1, '2024-07-04 21:15:20', 0, '0000-00-00 00:00:00'),
(5, 'SP-BBR', 475, 0, 625, 'Dari Pabrik Tangerang', 1, '2024-07-04 21:15:31', 0, '0000-00-00 00:00:00'),
(6, 'IDM-GOR', 55, 0, 221, 'Barang Retur', 1, '2024-07-04 21:15:46', 0, '0000-00-00 00:00:00'),
(7, 'CTT-ORI', 10, 0, 310, 'Barang Retur', 1, '2024-07-04 21:15:54', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `nama_lengkap`) VALUES
(5, 'fariz', '$2a$10$G10Jdh2vO4FxVsZl0az0xe30dDexJTyOq1DsCxfakvBzJnoqz/Eu2', 'fariz alfauzhi'),
(8, 'lancelot123', '$2a$10$jKjQpRqGOLTu8MPsfgMMku3igTBPQT1E3SRToaEqOSF4Gzx1wbJOO', 'muhammad lancelot shodikin'),
(18, ' ', '$2a$10$T2nYygQrA6sZBTqPvLxHM.7O5TmmPf8vJwcfb71guOqJ.JB2YqJpu', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `master_kategori`
--
ALTER TABLE `master_kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_produk`
--
ALTER TABLE `master_produk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stok`
--
ALTER TABLE `stok`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `master_kategori`
--
ALTER TABLE `master_kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `master_produk`
--
ALTER TABLE `master_produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stok`
--
ALTER TABLE `stok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
