-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3309
-- Thời gian đã tạo: Th6 23, 2021 lúc 02:40 AM
-- Phiên bản máy phục vụ: 10.4.13-MariaDB
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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(9, 'Violin', '2021-06-06 00:47:18', '2021-06-06 00:47:18'),
(11, 'Harmonica', '2021-06-16 05:56:45', '2021-06-16 05:56:45'),
(12, 'Ukulele', '2021-06-16 06:10:02', '2021-06-16 06:10:02');

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`comment_id`, `comment_rating`, `comment_content`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 5, 'Chất lượng tuyệt vời.', 2, 24, '2021-06-07 19:15:31', '2021-06-07 19:15:31'),
(2, 4, 'Sản phẩm tốt trong tầm giá =))', 2, 28, '2021-06-07 19:56:40', '2021-06-07 19:56:40'),
(3, -1, 'Có màu hồng không vậy shop =))', 2, 23, '2021-06-07 19:57:39', '2021-06-07 19:57:39'),
(5, 2, 'a', 2, 1, '2021-06-21 07:12:29', '2021-06-21 07:12:29'),
(6, -1, 'Chất lượng tạm ổn', 2, 1, '2021-06-21 07:13:20', '2021-06-21 07:13:20');

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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(11, 'Suzuki', '2021-06-06 00:46:57', '2021-06-06 00:46:57'),
(12, 'Ritmuller', '2021-06-16 02:48:15', '2021-06-16 02:48:15'),
(14, 'Deviser', '2021-06-16 06:13:00', '2021-06-16 06:13:00');

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
  `order_status` int(11) NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `orders_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`order_id`, `order_status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2021-06-07 19:11:03', '2021-06-07 19:12:28'),
(2, 1, 2, '2021-06-07 19:50:43', '2021-06-07 20:33:48'),
(3, 1, 2, '2021-06-21 06:58:48', '2021-06-21 10:57:30');

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`detail_id`, `detail_quantity`, `order_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 24, '2021-06-07 19:11:03', '2021-06-07 19:11:03'),
(2, 2, 2, 1, '2021-06-07 19:50:43', '2021-06-07 19:50:43'),
(3, 2, 2, 29, '2021-06-07 19:50:43', '2021-06-07 19:50:43'),
(4, 1, 2, 28, '2021-06-07 19:50:43', '2021-06-07 19:50:43'),
(5, 1, 3, 68, '2021-06-21 06:58:48', '2021-06-21 06:58:48');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `product_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` int(11) NOT NULL DEFAULT 0,
  `product_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `product_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_available` int(11) NOT NULL DEFAULT 0,
  `manufacturer_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `products_manufacturer_id_foreign` (`manufacturer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_price`, `product_image`, `product_description`, `product_available`, `manufacturer_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Taylor Academy A12E', 22000000, 'guitar-taylor-academy-12e.jpg', 'Thân đàn nhỏ gọn dễ chịu thích hợp với lối chơi fingerpicking. Mặt trước gỗ Sitka nguyên miếng cho âm thanh linh hoạt và độ vang lớn. Thân đàn bằng các lớp gỗ sapele mang đến một khung đàn chắc chắn. Bàn phím bằng gỗ mun được trang trí với các nốt họa tiết acrylic Ý 4mm. Hệ thống điện tử ES-B tích hợp tuner cho tông âm khuếch đại cực chi tiết. Thiết kế độc đáo kết hợp với mức giá phải chăng.', 43, 2, 1, '2021-05-25 02:14:37', '2021-05-25 02:24:43'),
