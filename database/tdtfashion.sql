-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2022 at 06:56 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tdtfashion`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_user` varchar(20) DEFAULT NULL,
  `admin_name` text DEFAULT NULL,
  `admin_pass` varchar(100) DEFAULT NULL,
  `admin_role` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_user`, `admin_name`, `admin_pass`, `admin_role`) VALUES
(1, 'admin', 'Quản trị viên 1', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'admin'),
(2, 'mod', 'Nhân viên 1', 'e55cffc81a5ad8cfe85239d944a3ae9513645a9eed79bc884f51b80b2760fc46', 'mod');

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `brand_id` int(11) NOT NULL,
  `brand_name` text DEFAULT NULL,
  `brand_logo` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`brand_id`, `brand_name`, `brand_logo`) VALUES
(1, 'Ananas', 'https://ananas.vn/wp-content/themes/ananas/assets/images/Logo_Ananas.png'),
(2, 'Icon Denim', 'https://cf.shopee.vn/file/133b73c7f696eaccc8517b300093e39a'),
(3, 'Louis Vuitton', 'https://inkythuatso.com/uploads/images/2021/11/logo-lv-inkythuatso-01-02-13-50-05.jpg'),
(4, 'Dior', 'https://gostyle.vn/wp-content/uploads/2020/10/y-nghia-chua-ai-biet-ve-logo-cua-thuong-hieu-dior-1.png'),
(5, 'Channel', 'https://cdn.elly.vn/uploads/2021/01/06205934/y-nghia-logo-thuong-hieu-chanel.png'),
(6, 'Gucci', 'https://gudlogo.com/wp-content/uploads/2019/11/gucci-logo-su-hinh-thanh-va-phat-trien.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'Nón'),
(2, 'Áo'),
(3, 'Quần'),
(4, 'Giày'),
(5, 'Túi xách'),
(6, 'Đồng hồ');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` text DEFAULT NULL,
  `customer_email` varchar(200) DEFAULT NULL,
  `customer_phone` varchar(14) DEFAULT NULL,
  `customer_address` text DEFAULT NULL,
  `customer_pass` varchar(100) DEFAULT NULL,
  `customer_status` varchar(10) DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `customer_email`, `customer_phone`, `customer_address`, `customer_pass`, `customer_status`) VALUES
(1, 'Trần Đình Thông', 'pynhokbin@gmail.com', '0868076100', 'Thôn Quảng Hội 1, Xã Vạn Thắng, Huyện Vạn Ninh, Tỉnh Khánh Hòa', '936fdf2f649b6895ca79b252cbe2a429d4670e3244f9a7ff95e231dc32ddb465', 'active'),
(32, 'Nguyen Huu Tai', 'nhtna.98@gmail.com', '0796251096', 'xóm 3, Xã Đường Hoa, Huyện Hải Hà, Tỉnh Quảng Ninh', 'b1b7909b14124b096164c1455ca4cd1d6c3639d2a5471c4ed957c0d01537c056', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL,
  `feedback_comment` text DEFAULT NULL,
  `feedback_rate` int(11) DEFAULT NULL,
  `feedback_date` datetime DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `feedback_comment`, `feedback_rate`, `feedback_date`, `product_id`, `customer_id`) VALUES
(47, 'Sản phẩm này ngon quá', 5, '2022-03-25 06:08:43', 6, 1),
(48, 'Đáng mua trong tầm giá!', 3, '2022-03-25 06:08:56', 6, 1),
(49, 'Sản phẩm đúng như mô tả', 3, '2022-03-25 06:18:32', 6, 1),
(50, 'Sản phẩm này tuyệt lắm', 4, '2022-03-25 07:05:50', 5, 1),
(51, 'Đêm qua em tuyệt lắm', 3, '2022-03-26 17:57:08', 1, 1),
(52, 'sản phẩm khá tốt', 4, '2022-04-05 08:03:02', 6, 32);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_id` varchar(20) NOT NULL,
  `order_date` datetime DEFAULT NULL,
  `order_payment` tinyint(1) DEFAULT NULL,
  `order_status` tinyint(1) DEFAULT NULL,
  `order_total` bigint(20) DEFAULT NULL,
  `order_note` text DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_name` text DEFAULT NULL,
  `order_phone` varchar(14) DEFAULT NULL,
  `order_email` varchar(200) DEFAULT NULL,
  `order_address` text DEFAULT NULL,
  `order_payment_code` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`order_id`, `order_date`, `order_payment`, `order_status`, `order_total`, `order_note`, `customer_id`, `order_name`, `order_phone`, `order_email`, `order_address`, `order_payment_code`) VALUES
