-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th2 28, 2024 lúc 04:33 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `lotus_syndication`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `intern`
--

CREATE TABLE `intern` (
  `id` int(11) NOT NULL,
  `firstName` varchar(55) DEFAULT NULL,
  `middleName` varchar(55) DEFAULT NULL,
  `lastName` varchar(55) DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `avata` varchar(200) DEFAULT NULL,
  `dispatching_company_id` int(11) DEFAULT NULL,
  `receiving_factory_id` int(11) DEFAULT NULL,
  `career_id` int(11) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `passport_code` varchar(50) DEFAULT NULL,
  `alien_card_number` varchar(50) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `intern`
--

INSERT INTO `intern` (`id`, `firstName`, `middleName`, `lastName`, `dob`, `avata`, `dispatching_company_id`, `receiving_factory_id`, `career_id`, `address`, `passport_code`, `alien_card_number`, `create_at`, `create_by`, `update_at`, `update_by`) VALUES
(1, 'Nam', 'Van', 'Pham', '1991-03-26 13:45:34', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfNOkro4gGhSzbEL1m8sL1mFQNNaj1604LMA&usqp=CAU', 1, 1, 1, 'Tokyo 100-8994', '1009999', '9999', '2024-02-27 13:45:34', 1, '2024-02-27 13:45:34', 1),
(2, 'Nguyen', 'Manh', 'Hung', '1991-03-26 06:45:34', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfNOkro4gGhSzbEL1m8sL1mFQNNaj1604LMA&usqp=CAU', 1, 1, 1, 'Tokyo 100-8994', '1009999', '9999', '2024-02-27 08:38:16', 1, '2024-02-27 08:38:16', 1),
(3, 'Vu', 'Van', 'Hao', '1994-03-26 06:45:34', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfNOkro4gGhSzbEL1m8sL1mFQNNaj1604LMA&usqp=CAU', 1, 1, 1, 'Honkaido 100-8994', '100999921', '999911', '2024-02-27 03:47:33', 1, '2024-02-27 03:47:33', 1),
(5, 'Pham', 'Văn', 'Mai', '1994-03-26 06:45:34', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfNOkro4gGhSzbEL1m8sL1mFQNNaj1604LMA&usqp=CAU', 1, 1, 1, 'Honkaido 100-8994', '100999921', '999911', '2024-02-27 16:14:06', 1, '2024-02-27 16:14:06', 1),
(6, 'Nam', 'Van', 'Pham', '1995-07-12 00:00:00', 'aaaaaa', 1, 1, 1, 'Ha Noi', '1009999', '9999', '2023-07-24 20:42:12', 1, '2024-02-27 13:45:34', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `intern`
--
ALTER TABLE `intern`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `intern`
--
ALTER TABLE `intern`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
