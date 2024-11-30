-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2024 at 03:03 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quanly_nhansu`
--

-- --------------------------------------------------------

--
-- Table structure for table `bang_cap`
--

CREATE TABLE `bang_cap` (
  `id` int(11) NOT NULL,
  `ma_bang_cap` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ten_bang_cap` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ghi_chu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nguoi_tao` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_tao` datetime NOT NULL,
  `nguoi_sua` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_sua` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bang_cap`
--

INSERT INTO `bang_cap` (`id`, `ma_bang_cap`, `ten_bang_cap`, `ghi_chu`, `nguoi_tao`, `ngay_tao`, `nguoi_sua`, `ngay_sua`) VALUES
(0, 'MBC1569664716', 'Không', '', 'Admin', '2023-09-24 21:08:16', 'Admin', '2023-09-24 21:08:16'),
(1, 'MBC1569651987', 'Bằng cử nhân', '', 'Admin', '2023-09-24 21:08:16', 'Admin', '2023-09-24 21:08:16'),
(2, 'MBC1569652012', 'Bằng thạc sĩ', '', 'Admin', '2023-09-24 21:08:16', 'Admin', '2023-09-24 21:08:16'),
(3, 'MBC1569652035', 'Bằng tiến sĩ', '', 'Admin', '2023-09-24 21:08:16', 'Admin', '2023-09-24 21:08:16'),
(4, 'MBC1569652169', 'Cử nhân khoa học xã hội', '', 'Admin', '2023-09-24 21:08:16', 'Admin', '2023-09-24 21:08:16'),
(5, 'MBC1569652180', 'Cử nhân khoa học tự nhiên', '', 'Admin', '2023-09-24 21:08:16', 'Admin', '2023-09-24 21:08:16'),
(8, 'MBC1569652431', 'Cử nhân quản trị kinh doanh', '', 'Admin', '2023-09-24 21:08:16', 'Admin', '2023-09-24 21:08:16'),
(9, 'MBC1569652436', 'Cử nhân thương mại và quản trị', '', 'Admin', '2023-09-24 21:08:16', 'Admin', '2023-09-24 21:08:16'),
(10, 'MBC1569652441', 'Cử nhân kế toán', '', 'Admin', '2023-09-24 21:08:16', 'Admin', '2023-09-24 21:08:16'),
(11, 'MBC1569652448', 'Cử nhân luật', '', 'Admin', '2023-09-24 21:08:16', 'Admin', '2023-09-24 21:08:16'),
(12, 'MBC1569652456', 'Cử nhân ngành quản trị và chính sách công', '', 'Admin', '2023-09-24 21:08:16', 'Admin', '2023-09-24 21:08:16'),
(13, 'MBC1569652463', 'Thạc sĩ khoa học xã hội', '', 'Admin', '2023-09-24 21:08:16', 'Admin', '2023-09-24 21:08:16'),
(14, 'MBC1569652469', 'Thạc sĩ khoa học tự nhiên', '', 'Admin', '2023-09-24 21:08:16', 'Admin', '2023-09-24 21:08:16'),
(15, 'MBC1569652475', 'Thạc sĩ quản trị kinh doanh', '', 'Admin', '2023-09-24 21:08:16', 'Admin', '2023-09-24 21:08:16'),
(16, 'MBC1569652481', 'Thạc sĩ kế toán', '', 'Admin', '2023-09-24 21:08:16', 'Admin', '2023-09-24 21:08:16');

-- --------------------------------------------------------

--
-- Table structure for table `chinh_luong`
--

