-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Apr 2022 pada 11.16
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ejournal`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `article`
--

CREATE TABLE `article` (
  `id_article` int(11) NOT NULL,
  `judul` varchar(250) DEFAULT NULL,
  `katakunci` varchar(150) DEFAULT NULL,
  `abstrak` varchar(1000) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_submit` datetime DEFAULT NULL,
  `id_contain_issue` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `assignment`
--

CREATE TABLE `assignment` (
  `id_assignment` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_accepted` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `date_invited` datetime DEFAULT NULL,
  `id_assigned_reviewer` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `author`
--

CREATE TABLE `author` (
  `id_author` int(11) NOT NULL,
  `nama` varchar(225) NOT NULL,
  `nama_tengah` varchar(225) NOT NULL,
  `nama_akhir` varchar(225) DEFAULT NULL,
  `email` varchar(225) NOT NULL,
  `url` varchar(225) DEFAULT NULL,
  `bidang` varchar(225) NOT NULL,
  `negara` varchar(225) NOT NULL,
  `bio` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `comment`
--

CREATE TABLE `comment` (
  `id_comment` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_comment_assignment` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `decision`
--

CREATE TABLE `decision` (
  `id_decision` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `decision` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detailauthor`
--

CREATE TABLE `detailauthor` (
  `id_detail_author` int(11) NOT NULL,
  `id_author` int(11) NOT NULL,
  `id_article` int(11) NOT NULL,
  `status` tinyint(11) NOT NULL DEFAULT 0,
  `date_created` int(11) NOT NULL,
  `date_completed` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `fullname`
--

CREATE TABLE `fullname` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `issue`
--

CREATE TABLE `issue` (
  `id_issue` int(11) NOT NULL,
  `volume` varchar(5) DEFAULT NULL,
  `number` varchar(5) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_published` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `reviewer`
--

CREATE TABLE `reviewer` (
  `id_reviewer` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `bidang` varchar(100) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `round`
--

CREATE TABLE `round` (
  `id_round` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_completed` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `type` varchar(200) NOT NULL COMMENT 'File Type'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id_article`);

--
-- Indeks untuk tabel `assignment`
--
ALTER TABLE `assignment`
  ADD PRIMARY KEY (`id_assignment`);

--
-- Indeks untuk tabel `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id_author`);

--
-- Indeks untuk tabel `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id_comment`);

--
-- Indeks untuk tabel `decision`
--
ALTER TABLE `decision`
  ADD PRIMARY KEY (`id_decision`);

--
-- Indeks untuk tabel `detailauthor`
--
ALTER TABLE `detailauthor`
  ADD PRIMARY KEY (`id_detail_author`);

--
-- Indeks untuk tabel `fullname`
--
ALTER TABLE `fullname`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `issue`
--
ALTER TABLE `issue`
  ADD PRIMARY KEY (`id_issue`);

--
-- Indeks untuk tabel `reviewer`
--
ALTER TABLE `reviewer`
  ADD PRIMARY KEY (`id_reviewer`);

--
-- Indeks untuk tabel `round`
--
ALTER TABLE `round`
  ADD PRIMARY KEY (`id_round`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `article`
--
ALTER TABLE `article`
  MODIFY `id_article` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `assignment`
--
ALTER TABLE `assignment`
  MODIFY `id_assignment` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `author`
--
ALTER TABLE `author`
  MODIFY `id_author` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `comment`
--
ALTER TABLE `comment`
  MODIFY `id_comment` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `detailauthor`
--
ALTER TABLE `detailauthor`
  MODIFY `id_detail_author` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `fullname`
--
ALTER TABLE `fullname`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `issue`
--
ALTER TABLE `issue`
  MODIFY `id_issue` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `reviewer`
--
ALTER TABLE `reviewer`
  MODIFY `id_reviewer` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `round`
--
ALTER TABLE `round`
  MODIFY `id_round` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
