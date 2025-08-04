-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 04, 2025 lúc 04:05 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `nckh_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `detai`
--

CREATE TABLE `detai` (
  `id_detai` int(10) UNSIGNED NOT NULL,
  `id_ttcn` int(10) UNSIGNED NOT NULL,
  `id_lvnc` int(10) UNSIGNED NOT NULL,
  `id_loaidt` int(10) UNSIGNED NOT NULL,
  `tendetai` text NOT NULL,
  `hotenCN` text NOT NULL,
  `donvi` text DEFAULT NULL,
  `sodt` varchar(10) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `tgbatdau` date NOT NULL,
  `tgketthuc` date NOT NULL,
  `sogiotg` int(11) NOT NULL,
  `trangthai` varchar(50) DEFAULT NULL,
  `diemdanhgia` text DEFAULT NULL,
  `nhanxet` text DEFAULT NULL,
  `kinhphitong` decimal(11,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `detai`
--

INSERT INTO `detai` (`id_detai`, `id_ttcn`, `id_lvnc`, `id_loaidt`, `tendetai`, `hotenCN`, `donvi`, `sodt`, `email`, `tgbatdau`, `tgketthuc`, `sogiotg`, `trangthai`, `diemdanhgia`, `nhanxet`, `kinhphitong`, `created_at`, `updated_at`) VALUES
(11, 1, 1, 3, 'Nghiên cứu ABC', 'Nguyen Van A', 'Khoa CNTT', '0123456789', 'a@gmail.com', '2025-07-27', '2025-08-27', 60, 'Đang chờ duyệt', NULL, NULL, NULL, '2025-07-30 03:49:07', '2025-07-30 03:49:07'),
(13, 2, 1, 1, 'Nghiên cứu Khoa học 1', 'Nguyen Van B', 'Khoa công nghệ thông tin', '0123456789', 'b@gmail.com', '2025-08-30', '2025-12-30', 200, 'Đang chờ duyệt', NULL, NULL, NULL, '2025-07-30 03:57:20', '2025-07-30 03:57:20'),
(14, 3, 1, 2, 'Nghiên cứu Khoa học 2', 'Le Van C', 'Khoa công nghệ thông tin', '0123456789', 'b@gmail.com', '2025-08-30', '2025-12-30', 120, 'Đang chờ duyệt', NULL, NULL, NULL, '2025-07-30 04:01:26', '2025-07-30 04:01:26'),
(15, 4, 1, 4, 'Sáng kiến kinh nghiệm 3', 'Nguyen Van D', 'Khoa công nghệ thông tin', '0123456789', 'c@gmail.com', '2025-08-30', '2025-12-30', 120, 'Đang chờ duyệt', NULL, NULL, NULL, '2025-07-30 08:36:21', '2025-07-30 08:36:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
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
-- Cấu trúc bảng cho bảng `kinhphi`
--

CREATE TABLE `kinhphi` (
  `id_kp` int(10) UNSIGNED NOT NULL,
  `id_detai` int(10) UNSIGNED DEFAULT NULL,
  `id_tiendo` int(10) UNSIGNED NOT NULL,
  `ctkhoanchi` text DEFAULT NULL,
  `donvitinh` text DEFAULT NULL,
  `soluong` text DEFAULT NULL,
  `dongia` decimal(11,2) DEFAULT NULL,
  `thanhtien` decimal(11,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `kinhphi`
--

INSERT INTO `kinhphi` (`id_kp`, `id_detai`, `id_tiendo`, `ctkhoanchi`, `donvitinh`, `soluong`, `dongia`, `thanhtien`, `created_at`, `updated_at`) VALUES
(11, 11, 11, 'Nội dung chi 1', 'Cuốn', '2', 100000.00, 200000.00, '2025-07-30 03:49:07', '2025-07-30 03:49:07'),
(12, 11, 11, 'In tài liệu', 'Bộ', '3', 50000.00, 150000.00, '2025-07-30 03:49:07', '2025-07-30 03:49:07'),
(13, 11, 12, 'Nội dung chi', 'Cuốn', '2', 100000.00, 200000.00, '2025-07-30 03:49:07', '2025-07-30 03:49:07'),
(14, 11, 12, 'In tài liệu', 'Bộ', '3', 50000.00, 150000.00, '2025-07-30 03:49:07', '2025-07-30 03:49:07'),
(19, 13, 15, 'Nội dung chi 1', 'Cuốn', '2', 100000.00, 200000.00, '2025-07-30 03:57:20', '2025-07-30 03:57:20'),
(20, 13, 15, 'In tài liệu', 'Bộ', '3', 50000.00, 150000.00, '2025-07-30 03:57:20', '2025-07-30 03:57:20'),
(21, 13, 16, 'Nội dung chi', 'Cuốn', '2', 100000.00, 200000.00, '2025-07-30 03:57:20', '2025-07-30 03:57:20'),
(22, 13, 16, 'In tài liệu', 'Bộ', '3', 50000.00, 150000.00, '2025-07-30 03:57:20', '2025-07-30 03:57:20'),
(23, 14, 17, 'Nội dung chi 1', 'Cuốn', '2', 100000.00, 200000.00, '2025-07-30 04:01:26', '2025-07-30 04:01:26'),
(24, 14, 17, 'In tài liệu', 'Bộ', '3', 50000.00, 150000.00, '2025-07-30 04:01:26', '2025-07-30 04:01:26'),
(25, 14, 18, 'Nội dung chi', 'Cuốn', '2', 100000.00, 200000.00, '2025-07-30 04:01:26', '2025-07-30 04:01:26'),
(26, 14, 18, 'In tài liệu', 'Bộ', '3', 50000.00, 150000.00, '2025-07-30 04:01:26', '2025-07-30 04:01:26'),
(27, 15, 19, 'Nội dung chi 1', 'Cuốn', '2', 100000.00, 200000.00, '2025-07-30 08:36:21', '2025-07-30 08:36:21'),
(28, 15, 19, 'In tài liệu', 'Bộ', '3', 50000.00, 150000.00, '2025-07-30 08:36:21', '2025-07-30 08:36:21'),
(29, 15, 20, 'Nội dung chi', 'Cuốn', '2', 100000.00, 200000.00, '2025-07-30 08:36:21', '2025-07-30 08:36:21'),
(30, 15, 20, 'In tài liệu', 'Bộ', '3', 50000.00, 150000.00, '2025-07-30 08:36:21', '2025-07-30 08:36:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `linhvucnghiencuu`
--

CREATE TABLE `linhvucnghiencuu` (
  `id_lvnc` int(10) UNSIGNED NOT NULL,
  `tenlvnc` text NOT NULL,
  `ghichu` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `linhvucnghiencuu`
--

INSERT INTO `linhvucnghiencuu` (`id_lvnc`, `tenlvnc`, `ghichu`, `created_at`, `updated_at`) VALUES
(1, 'Công nghệ thông tin', NULL, NULL, NULL),
(2, 'Công nghệ thực phẩm', NULL, '2025-07-25 15:51:20', '2025-07-25 15:51:20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaidetai`
--