('2022032623162832', '2022-03-26 23:16:28', 0, 5, 8000000, '', 32, 'Nguyen Huu Tai', '0796251096', 'nhtna.98@gmail.com', 'xóm 3, Xã Đường Hoa, Huyện Hải Hà, Tỉnh Quảng Ninh', ''),
('2022032623184332', '2022-03-26 23:18:43', 0, 4, 100000000, '', 32, 'Nguyen Huu Tai', '0796251096', 'nhtna.98@gmail.com', 'xóm 3, Xã Đường Hoa, Huyện Hải Hà, Tỉnh Quảng Ninh', ''),
('2022032623193232', '2022-03-26 23:19:32', 0, 3, 100000000, '', 32, 'Nguyen Huu Tai', '0796251096', 'nhtna.98@gmail.com', 'xóm 3, Xã Đường Hoa, Huyện Hải Hà, Tỉnh Quảng Ninh', ''),
('2022032623225232', '2022-03-26 23:22:52', 0, 2, 100000000, '', 32, 'Nguyen Huu Tai', '0796251096', 'nhtna.98@gmail.com', 'xóm 3, Xã Đường Hoa, Huyện Hải Hà, Tỉnh Quảng Ninh', ''),
('2022032713070132', '2022-03-27 13:07:01', 1, 1, 200000, 'tý tôi hủy trả tiền lại đây', 32, 'Nguyen Huu Tai', '0796251096', 'nhtna.98@gmail.com', 'xóm 3, Xã Đường Hoa, Huyện Hải Hà, Tỉnh Quảng Ninh', 'MOMOG1ES202111162022032713070132'),
('2022032808395232', '2022-03-28 08:39:52', 0, 5, 108000000, '', 32, 'Nguyen Huu Tai', '0796251096', 'nhtna.98@gmail.com', 'xóm 3, Xã Đường Hoa, Huyện Hải Hà, Tỉnh Quảng Ninh', ''),
('2022040508020832', '2022-04-05 08:02:08', 1, -1, 300000, '', 32, 'Nguyen Huu Tai', '0796251096', 'nhtna.98@gmail.com', 'xóm 3, Xã Đường Hoa, Huyện Hải Hà, Tỉnh Quảng Ninh', '');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `order_detail_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_id` varchar(20) NOT NULL,
  `order_detail_count` int(11) NOT NULL,
  `order_detail_price` bigint(20) NOT NULL,
  `order_detail_size_choose` text NOT NULL,
  `order_detail_color_choose` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`order_detail_id`, `product_id`, `order_id`, `order_detail_count`, `order_detail_price`, `order_detail_size_choose`, `order_detail_color_choose`) VALUES
