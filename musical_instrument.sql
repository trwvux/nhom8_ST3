-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th6 06, 2021 lúc 01:41 PM
-- Phiên bản máy phục vụ: 5.7.31
-- Phiên bản PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `musical_instrument`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `category_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `created_at`, `updated_at`) VALUES
(1, 'Guitar Acoustic', NULL, '2021-05-31 20:03:56'),
(2, 'Trống', NULL, NULL),
(3, 'Piano Điện', NULL, '2021-05-31 20:04:41'),
(4, 'Saxophone', NULL, '2021-05-31 18:26:48'),
(5, 'Trumpet', '2021-05-31 18:37:42', '2021-05-31 18:37:42'),
(6, 'Guitar Điện', '2021-05-31 19:53:15', '2021-05-31 19:53:15'),
(7, 'Guitar Classic', '2021-05-31 20:03:37', '2021-05-31 20:03:37'),
(8, 'Piano Cơ', '2021-05-31 20:05:08', '2021-05-31 20:05:08'),
(9, 'Violin', '2021-06-06 00:47:18', '2021-06-06 00:47:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categorizable`
--

DROP TABLE IF EXISTS `categorizable`;
CREATE TABLE IF NOT EXISTS `categorizable` (
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `categorizable_category_id_foreign` (`category_id`),
  KEY `categorizable_product_id_foreign` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categorizable`
--

INSERT INTO `categorizable` (`category_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-05-25 02:24:43', '2021-05-25 02:24:43'),
(1, 3, '2021-05-25 02:28:41', '2021-05-25 02:28:41'),
(1, 4, '2021-05-25 02:33:53', '2021-05-25 02:33:53'),
(1, 5, '2021-05-25 02:37:04', '2021-05-25 02:37:04'),
(2, 6, '2021-05-31 18:13:16', '2021-05-31 18:13:16'),
(2, 7, '2021-05-31 18:15:45', '2021-05-31 18:15:45'),
(2, 8, '2021-05-31 18:18:05', '2021-05-31 18:18:05'),
(3, 10, '2021-05-31 18:24:21', '2021-05-31 18:24:21'),
(3, 9, '2021-05-31 18:24:51', '2021-05-31 18:24:51'),
(4, 11, '2021-05-31 18:28:54', '2021-05-31 18:28:54'),
(4, 12, '2021-05-31 18:30:35', '2021-05-31 18:30:35'),
(4, 13, '2021-05-31 18:31:58', '2021-05-31 18:31:58'),
(4, 14, '2021-05-31 18:36:36', '2021-05-31 18:36:36'),
(5, 15, '2021-05-31 18:39:35', '2021-05-31 18:39:35'),
(5, 16, '2021-05-31 18:59:34', '2021-05-31 18:59:34'),
(5, 17, '2021-05-31 19:27:22', '2021-05-31 19:27:22'),
(5, 18, '2021-05-31 19:29:08', '2021-05-31 19:29:08'),
(8, 19, '2021-05-31 20:07:42', '2021-05-31 20:07:42'),
(8, 20, '2021-05-31 20:07:27', '2021-05-31 20:07:27'),
(8, 21, '2021-05-31 20:07:05', '2021-05-31 20:07:05'),
(8, 22, '2021-05-31 20:06:45', '2021-05-31 20:06:45'),
(8, 23, '2021-05-31 20:05:38', '2021-05-31 20:05:38'),
(8, 24, '2021-05-31 20:05:59', '2021-05-31 20:05:59'),
(6, 25, '2021-05-31 19:56:04', '2021-05-31 19:56:04'),
(6, 26, '2021-05-31 19:57:52', '2021-05-31 19:57:52'),
(6, 27, '2021-05-31 20:49:35', '2021-05-31 20:49:35'),
(6, 28, '2021-05-31 20:01:26', '2021-05-31 20:01:26'),
(9, 29, '2021-06-06 00:49:30', '2021-06-06 00:49:30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `comment_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_rating` int(11) NOT NULL,
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `comments_user_id_foreign` (`user_id`),
  KEY `comments_product_id_foreign` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `manufacturers`
--

DROP TABLE IF EXISTS `manufacturers`;
CREATE TABLE IF NOT EXISTS `manufacturers` (
  `manufacturer_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `manufacturer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `manufacturers`
--

INSERT INTO `manufacturers` (`manufacturer_id`, `manufacturer_name`, `created_at`, `updated_at`) VALUES
(2, 'Taylor', NULL, NULL),
(9, 'Kawai', '2021-05-31 19:38:11', '2021-05-31 19:38:11'),
(8, 'Boston', '2021-05-31 19:31:07', '2021-05-31 19:31:07'),
(5, 'Pearl', NULL, NULL),
(6, 'Roland', NULL, NULL),
(7, 'Selmer', '2021-05-31 18:27:24', '2021-05-31 18:27:24'),
(10, 'Fender', '2021-05-31 19:51:57', '2021-05-31 19:51:57'),
(11, 'Suzuki', '2021-06-06 00:46:57', '2021-06-06 00:46:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2021_04_09_000000_create_users_table', 1),
(2, '2021_04_10_020820_create_manufacturers_table', 1),
(3, '2021_04_11_160356_create_orders_table', 1),
(4, '2021_04_12_155658_create_categories_table', 1),
(5, '2021_04_13_155218_create_products_table', 1),
(6, '2021_04_14_160229_create_categorizable_table', 1),
(7, '2021_04_15_160908_create_comments_table', 1),
(8, '2021_04_16_021344_create_order_details_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_status` int(11) NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `orders_user_id_foreign` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `detail_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `detail_quantity` int(11) NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`detail_id`),
  KEY `order_details_order_id_foreign` (`order_id`),
  KEY `order_details_product_id_foreign` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `product_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` int(11) NOT NULL DEFAULT '0',
  `product_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_available` int(11) NOT NULL DEFAULT '0',
  `manufacturer_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `products_manufacturer_id_foreign` (`manufacturer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_price`, `product_image`, `product_description`, `product_available`, `manufacturer_id`, `created_at`, `updated_at`) VALUES
(1, 'Taylor Academy A12E', 22000000, 'guitar-taylor-academy-12e.jpg', 'Thân đàn nhỏ gọn dễ chịu thích hợp với lối chơi fingerpicking. Mặt trước gỗ Sitka nguyên miếng cho âm thanh linh hoạt và độ vang lớn. Thân đàn bằng các lớp gỗ sapele mang đến một khung đàn chắc chắn. Bàn phím bằng gỗ mun được trang trí với các nốt họa tiết acrylic Ý 4mm. Hệ thống điện tử ES-B tích hợp tuner cho tông âm khuếch đại cực chi tiết. Thiết kế độc đáo kết hợp với mức giá phải chăng.', 43, 2, '2021-05-25 02:14:37', '2021-05-25 02:24:43'),
(3, 'Taylor 110E', 19800000, 'TAYLOR 110E.jpg', 'Dáng Dreadnought cho âm thanh mạnh mẽ, ngân lâu trong thùng đàn. Mặt trước đàn làm bằng gỗ Sitka Spruce cao cấp. Thân đàn bằng gỗ Walnut cho âm thanh cực kỳ đặc trưng, cân bằng. Expression System® 2 khuếch đại âm thanh hiệu quả và tự nhiên nhất. Kết cấu UV thân thiện với môi trường.', 12, 2, '2021-05-25 02:28:26', '2021-05-25 02:28:41'),
(4, 'Taylor 418ce', 69720000, 'taylor-418ce-400x400.jpg', 'Thanh giằng Performance with Relief Rout. Hệ thống điện tử Expression System 2. Tusq Nut và Micarta Saddle', 45, 2, '2021-05-25 02:32:20', '2021-05-25 02:33:53'),
(5, 'Taylor PS14ce, Macassar', 259770000, 'PS16.jpg', 'Đỉnh cao trong các dòng Taylor là seri Presentation được giới thiệu với trình độ thủ công cao nhất của hãng. Giống như những người anh em trong seri, dáng đàn Grand Auditorium trở nên cực kì nổi bật với vân gỗ mun Macassar đến từ Indonesia ở mặt sau và hai bên hông kết hợp với chất gỗ Sitka spruce cao cấp ở mặt trước. Một chỗ vịn tay bằng gỗ mun được chạm khắc tỉ mỉ kết hợp với những nốt khảm tuyệt đẹp mang lại cảm giác vô cùng dễ chịu khi chơi. Bên cạnh đó, chiếc đàn còn sở hữu nhiều chi tiết tinh tế khác bao gồm: viền đàn rực rỡ bằng paua, backtrap bằng gỗ mun Macassar, và một họa tiết phím đàn hình nhành nho Nouveau thêm phần thanh nhã với đầu đàn sáng bóng và họa tiết ngựa đàn, một bộ tinh chỉnh dây Gotoh Gold, một lược và lưng ngựa đàn bằng xương, một mặt cắt cutaway Venetian và Expression System 2 electronics của Taylor.', 2, 2, '2021-05-25 02:36:05', '2021-05-25 02:37:04'),
(6, 'Pearl Decade Maple DMP925FP/C', 17770000, 'pearl-dmp925fp-c-4-400x400.gif', 'Pearl DMP925FP/C là một trong những thành viên được yêu thích nhất trong gia đình trống Pearl, bao gồm trống Bass  22″; trống Floor Tom 14″; Snare 14″;  trống Tom 1 10″ cuối cùng là Tom 2 : 12″. Với vỏ được làm từ gỗ maple cùng nhiều tính năng tiên tiến với lớp phủ bóng bẩy đa màu sắc, đem đến cho người chơi bộ trống tuyệt vời với mức giá phải chăng.', 12, 5, '2021-05-31 18:11:43', '2021-05-31 18:13:16'),
(7, 'PEARL Export Lacquer EXL725SP Standard', 13160000, 'exl725s249.jpg', 'Trống PEARL Export Lacquer EXL725SP Standard là tên tuổi mà mỗi tay trống đều biết đến. Sản phẩm đáp ứng nhu cầu của hàng ngàn nghệ sĩ trống bằng cách đưa chất lượng và giá trị đồng hành với nhau. Export Series giờ đã đươc tích hợp thêm công nghệ Vỏ Cao Cấp S.S.T. Superior Shell, tom-mount Opti-Loc, bộ hardware P830 với pedal P-930, và các lựa chọn trong bốn màu sắc tuyệt đẹp.', 12, 5, '2021-05-31 18:15:30', '2021-05-31 18:15:45'),
(8, 'PEARL Export EXX725SP Standard', 10780000, 'PEA_EX725SPC_33_1.jpg', 'Bộ nhạc cụ đã tạo ra hàng ngàn huyền thoại trống đang trở lại, mở ra một thế giới hoàn toàn mới và cải tiến. Bộ trống Export mới của Pearl được xây dựng mạnh mẽ hơn bao giờ hết để mang đến sự bền bỉ vượt thời gian giúp người chơi trống có được một khởi đầu vững chắc.', 24, 5, '2021-05-31 18:17:23', '2021-05-31 18:18:05'),
(9, 'Roland LX705', 54000000, 'dan-piano-dien-roland-lx-705-mau-nau.jpg', 'Piano điện Roland mẫu mới nhất thuộc series LX700 là những model LX 705, LX 706, LX 708, sản phẩm có nhiều màu, giá cả phải chăng, là model piano điện dành cho người mới học, giải trí gia đình và nghệ sĩ biểu diễn. Đặt mua đàn piano điện Roland LX705 tại Việt Thương Music. Âm sắc piano cao cấp với hệ thống bốn loa; giá cả phải chăng nhất của dòng LX700\r\nKhông cần phải trả giá để đến nhà hát và thưởng thức màn trình diễn ly kỳ của một cây đại dương cầm tại nhà.', 11, 6, '2021-05-31 18:21:03', '2021-05-31 18:24:51'),
(10, 'Roland GP-607', 129000000, 'dan-piano-dien-roland-gp-607.jpg', 'Một cây đàn grand piano mini khơi nguồn cho sự sáng tạo và thêm điểm nhấn vào không gian sống của bạn. \r\nNếu bạn đã ao ước được sở hữu một cây đàn đại dương cầm nhưng không đủ điều kiện mua do chi phí cao thì bạn hãy tin rằng Roland GP607 sẽ là sự bổ túc hoàn hảo vào trong ngôi nhà của bạn. Đàn mini grand piano điện Roland GP607 màu đen bóng hoặc trắng bóng có dáng hình như cây đàn grand piano cổ điển với thiết kế hoành tráng và vô cùng tinh tế. Tuy có vẻ ngoài  truyền thống nhưng chúng ta sẽ khám phá ra công nghệ mới nhất từ cây đàn này. Kết nối Bluetooth cho phép bạn truyền tải bài hát từ tablet hoặc điện thoại thông qua loa đa kênh 4.1 của GP607, làm cho căn phòng của bạn ngập tràn âm thanh phong phú, rõ ràng. Công nghệ SuperNATURAL Piano Modeling cung cấp âm thanh piano vô cùng thực tế  cùng với cảm giác chạm biểu cảm từ bàn phím mới PHA-50, đem tới cho những người chơi đàn một trải nghiệm tuyệt vời. Và một loạt các tính năng học tập trong đàn, bao gồm kết nối các ứng dụng cho việc dạy học đàn piano giúp truyền động lực cho việc học cũng như nâng kỹ năng đàn piano của bạn. Cho dù bạn muốn bổ túc một cây đàn làm cho không gian sống thêm nổi bật hay bạn muốn một cây đàn grand piano  hỗ trợ cho việc học tập thì GP607 sẽ là cây đàn vừa đem lại vẻ đẹp, sự sang trọng và cả biểu diễn piano lý tưởng trong ngôi nhà của bạn.', 1, 6, '2021-05-31 18:24:08', '2021-05-31 18:24:21'),
(11, 'Selmer TS650', 34200000, 'TS650.jpg', 'Conn TS650 Student Tenor Saxophones được biết đến là một chiếc kèn Saxophone cho sinh viên có âm thanh sâu và âm lượng to. Với chất lượng âm thanh này, chiếc kèn trở thành sự lựa chọn lý tưởng trong âm nhạc jazz và rock. Đây chính là điểm nổi bật của Conn TS650 Student Tenor Saxophones với những người yêu thích nhạc jazz và rock. Conn TS650 Student Tenor Saxophones được làm bằng chất liệu sơn màu vàng, các nút pearloid màu trắng mang đến một vẻ bề ngoài rất thu hút. Nhờ đó mà người yêu nhạc không chỉ có một chiếc kèn chất lượng để sử dụng, mà còn có một chiếc kèn với bề ngoài đẹp mắt để thể hiện đẳng cấp của bản thân.', 5, 7, '2021-05-31 18:28:44', '2021-05-31 18:28:54'),
(12, 'Conn selmer AS651', 24900000, 'conn-selmer-as651-400x400.jpg', 'Selmer AS651 là nhạc cụ hoàn hảo cho tất cả những người chơi mới bắt đầu muốn học chơi Saxophone. AS600 bền bỉ với âm thanh tuyệt vời. Ngoài ra, chất lượng của Saxophone vượt xa mức giá thấp của nó, vì vậy đây chắc chắn là chiếc Saxophone lý tưởng cho bất kỳ sinh viên mới nào!', 30, 7, '2021-05-31 18:30:25', '2021-05-31 18:30:35'),
(13, 'Selmer CAS280RS', 59300000, 'selmer-cas280rs-400x400.jpg', 'Kèn Selmer Alto Saxophone CAS280RS mang lại cảm giác thư thái, trong khi ngữ điệu hoàn hảo và âm thanh ấm áp của nó làm cho nó trở thành một nhạc cụ được nhiều nghệ sĩ yêu thích', 3, 7, '2021-05-31 18:31:49', '2021-05-31 18:31:58'),
(14, 'Selmer TS651', 26800000, 'selmer-ts651-400x400.jpg', 'Kèn Tenor Saxophone Selmer TS651 phù hợp với với cả sinh viên lẫn nhà giáo dục âm nhạc, từ nghiệp dư đến chuyên nghiệp, những người muốn chơi các dụng cụ Kèn Saxophone .', 18, 7, '2021-05-31 18:36:24', '2021-05-31 18:36:36'),
(15, 'Conn selmer TR650S', 15440000, 'conn-selmer-tr650s-400x400.jpg', 'Conn selmer TR650S  được thiết kế bắt mắt với lớp sơn bóng bảy, TR650S được rất nhiều người chơi kèn yêu thích bởi âm thanh và khả năng chơi tuyệt vời trong một mức giá phải chăng.', 50, 7, '2021-05-31 18:38:55', '2021-05-31 18:39:06'),
(16, 'Conn selmer PTRUMPET1', 4620000, 'conn-selmer-ptrumpet1r.jpg', 'pTrumpet là trumpet duy nhất với một hệ thống van nhựa hoàn chỉnh, được thiết kế và phát triển để tạo ra sự nhẹ nhàng, độ bền và chất lượng âm thanh vô song.', 22, 7, '2021-05-31 18:56:53', '2021-05-31 18:59:34'),
(17, 'Selmer Bach 180S37', 88350000, 'SELMER BACH PROFESSIONAL MODEL 180S37.jpg', 'Kèn bach 180 series là kèn bán kèn chuyên nghiệp số một thế giới. 180S37 có chuông chuyên nghiệp bằng búa tay #37 tạo ra âm thanh ấm áp với hình chiếu tuyệt vời cho phép nhạc cụ này hoạt động tốt trong nhiều cài đặt âm nhạc — từ nhạc jazz đến hòa nhạc hoặc chơi solo.', 2, 7, '2021-05-31 19:10:50', '2021-05-31 19:27:22'),
(18, 'Lazer LB-322N', 9310000, 'lb-322.jpg', 'Tuyệt vời ông mặt trời =))', 22, 2, '2021-05-31 19:28:35', '2021-05-31 19:29:08'),
(19, 'Boston GP-156', 749000000, 'dan-piano-boston-gp-156-pe-400x400.jpg', 'Đàn piano Boston GP-156 PE có kích thước lớn, được chế tác theo thiết kế Steinway & Sons nổi tiếng, thêm vào sự hoà âm đa dạng mà không có ở 1 loại nhạc cụ nào khác trong tầm giá tương đương. Cây đàn dài 156 cm này là cây đàn có kích thước nhỏ nhất trong các dòng grand piano của Boston nhưng lại cho chất lượng âm thanh không hề nhỏ. GP-156 PE là sự lựa chọn lý tưởng cho bất kỳ phòng dạy nhạc hay gia đình nào.', 2, 8, '2021-05-31 19:32:18', '2021-05-31 19:32:28'),
(20, 'Boston GP-178', 975000000, 'boston-gp-178.jpg', 'Đàn piano Boston GP-178 PE có kích thước lớn, được chế tác theo thiết kế Steinway & Sons nổi tiếng, thêm vào sự hoà âm đa dạng mà không có ở một loại nhạc cụ nào khác trong tầm giá tương đương. Cây đàn dài 178 cm này là sự lựa chọn hoàn hảo cho bất kỳ phòng học studio hay phòng nhạc nào.', 1, 8, '2021-05-31 19:34:36', '2021-05-31 19:34:46'),
(21, 'Boston GP-163', 895000000, 'dan-piano-boston-gp-163-pe.jpg', 'Với sự nổi tiếng của Boston, Boston PE II được tạo ra với nhiều tính năng tốt nhất trong phân khúc, bao gồm vành trong là lớp gỗ Hard Rock Maple và pinblock Octagrip ™. Với chiều dài 5’4″ (163cm), cây đàn piano này là đủ nhỏ để phù hợp với bất kỳ căn nhà nào, nhưng âm thanh nó sở hữu thì lớn hơn nhiều, nhờ vào thiết kế đuôi rộng đặc biệt.\r\n\r\nMỗi chiếc piano Boston của chúng tôi đều được Steinway & Sons cam kết về chất lượng thông qua Steinway Promise: “Nếu bạn quyết định đổi đàn piano Boston của mình lấy một cây Grand piano STEINWAY & SONS mới bất cứ lúc nào trong vòng mười năm, bạn sẽ nhận được khoản tín dụng trao đổi bằng với giá mua ban đầu của cây đàn piano Boston của bạn”.\r\n\r\nSo sánh với các đàn piano khác, độ căng dây đàn Boston ít hơn. Độ giảm căng dây này cho phép soundboard lớn hơn, tạo ra âm thanh vững vàng hơn và chất lượng ngân tốt hơn (như đàn piano lâu năm). Một loạt các phần cải tiến về cấu trúc khác gồm việc thay thế tối ưu của phần sườn, khung và các ngựa đàn, cũng góp phần cho âm thanh tuyệt hảo và tăng độ vững chắc cho đàn Boston.\r\n\r\nĐàn piano Boston mang đến soundboard lớn hơn so với các đàn piano cùng chiều dài, bởi vì thiết kế đầy sáng tạo “wide tail”. Phần vỏ đàn có cấu trúc rộng hơn có nghĩa là đàn Boston 5’10” cũng có vùng soundboard giống với dàn piano 6’2” bình thường, tạo ra độ mạnh mẽ, sự dày âm, và cảm giác như đang chơi đàn piano lớn hơn.\r\n\r\nTừng soundboard của đàn piano Boston được làm bằng tay từ gỗ Sitka spruce, được chứng minh là loại vật liệu cho âm cộng hưởng tốt nhất. Các soundboard Boston cũng được gia công một cách tỉ mỉ, cho phép độ rung tự do hơn. Cùng với một số các công nghệ đặc biệt – bằng sáng chế độc nhất của STEINWAY & SONS – kết quả là âm thanh mạnh mẽ và vững chãi.', 3, 8, '2021-05-31 19:36:27', '2021-05-31 19:36:37'),
(22, 'Kawai GX-5', 633000000, 'gx_5.jpg', 'Bản cộng hưởng là trái tim của một cây đàn piano. Chức năng của bản cộng hưởng là chuyển đổi các rung động của dây đàn piano thành những âm thanh dày dặn và vang dội. Kawai chỉ sử dụng gỗ vân sam đặc rắn được xẻ theo phương xuyên tâm với các thớ gỗ thẳng để sản xuất bản cộng hưởng dòng GX. Mỗi một đường bào mòn tinh tế theo hình chóp nhọn đều cung cấp mức độ thích hợp cho sự biến động âm thanh cộng hưởng trong từng khu vực. Chỉ những bản cộng hưởng đáp ứng hoặc vượt các tiêu chuẩn khắt khe về độ cộng hưởng của Kawai mới được lựa chọn để sử dụng cho các cây đàn piano thuộc dòng GX.', 2, 9, '2021-05-31 19:39:22', '2021-05-31 19:39:42'),
(23, 'Kawai SK-3', 1170000000, 'SK_3.jpg', 'Shigeru Kawai SK-3 là sự lựa chọn cho người thích vẻ đẹp cổ điển và yêu thích cái nhìn thanh lịch, là cây piano nổi trội hơn các loại piano khác trong cùng loại. Mỗi chi tiết bên trong của đàn piano Shigeru Kawai được làm từ những vật liệu lựa chọn cẩn thận để tạo ra âm thanh hay nhất và đặc sắc nhất. Sự kết hợp kỳ diệu của các loại gỗ, kim loại và công nghệ tiên tiến thế kỷ 21 được làm dưới tay của các Nghệ nhân Piano Kawai đã tạo ra những cây đàn piano biểu diễn đẳng cấp nhất thế giới.', 1, 9, '2021-05-31 19:41:35', '2021-05-31 19:41:56'),
(24, 'Kawai SK-2', 1100000000, 'sk 2.jpg', 'Đàn Piano Shigeru Kawai SK-2 là sự lựa chọn cho người thích vẻ đẹp cổ điển và yêu thích cái nhìn thanh lịch, là cây piano nổi trội hơn các loại piano khác trong cùng loại. Mỗi chi tiết bên trong của đàn piano Shigeru Kawai được làm từ những vật liệu lựa chọn cẩn thận để tạo ra âm thanh hay nhất và đặc sắc nhất. Sự kết hợp kỳ diệu của các loại gỗ, kim loại và công nghệ tiên tiến thế kỷ 21 được làm dưới tay của các Nghệ nhân Piano Kawai đã tạo ra những cây đàn piano biểu diễn đẳng cấp nhất thế giới.', 1, 9, '2021-05-31 19:45:22', '2021-05-31 19:45:39'),
(25, 'Fender Player Strat', 19250000, 'fender-player-strat-pls-top-pf-tbs-400x400.jpg', 'Guitar Fender Player Strat PLS TOP PF TBS  là một trong những cái tên được yêu thích trong dòng sản phẩm Player của Fender. Sở hữu dải tần trung và trầm mạnh mẽ, kết hợp cho ra âm thanh rõ ràng không trộn lẫn. Player Stratocaster được xây dựng với cảm giác, tình yêu và phong cách Fender đích thực.', 22, 10, '2021-05-31 19:55:33', '2021-05-31 19:56:04'),
(26, 'Fender MIJ Traditional', 21790000, 'fender-mij-traditional-60s-jazz-bass-400x400.jpg', 'Fender MIJ Traditional \'60s Jazz Bass® sự lựa chọn lý tưởng cho những ai yêu thích âm thanh nhạc Jazz những năm 62\r\n\r\nJazz Bass Traditional ‘60s tái tạo âm sắc và cảm hứng của nhạc jazz vào 62 năm, sử dụng Bass Wood là loại gỗ chính làm thân đàn cung cấp âm thanh với hiệu ứng đặc biệt duy nhất của Jazz Bass. Đây là một âm thanh jazz đặc biệt và sẽ trường tồn theo thời gian.', 10, 2, '2021-05-31 19:57:35', '2021-05-31 19:57:52'),
(27, 'FENDER ACOUSTASONIC', 44810000, 'fender-0972013257-400x400.jpg', 'Động cơ âm thanh do Fishman® thiết kế để cung cấp biểu hiện âm thanh mới từ phòng thu đến sân khấu.', 9, 10, '2021-05-31 19:59:35', '2021-05-31 20:49:35'),
(28, 'Fender Player Strat MN', 18350000, 'fender-player-strat-mn.png', 'Fender Player Strat MN được thiết kế theo phong cách Stratocaster với cần đàn bằng gỗ maple cùng những tính năng hiện đại mang đến âm thanh đẳng cấp cho người dùng', 8, 10, '2021-05-31 20:01:15', '2021-05-31 20:01:26'),
(29, 'SUZUKI VIOLIN NS20FE-3/4', 13660000, 'SUZUKI_VIOLIN_NS20FE.jpg', 'Thuộc dòng Model 220 Nagoya Suzuki violin, từ lâu đã trở thành tiêu chuẩn để các nhạc cụ khác đánh giá và so sánh. Cây đàn violin này được rất nhiều giáo viên và những người chơi nhạc nổi tiếng lựa chọn để sử dụng. Với những gì đem lại, bạn sẽ không bao giờ thất vọng khi chọn mua và sử dụng cây đàn violin này.', 10, 11, '2021-06-06 00:49:30', '2021-06-06 00:49:30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email_valid` int(11) NOT NULL,
  `user_permission` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `user_username`, `user_password`, `user_email`, `user_email_valid`, `user_permission`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$12$bYJPn80S4etZr.BXtgGwI.LXX44A7Sh19T11eIQl8nAbASv4W3N8O', '', 1, 0, NULL, NULL),
(2, 'AndyVu', '$2y$12$bYJPn80S4etZr.BXtgGwI.LXX44A7Sh19T11eIQl8nAbASv4W3N8O', '', 1, 1, NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