(3, 'Taylor 110E', 19800000, 'TAYLOR 110E.jpg', 'Dáng Dreadnought cho âm thanh mạnh mẽ, ngân lâu trong thùng đàn. Mặt trước đàn làm bằng gỗ Sitka Spruce cao cấp. Thân đàn bằng gỗ Walnut cho âm thanh cực kỳ đặc trưng, cân bằng. Expression System® 2 khuếch đại âm thanh hiệu quả và tự nhiên nhất. Kết cấu UV thân thiện với môi trường.', 12, 2, 1, '2021-05-25 02:28:26', '2021-05-25 02:28:41'),
(4, 'Taylor 418ce', 69720000, 'taylor-418ce-400x400.jpg', 'Thanh giằng Performance with Relief Rout. Hệ thống điện tử Expression System 2. Tusq Nut và Micarta Saddle', 45, 2, 1, '2021-05-25 02:32:20', '2021-05-25 02:33:53'),
(5, 'Taylor PS14ce, Macassar', 259770000, 'PS16.jpg', 'Đỉnh cao trong các dòng Taylor là seri Presentation được giới thiệu với trình độ thủ công cao nhất của hãng. Giống như những người anh em trong seri, dáng đàn Grand Auditorium trở nên cực kì nổi bật với vân gỗ mun Macassar đến từ Indonesia ở mặt sau và hai bên hông kết hợp với chất gỗ Sitka spruce cao cấp ở mặt trước. Một chỗ vịn tay bằng gỗ mun được chạm khắc tỉ mỉ kết hợp với những nốt khảm tuyệt đẹp mang lại cảm giác vô cùng dễ chịu khi chơi. Bên cạnh đó, chiếc đàn còn sở hữu nhiều chi tiết tinh tế khác bao gồm: viền đàn rực rỡ bằng paua, backtrap bằng gỗ mun Macassar, và một họa tiết phím đàn hình nhành nho Nouveau thêm phần thanh nhã với đầu đàn sáng bóng và họa tiết ngựa đàn, một bộ tinh chỉnh dây Gotoh Gold, một lược và lưng ngựa đàn bằng xương, một mặt cắt cutaway Venetian và Expression System 2 electronics của Taylor.', 2, 2, 1, '2021-05-25 02:36:05', '2021-05-25 02:37:04'),
(6, 'Pearl Decade Maple DMP925FP/C', 17770000, 'pearl-dmp925fp-c-4-400x400.gif', 'Pearl DMP925FP/C là một trong những thành viên được yêu thích nhất trong gia đình trống Pearl, bao gồm trống Bass  22″; trống Floor Tom 14″; Snare 14″;  trống Tom 1 10″ cuối cùng là Tom 2 : 12″. Với vỏ được làm từ gỗ maple cùng nhiều tính năng tiên tiến với lớp phủ bóng bẩy đa màu sắc, đem đến cho người chơi bộ trống tuyệt vời với mức giá phải chăng.', 12, 5, 2, '2021-05-31 18:11:43', '2021-05-31 18:13:16'),
(7, 'PEARL Export Lacquer EXL725SP Standard', 13160000, 'exl725s249.jpg', 'Trống PEARL Export Lacquer EXL725SP Standard là tên tuổi mà mỗi tay trống đều biết đến. Sản phẩm đáp ứng nhu cầu của hàng ngàn nghệ sĩ trống bằng cách đưa chất lượng và giá trị đồng hành với nhau. Export Series giờ đã đươc tích hợp thêm công nghệ Vỏ Cao Cấp S.S.T. Superior Shell, tom-mount Opti-Loc, bộ hardware P830 với pedal P-930, và các lựa chọn trong bốn màu sắc tuyệt đẹp.', 12, 5, 2, '2021-05-31 18:15:30', '2021-05-31 18:15:45'),
(8, 'PEARL Export EXX725SP Standard', 10780000, 'PEA_EX725SPC_33_1.jpg', 'Bộ nhạc cụ đã tạo ra hàng ngàn huyền thoại trống đang trở lại, mở ra một thế giới hoàn toàn mới và cải tiến. Bộ trống Export mới của Pearl được xây dựng mạnh mẽ hơn bao giờ hết để mang đến sự bền bỉ vượt thời gian giúp người chơi trống có được một khởi đầu vững chắc.', 24, 5, 2, '2021-05-31 18:17:23', '2021-05-31 18:18:05'),
(9, 'Roland LX705', 54000000, 'dan-piano-dien-roland-lx-705-mau-nau.jpg', 'Piano điện Roland mẫu mới nhất thuộc series LX700 là những model LX 705, LX 706, LX 708, sản phẩm có nhiều màu, giá cả phải chăng, là model piano điện dành cho người mới học, giải trí gia đình và nghệ sĩ biểu diễn. Đặt mua đàn piano điện Roland LX705 tại Việt Thương Music. Âm sắc piano cao cấp với hệ thống bốn loa; giá cả phải chăng nhất của dòng LX700\r\nKhông cần phải trả giá để đến nhà hát và thưởng thức màn trình diễn ly kỳ của một cây đại dương cầm tại nhà.', 11, 6, 3, '2021-05-31 18:21:03', '2021-05-31 18:24:51'),
(10, 'Roland GP-607', 129000000, 'dan-piano-dien-roland-gp-607.jpg', 'Một cây đàn grand piano mini khơi nguồn cho sự sáng tạo và thêm điểm nhấn vào không gian sống của bạn. \r\nNếu bạn đã ao ước được sở hữu một cây đàn đại dương cầm nhưng không đủ điều kiện mua do chi phí cao thì bạn hãy tin rằng Roland GP607 sẽ là sự bổ túc hoàn hảo vào trong ngôi nhà của bạn. Đàn mini grand piano điện Roland GP607 màu đen bóng hoặc trắng bóng có dáng hình như cây đàn grand piano cổ điển với thiết kế hoành tráng và vô cùng tinh tế. Tuy có vẻ ngoài  truyền thống nhưng chúng ta sẽ khám phá ra công nghệ mới nhất từ cây đàn này. Kết nối Bluetooth cho phép bạn truyền tải bài hát từ tablet hoặc điện thoại thông qua loa đa kênh 4.1 của GP607, làm cho căn phòng của bạn ngập tràn âm thanh phong phú, rõ ràng. Công nghệ SuperNATURAL Piano Modeling cung cấp âm thanh piano vô cùng thực tế  cùng với cảm giác chạm biểu cảm từ bàn phím mới PHA-50, đem tới cho những người chơi đàn một trải nghiệm tuyệt vời. Và một loạt các tính năng học tập trong đàn, bao gồm kết nối các ứng dụng cho việc dạy học đàn piano giúp truyền động lực cho việc học cũng như nâng kỹ năng đàn piano của bạn. Cho dù bạn muốn bổ túc một cây đàn làm cho không gian sống thêm nổi bật hay bạn muốn một cây đàn grand piano  hỗ trợ cho việc học tập thì GP607 sẽ là cây đàn vừa đem lại vẻ đẹp, sự sang trọng và cả biểu diễn piano lý tưởng trong ngôi nhà của bạn.', 1, 6, 8, '2021-05-31 18:24:08', '2021-06-16 05:09:39'),
(11, 'Selmer TS650', 34200000, 'TS650.jpg', 'Conn TS650 Student Tenor Saxophones được biết đến là một chiếc kèn Saxophone cho sinh viên có âm thanh sâu và âm lượng to. Với chất lượng âm thanh này, chiếc kèn trở thành sự lựa chọn lý tưởng trong âm nhạc jazz và rock. Đây chính là điểm nổi bật của Conn TS650 Student Tenor Saxophones với những người yêu thích nhạc jazz và rock. Conn TS650 Student Tenor Saxophones được làm bằng chất liệu sơn màu vàng, các nút pearloid màu trắng mang đến một vẻ bề ngoài rất thu hút. Nhờ đó mà người yêu nhạc không chỉ có một chiếc kèn chất lượng để sử dụng, mà còn có một chiếc kèn với bề ngoài đẹp mắt để thể hiện đẳng cấp của bản thân.', 5, 7, 4, '2021-05-31 18:28:44', '2021-05-31 18:28:54'),
(12, 'Conn selmer AS651', 24900000, 'conn-selmer-as651-400x400.jpg', 'Selmer AS651 là nhạc cụ hoàn hảo cho tất cả những người chơi mới bắt đầu muốn học chơi Saxophone. AS600 bền bỉ với âm thanh tuyệt vời. Ngoài ra, chất lượng của Saxophone vượt xa mức giá thấp của nó, vì vậy đây chắc chắn là chiếc Saxophone lý tưởng cho bất kỳ sinh viên mới nào!', 30, 7, 4, '2021-05-31 18:30:25', '2021-05-31 18:30:35'),
(13, 'Selmer CAS280RS', 59300000, 'selmer-cas280rs-400x400.jpg', 'Kèn Selmer Alto Saxophone CAS280RS mang lại cảm giác thư thái, trong khi ngữ điệu hoàn hảo và âm thanh ấm áp của nó làm cho nó trở thành một nhạc cụ được nhiều nghệ sĩ yêu thích', 3, 7, 4, '2021-05-31 18:31:49', '2021-05-31 18:31:58'),
(14, 'Selmer TS651', 26800000, 'selmer-ts651-400x400.jpg', 'Kèn Tenor Saxophone Selmer TS651 phù hợp với với cả sinh viên lẫn nhà giáo dục âm nhạc, từ nghiệp dư đến chuyên nghiệp, những người muốn chơi các dụng cụ Kèn Saxophone .', 18, 7, 4, '2021-05-31 18:36:24', '2021-05-31 18:36:36'),
(15, 'Conn selmer TR650S', 15440000, 'conn-selmer-tr650s-400x400.jpg', 'Conn selmer TR650S  được thiết kế bắt mắt với lớp sơn bóng bảy, TR650S được rất nhiều người chơi kèn yêu thích bởi âm thanh và khả năng chơi tuyệt vời trong một mức giá phải chăng.', 50, 7, 5, '2021-05-31 18:38:55', '2021-05-31 18:39:06'),
(16, 'Conn selmer PTRUMPET1', 4620000, 'conn-selmer-ptrumpet1r.jpg', 'pTrumpet là trumpet duy nhất với một hệ thống van nhựa hoàn chỉnh, được thiết kế và phát triển để tạo ra sự nhẹ nhàng, độ bền và chất lượng âm thanh vô song.', 22, 7, 5, '2021-05-31 18:56:53', '2021-05-31 18:59:34'),
(17, 'Selmer Bach 180S37', 88350000, 'SELMER BACH PROFESSIONAL MODEL 180S37.jpg', 'Kèn bach 180 series là kèn bán kèn chuyên nghiệp số một thế giới. 180S37 có chuông chuyên nghiệp bằng búa tay #37 tạo ra âm thanh ấm áp với hình chiếu tuyệt vời cho phép nhạc cụ này hoạt động tốt trong nhiều cài đặt âm nhạc — từ nhạc jazz đến hòa nhạc hoặc chơi solo.', 2, 7, 5, '2021-05-31 19:10:50', '2021-05-31 19:27:22'),
(18, 'Lazer LB-322N', 9310000, 'lb-322.jpg', 'Tuyệt vời ông mặt trời =))', 22, 2, 5, '2021-05-31 19:28:35', '2021-05-31 19:29:08'),
(20, 'Boston GP-178', 975000000, 'boston-gp-178.jpg', 'Đàn piano Boston GP-178 PE có kích thước lớn, được chế tác theo thiết kế Steinway & Sons nổi tiếng, thêm vào sự hoà âm đa dạng mà không có ở một loại nhạc cụ nào khác trong tầm giá tương đương. Cây đàn dài 178 cm này là sự lựa chọn hoàn hảo cho bất kỳ phòng học studio hay phòng nhạc nào.', 1, 8, 8, '2021-05-31 19:34:36', '2021-05-31 19:34:46'),
(21, 'Boston GP-163', 895000000, 'dan-piano-boston-gp-163-pe.jpg', 'Với sự nổi tiếng của Boston, Boston PE II được tạo ra với nhiều tính năng tốt nhất trong phân khúc, bao gồm vành trong là lớp gỗ Hard Rock Maple và pinblock Octagrip ™. Với chiều dài 5’4″ (163cm), cây đàn piano này là đủ nhỏ để phù hợp với bất kỳ căn nhà nào, nhưng âm thanh nó sở hữu thì lớn hơn nhiều, nhờ vào thiết kế đuôi rộng đặc biệt.\r\n\r\nMỗi chiếc piano Boston của chúng tôi đều được Steinway & Sons cam kết về chất lượng thông qua Steinway Promise: “Nếu bạn quyết định đổi đàn piano Boston của mình lấy một cây Grand piano STEINWAY & SONS mới bất cứ lúc nào trong vòng mười năm, bạn sẽ nhận được khoản tín dụng trao đổi bằng với giá mua ban đầu của cây đàn piano Boston của bạn”.\r\n\r\nSo sánh với các đàn piano khác, độ căng dây đàn Boston ít hơn. Độ giảm căng dây này cho phép soundboard lớn hơn, tạo ra âm thanh vững vàng hơn và chất lượng ngân tốt hơn (như đàn piano lâu năm). Một loạt các phần cải tiến về cấu trúc khác gồm việc thay thế tối ưu của phần sườn, khung và các ngựa đàn, cũng góp phần cho âm thanh tuyệt hảo và tăng độ vững chắc cho đàn Boston.\r\n\r\nĐàn piano Boston mang đến soundboard lớn hơn so với các đàn piano cùng chiều dài, bởi vì thiết kế đầy sáng tạo “wide tail”. Phần vỏ đàn có cấu trúc rộng hơn có nghĩa là đàn Boston 5’10” cũng có vùng soundboard giống với dàn piano 6’2” bình thường, tạo ra độ mạnh mẽ, sự dày âm, và cảm giác như đang chơi đàn piano lớn hơn.\r\n\r\nTừng soundboard của đàn piano Boston được làm bằng tay từ gỗ Sitka spruce, được chứng minh là loại vật liệu cho âm cộng hưởng tốt nhất. Các soundboard Boston cũng được gia công một cách tỉ mỉ, cho phép độ rung tự do hơn. Cùng với một số các công nghệ đặc biệt – bằng sáng chế độc nhất của STEINWAY & SONS – kết quả là âm thanh mạnh mẽ và vững chãi.', 3, 8, 8, '2021-05-31 19:36:27', '2021-05-31 19:36:37'),
(22, 'Kawai GX-5', 633000000, 'gx_5.jpg', 'Bản cộng hưởng là trái tim của một cây đàn piano. Chức năng của bản cộng hưởng là chuyển đổi các rung động của dây đàn piano thành những âm thanh dày dặn và vang dội. Kawai chỉ sử dụng gỗ vân sam đặc rắn được xẻ theo phương xuyên tâm với các thớ gỗ thẳng để sản xuất bản cộng hưởng dòng GX. Mỗi một đường bào mòn tinh tế theo hình chóp nhọn đều cung cấp mức độ thích hợp cho sự biến động âm thanh cộng hưởng trong từng khu vực. Chỉ những bản cộng hưởng đáp ứng hoặc vượt các tiêu chuẩn khắt khe về độ cộng hưởng của Kawai mới được lựa chọn để sử dụng cho các cây đàn piano thuộc dòng GX.', 2, 9, 8, '2021-05-31 19:39:22', '2021-05-31 19:39:42'),
(23, 'Kawai SK-3', 1170000000, 'SK_3.jpg', 'Shigeru Kawai SK-3 là sự lựa chọn cho người thích vẻ đẹp cổ điển và yêu thích cái nhìn thanh lịch, là cây piano nổi trội hơn các loại piano khác trong cùng loại. Mỗi chi tiết bên trong của đàn piano Shigeru Kawai được làm từ những vật liệu lựa chọn cẩn thận để tạo ra âm thanh hay nhất và đặc sắc nhất. Sự kết hợp kỳ diệu của các loại gỗ, kim loại và công nghệ tiên tiến thế kỷ 21 được làm dưới tay của các Nghệ nhân Piano Kawai đã tạo ra những cây đàn piano biểu diễn đẳng cấp nhất thế giới.', 1, 9, 8, '2021-05-31 19:41:35', '2021-05-31 19:41:56'),
(24, 'Kawai SK-2', 1100000000, 'sk 2.jpg', 'Đàn Piano Shigeru Kawai SK-2 là sự lựa chọn cho người thích vẻ đẹp cổ điển và yêu thích cái nhìn thanh lịch, là cây piano nổi trội hơn các loại piano khác trong cùng loại. Mỗi chi tiết bên trong của đàn piano Shigeru Kawai được làm từ những vật liệu lựa chọn cẩn thận để tạo ra âm thanh hay nhất và đặc sắc nhất. Sự kết hợp kỳ diệu của các loại gỗ, kim loại và công nghệ tiên tiến thế kỷ 21 được làm dưới tay của các Nghệ nhân Piano Kawai đã tạo ra những cây đàn piano biểu diễn đẳng cấp nhất thế giới.', 1, 9, 8, '2021-05-31 19:45:22', '2021-05-31 19:45:39'),
(25, 'Fender Player Strat', 19250000, 'fender-player-strat-pls-top-pf-tbs-400x400.jpg', 'Guitar Fender Player Strat PLS TOP PF TBS  là một trong những cái tên được yêu thích trong dòng sản phẩm Player của Fender. Sở hữu dải tần trung và trầm mạnh mẽ, kết hợp cho ra âm thanh rõ ràng không trộn lẫn. Player Stratocaster được xây dựng với cảm giác, tình yêu và phong cách Fender đích thực.', 22, 10, 6, '2021-05-31 19:55:33', '2021-05-31 19:56:04'),
(26, 'Fender MIJ Traditional', 21790000, 'fender-mij-traditional-60s-jazz-bass-400x400.jpg', 'Fender MIJ Traditional \'60s Jazz Bass® sự lựa chọn lý tưởng cho những ai yêu thích âm thanh nhạc Jazz những năm 62\r\n\r\nJazz Bass Traditional ‘60s tái tạo âm sắc và cảm hứng của nhạc jazz vào 62 năm, sử dụng Bass Wood là loại gỗ chính làm thân đàn cung cấp âm thanh với hiệu ứng đặc biệt duy nhất của Jazz Bass. Đây là một âm thanh jazz đặc biệt và sẽ trường tồn theo thời gian.', 10, 2, 6, '2021-05-31 19:57:35', '2021-05-31 19:57:52'),
(27, 'Fender Acou', 44810000, 'fender-0972013257-400x400.jpg', 'Động cơ âm thanh do Fishman® thiết kế để cung cấp biểu hiện âm thanh mới từ phòng thu đến sân khấu.', 9, 10, 6, '2021-05-31 19:59:35', '2021-06-16 05:07:32'),
(28, 'Fender Player Strat MN', 18350000, 'fender-player-strat-mn.png', 'Fender Player Strat MN được thiết kế theo phong cách Stratocaster với cần đàn bằng gỗ maple cùng những tính năng hiện đại mang đến âm thanh đẳng cấp cho người dùng', 8, 10, 6, '2021-05-31 20:01:15', '2021-05-31 20:01:26'),
(29, 'SUZUKI VIOLIN NS20FE-3/4', 13660000, 'SUZUKI_VIOLIN_NS20FE.jpg', 'Thuộc dòng Model 220 Nagoya Suzuki violin, từ lâu đã trở thành tiêu chuẩn để các nhạc cụ khác đánh giá và so sánh. Cây đàn violin này được rất nhiều giáo viên và những người chơi nhạc nổi tiếng lựa chọn để sử dụng. Với những gì đem lại, bạn sẽ không bao giờ thất vọng khi chọn mua và sử dụng cây đàn violin này.', 10, 11, 9, '2021-06-06 00:49:30', '2021-06-16 05:08:21'),
(30, 'Roland TD-1DMK', 21680000, 'roland-td-1dmk-400x400.jpg', 'Roland vừa cho ra mắt bộ trống V-Drum TD-1DMK hoàn toàn mới cho phân khúc entry-level, với mục đích nhằm giúp những người chơi mới phát triển kĩ năng một cách nhanh chóng và dễ dàng nhất có thể.Thiết kế đơn giản\r\nBộ trống có thiết kế khá đơn giản, chỉ cần cắm và chơi mà không cần trải qua các bước set up phức tạp, giúp cho nó rất thân thiện với người chơi mới. Bộ kit bao gồm 15 bộ tiếng và nhiều chế độ coach hỗ trợ người học được tích hợp sẵn, những chế độ được thiết kế giúp người chơi phát triển các kĩ năng về nhịp điệu. Ngoài ra, người dùng còn có thể kết nối TD-1DMK với phần mềm Melodics dành cho Windows/Mac, cung cấp những bài học miễn phí đầy trực quan.\r\n\r\nCảm giác chơi tự nhiên, dễ dàng di chuyển\r\nĐiểm nổi bật của bộ trống là các pad đều được trang bị mặt lưới mesh, điều ít khi gặp trên những dòng sản phẩm phổ thông. Ưu điểm của mặt mesh là mang lại cảm giác chơi tự nhiên hơn, đồ ồn thấp và trọng lượng nhẹ giúp dễ dàng di chuyển, bộ trống mới này của Roland chỉ nặng 7kg.', 14, 6, 2, '2021-06-16 02:25:03', '2021-06-16 02:25:03'),
(31, 'ROLAND TD-17KV-X', 45690000, 'TD-17KVX-400x400.jpg', 'Khi bạn có những đam mê nghiêm túc với bộ môn trống, bạn rất cần một bộ trống phù hợp với tham vọng trở thành một tay trống chuyên nghiệp của mình. Dòng V-Drums TD-17 cho phép kỹ thuật của bạn tỏa sáng thực sự, được tích hợp tính năng của các công cụ đào tạo giúp thúc đẩy năng lượng phấn đấu để tăng khả năng chơi trống của bạn. Kết hợp một động cơ âm thanh TD-50 với các miếng đệm mới được phát triển tạo ra một bộ trống điện tử giá cả phải chăng, gần giống với trống cơ. Trong khi đó, một loạt các chức năng huấn luyện tích hợp sẽ theo dõi kỹ thuật của bạn, đo lường sự tiến bộ của bạn và tăng động lực cố gắng cho bạn. Trở thành một tay trống tốt hơn trước giờ vẫn là công việc không hề dễ dàng, nhưng TD-17 có thể giúp bạn đạt được điều đó.', 8, 6, 2, '2021-06-16 02:26:34', '2021-06-16 02:26:34'),
(32, 'Suzuki Violin 220FE4 4/4', 17960000, '200fe4.jpg', 'Model 220 Nagoya Suzuki violin từ lâu đã trở thành tiêu chuẩn mà các nhạc cụ khác được so sánh và đánh giá. Mô hình violon truyền thống này đã được chơi và yêu thích bởi các sinh viên và giáo viên trên toàn thế giới kể từ khi nó được đưa vào thị trường.', 34, 11, 9, '2021-06-16 02:28:41', '2021-06-16 02:28:41'),
(33, 'Suzuki FS-10 3/4', 5230000, 'S FS 10 3.jpg', 'Suzuki FS-10 3/4 được thiết kế dành cho trẻ em với kích thước 3/4 mang đến sự thoải mái khi sử dụng.', 3, 11, 9, '2021-06-16 02:31:21', '2021-06-16 02:31:21'),
(34, 'Suzuki Violin NS 20FIT 3/4', 13660000, '20.jpg', 'Suzuki Violin NS 20FIT 3/4, Kiểu dáng, thiết kế đẹp và hài hòa, Thiết kế nổi bật, màu sắc sang trọng, Cạnh tranh về giá và cạnh tranh về chất lượng.', 4, 11, 9, '2021-06-16 02:33:33', '2021-06-16 02:33:33'),
(35, 'Scherl and Roth SR42E152H', 12000000, 'Scherl--Roth-sr42e152h-450x471.jpg', 'Chiếc đàn Scherl and Roth SR42E152H này  được làm bằng chất liệu gỗ cứng có độ bền khác cao với kích thước 15 1/2\" phù hợp với đôi tay nhỏ bé. Sự kết hợp hài hòa giữa âm thanh và vẻ ngoài sang trọng nó là một trong những ưu tiên lựa chọn cho những ai mới bắt đầu hành trình âm nhạc diệu kỳ của mình', 6, 11, 9, '2021-06-16 02:35:20', '2021-06-16 02:35:20'),
(36, 'Fender Acoustasionic', 44810000, 'fender-0972013206-400x400.jpg', 'Tuyệt vời ông mặt trời =))', 33, 10, 6, '2021-06-16 02:37:29', '2021-06-16 05:06:39'),
(37, 'Fender CN-60S', 5640000, 'c 05.jpg', 'Fender CN-60S Classical Natural giúp người trải nghiệm sự thuận tiện của dây Nylon và âm thanh của dây thép', 23, 10, 7, '2021-06-16 02:39:52', '2021-06-16 05:05:12'),
(38, 'Fender CN-60S, Black', 5640000, 'c 04.jpg', 'Fender CN-60S Classical Black giúp người trải nghiệm sự thuận tiện của dây Nylon và âm thanh của dây thép.', 12, 10, 7, '2021-06-16 02:41:05', '2021-06-16 02:41:05'),
(39, 'Fender CN-60S Classical', 5600000, 'c 05 (1).jpg', 'Fender CN-60S Classical Natural giúp người trải nghiệm sự thuận tiện của dây Nylon và âm thanh của dây thép', 12, 10, 7, '2021-06-16 02:42:50', '2021-06-16 02:42:50'),
(40, 'Suzuki SDG-15NL', 2780000, 'SUZUKI SDG-15 NL.jpg', 'Đàn Guitar Suzuki SDG-15NL thiết kế trang nhã, cổ điển, âm thanh trung thực, trong trẻo, âm trầm, là lựa chọn tuyệt vời cho ngườ mới bắt đầu học cũng như chơi giải trí, đặt biệt là giới học sinh, sinh viên.\r\n\r\n- Mặt đàn làm bằng gỗ Vân Sam (Spruce)\r\n\r\nĐây là loại gỗ quý, chuyên dùng làm các vật dụng quý trong nhà. Đối với guitar, gỗ Vân Sam mang lại âm thanh ngân vang như tiếng chuông. Âm thanh rõ rang, cân bằng và có độ ngân lâu trong thùng đàn.\r\n\r\nĐối với các nghệ sỹ Guitar chuyên nghiệp, mỗi khi biểu diễn trong hội trường lớn, họ thường chọn đàn làm bằng gỗ Vân Sam. Lý do gỗ này mang lại âm thanh hay và cân bằng tốt, giúp đẩy âm thanh ra phía cuối hội trường lớn.\r\n\r\nCây đàn guitar Suzuki SDG 15NL này có những đặc điểm đó khi mặt đàn được làm bằng gỗ Vân Sam.\r\n\r\n- Tuổi thọ cao\r\n\r\nTuổi thọ của đàn guitar Suzuki SDG 15NL có thể lên tới cả chục năm (âm thanh, chất gỗ không đổi) nhờ lưng, hông đàn làm bằng gỗ Đoan; Phím và ngựa bằng gỗ Phong… Đây là các loại gỗ rất bền bỉ với thời tiết mà rất hiếm cây đàn nào có được. Tuổi thọ của nó không bao giờ dưới 5 năm, phần lớn là 8 – 10 năm. Trải qua cả quãng thời gian dài này chất đàn vẫn không thay đổi và giữ được tiếng trong trẻo, sang trọng của nó như ngày đầu.\r\n\r\nCảm nhận đầu tiên khi người chơi bấm hợp âm Đô trưởng và vuốt đêu 6 dây là âm thanh trong trẻo nhưng rất trầm, ấm vang lên.', 34, 11, 1, '2021-06-16 02:44:49', '2021-06-16 02:44:49'),
(41, 'Suzuki SDG-45CE NL', 4140000, 'SUZUKI SDG-45CE NL.jpg', 'Đàn guitar Suzuki SDG-45 CENL nổi bật với kiểu dáng hiện đại, là mẫu thiết kế chuẩn cho nhiều kiểu đàn Modern hiện nay', 12, 11, 1, '2021-06-16 02:46:11', '2021-06-16 02:46:11'),
(42, 'Ritmuller 160R1 A112', 879000000, 'Ritmuller-160R1-A112-1-400x400.jpg', 'Đàn piano Ritmuller 160R1 A112 là cây đàn đại dương cầm cao cấp của Đức, được làm từ loại gỗ chất lượng (gỗ chuyên dùng sản xuất các loại đàn piano nổi tiếng thế giới), được lắp ráp kết hợp giữa phương pháp thủ công truyền thống Châu Âu và những công nghệ phát triển đương đại. Đàn có đầu búa ABEL trong đàn được sản xuất tại Đức có tính đàn hồi tốt và độ cứng được điều chỉnh một cách hoàn hảo để tạo ra những giai điệu piano tươi sáng và đa dạng. Ngựa đàn được làm từ gỗ thích cứng tạo cho sự truyền âm chính xác và sắc xảo tạo ra âm thanh piano thuần khiết. Dây dàn Piano Ritmuller tạo ra chất lượng âm thanh tuyệt hảo. Đàn piano Ritmuller 160R1 A112 kiểu dáng sang trọng, chuyên nghiệp, âm thanh trầm, ấm, vang, sẽ là điểm nhấn cho căn nhà bạn thêm sang trọng. Đây là cây đàn piano được nghệ sĩ và người chơi piano chuyên nghiệp đánh giá cao.', 1, 12, 8, '2021-06-16 02:49:31', '2021-06-16 02:49:31'),
(43, 'Ritmuller 160R1 A111', 679000000, 'GP160R1.jpg', 'Đàn piano Ritmuller 160R1 A111 là cây đàn đại dương cầm cao cấp của Đức, được làm từ loại gỗ chất lượng (gỗ chuyên dùng sản xuất các loại đàn piano nổi tiếng thế giới), được lắp ráp kết hợp giữa phương pháp thủ công truyền thống Châu Âu và những công nghệ phát triển đương đại. Đàn có đầu búa ABEL trong đàn được sản xuất tại Đức có tính đàn hồi tốt và độ cứng được điều chỉnh một cách hoàn hảo để tạo ra những giai điệu piano tươi sáng và đa dạng. Ngựa đàn được làm từ gỗ thích cứng tạo cho sự truyền âm chính xác và sắc xảo tạo ra âm thanh piano thuần khiết. Dây dàn Piano Ritmuller tạo ra chất lượng âm thanh tuyệt hảo. Đàn piano Ritmuller 160R1 A111 kiểu dáng sang trọng, chuyên nghiệp, âm thanh trầm, ấm, vang, sẽ là điểm nhấn cho căn nhà bạn thêm sang trọng. Đây là cây đàn piano được nghệ sĩ và người chơi piano chuyên nghiệp đánh giá cao.', 2, 12, 8, '2021-06-16 02:50:45', '2021-06-16 02:50:45'),
(44, 'Ritmuller 123R A111', 34000000, 'UP132R.jpg', 'Mr. Lothar Thomma được thế giới biết đến như một bậc thầy về thiết kế piano và ông cũng nổi tiếng với những quy định nghiêm ngặt về lắp ráp thủ công và quản trị chất lượng. Bộ máy: Lắp ráp thủ công theo truyền thống Châu Âu. Các chi tiết bằng gỗ và sản xuất một cách chính xác theo dây chuyền kỹ thuật số CNC tạo nên độ nhanh nhạy khi nhấn phím đàn. Búa nỉ: Hãng sản xuất nổi tiếng của Đức ABEL cung cấp dàn búa nỉ cho đàn Ritmuller. Độ đàn hồi tốt nhất của nỉ cộng thêm Công Nghệ Ép Cứng Búa Nỉ một cách hoàn hảo đã tạo nên những âm sắc trong sáng và phong phú khi gõ vào các dây đàn. Dây đàn: Roslau của Đức nổi tiếng với chất lượng âm thanh tuyệt hảo. Lắp ráp thủ công: Kết hợp giữa phương pháp thủ công truyền thống Châu Âu và những công nghệ phát triển đương đại. Nỉ ngắt tiếng vang: Sản xuất tại Châu Âu với chất lượng cao giúp cho việc biểu diễn chuyên nghiệp các kỹ thuật ngón đàn piano. Ngựa đàn: Các lớp gỗ cứng theo chiều dọc được ghép lại để tạo nên một con ngựa và được đặt chính xác vào vị trí trên mặt đàn sẽ truyền những rung động của các tần số âm thanh đến soundboard tạo nên những âm thanh thuần khiết hơn. Hệ thống Slow-fall:  Giúp bảo vệ đàn tiện lợi hơn và thoải mái hơn trong quá trình sử dụng đặc biệt đối với trẻ em. Gỗ dùng sản xuất đàn: Gỗ tự nhiên khai thác theo mùa hàng năm và được xử lý kỹ thuật nghiêm ngặt bằng khoa học hiện đại. Điều  này làm tăng tính bền và ổn định của gỗ làm đàn dưới mọi thời tiết. Độ ẩm và nhiệt độ được kiểm soát nghiêm ngặt đảm bảo môi trường tốt nhất trong quá trình sản xuất nhằm làm tăng tính ổn định âm sắc và khả năng sử dụng đàn. Độ ẩm và nhiệt độ được kiểm soát nghiêm ngặt đảm bảo môi trường tốt nhất trong quá trình sản xuất nhằm làm tăng tính ổn định âm sắc và khả năng sử dụng đàn.', 5, 12, 3, '2021-06-16 02:53:37', '2021-06-16 02:53:37'),
(45, 'Boston UP-118E', 338200000, 'up 18.jpg', 'Đàn piano Boston là một thương hiệu con của hãng Piano lừng danh Steinway & Sons, mang cùng một tiêu chuẩn xuất sắc của tất cả các công cụ được thiết kế bởi hãng này.  Piano Boston UP-118E được thừa hưởng những thiết kế ưu việt của thương hiệu Steinway, mang âm sắc cổ điện với thiết kế tinh tế, đẹp và hiện đại. Cây đàn có âm thanh và cấu tạo tương tự những chiếc grand piano. Với cây upright UP-118E này, bạn sẽ thỏa sức thể hiện đam mê âm nhạc của mình như đang trải nghiệm một cây grand piano thực sự.', 5, 8, 3, '2021-06-16 02:54:51', '2021-06-16 02:54:51'),
(46, 'Boston UP-126E PE', 387150000, 'up 18.jpg', 'Đàn piano Boston là một thương hiệu con của hãng Piano lừng danh Steinway & Sons, mang cùng một tiêu chuẩn xuất sắc của tất cả các công cụ được thiết kế bởi hãng này.  Piano Boston UP-126E PE được thừa hưởng những thiết kế ưu việt của thương hiệu Steinway, mang âm sắc cổ điện với thiết kế tinh tế, đẹp và hiện đại. Cây đàn có âm thanh và cấu tạo tương tự những chiếc grand piano. Với cây upright UP-126E PE này, bạn sẽ thỏa sức thể hiện đam mê âm nhạc của mình như đang trải nghiệm một cây grand piano thực sự.', 7, 8, 3, '2021-06-16 02:56:43', '2021-06-16 02:56:43'),
(47, 'Boston UP-132E', 425420000, 'up 18.jpg', 'Từng soundboard của đàn piano Boston Up 132E được làm bằng tay từ gỗ Sitka spruce, được chứng minh là loại vật liệu cho âm cộng hưởng tốt nhất. Các soundboard Boston cũng được gia công một cách tỉ mỉ, cho phép độ rung tự do hơn. Cùng với một số các công nghệ đặc biệt – bằng sáng chế độc nhất của Steinway & Sons - kết quả là âm thanh mạnh mẽ và vững chãi.', 4, 8, 3, '2021-06-16 02:57:38', '2021-06-16 02:57:38'),
(48, 'Kawai K-500', 237000000, 'k500.jpg', 'Đàn piano Kawai K-500 có bộ máy cơ Thiên niên kỷ thế hệ thứ III (Millennium III Action) được làm bằng ABS - Carbon, một chất liệu tổng hợp được tạo ra bởi sự pha trộn của sợi carbon và ABS styran – một chất liệu nổi tiếng của Kawai. ABS - Carbon là chất liệu vô cùng mạnh mẽ và cứng cáp, cho phép tạo ra các bộ phận hoạt động nhẹ hơn mà không phải hao tốn nhiều sức lực. Với chất liệu đặc biệt này, bộ máy cơ hoạt động mạnh mẽ hơn, nhanh nhạy hơn và mang lại những ưu điểm tuyệt vời: khả năng hoạt động vượt trội, sự kiểm soát tốt hơn và ổn định hơn so với bộ máy cơ làm bằng gỗ thông thường.', 3, 9, 3, '2021-06-16 03:03:19', '2021-06-16 03:03:19'),
(52, 'Kawai K-500', 237000000, 'k500.jpg', 'Đàn piano Kawai K-500 có bộ máy cơ Thiên niên kỷ thế hệ thứ III (Millennium III Action) được làm bằng ABS - Carbon, một chất liệu tổng hợp được tạo ra bởi sự pha trộn của sợi carbon và ABS styran – một chất liệu nổi tiếng của Kawai. ABS - Carbon là chất liệu vô cùng mạnh mẽ và cứng cáp, cho phép tạo ra các bộ phận hoạt động nhẹ hơn mà không phải hao tốn nhiều sức lực. Với chất liệu đặc biệt này, bộ máy cơ hoạt động mạnh mẽ hơn, nhanh nhạy hơn và mang lại những ưu điểm tuyệt vời: khả năng hoạt động vượt trội, sự kiểm soát tốt hơn và ổn định hơn so với bộ máy cơ làm bằng gỗ thông thường.', 5, 9, 3, '2021-06-16 03:15:22', '2021-06-16 03:15:22'),
(55, 'Conn & Selmer 601', 6400000, 'conn-selmer-601-400x400.jpg', 'Chiếc King 601 Bb Trumpet được sản xuất tại Mỹ với vật liệu chất lượng cao nhất. Nó cung cấp một slide điều chỉnh chính duy nhất cho hoạt động dễ dàng', 23, 7, 5, '2021-06-16 05:47:22', '2021-06-16 05:47:22'),
(56, 'conn & selmer 2055s', 32550000, 'conn-selmer-2055s-400x400.jpg', 'King Silver Flair dòng Bb Trumpet 2055S được các nghệ sĩ trên toàn thế giới đánh giá cao', 4, 7, 5, '2021-06-16 05:50:09', '2021-06-16 05:50:09'),
(57, 'Selmer BPM 180S37', 88350000, 'SELMER BACH PROFESSIONAL MODEL 180S37.jpg', 'Kèn bach 180 series là kèn bán kèn chuyên nghiệp số một thế giới. 180S37 có chuông chuyên nghiệp bằng búa tay #37 tạo ra âm thanh ấm áp với hình chiếu tuyệt vời cho phép nhạc cụ này hoạt động tốt trong nhiều cài đặt âm nhạc — từ nhạc jazz đến hòa nhạc hoặc chơi solo. Ống #25 cho phép sức đề kháng nhẹ có hiệu quả trong việc tập trung sản xuất tông màu.', 9, 7, 5, '2021-06-16 05:52:34', '2021-06-16 05:52:34'),
(58, 'Selmer CAS280R', 60800000, 'CAS280R.jpg', 'Thể hiện bản thân thông qua âm thanh dựa trên những điều tuyệt vời mà Selmer truyền thống mang lại. Selmer LaVoix  II saxophones CAS280R không những mang lại cảm giác thú vị mà còn là âm thanh tuyệt vời khi chơi.', 11, 7, 4, '2021-06-16 05:55:27', '2021-06-16 05:55:27'),
(59, 'Harmonica MR-250B', 680000, 'SUZUKI_HARMONICA_MR-250B-400x400.jpg', 'SUZUKI HARMONICA MR-250B là sản phẩm của một thương hiệu nổi tiếng của Nhật. Suzuki đã phát minh ra công nghệ làm thân kèn mới được làm bằng nhựa ABS đúc, điều này giúp giá thành giảm đi mà chất lượng của kèn vẫn không thay đổi.', 54, 11, 11, '2021-06-16 06:00:26', '2021-06-16 06:00:26'),
(60, 'Suzuki MR-350V C', 1020000, '350c.jpg', 'Kèn Harmonica Suzuki MR-350V (key C) là mẫu Diatonic Harmonica thuộc series Professional của Suzuki, mẫu kèn này có thiết kế giống hệt mẫu MR-350 (ProMaster) nhưng được gắn thêm một hệ thống valved điều khí (điều hơi thổi) nhằm mang đến cho người chơi một cảm nhận đặc biệt khì sử dụng\r\n\r\nProMaster MR-350V có thân làm bằng nhôm, lưỡi gà làm từ phosphor-đồng, được lấy âm mẫu thủ công với độ chuẩn xác cao nhất. Hệ thống valved tuần hoàn khí tạo nên những âm thanh huyền ảo đầy mê hoặc, thổi siêu nhẹ và bend rất dễ dàng, nếu như MR-350 được chấm điểm bend là 8/10 thì ProMaster Valved có điểm9.5/10 (tương đương Manji về độ dễ khi thực hành bend), nhà sản xuất cũng tin rằngthiết kế độc đáo này sẽ khiến người yêu harp khi cầm MR350V lên rồi sẽ không còn muốn buông ra nữa\r\n\r\nSuzuki luôn gây ấn tượng cho người chơi kèn bằng những ý tưởng chế tác harmonica chưa từng có từ quá khứ, sử dụng công nghệ hiện đại trong khâu sản xuất, hình thức đẹp mắt nhưng vẫn giữ được trọn vẹn những yêu cầu chung của một cây kèn chất lượng cao. MR-350V là một trong số các sản phẩm như vậy, hoàn hảo đến từng chi tiết, được làm bán thủ công nguyên chiếc tại Nhật (Madein Japan)', 12, 11, 11, '2021-06-16 06:01:37', '2021-06-16 06:01:37'),
(61, 'Suzuki SCX-56C', 5160000, 'Suzuki SCX-56C.jpg', 'Kèn Harmonica Suzuki SCX-56 là mẫu Chromatic Harmonica thuộc series Professional của hãng Suzuki (Nhật). Chromatix là tên gọi riêng của dòng sản phẩm này (giống như Chromonica hay Chrometta là những tên riêng của hãngHohner), đây là mẫu piano cầm tay được miêu tả là có âm thanh sâu lắng và mềm mạinhư lụa, Chromatix có ba loại (12, 14 và 16 lỗ), Suzuki SCX-56 là loại 14 lỗ.', 23, 11, 11, '2021-06-16 06:05:39', '2021-06-16 06:05:39'),
(62, 'Suzuki SU-21SPC', 760000, 'Suzuki SU-21SPC.jpg', 'Nhạc cụ dành cho mọi người. Âm thanh nồng nàn tha thiết, vui tươi, rộn rã, diễn tả mọi cảm xúc người chơi. Được thiết kế nhỏ gọn dễ mang theo. Harmonica Suzuki SU-21 dành cho người chơi chuyên nghiệp', 12, 11, 11, '2021-06-16 06:06:51', '2021-06-16 06:06:51'),
(63, 'Suzuki SCX-48C', 4600000, 'Suzuki SCX-48C.jpg', 'Kèn Harmonica - Suzuki SCX-48 là mẫu Chromatic Harmonica thuộc series Professional của hãng Suzuki (Nhật). Chromatix là tên gọi riêng của dòng sản phẩm này (giống như Chromonica hay Chrometta là những tên riêng của hãng Hohner), đây là mẫu piano cầm tay được miêu tả là có âm thanh sâu lắng và mềm mại như lụa, Chromatix có ba loại (12, 14 và 16 lỗ), Suzuki SCX-48 là loại 12 lỗ.', 12, 11, 11, '2021-06-16 06:07:59', '2021-06-16 06:07:59'),
(65, 'Ukulele Soprano Natural', 3150000, 'u 04.jpg', 'Cây đàn Fender Ukelele U’Uku Soprano mới - phong cách có tên từ tiếng Hawai “nhỏ nhắn” (các cây đàn soprano uke là loại đàn nhỏ nhất trong dòng đàn ukulele), nhưng niềm vui mà nó tạo ra với âm thanh tuyệt vời và thiết kế trang nhã lại “rất lớn”', 12, 10, 12, '2021-06-16 06:11:12', '2021-06-16 06:11:12'),
(66, 'Deviser UK-21-30', 1000000, 'dan-ukulele-deviser-uk-21-30-400x400.jpg', 'Đàn Ukulele Soprano Deviser UK-21-20 có chiều dài 53cm (21inch), thích hợp với người mới tập chơi uke, người có bàn tay nhỏ và trẻ em. Soprano là giọng nữ có âm vực cao nhất trong tất cả các loại giọng và dòng đàn uke soprano này cũng vậy. Đây là cây ukulele hoàn hảo cho người mới bắt đầu học ukulele với một ngân sách tiết kiệm tối đa.', 11, 14, 12, '2021-06-16 06:14:40', '2021-06-16 06:14:40'),
(67, 'Deviser UK-21-65', 990000, 'deviser-uk-21-65-400x400.jpg', 'Đàn Ukulele Soprano Deviser UK-21-65 có chiều dài 53cm (21inch), thích hợp với người mới tập chơi uke, người có bàn tay nhỏ và trẻ em. Soprano là giọng nữ có âm vực cao nhất trong tất cả các loại giọng và dòng đàn uke soprano này cũng vậy. Đây là cây ukulele hoàn hảo cho người mới bắt đầu học ukulele với một ngân sách tiết kiệm tối đa.', 12, 14, 12, '2021-06-16 06:15:58', '2021-06-16 06:15:58'),
(68, 'Deviser UK-24-30', 1120000, 'deviser-uk-24-30-400x400.jpg', 'Ukulele Soprano Deviser UK-24-30 là cây đàn được yêu thích nhất hiện nay, bằng gỗ mahogany, có chiều dài 60cm (24inch), thích hợp với người có bàn tay khá lớn. Dây đàn được làm bằng sợi nilon cao cấp, lỗ thoát âm trang trí bắt mắt.', 9, 14, 12, '2021-06-16 06:17:09', '2021-06-16 06:17:09'),
(69, 'Deviser UK-24-50', 1140000, 'dan_ukulele_UK_24_50.png', 'Đàn Ukulele Concert Deviser UK-24-50 là cây đàn được yêu thích nhất hiện nay, bằng gỗ mahogany, có chiều dài 60cm (24inch), thích hợp với người có bàn tay khá lớn. Dây đàn được làm bằng sợi nilon cao cấp, lỗ thoát âm trang trí bắt mắt.', 22, 14, 12, '2021-06-16 06:18:22', '2021-06-16 06:18:22');

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
  `user_email_valid` int(11) NOT NULL DEFAULT 0,
  `user_permission` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `user_username`, `user_password`, `user_email`, `user_email_valid`, `user_permission`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$12$bYJPn80S4etZr.BXtgGwI.LXX44A7Sh19T11eIQl8nAbASv4W3N8O', '', 1, 0, NULL, NULL),
(2, 'AndyVu', '$2y$12$bYJPn80S4etZr.BXtgGwI.LXX44A7Sh19T11eIQl8nAbASv4W3N8O', '', 1, 1, NULL, NULL),
(9, 'a', '$2y$12$ZhcljsTyOR7rkaWbJueqj.nj75HQsc6PBJ3iXkqjBMUylOdhobv0i', 'truongvutrssh@gmail.com', 0, 1, '2021-06-21 20:05:43', '2021-06-21 20:05:43'),
(10, 'thai', '$2y$12$8ezAUCDqQ5kRcmDQPzm9guXhCiK.TXWGyUVvr.KAnFwNOhIke4J8u', 'thai@gmail.com', 1, 1, '2021-06-21 20:34:22', '2021-06-21 20:34:22');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