CREATE TABLE `chinh_luong` (
  `id` int(11) NOT NULL,
  `nhanvien_id` int(11) NOT NULL,
  `so_qd` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_ky_ket` datetime NOT NULL,
  `ngay_dieu_chinh` datetime NOT NULL,
  `heso_luong_cu` double NOT NULL,
  `heso_luong_moi` double NOT NULL,
  `nguoi_tao_id` int(11) NOT NULL,
  `ngay_tao` datetime NOT NULL,
  `nguoi_sua_id` int(11) NOT NULL,
  `ngay_sua` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chi_tiet_nhom`
--

CREATE TABLE `chi_tiet_nhom` (
  `id` int(11) NOT NULL,
  `ma_nhom` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nhan_vien_id` int(11) NOT NULL,
  `nguoi_tao` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_tao` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chi_tiet_nhom`
--

INSERT INTO `chi_tiet_nhom` (`id`, `ma_nhom`, `nhan_vien_id`, `nguoi_tao`, `ngay_tao`) VALUES
(1, 'GRP1571110024', 11, 'Admin', '2023-09-24 21:08:43'),
(2, 'GRP1571110024', 10, 'Admin', '2023-09-24 21:08:43'),
(3, 'GRP1571110024', 5, 'Admin', '2023-09-24 21:08:43'),
(8, 'GRP1571110761', 5, 'Admin', '2023-09-24 21:08:43'),
(9, 'GRP1571110761', 4, 'Admin', '2023-09-24 21:08:43'),
(17, 'GRP1571110790', 11, 'Admin', '2023-09-24 21:08:43'),
(18, 'GRP1571110790', 13, 'Admin', '2023-09-24 21:08:43'),
(19, 'GRP1571110790', 3, 'Admin', '2023-09-24 21:08:43'),
(20, 'GRP1571110114', 10, 'Admin', '2023-09-24 21:08:43'),
(21, 'GRP1571110114', 5, 'Admin', '2023-09-24 21:08:43'),
(22, 'GRP1571110114', 3, 'Admin', '2023-09-24 21:08:43'),
(23, 'GRP1571110114', 8, 'Admin', '2023-09-24 21:08:43'),
(24, 'GRP1571110790', 8, 'Admin', '2023-09-24 21:08:43'),
(25, 'GRP1571110790', 2, 'AccountAdmin', '2023-09-24 21:08:43'),
(26, 'GRP1571110761', 2, 'AccountAdmin', '2023-09-24 21:08:43');

-- --------------------------------------------------------

--
-- Table structure for table `chi_tiet_phong_ban`
--

CREATE TABLE `chi_tiet_phong_ban` (
  `id` int(11) NOT NULL,
  `nhan_vien_id` int(11) DEFAULT NULL,
  `phong_ban_id` int(11) DEFAULT NULL,
  `nguoi_tao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ngay_tao` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chi_tiet_phong_ban`
--

INSERT INTO `chi_tiet_phong_ban` (`id`, `nhan_vien_id`, `phong_ban_id`, `nguoi_tao`, `ngay_tao`) VALUES
(2, 12, 20, 'Admin', '2023-09-24 21:09:02'),
(3, 11, 21, 'Admin', '2023-09-24 21:09:02'),
(4, 10, 21, 'Admin', '2023-09-24 21:09:02'),
(5, 2, 20, 'Admin', '2023-09-24 21:09:02'),
(6, 12, 27, 'Admin', '2023-09-24 21:09:02'),
(7, 10, 27, 'Admin', '2023-09-24 21:09:02'),
(9, 20, 20, 'Admin', '2023-10-07 22:52:22');

-- --------------------------------------------------------

--
-- Table structure for table `chuc_vu`
--

CREATE TABLE `chuc_vu` (
  `id` int(11) NOT NULL,
  `ma_chuc_vu` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ten_chuc_vu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `luong_ngay` double NOT NULL,
  `ghi_chu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nguoi_tao` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_tao` datetime NOT NULL,
  `nguoi_sua` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_sua` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chuc_vu`
--

INSERT INTO `chuc_vu` (`id`, `ma_chuc_vu`, `ten_chuc_vu`, `luong_ngay`, `ghi_chu`, `nguoi_tao`, `ngay_tao`, `nguoi_sua`, `ngay_sua`) VALUES
(16, 'MCV1569203762', 'Phó giám đốc', 560000, '<p>sdadasd</p>\r\n', 'Admin', '2023-09-24 21:09:43', ' Admin', '2023-10-07 22:46:14'),
(17, 'MCV1569203773', 'Giám đốc', 600000, '', 'Admin', '2023-09-24 21:09:43', 'Admin', '2023-09-24 21:09:43'),
(33, 'MCV1569204007', 'Nhân viên', 230000, '', 'Admin', '2023-09-24 21:09:43', 'Admin', '2023-09-24 21:09:43'),
(37, 'MCV1569985216', 'Trưởng phòng', 310000, '', 'Admin', '2023-09-24 21:09:43', 'Admin', '2023-09-24 21:09:43'),
(38, 'MCV1569985261', 'Phó phòng', 280000, '', 'Admin', '2023-09-24 21:09:43', 'Admin', '2023-09-24 21:09:43'),
(39, 'MCV1571105797', 'Marketing', 285000, '<p>Quảng b&aacute;, k&ecirc;u gọi kh&aacute;ch h&agrave;ng tham gia.</p>\r\n', 'Admin', '2023-09-24 21:09:43', 'Admin', '2023-09-24 21:09:43'),
(42, 'MCV1696693615', 'Nhân viên thời vụ', 300000, '<p>Nh&acirc;n vi&ecirc;n thời vụ</p>\r\n', ' Admin', '2023-10-07 22:46:55', ' Admin', '2023-12-30 21:33:41'),
(43, 'MCV1703946848', 'Nhân viên làm tết', 300000, '<p>Nh&acirc;n vi&ecirc;n l&agrave;m tết</p>\r\n', ' Admin', '2023-12-30 21:34:08', ' Admin', '2023-12-30 21:34:08'),
(44, 'MCV1704376910', 'Nhân viên1234', 100000, '', ' Admin', '2024-01-04 21:01:50', ' Admin', '2024-01-04 21:01:50');

-- --------------------------------------------------------

--
-- Table structure for table `chuyen_mon`
--

CREATE TABLE `chuyen_mon` (
  `id` int(11) NOT NULL,
  `ma_chuyen_mon` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ten_chuyen_mon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ghi_chu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nguoi_tao` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_tao` datetime NOT NULL,
  `nguoi_sua` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_sua` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chuyen_mon`
--

INSERT INTO `chuyen_mon` (`id`, `ma_chuyen_mon`, `ten_chuyen_mon`, `ghi_chu`, `nguoi_tao`, `ngay_tao`, `nguoi_sua`, `ngay_sua`) VALUES
(0, 'MCM1569664640', 'Không', '', 'Admin', '2023-09-24 21:10:03', 'Admin', '2023-09-24 21:10:03'),
(2, 'MCM1569208526', 'Kế toán', '', 'Admin', '2023-09-24 21:10:03', 'Admin', '2023-09-24 21:10:03'),
(3, 'MCM1569208539', 'Công nghệ thông tin', '', 'Admin', '2023-09-24 21:10:03', 'Admin', '2023-09-24 21:10:03'),
(4, 'MCM1569208553', 'Quản trị nhà hàng - khách sạn', '', 'Admin', '2023-09-24 21:10:03', 'Admin', '2023-09-24 21:10:03'),
(5, 'MCM1569208562', 'Tiếp tân', '', 'Admin', '2023-09-24 21:10:03', 'Admin', '2023-09-24 21:10:03'),
(6, 'MCM1569208577', 'Sale', '', 'Admin', '2023-09-24 21:10:03', 'Admin', '2023-09-24 21:10:03'),
(7, 'MCM1569208618', 'Hành chính văn phòng', '', 'Admin', '2023-09-24 21:10:03', 'Admin', '2023-09-24 21:10:03'),
(8, 'MCM1569208631', 'Quản lý chất lượng', '', 'Admin', '2023-09-24 21:10:03', 'Admin', '2023-09-24 21:10:03'),
(9, 'MCM1569208648', 'Thương mại điện tử', '', 'Admin', '2023-09-24 21:10:03', 'Admin', '2023-09-24 21:10:03'),
(10, 'MCM1569208673', 'Tài chính', '', 'Admin', '2023-09-24 21:10:03', 'Admin', '2023-09-24 21:10:03'),
(11, 'MCM1569208680', 'Quản lý', '', 'Admin', '2023-09-24 21:10:03', 'Admin', '2023-09-24 21:10:03'),
(12, 'MCM1569208698', 'Maketing', '', 'Admin', '2023-09-24 21:10:03', 'Admin', '2023-09-24 21:10:03'),
(13, 'MCM1569208705', 'Khởi nghiệp', '', 'Admin', '2023-09-24 21:10:03', 'Admin', '2023-09-24 21:10:03'),
(14, 'MCM1569208731', 'Quản lý nguồn nhân lực', '', 'Admin', '2023-09-24 21:10:03', 'Admin', '2023-09-24 21:10:03'),
(15, 'MCM1569208740', 'Kinh doanh', '', 'Admin', '2023-09-24 21:10:03', 'Admin', '2023-09-24 21:10:03'),
(16, 'MCM1569208758', 'Vận tải và hậu cần', '', 'Admin', '2023-09-24 21:10:03', 'Admin', '2023-09-24 21:10:03'),
(17, 'MCM1569208771', 'Kinh doanh', '', 'Admin', '2023-09-24 21:10:03', 'Admin', '2023-09-24 21:10:03'),
(18, 'MCM1569208782', 'Bán lẻ', '', 'Admin', '2023-09-24 21:10:03', 'Admin', '2023-09-24 21:10:03');

-- --------------------------------------------------------

--
-- Table structure for table `cong_tac`
--

CREATE TABLE `cong_tac` (
  `id` int(11) NOT NULL,
  `ma_cong_tac` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nhanvien_id` int(11) NOT NULL,
  `ngay_bat_dau` date NOT NULL,
  `ngay_ket_thuc` date NOT NULL,
  `dia_diem` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `muc_dich` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `ghi_chu` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `nguoi_tao` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_tao` datetime NOT NULL,
  `nguoi_sua` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_sua` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cong_tac`
--

INSERT INTO `cong_tac` (`id`, `ma_cong_tac`, `nhanvien_id`, `ngay_bat_dau`, `ngay_ket_thuc`, `dia_diem`, `muc_dich`, `ghi_chu`, `nguoi_tao`, `ngay_tao`, `nguoi_sua`, `ngay_sua`) VALUES
(1, 'MCT1570351884', 3, '2022-08-06', '2022-08-12', 'Cần Thơ', '<p>Đi thi c&ocirc;ng lắp đặt</p>\r\n', '', 'Admin', '2023-09-24 21:10:16', 'Account Admin', '2023-09-24 21:10:16'),
(3, 'MCT1570352254', 4, '2022-07-06', '2022-07-08', 'Phú Quốc', '<p>Khảo s&aacute;t&nbsp;</p>\r\n', '', 'Admin', '2023-09-24 21:10:16', 'Account Admin', '2023-09-24 21:10:16'),
(5, 'MCT1570353978', 5, '2022-08-08', '2022-08-13', 'Cần Thơ', '<p>Khảo s&aacute;t&nbsp;</p>\r\n', '', 'Admin', '2023-09-24 21:10:16', 'Account Admin', '2023-09-24 21:10:16'),
(6, 'MCT1571039527', 10, '2022-08-14', '2022-08-20', 'Phú Quốc', '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p>Đi thi c&ocirc;ng lắp đặt</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '', 'Admin', '2023-09-24 21:10:16', 'Account Admin', '2023-09-24 21:10:16'),
(8, 'MCT1686232869', 2, '2023-06-01', '2023-06-05', 'Hà Nội', '<p>Đi chơi&nbsp;</p>\r\n', '', 'Account Admin', '2023-09-24 21:10:16', 'Account Admin', '2023-09-24 21:10:16'),
(11, 'MCT1686234443', 2, '2023-06-14', '2023-06-17', 'HCM', '<p>HCM</p>\r\n', 'HCM', 'Account Admin', '2023-09-24 21:10:16', '', '2023-09-24 21:10:16'),
(12, 'MCT1686407975', 2, '2023-06-11', '2023-06-13', 'dfsadas', '<p>&aacute;dasdas</p>\r\n', 'ádasdasd', 'Account Admin', '2023-09-24 21:10:16', '', '2023-09-24 21:10:16'),
(14, 'MCT1686481512', 2, '2023-06-20', '2023-06-23', 'Huế', '<p>Đi chơi</p>\r\n', 'Đi chơi', ' Admin', '2023-09-24 21:10:16', '', '2023-09-24 21:10:16'),
(15, 'MCT1686583472', 2, '2023-06-24', '2023-06-27', 'HCM', '<p>Đi chơi</p>\r\n', 'Đi chơi', ' Admin', '2023-09-24 21:10:16', '', '2023-09-24 21:10:16');

-- --------------------------------------------------------

--
-- Table structure for table `dan_toc`
--

CREATE TABLE `dan_toc` (
  `id` int(11) NOT NULL,
  `ten_dan_toc` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dan_toc`
--

INSERT INTO `dan_toc` (`id`, `ten_dan_toc`) VALUES
(1, 'Kinh'),
(2, 'Khơ-me'),
(3, 'Mường'),
(4, 'Thổ'),
(5, 'H\'Mông'),
(6, 'Ê-đê'),
(7, 'Bố Y'),
(8, 'Lào'),
(9, 'Tày'),
(10, 'Thái'),
(11, 'Nùng'),
(12, 'Khơ-mú'),
(13, 'M\'Nông'),
(14, 'Xơ Đăng'),
(15, 'Chăm'),
(16, 'Gia Rai'),
(17, 'Hoa'),
(18, 'Lô Lô'),
(19, 'Phù Lá');

-- --------------------------------------------------------

--
-- Table structure for table `khen_thuong_ky_luat`
--

CREATE TABLE `khen_thuong_ky_luat` (
  `id` int(11) NOT NULL,
  `ma_kt` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `so_qd` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_qd` date NOT NULL,
  `nhanvien_id` int(11) NOT NULL,
  `ten_khen_thuong` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `loai_kt_id` int(11) NOT NULL,
  `hinh_thuc` tinyint(1) NOT NULL,
  `so_tien` double NOT NULL,
  `flag` tinyint(1) NOT NULL,
  `ghi_chu` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `nguoi_tao` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_tao` datetime NOT NULL,
  `nguoi_sua` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_sua` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `khen_thuong_ky_luat`
--

INSERT INTO `khen_thuong_ky_luat` (`id`, `ma_kt`, `so_qd`, `ngay_qd`, `nhanvien_id`, `ten_khen_thuong`, `loai_kt_id`, `hinh_thuc`, `so_tien`, `flag`, `ghi_chu`, `nguoi_tao`, `ngay_tao`, `nguoi_sua`, `ngay_sua`) VALUES
(1, 'MKT1571286726', 'DHK/1146', '2019-10-17', 5, 'Khen thưởng nhân viên năng động', 6, 0, 240000, 1, '<p>Thưởng trong th&aacute;ng</p>\r\n', 'Admin', '2023-09-24 21:10:32', 'Admin', '2023-09-24 21:10:32'),
(2, 'MKT1571286771', 'DHK/1145', '2019-10-17', 4, 'Khen thưởng nhân viên chăm chỉ', 7, 0, 400000, 1, '', 'Admin', '2023-09-24 21:10:32', 'Admin', '2023-09-24 21:10:32'),
(3, 'MKT1571286857', 'DKT/1144', '2019-10-17', 12, 'Khen thưởng nhân viên tốt', 5, 1, 325000, 1, '', 'Admin', '2023-09-24 21:10:32', 'Admin', '2023-09-24 21:10:32'),
(7, 'MKT1571365640', 'DHK/1143', '2019-10-14', 5, 'Khen thưởng nhân viên hiếu động', 7, 1, 360000, 1, '<p>Thưởng cho th&agrave;nh phần hiếu động</p>\r\n', 'Admin', '2023-09-24 21:10:32', 'Admin', '2023-09-24 21:10:32'),
(9, 'MKL1571368523', 'DKT/5933', '2019-10-18', 12, 'Chuyên đi trễ', 15, 0, 25000, 0, '', 'Admin', '2023-09-24 21:10:32', 'Admin', '2023-09-24 21:10:32'),
(11, 'MKL1571369398', 'DKT/4421', '2019-10-12', 8, 'Nhân viên chậm chạp', 14, 1, 123000, 0, '<p>Cần c&acirc;n nhắc khi sử dụng nh&acirc;n vi&ecirc;n n&agrave;y.</p>\r\n', 'Admin', '2023-09-24 21:10:32', 'Admin', '2023-09-24 21:10:32'),
(12, 'MKL1686415213', 'dsfsdfsd', '2023-06-10', 2, 'sdfsfsd', 14, 1, 10000, 0, '<p>dsfsdfsd</p>\r\n', 'Account Admin', '2023-09-24 21:10:32', 'Account Admin', '2023-09-24 21:10:32'),
(13, 'MKL1686415654', '1520123', '2023-06-08', 2, 'ĐI muộn', 15, 1, 20000, 0, '<p>ĐI muộn</p>\r\n', 'Account Admin', '2023-09-24 21:10:32', 'Account Admin', '2023-09-24 21:10:32'),
(14, 'MKT1686417893', '123123123', '2023-06-11', 2, 'sdfdsfsd', 5, 1, 500000, 1, '<p>sdfsdfsd</p>\r\n', 'Account Admin', '2023-09-24 21:10:32', 'Account Admin', '2023-09-24 21:10:32'),
(15, 'MKT1686481573', 'ádasd', '2023-06-11', 2, 'ádasdasd', 5, 1, 500000, 1, '<p>&aacute;dasda</p>\r\n', ' Admin', '2023-09-24 21:10:32', ' Admin', '2023-09-24 21:10:32');

-- --------------------------------------------------------

--
-- Table structure for table `loai_khen_thuong_ky_luat`
--

CREATE TABLE `loai_khen_thuong_ky_luat` (
  `id` int(11) NOT NULL,
  `ma_loai` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ten_loai` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ghi_chu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `flag` tinyint(1) NOT NULL,
  `nguoi_tao` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_tao` datetime NOT NULL,
  `nguoi_sua` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_sua` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loai_khen_thuong_ky_luat`
--

INSERT INTO `loai_khen_thuong_ky_luat` (`id`, `ma_loai`, `ten_loai`, `ghi_chu`, `flag`, `nguoi_tao`, `ngay_tao`, `nguoi_sua`, `ngay_sua`) VALUES
(5, 'LKT1571280354', 'Nhân viên đồng', '', 1, 'Đào Thanh Huy', '2023-09-24 21:10:46', ' Admin', '2024-01-04 20:58:02'),
(6, 'LKT1571280364', 'Nhân viên bạc', '', 1, 'Đào Thanh Huy', '2023-09-24 21:10:46', 'Đào Thanh Huy', '2023-09-24 21:10:46'),
(7, 'LKT1571280370', 'Nhân viên vàng', '', 1, 'Đào Thanh Huy', '2023-09-24 21:10:46', 'Đào Thanh Huy', '2023-09-24 21:10:46'),
(8, 'LKT1571280376', 'Nhân viên kim cương', '', 1, 'Đào Thanh Huy', '2023-09-24 21:10:46', 'Đào Thanh Huy', '2023-09-24 21:10:46'),
(14, 'LKL1571366769', 'Nhân viên đi trễ', '<p>Nh&acirc;n vi&ecirc;n thường xuy&ecirc;n đi trễ</p>\r\n', 0, 'Đào Thanh Huy', '2023-09-24 21:10:46', 'Đào Thanh Huy', '2023-09-24 21:10:46'),
(15, 'LKL1571366807', 'Nhân viên nghỉ quá ngày cho phép', '<p>Nh&acirc;n vi&ecirc;n nghỉ tr&ecirc;n 20 ng&agrave;y/th&aacute;ng.</p>\r\n', 0, 'Đào Thanh Huy', '2023-09-24 21:10:46', 'Đào Thanh Huy', '2023-09-24 21:10:46'),
(19, 'LKL1571367774', 'Test', '', 0, 'Đào Thanh Huy', '2023-09-24 21:10:46', 'Đào Thanh Huy', '2023-09-24 21:10:46'),
(20, 'LKT1686481546', 'đâsd', '<p>&aacute;dasdasd</p>\r\n', 1, ' Admin', '2023-09-24 21:10:46', ' Admin', '2023-09-24 21:10:46'),
(21, 'LKL1704376706', 'Kỷ luật vi phạm đi muộn', '<p>Kỷ luật vi phạm đi muộn</p>\r\n', 0, ' Admin', '2024-01-04 20:58:26', ' Admin', '2024-01-04 20:58:26');

-- --------------------------------------------------------

--
-- Table structure for table `loai_nv`
--

CREATE TABLE `loai_nv` (
  `id` int(11) NOT NULL,
  `ma_loai_nv` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ten_loai_nv` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ghi_chu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nguoi_tao` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_tao` datetime NOT NULL,
  `nguoi_sua` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_sua` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loai_nv`
--

INSERT INTO `loai_nv` (`id`, `ma_loai_nv`, `ten_loai_nv`, `ghi_chu`, `nguoi_tao`, `ngay_tao`, `nguoi_sua`, `ngay_sua`) VALUES
(2, 'LNV1569654834', 'Nhân viên chính thức', '', 'Admin', '2023-09-24 21:10:59', 'Admin', '2023-09-24 21:10:59'),
(3, 'LNV1569654844', 'Nhân viên thực tập', '', 'Admin', '2023-09-24 21:10:59', 'Admin', '2023-09-24 21:10:59'),
(4, 'LNV1569654850', 'Nhân viên thời vụ', '', 'Admin', '2023-09-24 21:10:59', 'Admin', '2023-09-24 21:10:59');

-- --------------------------------------------------------

--
-- Table structure for table `luong`
--

CREATE TABLE `luong` (
  `id` int(11) NOT NULL,
  `ma_luong` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nhanvien_id` int(11) NOT NULL,
  `luong_thang` double NOT NULL,
  `ngay_cong` int(11) NOT NULL,
  `phu_cap` double NOT NULL,
  `khoan_nop` double NOT NULL,
  `tam_ung` double NOT NULL,
  `thuc_lanh` double NOT NULL,
  `ngay_cham` date NOT NULL,
  `ghi_chu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nguoi_tao_id` int(11) NOT NULL,
  `ngay_tao` datetime NOT NULL,
  `nguoi_sua_id` int(11) NOT NULL,
  `ngay_sua` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `luong`
--

INSERT INTO `luong` (`id`, `ma_luong`, `nhanvien_id`, `luong_thang`, `ngay_cong`, `phu_cap`, `khoan_nop`, `tam_ung`, `thuc_lanh`, `ngay_cham`, `ghi_chu`, `nguoi_tao_id`, `ngay_tao`, `nguoi_sua_id`, `ngay_sua`) VALUES
(3, 'ML1570075152', 10, 18600000, 28, 2260000, 1953000, 1500000, 17407000, '2022-04-07', '', 4, '2023-05-06 09:49:48', 4, '2023-05-06 09:49:48'),
(4, 'ML1570075175', 5, 5750000, 25, 0, 603750, 1500000, 3646250, '2022-10-03', '', 4, '2023-05-06 09:49:48', 4, '2023-05-06 09:49:48'),
(5, 'ML1570075372', 3, 8050000, 30, 1650000, 845250, 1500000, 7354750, '2022-10-03', '', 4, '2023-05-06 09:49:48', 4, '2023-05-06 09:49:48'),
(9, 'ML1570267241', 10, 19800000, 29, 2305000, 2079000, 0, 20026000, '2022-11-05', '', 4, '2023-05-06 09:49:48', 4, '2023-05-06 09:49:48'),
(10, 'ML1570267671', 10, 13800000, 23, 2035000, 1449000, 1200000, 13186000, '2022-12-05', '', 4, '2023-05-06 09:49:48', 4, '2023-05-06 09:49:48'),
(11, 'ML1570267847', 2, 8050000, 30, 1650000, 845250, 500000, 8354750, '2022-08-01', '', 4, '2023-05-06 09:49:48', 4, '2023-05-06 09:49:48'),
(12, 'ML1570267874', 2, 7590000, 29, 1605000, 796950, 0, 8398050, '2022-11-05', '', 4, '2023-05-06 09:49:48', 4, '2023-05-06 09:49:48'),
(13, 'ML1570355932', 8, 9240000, 29, 1805000, 970200, 1000000, 9074800, '2022-10-06', '<p>Nhận tiền mặt</p>\r\n', 12, '2023-05-06 09:49:48', 12, '2023-05-06 09:49:48'),
(14, 'ML1571365486', 12, 4600000, 20, 0, 483000, 0, 4117000, '2022-10-18', '', 12, '2023-05-06 09:49:48', 12, '2023-05-06 09:49:48'),
(15, 'ML1571390955', 8, 9800000, 30, 1850000, 1029000, 0, 10621000, '2022-11-05', '', 1, '2023-05-06 09:49:48', 1, '2023-05-06 09:49:48'),
(16, 'ML1686481407', 3, 4600000, 20, 1000000, 483000, 0, 5117000, '2023-06-11', '<p>sdfsdfsdf</p>\r\n', 1, '2023-06-11 18:03:27', 1, '2023-06-11 18:03:27'),
(17, 'ML1696694217', 2, 7130000, 28, 1560000, 748650, 0, 7941350, '2023-10-07', '<p>M&ocirc; tả lương th&aacute;ng 10</p>\r\n', 1, '2023-10-07 22:56:57', 1, '2023-10-07 22:56:57');

-- --------------------------------------------------------

--
-- Table structure for table `nhanvien`
--

CREATE TABLE `nhanvien` (
  `id` int(11) NOT NULL,
  `ma_nv` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `hinh_anh` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ten_nv` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `biet_danh` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gioi_tinh` tinyint(1) NOT NULL,
  `ngay_sinh` date NOT NULL,
  `noi_sinh` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hon_nhan_id` int(11) NOT NULL,
  `so_cmnd` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `noi_cap_cmnd` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_cap_cmnd` date NOT NULL,
  `nguyen_quan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quoc_tich_id` int(11) NOT NULL,
  `ton_giao_id` int(11) NOT NULL,
  `dan_toc_id` int(11) NOT NULL,
  `ho_khau` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tam_tru` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `loai_nv_id` int(11) NOT NULL,
  `trinh_do_id` int(11) NOT NULL,
  `chuyen_mon_id` int(11) NOT NULL,
  `bang_cap_id` int(11) NOT NULL,
  `phong_ban_id` int(11) DEFAULT NULL,
  `chuc_vu_id` int(11) NOT NULL,
  `trang_thai` tinyint(1) NOT NULL,
  `nguoi_tao_id` int(11) NOT NULL,
  `ngay_tao` datetime NOT NULL,
  `nguoi_sua_id` int(11) NOT NULL,
  `ngay_sua` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `nhanvien`
--

INSERT INTO `nhanvien` (`id`, `ma_nv`, `hinh_anh`, `ten_nv`, `biet_danh`, `gioi_tinh`, `ngay_sinh`, `noi_sinh`, `hon_nhan_id`, `so_cmnd`, `noi_cap_cmnd`, `ngay_cap_cmnd`, `nguyen_quan`, `quoc_tich_id`, `ton_giao_id`, `dan_toc_id`, `ho_khau`, `tam_tru`, `loai_nv_id`, `trinh_do_id`, `chuyen_mon_id`, `bang_cap_id`, `phong_ban_id`, `chuc_vu_id`, `trang_thai`, `nguoi_tao_id`, `ngay_tao`, `nguoi_sua_id`, `ngay_sua`) VALUES
(2, 'MNV1569830976', '1569907877.jpg', 'Nguyễn Duy Sơn', 'Sơn Núi Đá', 1, '1994-12-19', 'Long Xuyên', 2, '371807766', 'Long Xuyên', '2016-09-30', 'Long Xuyên', 24, 0, 1, 'Long Xuyên', 'Rạch Giá - Kiên Giang', 2, 18, 2, 2, 22, 33, 1, 4, '2023-09-24 21:11:24', 1, '2023-09-24 21:11:24'),
(3, 'MNV1569831824', '1569831824.jpg', 'Nguyễn Thị Mỹ Phương', 'Phương Kini', 0, '1996-09-20', 'Rạch Giá - Kiên Giang', 1, '3718087785', 'Kiên Giang', '2016-09-30', 'Rạch Giá - Kiên Giang', 24, 1, 1, 'Rạch Giá - Kiên Giang', 'Rạch Giá - Kiên Giang', 2, 17, 11, 1, 22, 33, 1, 4, '2023-09-24 21:11:24', 4, '2023-09-24 21:11:24'),
(4, 'MNV1569833913', '1569833913.jpg', 'Nguyễn Phước Thanh', '', 1, '1984-09-12', 'Phú Quốc - Kiên Giang', 3, '567423431', 'Kiên Giang', '2002-04-23', 'Phú Quốc - Kiên Giang', 24, 0, 1, 'Phú Quốc - Kiên Giang', 'Phú Quốc - Kiên Giang', 2, 18, 15, 2, 20, 16, 1, 4, '2023-09-24 21:11:24', 4, '2023-09-24 21:11:24'),
(5, 'MNV1569834099', '1569907854.png', 'Trần Thị Bích Nhi', 'Nhi Kute', 0, '1997-02-12', 'Châu Thành - Kiên Giang', 1, '378623143', 'Kiên Giang', '2004-09-12', 'Châu Thành - Kiên Giang', 24, 1, 1, 'Châu Thành - Kiên Giang', 'Châu Thành - Kiên Giang', 4, 17, 5, 1, 21, 33, 1, 4, '2023-09-24 21:11:24', 4, '2023-09-24 21:11:24'),
(8, 'MNV1569835233', '1569835233.jpg', 'Trần Mai Phương', 'Phương Kòi', 0, '2000-12-09', 'Thốt Nốt - Cần Thơ', 2, '3718087777', 'Cà Mau', '2012-09-30', 'Cà Mau', 24, 0, 1, 'Cà Mau', 'Cà Mau', 3, 17, 5, 1, 20, 38, 1, 4, '2023-09-24 21:11:24', 4, '2023-09-24 21:11:24'),
(10, 'MNV1569905940', '1569907839.jpg', 'Nguyễn Minh Thông', 'Thông bác học', 1, '1980-12-04', 'Nghệ An', 3, '3718087744', 'Nghệ An', '1997-04-02', 'Nghệ An', 24, 3, 1, 'Nghệ An', 'Nghệ An', 2, 17, 14, 4, 20, 17, 1, 4, '2023-09-24 21:11:24', 1, '2023-09-24 21:11:24'),
(11, 'MNV1569906116', '1569906116.jpg', 'Nguyễn Duy Tính', '', 1, '1992-09-12', 'Nghệ An', 3, '343214564', 'Nghệ An', '2002-10-20', 'Nghệ An', 24, 0, 18, 'Nghệ An', 'Nghệ An', 3, 18, 7, 11, 23, 37, 1, 4, '2023-09-24 21:11:24', 1, '2023-09-24 21:11:24'),
(12, 'MNV1571124337', '1571124337.jpg', 'Trần Diễm My', '', 0, '1997-10-15', 'Nghệ An', 1, '3716024774', 'Nghệ An', '2015-10-15', 'Nghệ An', 24, 0, 1, 'Nghệ An', 'Nghệ An', 4, 17, 9, 1, 20, 33, 1, 12, '2023-09-24 21:11:24', 1, '2023-09-24 21:11:24'),
(13, 'MNV1571124772', '1683341711.jpg', 'Trần Văn Triệu', 'Triệu Phú', 1, '1990-12-20', 'Nghệ An', 3, '443212354', 'Nghệ An', '2000-12-20', 'Nghệ An', 24, 0, 1, 'Nghệ An', 'Rạch Giá - Kiên Giang', 2, 16, 2, 16, 21, 33, 1, 12, '2023-09-24 21:11:24', 1, '2023-12-30 21:35:48'),
(18, 'MNV1687110686', '1687110686.jpg', 'sdfsfsdfsdfsd', 'sdfsdf', 1, '2023-06-19', 'sdfsdf', 1, '43534534534', 'sdfsdf', '2023-06-19', 'sdfsdf', 2, 1, 16, 'sdasdas', 'sdfsdf', 2, 17, 11, 13, NULL, 16, 1, 1, '2023-09-24 21:11:24', 1, '2023-09-24 21:11:24'),
(20, 'MNV1696693836', '1696693836.png', 'Nguyễn Văn B', 'sdasda', 0, '1998-12-11', 'hà Nội', 1, '34543543534', 'Hà Nội', '2022-11-15', 'Hà Nội', 15, 0, 17, 'Hà Nội', 'Hà Nội', 2, 17, 3, 9, NULL, 38, 1, 1, '2023-10-07 22:50:36', 1, '2023-10-07 22:50:36'),
(21, 'MNV1696694819', '1696694819.png', 'Phạm Đạt', 'Đạt', 1, '2023-10-07', 'Hà Nội', 1, '2342423432423', 'Hà Nội', '2023-10-07', 'Hà Nội', 15, 1, 14, 'Mã nhân viên:', 'Hà Nội', 2, 17, 14, 14, NULL, 16, 1, 1, '2023-10-07 23:06:59', 1, '2023-10-07 23:06:59');

-- --------------------------------------------------------

--
-- Table structure for table `nhom`
--

CREATE TABLE `nhom` (
  `id` int(11) NOT NULL,
  `ma_nhom` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ten_nhom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mo_ta` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nguoi_tao` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_tao` datetime NOT NULL,
  `nguoi_sua` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_sua` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `nhom`
--

INSERT INTO `nhom` (`id`, `ma_nhom`, `ten_nhom`, `mo_ta`, `nguoi_tao`, `ngay_tao`, `nguoi_sua`, `ngay_sua`) VALUES
(1, 'GRP1571110024', 'Nhóm thu thập', '<p>Nh&oacute;m chuy&ecirc;n thu thập th&ocirc;ng tin kh&aacute;ch h&agrave;ng</p>\r\n', 'ĐàoThanh Huy', '2023-09-24 21:11:39', 'ĐàoThanh Huy', '2023-09-24 21:11:39'),
(2, 'GRP1571110114', 'Nhóm quản lý dự án', '<p>Thu thập, quản l&yacute; những dự &aacute;n mới, dự &aacute;n đang thực hiện</p>\r\n', 'ĐàoThanh Huy', '2023-09-24 21:11:39', 'ĐàoThanh Huy', '2023-09-24 21:11:39'),
(4, 'GRP1571110761', 'Nhóm đang công tác', '', 'ĐàoThanh Huy', '2023-09-24 21:11:39', '', '2023-09-24 21:11:39'),
(5, 'GRP1571110790', 'Nhóm tổ chức sự kiện', '', 'ĐàoThanh Huy', '2023-09-24 21:11:39', '', '2023-09-24 21:11:39');

-- --------------------------------------------------------

--
-- Table structure for table `phong_ban`
--

CREATE TABLE `phong_ban` (
  `id` int(11) NOT NULL,
  `ma_phong_ban` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ten_phong_ban` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ghi_chu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nguoi_tao` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_tao` datetime NOT NULL,
  `nguoi_sua` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ngay_sua` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `phong_ban`
--

INSERT INTO `phong_ban` (`id`, `ma_phong_ban`, `ten_phong_ban`, `ghi_chu`, `nguoi_tao`, `ngay_tao`, `nguoi_sua`, `ngay_sua`) VALUES
(20, 'MBP1569204111', 'Phòng ứng dụng phát triển sss', '<p>sdfsdfsd zxczxczxc</p>\r\n', 'Admin', '2023-09-24 21:11:50', 'Account Admin', '2023-09-24 21:11:50'),
(21, 'MBP1569204120', 'Phòng dịch vụ truyền thông', '', 'Admin', '2023-09-24 21:11:50', 'Account Admin', '2023-09-24 21:11:50'),
(22, 'MBP1569204129', 'Phòng đào tạo hợp tác ', '', 'Admin', '2023-09-24 21:11:50', 'Account Admin', '2023-09-24 21:11:50'),
(23, 'MBP1569204142', 'Phòng hành chính tổng hợp', '', 'Admin', '2023-09-24 21:11:50', 'Account Admin', '2023-09-24 21:11:50');

-- --------------------------------------------------------

--
-- Table structure for table `quoc_tich`
--

CREATE TABLE `quoc_tich` (
  `id` int(11) NOT NULL,
  `ten_quoc_tich` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `quoc_tich`
--

INSERT INTO `quoc_tich` (`id`, `ten_quoc_tich`) VALUES
(1, 'Danish'),
(2, 'Đan Mạch'),
(3, 'British / English'),
(4, 'Anh'),
(5, 'Estonian'),
(6, 'Estonia'),
(7, 'Finnish'),
(8, 'Phần Lan'),
(9, 'Icelandic'),
(10, 'Irish'),
(11, 'Ireland'),
(12, 'Latvian'),
(13, 'Latvia'),
(14, 'Lithuanian'),
(15, 'Norwegian'),
(16, 'Na Uy'),
(17, 'Canada'),
(18, 'Scotland'),
(19, 'Thụy Điển'),
(20, 'Tây Ban Nha'),
(21, 'Séc'),
(22, 'Ba Lan'),
(23, 'Mỹ'),
(24, 'Việt Nam'),
(25, 'Ấn Độ'),
(26, 'Trung Quốc'),
(27, 'Mông Cổ'),
(28, 'Triều Tiên'),
(29, 'Đài Loan'),
(30, 'Campuchia'),
(31, 'Indonesia'),
(32, 'Lào'),
(33, 'Philipin'),
(34, 'Thái Lan');

-- --------------------------------------------------------

--
-- Table structure for table `tai_khoan`
--

CREATE TABLE `tai_khoan` (
  `id` int(11) NOT NULL,
  `ma_nv` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ho` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ten` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `hinh_anh` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `mat_khau` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `so_dt` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `quyen` tinyint(1) NOT NULL,
  `trang_thai` tinyint(1) NOT NULL,
  `truy_cap` int(11) NOT NULL,
  `ngay_tao` datetime NOT NULL,
  `ngay_sua` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tai_khoan`
--

INSERT INTO `tai_khoan` (`id`, `ma_nv`, `ho`, `ten`, `hinh_anh`, `email`, `mat_khau`, `so_dt`, `quyen`, `trang_thai`, `truy_cap`, `ngay_tao`, `ngay_sua`) VALUES
(1, 'admin', '', 'Admin', 'admin.png', 'admin@gmail.com', '25d55ad283aa400af464c76d713c07ad', '099999999999', 1, 1, 69, '2023-09-24 21:12:04', '2023-09-24 21:12:04'),
(2, NULL, 'Thái', 'Mỹ Tiên', '1568644813.jpg', 'ruakundor@gmail.com', '25d55ad283aa400af464c76d713c07ad', '099999999999', 1, 1, 20, '2023-09-24 21:12:04', '2023-09-24 21:12:04'),
(3, NULL, 'Nguyễn', 'Thị Bích Ngọc', '1568647601.jpg', 'thienhoang97@gmail.com', '25d55ad283aa400af464c76d713c07ad', '0932312994', 0, 1, 3, '2023-09-24 21:12:04', '2023-09-24 21:12:04'),
(11, NULL, 'Test', 'Test', '1568856833.jpg', 'test@gmail.com', '202cb962ac59075b964b07152d234b70', '1234567890', 0, 1, 5, '2023-09-24 21:12:04', '2023-09-24 21:12:04'),
(12, NULL, 'Đào', 'Thanh Huy', 'admin.png', 'dthanhhuy1998@gmail.com', '202cb962ac59075b964b07152d234b70', '1234567890', 1, 1, 15, '2023-09-24 21:12:04', '2023-09-24 21:12:04'),
(13, NULL, 'Nguyễn Văn', 'Dược', 'admin.png', 'duocnvoit@gmail.com', '25d55ad283aa400af464c76d713c07ad', '0359020898', 0, 1, 2, '2023-09-24 21:12:04', '2023-09-24 21:12:04'),
(14, 'MNV1569830976', 'Nguyễn ', 'Duy Sơn', '1686418008.jpg', 'nguyenduyson@gmail.com', '25d55ad283aa400af464c76d713c07ad', '', 0, 1, 11, '2023-09-24 21:12:04', '2023-09-24 21:12:04'),
(16, 'MNV1569835233', 'Trần Mai ', 'Phương', 'admin.png', 'tranmaiphuong@gmail.com', '25d55ad283aa400af464c76d713c07ad', '0928817228', 0, 1, 1, '2023-09-24 21:12:04', '2023-09-24 21:12:04'),
(17, 'MNV1571124772', 'Trần Văn ', 'Triệu', '1686481095.jpg', 'tranvantrieu@gmail.com', '25d55ad283aa400af464c76d713c07ad', '0359085899', 0, 1, 0, '2023-09-24 21:12:04', '2023-09-24 21:12:04'),
(18, 'MNV1569831824', 'Nguyễn', 'Phương', 'admin.png', 'nguyenphuong@gmail.com', '25d55ad283aa400af464c76d713c07ad', '0359020898', 0, 1, 1, '2023-09-24 21:12:04', '2023-09-24 21:12:04'),
(19, 'MNV1696694819', 'Phạm ', 'Đạt', 'admin.png', 'phamdat@gmail.com', '25d55ad283aa400af464c76d713c07ad', '0928817228', 0, 1, 1, '2023-10-07 23:08:21', '2023-10-07 23:08:21');

-- --------------------------------------------------------

--
-- Table structure for table `tinh_trang_hon_nhan`
--

CREATE TABLE `tinh_trang_hon_nhan` (
  `id` int(11) NOT NULL,
  `ten_tinh_trang` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tinh_trang_hon_nhan`
--

INSERT INTO `tinh_trang_hon_nhan` (`id`, `ten_tinh_trang`) VALUES
(1, 'Độc thân'),
(2, 'Đính hôn'),
(3, 'Có gia đình'),
(4, 'Ly thân'),
(5, 'Ly hôn');

-- --------------------------------------------------------

--
-- Table structure for table `ton_giao`
--

CREATE TABLE `ton_giao` (
  `id` int(11) NOT NULL,
  `ten_ton_giao` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ton_giao`
--

INSERT INTO `ton_giao` (`id`, `ten_ton_giao`) VALUES
(0, 'Không'),
(1, 'Phật giáo'),
(2, 'Thiên chúa giáo'),
(3, 'Đạo tin lành'),
(4, 'Hồi giáo'),
(5, 'Do Thái giáo');

-- --------------------------------------------------------

--
-- Table structure for table `trinh_do`
--

CREATE TABLE `trinh_do` (
  `id` int(11) NOT NULL,
  `ma_trinh_do` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ten_trinh_do` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ghi_chu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nguoi_tao` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_tao` datetime NOT NULL,
  `nguoi_sua` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_sua` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `trinh_do`
--

INSERT INTO `trinh_do` (`id`, `ma_trinh_do`, `ten_trinh_do`, `ghi_chu`, `nguoi_tao`, `ngay_tao`, `nguoi_sua`, `ngay_sua`) VALUES
(1, 'MTD1569206480', '1/12', '<p>Tr&igrave;nh độ lớp 1/12</p>\r\n', 'Admin', '2023-09-24 21:12:19', 'Admin', '2023-09-24 21:12:19'),
(2, 'MTD1569206546', '2/12', '<p>Tr&igrave;nh độ lớp 2/12</p>\r\n', 'Admin', '2023-09-24 21:12:19', 'Admin', '2023-09-24 21:12:19'),
(3, 'MTD1569206555', '3/12', '<p>Tr&igrave;nh độ lớp 3/12</p>\r\n', 'Admin', '2023-09-24 21:12:19', 'Admin', '2023-09-24 21:12:19'),
(4, 'MTD1569206570', '4/12', '<p>Tr&igrave;nh độ lớp 4/12</p>\r\n', 'Admin', '2023-09-24 21:12:19', 'Admin', '2023-09-24 21:12:19'),
(5, 'MTD1569206579', '5/12', '<p>Tr&igrave;nh độ lớp 5/12</p>\r\n', 'Admin', '2023-09-24 21:12:19', 'Admin', '2023-09-24 21:12:19'),
(6, 'MTD1569206590', '6/12', '<p>Tr&igrave;nh độ lớp 6/12</p>\r\n', 'Admin', '2023-09-24 21:12:19', 'Admin', '2023-09-24 21:12:19'),
(7, 'MTD1569206604', '7/12', '<p>Tr&igrave;nh độ lớp 7/12</p>\r\n', 'Admin', '2023-09-24 21:12:19', 'Admin', '2023-09-24 21:12:19'),
(8, 'MTD1569206616', '8/12', '<p>Tr&igrave;nh độ lớp 8/12</p>\r\n', 'Admin', '2023-09-24 21:12:19', 'Admin', '2023-09-24 21:12:19'),
(9, 'MTD1569206628', '9/12', '<p>Tr&igrave;nh độ lớp 9/12</p>\r\n', 'Admin', '2023-09-24 21:12:19', 'Admin', '2023-09-24 21:12:19'),
(10, 'MTD1569206638', '10/12', '<p>Tr&igrave;nh độ lớp 10/12</p>\r\n', 'Admin', '2023-09-24 21:12:19', 'Admin', '2023-09-24 21:12:19'),
(11, 'MTD1569206649', '11/12', '<p>Tr&igrave;nh độ lớp 11/12</p>\r\n', 'Admin', '2023-09-24 21:12:19', 'Admin', '2023-09-24 21:12:19'),
(12, 'MTD1569206662', '12/12', '<p>Tr&igrave;nh độ lớp 12/12</p>\r\n', 'Admin', '2023-09-24 21:12:19', 'Admin', '2023-09-24 21:12:19'),
(15, 'MTD1569651298', 'Trung cấp', '', 'Admin', '2023-09-24 21:12:19', 'Admin', '2023-09-24 21:12:19'),
(16, 'MTD1569651304', 'Cao đẳng', '', 'Admin', '2023-09-24 21:12:19', 'Admin', '2023-09-24 21:12:19'),
(17, 'MTD1569651310', 'Đại học', '', 'Admin', '2023-09-24 21:12:19', 'Admin', '2023-09-24 21:12:19'),
(18, 'MTD1569651317', 'Cao học', '', 'Admin', '2023-09-24 21:12:19', 'Admin', '2023-09-24 21:12:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bang_cap`
--
ALTER TABLE `bang_cap`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chinh_luong`
--
ALTER TABLE `chinh_luong`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nhanvien_id` (`nhanvien_id`);

--
-- Indexes for table `chi_tiet_nhom`
--
ALTER TABLE `chi_tiet_nhom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chi_tiet_phong_ban`
--
ALTER TABLE `chi_tiet_phong_ban`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chuc_vu`
--
ALTER TABLE `chuc_vu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chuyen_mon`
--
ALTER TABLE `chuyen_mon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cong_tac`
--
ALTER TABLE `cong_tac`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nhanvien_id` (`nhanvien_id`);

--
-- Indexes for table `dan_toc`
--
ALTER TABLE `dan_toc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `khen_thuong_ky_luat`
--
ALTER TABLE `khen_thuong_ky_luat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loai_kt_id` (`loai_kt_id`),
  ADD KEY `nhanvien_id` (`nhanvien_id`);

--
-- Indexes for table `loai_khen_thuong_ky_luat`
--
ALTER TABLE `loai_khen_thuong_ky_luat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loai_nv`
--
ALTER TABLE `loai_nv`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `luong`
--
ALTER TABLE `luong`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nhanvien_id` (`nhanvien_id`);

--
-- Indexes for table `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ton_giao_id` (`ton_giao_id`),
  ADD KEY `dan_toc_id` (`dan_toc_id`),
  ADD KEY `loai_nv_id` (`loai_nv_id`),
  ADD KEY `chuyen_mon_id` (`chuyen_mon_id`),
  ADD KEY `trinh_do_id` (`trinh_do_id`),
  ADD KEY `bang_cap_id` (`bang_cap_id`),
  ADD KEY `chuc_vu_id` (`chuc_vu_id`),
  ADD KEY `nguoi_tao_id` (`nguoi_tao_id`),
  ADD KEY `nguoi_sua_id` (`nguoi_sua_id`);

--
-- Indexes for table `nhom`
--
ALTER TABLE `nhom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phong_ban`
--
ALTER TABLE `phong_ban`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quoc_tich`
--
ALTER TABLE `quoc_tich`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tai_khoan`
--
ALTER TABLE `tai_khoan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tinh_trang_hon_nhan`
--
ALTER TABLE `tinh_trang_hon_nhan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ton_giao`
--
ALTER TABLE `ton_giao`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trinh_do`
--
ALTER TABLE `trinh_do`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bang_cap`
--
ALTER TABLE `bang_cap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `chinh_luong`
--
ALTER TABLE `chinh_luong`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chi_tiet_nhom`
--
ALTER TABLE `chi_tiet_nhom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `chi_tiet_phong_ban`
--
ALTER TABLE `chi_tiet_phong_ban`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `chuc_vu`
--
ALTER TABLE `chuc_vu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `chuyen_mon`
--
ALTER TABLE `chuyen_mon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `cong_tac`
--
ALTER TABLE `cong_tac`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `dan_toc`
--
ALTER TABLE `dan_toc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `khen_thuong_ky_luat`
--
ALTER TABLE `khen_thuong_ky_luat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `loai_khen_thuong_ky_luat`
--
ALTER TABLE `loai_khen_thuong_ky_luat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `loai_nv`
--
ALTER TABLE `loai_nv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `luong`
--
ALTER TABLE `luong`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `nhanvien`
--
ALTER TABLE `nhanvien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `nhom`
--
ALTER TABLE `nhom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `phong_ban`
--
ALTER TABLE `phong_ban`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `quoc_tich`
--
ALTER TABLE `quoc_tich`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `tai_khoan`
--
ALTER TABLE `tai_khoan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tinh_trang_hon_nhan`
--
ALTER TABLE `tinh_trang_hon_nhan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ton_giao`
--
ALTER TABLE `ton_giao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `trinh_do`
--
ALTER TABLE `trinh_do`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chinh_luong`
--
ALTER TABLE `chinh_luong`
  ADD CONSTRAINT `chinh_luong_ibfk_1` FOREIGN KEY (`nhanvien_id`) REFERENCES `nhanvien` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cong_tac`
--
ALTER TABLE `cong_tac`
  ADD CONSTRAINT `cong_tac_ibfk_1` FOREIGN KEY (`nhanvien_id`) REFERENCES `nhanvien` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `khen_thuong_ky_luat`
--
ALTER TABLE `khen_thuong_ky_luat`
  ADD CONSTRAINT `khen_thuong_ky_luat_ibfk_1` FOREIGN KEY (`nhanvien_id`) REFERENCES `nhanvien` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `khen_thuong_ky_luat_ibfk_2` FOREIGN KEY (`loai_kt_id`) REFERENCES `loai_khen_thuong_ky_luat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `luong`
--
ALTER TABLE `luong`
  ADD CONSTRAINT `luong_ibfk_1` FOREIGN KEY (`nhanvien_id`) REFERENCES `nhanvien` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD CONSTRAINT `nhanvien_ibfk_1` FOREIGN KEY (`quoc_tich_id`) REFERENCES `quoc_tich` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `nhanvien_ibfk_2` FOREIGN KEY (`ton_giao_id`) REFERENCES `ton_giao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `nhanvien_ibfk_3` FOREIGN KEY (`dan_toc_id`) REFERENCES `dan_toc` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `nhanvien_ibfk_4` FOREIGN KEY (`loai_nv_id`) REFERENCES `loai_nv` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `nhanvien_ibfk_5` FOREIGN KEY (`trinh_do_id`) REFERENCES `trinh_do` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `nhanvien_ibfk_6` FOREIGN KEY (`chuyen_mon_id`) REFERENCES `chuyen_mon` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `nhanvien_ibfk_7` FOREIGN KEY (`bang_cap_id`) REFERENCES `bang_cap` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `nhanvien_ibfk_8` FOREIGN KEY (`phong_ban_id`) REFERENCES `phong_ban` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `nhanvien_ibfk_9` FOREIGN KEY (`chuc_vu_id`) REFERENCES `chuc_vu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