CREATE TABLE `loaidetai` (
  `id_loaidt` int(10) UNSIGNED NOT NULL,
  `tenloaidetai` text NOT NULL,
  `sogioTGtoida` int(11) DEFAULT NULL,
  `sogioTVtoida` int(11) DEFAULT NULL,
  `soTVtoida` int(11) DEFAULT NULL,
  `nam` int(11) NOT NULL,
  `ghichu` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `loaidetai`
--

INSERT INTO `loaidetai` (`id_loaidt`, `tenloaidetai`, `sogioTGtoida`, `sogioTVtoida`, `soTVtoida`, `nam`, `ghichu`, `created_at`, `updated_at`) VALUES
(1, 'Đề tài cấp tỉnh', 200, 100, 5, 2025, 'note', '2025-07-25 15:58:44', '2025-07-25 15:58:44'),
(2, 'Đề tài cấp trường', 120, 60, 4, 2025, 'note', '2025-07-25 15:58:44', '2025-07-25 15:58:44'),
(3, 'Đề tài cấp khoa', 60, 30, 2, 2025, NULL, '2025-07-30 02:28:47', '2025-07-30 02:28:47'),
(4, 'Sáng kiến kinh nghiệm (SKKN)', 60, 30, 2, 2025, NULL, '2025-07-30 02:48:21', '2025-07-30 02:43:46'),
(5, 'Các hội đồng', 2, 5, 5, 2025, NULL, '2025-07-30 03:41:45', '2025-07-30 03:41:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaispnghiencuu`
--

CREATE TABLE `loaispnghiencuu` (
  `id_loai` int(10) UNSIGNED NOT NULL,
  `tenloaispnc` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `loaispnghiencuu`
--

INSERT INTO `loaispnghiencuu` (`id_loai`, `tenloaispnc`, `created_at`, `updated_at`) VALUES
(1, 'Giáo trình\r\n', '2025-07-25 15:56:24', '2025-07-25 15:56:24');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_07_15_035815_thongtincanhan_table', 1),
(6, '2025_07_15_072504_loaispnghiencuu_table', 1),
(7, '2025_07_15_073630_linhvunghiencuu_table', 1),
(8, '2025_07_15_074126_loaidetai_table', 1),
(9, '2025_07_15_151206_detai_table', 1),
(10, '2025_07_15_151306_nam_table', 1),
(11, '2025_07_15_154353_sanpham_table', 1),
(12, '2025_07_15_154720_thanhvien_table', 1),
(13, '2025_07_15_155957_tvhoidong_table', 1),
(14, '2025_07_15_160149_tiendo_table', 1),
(15, '2025_07_15_175545_kinhphi_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
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
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `id_sanpham` int(10) UNSIGNED NOT NULL,
  `id_detai` int(10) UNSIGNED NOT NULL,
  `id_loai` int(10) UNSIGNED DEFAULT NULL,
  `linkSP` text NOT NULL,
  `tenSP` text NOT NULL,
  `trangthai` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sogiotheonam`
--

CREATE TABLE `sogiotheonam` (
  `id_nam` int(10) UNSIGNED NOT NULL,
  `id_loaidt` int(10) UNSIGNED NOT NULL,
  `sogioTGtoida` int(11) NOT NULL,
  `sogioTVtoida` int(11) NOT NULL,
  `soTVtoida` int(11) NOT NULL,
  `nam` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sogiotheonam`
--

INSERT INTO `sogiotheonam` (`id_nam`, `id_loaidt`, `sogioTGtoida`, `sogioTVtoida`, `soTVtoida`, `nam`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(4, 1, 200, 100, 5, 2025, NULL, NULL, '2025-07-30 04:04:20', '2025-07-30 04:04:20'),
(5, 2, 120, 60, 4, 2025, NULL, NULL, '2025-07-30 04:04:20', '2025-07-30 04:04:20'),
(6, 3, 60, 30, 2, 2025, NULL, NULL, '2025-07-30 04:05:42', '2025-07-30 04:05:42'),
(7, 4, 60, 30, 2, 2025, NULL, NULL, '2025-07-30 04:06:12', '2025-07-30 04:06:12'),
(8, 5, 2, 5, 5, 2025, NULL, NULL, '2025-07-30 04:06:31', '2025-07-30 04:06:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thanhvien`
--

CREATE TABLE `thanhvien` (
  `id_tv` int(10) UNSIGNED NOT NULL,
  `id_detai` int(10) UNSIGNED NOT NULL,
  `id_ttcn` int(10) UNSIGNED DEFAULT NULL,
  `tenthanhvien` text NOT NULL,
  `nhiemvu` text DEFAULT NULL,
  `vaitro` text DEFAULT NULL,
  `sogiothamgia` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `thanhvien`
--

INSERT INTO `thanhvien` (`id_tv`, `id_detai`, `id_ttcn`, `tenthanhvien`, `nhiemvu`, `vaitro`, `sogiothamgia`, `created_at`, `updated_at`) VALUES
(17, 11, NULL, 'Le Van B', 'Thành viên', 'Hỗ trợ', 15, '2025-07-30 03:49:07', '2025-07-30 03:49:07'),
(18, 11, NULL, 'Tran Thi C', 'Thành viên', 'Hỗ trợ', 14, '2025-07-30 03:49:07', '2025-07-30 03:49:07'),
(21, 13, NULL, 'Le Van E', 'Thành viên', 'Hỗ trợ', 45, '2025-07-30 03:57:20', '2025-07-30 03:57:20'),
(22, 13, NULL, 'Tran Thi F', 'Thành viên', 'Hỗ trợ', 30, '2025-07-30 03:57:20', '2025-07-30 03:57:20'),
(23, 14, NULL, 'Le Van E', 'Thành viên', 'Hỗ trợ', 25, '2025-07-30 04:01:26', '2025-07-30 04:01:26'),
(24, 14, NULL, 'Tran Thi F', 'Thành viên', 'Hỗ trợ', 25, '2025-07-30 04:01:26', '2025-07-30 04:01:26'),
(25, 15, NULL, 'Le Van G', 'Thành viên', 'Hỗ trợ', 25, '2025-07-30 08:36:21', '2025-07-30 08:36:21'),
(26, 15, NULL, 'Tran Thi E', 'Thành viên', 'Hỗ trợ', 25, '2025-07-30 08:36:21', '2025-07-30 08:36:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thongtincanhan`
--

CREATE TABLE `thongtincanhan` (
  `id_ttcn` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `hovaten` varchar(255) DEFAULT NULL,
  `dvcongtac` text DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `thongtincanhan`
--

INSERT INTO `thongtincanhan` (`id_ttcn`, `user_id`, `hovaten`, `dvcongtac`, `email`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Nguyễn Văn A', 'Khoa công nghệ thông tin', 'tin@gmail.com', '2025-07-25 16:11:08', '2025-07-25 16:11:08'),
(2, NULL, 'Nguyễn Văn B', 'Khoa cơ bản', 'b@gmail.com', '2025-07-30 02:50:55', '2025-07-30 02:50:55'),
(3, NULL, 'Lê Văn C', 'Khoa công nghệ thông tin', 'c@gmail.com', '2025-07-30 02:50:55', '2025-07-30 02:50:55'),
(4, NULL, 'Nguyễn Văn D', 'Khoa công nghệ thực phẩm', 'd@gmail.com', '2025-07-30 02:53:30', '2025-07-30 02:53:30'),
(5, NULL, 'Nguyễn Văn E', 'Khoa cơ bản', 'e@gmail.com', '2025-07-30 02:53:30', '2025-07-30 02:53:30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tiendo`
--

CREATE TABLE `tiendo` (
  `id_tiendo` int(10) UNSIGNED NOT NULL,
  `id_detai` int(10) UNSIGNED NOT NULL,
  `id_tv` int(10) UNSIGNED DEFAULT NULL,
  `ndcongviec` text NOT NULL,
  `nguoithuchien` text DEFAULT NULL,
  `thang` text DEFAULT NULL,
  `tgbatdau` date DEFAULT NULL,
  `tgketthuc` date DEFAULT NULL,
  `trangthai` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tiendo`
--

INSERT INTO `tiendo` (`id_tiendo`, `id_detai`, `id_tv`, `ndcongviec`, `nguoithuchien`, `thang`, `tgbatdau`, `tgketthuc`, `trangthai`, `created_at`, `updated_at`) VALUES
(11, 11, NULL, 'Công việc 1', 'tác giả và thành viên', 'Tháng 1', NULL, NULL, 'Đang thức hiện', '2025-07-30 03:49:07', '2025-07-30 03:49:07'),
(12, 11, NULL, 'Công việc 2', 'tác giả', 'Tháng 1 - Tháng 2', '2025-08-10', '2025-08-20', 'Chưa thực hiện', '2025-07-30 03:49:07', '2025-07-30 03:49:07'),
(15, 13, NULL, 'Công việc 1', 'tác giả và thành viên', 'Tháng 1', NULL, NULL, 'Đang thức hiện', '2025-07-30 03:57:20', '2025-07-30 03:57:20'),
(16, 13, NULL, 'Công việc 2', 'tác giả', 'Tháng 1 - Tháng 2', '2025-08-10', '2025-08-20', 'Chưa thực hiện', '2025-07-30 03:57:20', '2025-07-30 03:57:20'),
(17, 14, NULL, 'Công việc 1', 'tác giả và thành viên', 'Tháng 1', NULL, NULL, 'Đang thức hiện', '2025-07-30 04:01:26', '2025-07-30 04:01:26'),
(18, 14, NULL, 'Công việc 2', 'tác giả', 'Tháng 1 - Tháng 2', '2025-08-10', '2025-08-20', 'Chưa thực hiện', '2025-07-30 04:01:26', '2025-07-30 04:01:26'),
(19, 15, NULL, 'Công việc 1', 'tác giả và thành viên', 'Tháng 1', NULL, NULL, 'Đang thức hiện', '2025-07-30 08:36:21', '2025-07-30 08:36:21'),
(20, 15, NULL, 'Công việc 2', 'tác giả', 'Tháng 1 - Tháng 2', '2025-08-10', '2025-08-20', 'Chưa thực hiện', '2025-07-30 08:36:21', '2025-07-30 08:36:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tvhoidong`
--

CREATE TABLE `tvhoidong` (
  `id_tv` int(10) UNSIGNED NOT NULL,
  `id_detai` int(10) UNSIGNED NOT NULL,
  `id_ttcn` int(10) UNSIGNED DEFAULT NULL,
  `tenthanhvien` text DEFAULT NULL,
  `chucdanh` text DEFAULT NULL,
  `sogiohoidong` int(11) DEFAULT NULL,
  `loaihoidong` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `permission` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `permission`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'vtt', 'tin@gmail.com', '2025-07-25 16:10:10', '123456', 'manager', NULL, '2025-07-25 16:10:10', '2025-07-25 16:10:10');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `detai`
--
ALTER TABLE `detai`
  ADD PRIMARY KEY (`id_detai`),
  ADD KEY `detai_id_loaidt_foreign` (`id_loaidt`),
  ADD KEY `detai_id_ttcn_foreign` (`id_ttcn`),
  ADD KEY `detai_id_lvnc_foreign` (`id_lvnc`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `kinhphi`
--
ALTER TABLE `kinhphi`
  ADD PRIMARY KEY (`id_kp`),
  ADD KEY `kinhphi_id_detai_foreign` (`id_detai`),
  ADD KEY `kinhphi_id_tiendo_foreign` (`id_tiendo`);

--
-- Chỉ mục cho bảng `linhvucnghiencuu`
--
ALTER TABLE `linhvucnghiencuu`
  ADD PRIMARY KEY (`id_lvnc`);

--
-- Chỉ mục cho bảng `loaidetai`
--
ALTER TABLE `loaidetai`
  ADD PRIMARY KEY (`id_loaidt`);

--
-- Chỉ mục cho bảng `loaispnghiencuu`
--
ALTER TABLE `loaispnghiencuu`
  ADD PRIMARY KEY (`id_loai`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`id_sanpham`),
  ADD KEY `sanpham_id_detai_foreign` (`id_detai`),
  ADD KEY `sanpham_id_loai_foreign` (`id_loai`);

--
-- Chỉ mục cho bảng `sogiotheonam`
--
ALTER TABLE `sogiotheonam`
  ADD PRIMARY KEY (`id_nam`),
  ADD KEY `sogiotheonam_id_loaidt_foreign` (`id_loaidt`);

--
-- Chỉ mục cho bảng `thanhvien`
--
ALTER TABLE `thanhvien`
  ADD PRIMARY KEY (`id_tv`),
  ADD KEY `thanhvien_id_detai_foreign` (`id_detai`),
  ADD KEY `thanhvien_id_ttcn_foreign` (`id_ttcn`);

--
-- Chỉ mục cho bảng `thongtincanhan`
--
ALTER TABLE `thongtincanhan`
  ADD PRIMARY KEY (`id_ttcn`),
  ADD KEY `thongtincanhan_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `tiendo`
--
ALTER TABLE `tiendo`
  ADD PRIMARY KEY (`id_tiendo`),
  ADD KEY `tiendo_id_detai_foreign` (`id_detai`),
  ADD KEY `tiendo_id_tv_foreign` (`id_tv`);

--
-- Chỉ mục cho bảng `tvhoidong`
--
ALTER TABLE `tvhoidong`
  ADD PRIMARY KEY (`id_tv`),
  ADD KEY `tvhoidong_id_detai_foreign` (`id_detai`),
  ADD KEY `tvhoidong_id_ttcn_foreign` (`id_ttcn`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `detai`
--
ALTER TABLE `detai`
  MODIFY `id_detai` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `kinhphi`
--
ALTER TABLE `kinhphi`
  MODIFY `id_kp` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `linhvucnghiencuu`
--
ALTER TABLE `linhvucnghiencuu`
  MODIFY `id_lvnc` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `loaidetai`
--
ALTER TABLE `loaidetai`
  MODIFY `id_loaidt` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `loaispnghiencuu`
--
ALTER TABLE `loaispnghiencuu`
  MODIFY `id_loai` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `id_sanpham` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sogiotheonam`
--
ALTER TABLE `sogiotheonam`
  MODIFY `id_nam` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `thanhvien`
--
ALTER TABLE `thanhvien`
  MODIFY `id_tv` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `thongtincanhan`
--
ALTER TABLE `thongtincanhan`
  MODIFY `id_ttcn` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `tiendo`
--
ALTER TABLE `tiendo`
  MODIFY `id_tiendo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `tvhoidong`
--
ALTER TABLE `tvhoidong`
  MODIFY `id_tv` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `detai`
--
ALTER TABLE `detai`
  ADD CONSTRAINT `detai_id_loaidt_foreign` FOREIGN KEY (`id_loaidt`) REFERENCES `loaidetai` (`id_loaidt`) ON DELETE CASCADE,
  ADD CONSTRAINT `detai_id_lvnc_foreign` FOREIGN KEY (`id_lvnc`) REFERENCES `linhvucnghiencuu` (`id_lvnc`),
  ADD CONSTRAINT `detai_id_ttcn_foreign` FOREIGN KEY (`id_ttcn`) REFERENCES `thongtincanhan` (`id_ttcn`);

--
-- Các ràng buộc cho bảng `kinhphi`
--
ALTER TABLE `kinhphi`
  ADD CONSTRAINT `kinhphi_id_detai_foreign` FOREIGN KEY (`id_detai`) REFERENCES `detai` (`id_detai`),
  ADD CONSTRAINT `kinhphi_id_tiendo_foreign` FOREIGN KEY (`id_tiendo`) REFERENCES `tiendo` (`id_tiendo`);

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `sanpham_id_detai_foreign` FOREIGN KEY (`id_detai`) REFERENCES `detai` (`id_detai`) ON DELETE CASCADE,
  ADD CONSTRAINT `sanpham_id_loai_foreign` FOREIGN KEY (`id_loai`) REFERENCES `loaispnghiencuu` (`id_loai`);

--
-- Các ràng buộc cho bảng `sogiotheonam`
--
ALTER TABLE `sogiotheonam`
  ADD CONSTRAINT `sogiotheonam_id_loaidt_foreign` FOREIGN KEY (`id_loaidt`) REFERENCES `loaidetai` (`id_loaidt`);

--
-- Các ràng buộc cho bảng `thanhvien`
--
ALTER TABLE `thanhvien`
  ADD CONSTRAINT `thanhvien_id_detai_foreign` FOREIGN KEY (`id_detai`) REFERENCES `detai` (`id_detai`),
  ADD CONSTRAINT `thanhvien_id_ttcn_foreign` FOREIGN KEY (`id_ttcn`) REFERENCES `thongtincanhan` (`id_ttcn`);

--
-- Các ràng buộc cho bảng `thongtincanhan`
--
ALTER TABLE `thongtincanhan`
  ADD CONSTRAINT `thongtincanhan_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `tiendo`
--
ALTER TABLE `tiendo`
  ADD CONSTRAINT `tiendo_id_detai_foreign` FOREIGN KEY (`id_detai`) REFERENCES `detai` (`id_detai`),
  ADD CONSTRAINT `tiendo_id_tv_foreign` FOREIGN KEY (`id_tv`) REFERENCES `thanhvien` (`id_tv`);

--
-- Các ràng buộc cho bảng `tvhoidong`
--
ALTER TABLE `tvhoidong`
  ADD CONSTRAINT `tvhoidong_id_detai_foreign` FOREIGN KEY (`id_detai`) REFERENCES `detai` (`id_detai`),
  ADD CONSTRAINT `tvhoidong_id_ttcn_foreign` FOREIGN KEY (`id_ttcn`) REFERENCES `thongtincanhan` (`id_ttcn`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