(26, 6, '2022032623162832', 1, 8000000, 'M', 'Nâu'),
(27, 5, '2022032623184332', 1, 100000000, 'L', 'Đen'),
(28, 5, '2022032623193232', 1, 100000000, 'L', 'Đen'),
(29, 5, '2022032623225232', 1, 100000000, 'L', 'Đen'),
(30, 1, '2022032713070132', 1, 200000, 'M', 'Trắng'),
(31, 6, '2022032808395232', 1, 8000000, 'M', 'Nâu'),
(32, 5, '2022032808395232', 1, 100000000, 'L', 'Đen'),
(33, 3, '2022040508020832', 1, 300000, 'M', 'Nâu');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` text DEFAULT NULL,
  `product_color` text DEFAULT '[]',
  `product_size` text DEFAULT '[]',
  `product_img` text DEFAULT '[]',
  `product_price` bigint(20) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `product_description` text DEFAULT NULL,
  `product_status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_color`, `product_size`, `product_img`, `product_price`, `category_id`, `brand_id`, `product_description`, `product_status`) VALUES
(1, 'Giày Annas', '[\"Trắng\", \"Đen\"]', '[\"M\",\"L\"]', '[\"https://ananas.vn/wp-content/uploads/stu_basas_A61013_1.jpg\",\"https://ananas.vn/wp-content/uploads/stu_basas_A61013_3.jpg\",\"https://ananas.vn/wp-content/uploads/stu_basas_A61014_11.jpg\",\"https://ananas.vn/wp-content/uploads/stu_basas_A61014_31.jpg\"]', 200000, 4, 1, NULL, 1),
(2, 'Áo thun sọc Icon Denim', '[\"Đen\"]', '[\"M\",\"L\"]', '[\"https://salt.tikicdn.com/cache/400x400/ts/product/73/9c/b3/2ca8fbe80ba517e0ea21ebe5a8ca589b.jpg.webp\",\"https://salt.tikicdn.com/cache/400x400/ts/product/bb/fe/fa/0b7f45e7aff2e9bc57f70517e1470700.jpg.webp\"]', 800000, 2, 2, NULL, 1),
(3, 'Túi LV', '[\"Nâu\"]', '[\"M\"]', '[\"https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2020/03/pochette-accessoires-monogram-6-jpg-1585297302-27032020152142.jpg\",\"https://milistore.net/wp-content/uploads/imgup/upload/tui-louis-vuitton-favorite-m-monogram-canvas-0434.jpg\"]', 300000, 5, 3, NULL, 1),
(4, 'Đồng hồ', '[\"Trắng\"]', '[\"40\", \"60\"]', '[\"https://firebasestorage.googleapis.com/v0/b/tdtfashionshop.appspot.com/o/1650174306671-dongho1.jpg?alt=media&token=070366b2-ef59-4b3d-bc21-e30d519711f4\",\"https://firebasestorage.googleapis.com/v0/b/tdtfashionshop.appspot.com/o/1650174306674-dongho3.jpg?alt=media&token=a943f5e2-8909-46a8-a440-41145ccecdbb\",\"https://firebasestorage.googleapis.com/v0/b/tdtfashionshop.appspot.com/o/1650174306674-dongho4.jpg?alt=media&token=46448d0b-8741-4607-931c-bce95b2e07d4\",\"https://firebasestorage.googleapis.com/v0/b/tdtfashionshop.appspot.com/o/1650174306674-dongho2.jpg?alt=media&token=ce910120-bd85-45f6-8e46-dd8c79ef1820\"]', 1000000, 6, 4, NULL, 1),
(5, 'Quần Channel', '[\"Đen\"]', '[\"L\",\"XL\",\"XXL\"]', '[\"https://static.hotdeal.vn/images/859/859348/400x500/203799-quan-legging-in-hoa-tiet-ca-tinh-203782-vn-2-3.jpg\",\"https://hd1.hotdeal.vn/images/uploads/2015/11/17/203782/203782_quan_legging_in_hoa_tiet_body_7.jpg\",\"https://hd1.hotdeal.vn/images/uploads/2015/10/30/190830/190830-quan-legging-rach-ca-tinh-body%20%285%29.jpg\"]', 1000000, 3, 5, NULL, 1),
(6, 'Nón Gucci', '[\"Nâu\"]', '[\"M\"]', '[\"https://cdn.vuahanghieu.com/unsafe/0x900/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2019/03/mu-gucci-bee-print-gg-supreme-baseball-beige-5c8078024e7b1-07032019084642.jpg\",\"https://vn-test-11.slatic.net/p/76f58aa7d085eac61880ecdc2df6a7f6.jpg\"]', 800000, 1, 6, NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`),
  ADD KEY `IX_Relationship3` (`product_id`),
  ADD KEY `IX_Relationship8` (`customer_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `IX_Relationship4` (`customer_id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`order_detail_id`),
  ADD KEY `Relationship6` (`product_id`),
  ADD KEY `Relationship123` (`order_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `IX_Relationship2` (`category_id`),
  ADD KEY `IX_Relationship7` (`brand_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `order_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `Relationship3` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `Relationship8` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `Relationship4` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `Relationship123` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`),
  ADD CONSTRAINT `Relationship6` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `Relationship2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `Relationship7` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
