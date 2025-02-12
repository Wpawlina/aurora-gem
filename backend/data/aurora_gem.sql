-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Generation Time: Feb 12, 2025 at 10:16 PM
-- Server version: 8.0.40
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aurora_gem`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`) VALUES
(1, 'Rings'),
(2, 'Necklaces'),
(3, 'Bracelets'),
(4, 'Earrings'),
(5, 'Pendants'),
(6, 'Watches'),
(7, 'Brooches'),
(8, 'Anklets'),
(9, 'Charms'),
(10, 'Cufflinks');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `postal_code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `firstname`, `lastname`, `email`, `password`, `postal_code`, `address`, `is_admin`) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', 'password123', '12345', '123 Luxury St.', 1),
(2, 'Jane', 'Smith', 'jane.smith@example.com', 'securepass', '54321', '456 Gem Ave.', 0),
(3, 'Alice', 'Brown', 'alice.brown@example.com', 'mypassword', '67890', '789 Jewel Rd.', 0),
(4, 'Bob', 'Johnson', 'bob.johnson@example.com', 'strongpass', '09876', '321 Opal Ln.', 0),
(5, 'Emily', 'White', 'emily.white@example.com', 'whitegem', '11223', '654 Pearl Blvd.', 0),
(6, 'Michael', 'Green', 'michael.green@example.com', 'greenstone', '44556', '987 Ruby Cir.', 0),
(7, 'Sophia', 'King', 'sophia.king@example.com', 'crownjewel', '77889', '123 Diamond Ct.', 0),
(8, 'Liam', 'Lee', 'liam.lee@example.com', 'leeluxe', '99100', '456 Sapphire Dr.', 0),
(9, 'Olivia', 'Taylor', 'olivia.taylor@example.com', 'taylorstone', '22334', '789 Emerald Way', 0),
(10, 'James', 'Anderson', 'james.anderson@example.com', 'jewelking', '55667', '321 Gold Pl.', 0),
(11, 'adasdsad', 'affsfafas', 'ww22zcxzcxc2@gmail.com', '$2a$10$8jKFsCikxgWM.GLTg1MhYuhNzplv0uBKlj5ZIrESNwHpe90F7WO9O', '23-333', 'Wieliczka ul.krakowska 85/1', 0),
(12, 'adsds', 'asdsda', 'test@gmail.com', '$2a$10$o6bqVCTBZy0iGgpOnOk5M.GkqpgBFm8I3eOaF1p/0/AkrMuhakfku', '32333', 'testowa 22', 0),
(13, 'Marcin', 'Woronowicz', 'sempai@gmail.com', '$2a$10$zD5zwu3WN3b4KQzVbNPDbuLs2bnDirx9yYmVv0XFKV77RvUe7sNRy', '35-901', 'Opolska', 0),
(14, 'Joachim', 'Baranowski', 'adminek@op.pl', '$2a$10$7xeyfm2rHvMWVzZgGMILkeyboxwLHomytAmlUYz4wgR5.wXIdINkS', '35-949', 'Wroclawska , Krakow', 1),
(15, 'Paweł', 'Michalski', 'marek@gmail.com', '$2a$10$RmGHY1/xwog5j/O9EaZPYONfYgIwaIsrHm3OAcHP8YrHh/U1RkiHi', '35-602', 'Raginisa 45, Rzeszow', 0),
(16, 'Wojciech', 'Pawlina', 'wpawlina@gmail.com', '$2a$10$JOPvgc.kcjvhMUrlKB5fneVyGiVf9CDh/.x3afoGY8lidS9MTd.f6', '12345', 'Kraków ul. Testowa 2', 0),
(17, 'Wojciech', 'Pawlina', 'rew@test.com', '$2a$10$/5B0jhSWIFG.9PH0LeJ2y.WjuBF8K31zfDx2KMi0NAS6CGt43wXTq', '31-411', 'Słon', 0);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `image_id` int NOT NULL,
  `product_id` int NOT NULL,
  `url` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`image_id`, `product_id`, `url`, `file_name`) VALUES
(1, 1, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/silver-ring-with-a-sparkling+zirconia.webp', 'jewelry image'),
(2, 2, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/gold-ring-with-a-diamond.webp', 'jewelry image'),
(3, 3, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/platinum-ring-with-a-deep-blue-sapphire.webp', 'jewelry image'),
(4, 4, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/silver-ring-with-a-vibrant-red-ruby.webp', 'jewelry image'),
(5, 5, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/gold-ring-with-a-vibrant-blue-topaz.webp', 'jewelry image'),
(6, 6, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/white-gold-ring-with-a-sparkling-diamond.webp', 'jewelry image'),
(7, 7, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/gold-necklace-with-an-elegant-pendant.webp', 'jewelry image'),
(8, 8, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/diamond-necklace.webp', 'jewelry image'),
(9, 9, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/sapphire-necklace.webp', 'jewelry image'),
(10, 10, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/pearl-necklace.webp', 'jewelry image'),
(11, 11, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/silver-necklace-with-a-heart-shaped-pendant.webp', 'jewelry image'),
(12, 12, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/gold-chain-necklace.webp', 'jewelry image'),
(13, 13, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/silver-charm-bracelet.webp', 'jewelry image'),
(14, 14, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/gold-cuff-bracelet.webp', 'jewelry image'),
(15, 15, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/leather-bracelet.webp', 'jewelry image'),
(16, 16, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/silver-bangle-bracelet.webp', 'jewelry image'),
(17, 17, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/gold-bracelet-with-diamonds.webp', 'jewelry image'),
(18, 18, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/bracelet-with-turquoise.webp', 'jewelry image'),
(19, 19, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/silver-earrings-with-sparkling-zirconia+.webp', 'jewelry image'),
(20, 20, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/gold-hoop-earrings.webp', 'jewelry image'),
(21, 21, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/diamond-stud-earrings.webp', 'jewelry image'),
(22, 22, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/silver-drop-earrings.webp', 'jewelry image'),
(23, 23, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/gold-earrings-with-pearls.webp', 'jewelry image'),
(24, 24, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/gold-earrings-with-sapphire.webp', 'jewelry image'),
(25, 25, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/silver-pendant-with-ruby.webp', 'jewelry image'),
(26, 26, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/gold-pendant-with-emerald.webp', 'jewelry image'),
(27, 27, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/white-gold-pendant-with-diamond.webp', 'jewelry image'),
(28, 28, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/heart-shaped-pendant-with-zirconia.webp', 'jewelry image'),
(29, 29, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/pendant_with_amethyst.webp', 'jewelry image'),
(30, 30, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/gold-pendant-with-sapphire.webp\r\n', 'jewelry image'),
(31, 31, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/men\'s-stainless-steel-watch.webp', 'jewelry image'),
(32, 32, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/women\'s-gold-plated-watch.webp', 'jewelry image'),
(33, 33, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/silver-watch-with-a-leathe-strap.webp', 'jewelry image'),
(34, 34, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/men\'s-chronograph-watch.webp', 'jewelry image'),
(35, 35, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/women\'s-diamond-watch.webp', 'jewelry image'),
(36, 36, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/stainless-steel-watch-with-a-blue-dial.webp', 'jewelry image'),
(37, 37, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/silver-brooch-with-pearls.webp', 'jewelry image'),
(38, 38, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/gold-brooch-with-sapphire.webp', 'jewelry image'),
(39, 39, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/silver-butterfly-brooch.webp', 'jewelry image'),
(40, 40, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/gold_rose_brooch.png', 'jewelry image'),
(41, 41, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/diamond-brooch.webp', 'jewelry image'),
(42, 42, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/vintage-brooch-with-garnet.webp', 'jewelry image'),
(43, 43, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/silver-anklet-with-charms.webp', 'jewelry image'),
(44, 44, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/gold-anklet-with-diamonds.webp', 'jewelry image'),
(45, 45, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/silver-anklet-with-turquoise.webp', 'jewelry image'),
(46, 46, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/gold-anklet-with-pearls.webp', 'jewelry image'),
(47, 47, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/white-gold-anklet-with-diamonds.webp', 'jewelry image'),
(48, 48, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/silver-anklet-with-amethyst.webp', 'jewelry image'),
(49, 49, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/silver-charm-with-enamel.png', 'jewelry image'),
(50, 50, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/gold-charm-with-diamonds.webp', 'jewelry image'),
(51, 51, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/silver-heart-shaped-charm.webp', 'jewelry image'),
(52, 52, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/gold-charm-with-ruby.webp', 'jewelry image'),
(53, 53, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/silver-star-shaped.webp', 'jewelry image'),
(54, 54, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/gold-moon-shaped.webp', 'jewelry image'),
(55, 55, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/silver-cufflinks-with-onyx.webp', 'jewelry image'),
(56, 56, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/gold-cufflinks-with-pearls.webp', 'jewelry image'),
(57, 57, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/silver-cufflinks-with-sapphire.png', 'jewelry image'),
(58, 58, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/gold-cufflinks-with-diamond.webp', 'jewelry image'),
(59, 59, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/silver-cufflinks-with-amethyst.webp', 'jewelry image'),
(60, 60, 'https://aurora-gem.s3.eu-north-1.amazonaws.com/gold-cufflinks-with-emerald.webp', 'jewelry image');

-- --------------------------------------------------------

--
-- Table structure for table `opinions`
--

CREATE TABLE `opinions` (
  `opinion_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `content` varchar(400) NOT NULL,
  `stars` int NOT NULL,
  `product_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `opinions`
--

INSERT INTO `opinions` (`opinion_id`, `customer_id`, `content`, `stars`, `product_id`) VALUES
(1, 1, 'Elegant design and great quality', 5, 1),
(2, 2, 'Amazing product, worth every penny!', 5, 2),
(3, 3, 'Very satisfied with the purchase', 4, 3),
(4, 4, 'The ring exceeded my expectations', 5, 4),
(5, 5, 'High quality but slightly overpriced', 4, 5),
(6, 6, 'Perfect for special occasions', 5, 6),
(8, 8, 'Bracelet matches well with my outfit', 4, 8),
(9, 9, 'Great craftsmanship, fast shipping', 5, 9),
(10, 10, 'Not as shiny as expected', 3, 10),
(11, 13, 'Best anklet ever!!!', 4, 48),
(12, 13, 'Average one', 2, 19),
(18, 15, 'What\'s wrong', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `order_date` datetime NOT NULL,
  `customer_id` int NOT NULL,
  `shipment` double(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_date`, `customer_id`, `shipment`) VALUES
(1, '2025-01-02 14:30:00', 2, 40.00),
(2, '2025-01-03 16:45:00', 3, 60.00),
(3, '2025-01-04 11:20:00', 4, 55.00),
(4, '2025-01-05 18:15:00', 5, 45.00),
(5, '2025-01-06 13:10:00', 6, 70.00),
(6, '2025-01-07 09:30:00', 7, 35.00),
(7, '2025-01-08 20:50:00', 8, 80.00),
(8, '2025-01-09 12:00:00', 9, 65.00),
(9, '2025-01-10 17:05:00', 10, 30.00),
(17, '2025-01-19 11:55:16', 13, 20.00),
(18, '2025-01-19 11:57:58', 13, 20.00),
(19, '2025-01-19 20:09:47', 14, 20.00),
(20, '2025-01-20 12:20:03', 14, 20.00),
(21, '2025-01-20 13:24:42', 15, 20.00),
(22, '2025-01-20 13:56:56', 13, 20.00),
(23, '2025-02-11 14:33:08', 14, 20.00),
(24, '2025-02-11 18:58:57', 13, 20.00),
(25, '2025-02-11 19:02:43', 13, 20.00),
(26, '2025-02-11 19:03:56', 13, 20.00),
(27, '2025-02-12 14:16:00', 14, 20.00),
(28, '2025-02-12 14:16:19', 14, 20.00),
(29, '2025-02-12 16:36:50', 14, 20.00),
(30, '2025-02-12 16:40:16', 14, 20.00),
(31, '2025-02-12 21:42:22', 14, 20.00),
(32, '2025-02-12 21:43:23', 14, 20.00);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` double(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`order_id`, `product_id`, `quantity`, `price`) VALUES
(1, 1, 1, 1200.00),
(21, 1, 4, 199.00),
(23, 1, 1, 199.00),
(1, 2, 1, 2500.00),
(18, 2, 1, 299.00),
(19, 2, 1, 299.00),
(21, 2, 4, 299.00),
(2, 3, 2, 1500.00),
(3, 4, 1, 1800.00),
(3, 5, 1, 3000.00),
(4, 6, 1, 2000.00),
(5, 7, 2, 2200.00),
(22, 7, 6, 149.00),
(30, 7, 1, 149.00),
(6, 8, 1, 1700.00),
(28, 8, 1, 249.00),
(7, 9, 1, 1900.00),
(24, 9, 1, 299.00),
(32, 9, 1, 299.00),
(8, 10, 1, 800.00),
(20, 14, 3, 199.00),
(27, 14, 1, 199.00),
(26, 25, 1, 129.00),
(25, 26, 1, 169.00),
(29, 26, 1, 169.00),
(31, 35, 1, 249.00),
(20, 38, 2, 149.00),
(17, 39, 2, 129.00),
(17, 40, 2, 179.00),
(31, 42, 1, 199.00),
(18, 44, 1, 129.00);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int NOT NULL,
  `price` double(8,2) NOT NULL,
  `name` varchar(50) NOT NULL,
  `short_description` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `category_id` int NOT NULL,
  `available_quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `price`, `name`, `short_description`, `description`, `category_id`, `available_quantity`) VALUES
(1, 199.00, 'Silver Ring with Zirconia', 'Elegant silver ring adorned with zirconia.', 'A beautiful silver ring featuring a sparkling zirconia stone.', 1, 45),
(2, 299.00, 'Gold Ring with Diamond', 'Classic gold ring with a single diamond.', 'A timeless gold ring showcasing a brilliant diamond.', 1, 24),
(3, 179.00, 'Platinum Ring with Sapphire', 'Sophisticated platinum ring with sapphire.', 'An elegant platinum ring featuring a stunning sapphire.', 1, 25),
(4, 249.00, 'Silver Ring with Ruby', 'Silver ring adorned with a ruby gemstone.', 'A gorgeous silver ring featuring a vibrant ruby.', 1, 40),
(5, 149.00, 'Gold Ring with Topaz', 'Gold ring with a blue topaz gemstone.', 'A luxurious gold ring with a sparkling blue topaz.', 1, 45),
(6, 199.00, 'Diamond Ring in White Gold', 'Elegant white gold ring set with a diamond.', 'A refined white gold ring showcasing a dazzling diamond.', 1, 50),
(7, 149.00, 'Gold Necklace with a Pendant', 'Beautiful gold necklace with a round pendant.', 'A stunning gold necklace featuring a polished round pendant.', 2, 53),
(8, 249.00, 'Diamond Necklace', 'A diamond necklace for special occasions.', 'A sophisticated diamond necklace, perfect for formal events.', 2, 39),
(9, 299.00, 'Sapphire Necklace', 'Elegant necklace with a sapphire gemstone.', 'A refined sapphire necklace, showcasing elegance and style.', 2, 33),
(10, 129.00, 'Pearl Necklace', 'Delicate pearl necklace with gold clasp.', 'A timeless pearl necklace featuring a gold clasp.', 2, 50),
(11, 199.00, 'Silver Necklace with a Heart Pendant', 'A silver necklace with a heart-shaped pendant.', 'An elegant silver necklace showcasing a heart-shaped pendant.', 2, 60),
(12, 179.00, 'Gold Chain Necklace', 'Classic gold chain necklace.', 'A stylish gold chain necklace that pairs well with any attire.', 2, 45),
(13, 129.00, 'Silver Charm Bracelet', 'A silver bracelet with multiple charms.', 'A charming silver bracelet featuring a variety of decorative charms.', 3, 60),
(14, 199.00, 'Gold Cuff Bracelet', 'Elegant gold cuff bracelet with a polished finish.', 'A luxurious gold cuff bracelet, perfect for formal events.', 3, 31),
(15, 149.00, 'Leather Bracelet with Metal Clasp', 'Stylish leather bracelet with metal clasp.', 'A trendy leather bracelet with a stylish metal clasp.', 3, 50),
(16, 159.00, 'Silver Bangle Bracelet', 'A classic silver bangle bracelet.', 'A sleek and minimalistic silver bangle bracelet.', 3, 55),
(17, 179.00, 'Gold Bracelet with Diamonds', 'Gold bracelet featuring diamonds.', 'A luxurious gold bracelet embellished with shimmering diamonds.', 3, 40),
(18, 129.00, 'Bracelet with Turquoise', 'Charming bracelet adorned with turquoise stones.', 'A beautiful bracelet featuring natural turquoise stones.', 3, 60),
(19, 99.00, 'Silver Earrings with Zirconia', 'Simple silver earrings with zirconia stones.', 'Elegant silver earrings with shimmering zirconia stones.', 4, 60),
(20, 149.00, 'Gold Hoop Earrings', 'Gold hoop earrings with a sleek design.', 'Timeless gold hoop earrings that can be worn with any outfit.', 4, 40),
(21, 199.00, 'Diamond Stud Earrings', 'Classic diamond stud earrings.', 'Exquisite diamond stud earrings perfect for any occasion.', 4, 50),
(22, 129.00, 'Silver Drop Earrings', 'Delicate silver drop earrings.', 'Stylish silver earrings with a long drop design.', 4, 55),
(23, 169.00, 'Gold Earrings with Pearls', 'Elegant gold earrings featuring pearls.', 'Beautiful gold earrings adorned with round pearls.', 4, 45),
(24, 179.00, 'Sapphire Earrings in Gold', 'Gold earrings with sapphire gemstones.', 'Luxurious gold earrings featuring stunning sapphires.', 4, 30),
(25, 129.00, 'Silver Pendant with Ruby', 'Silver pendant with a ruby gemstone.', 'Elegant silver pendant showcasing a vibrant ruby gemstone.', 5, 49),
(26, 169.00, 'Gold Pendant with Emerald', 'Gold pendant with an emerald stone.', 'A refined gold pendant featuring a deep green emerald stone.', 5, 43),
(27, 199.00, 'Diamond Pendant in White Gold', 'White gold pendant with a diamond centerpiece.', 'A sophisticated white gold pendant set with a brilliant diamond.', 5, 40),
(28, 179.00, 'Heart-Shaped Pendant with Zirconia', 'Silver heart-shaped pendant with zirconia stones.', 'A delicate heart-shaped silver pendant, adorned with zirconia.', 5, 60),
(29, 139.00, 'Pendant with Amethyst', 'Silver pendant with a purple amethyst gemstone.', 'A graceful silver pendant featuring a stunning amethyst stone.', 5, 55),
(30, 159.00, 'Gold Pendant with Sapphire', 'Gold pendant with a sapphire gemstone.', 'A beautiful gold pendant set with a captivating sapphire gemstone.', 5, 30),
(31, 299.00, 'Men\'s Stainless Steel Watch', 'Durable stainless steel watch with a black dial.', 'A robust men\'s watch featuring a stainless steel band and black dial.', 6, 45),
(32, 349.00, 'Women\'s Gold-Plated Watch', 'Stylish gold-plated watch with a white face.', 'An elegant women\'s watch with a gold-plated band and white face.', 6, 30),
(33, 199.00, 'Silver Watch with Leather Strap', 'Sleek silver watch with a leather strap.', 'A refined silver watch featuring a comfortable leather strap.', 6, 60),
(34, 179.00, 'Men\'s Chronograph Watch', 'Sporty chronograph watch with multiple dials.', 'A sporty men\'s watch with chronograph features and a robust design.', 6, 40),
(35, 249.00, 'Women\'s Diamond Watch', 'Luxury women\'s watch with diamonds.', 'An exquisite women\'s watch featuring diamond accents.', 6, 49),
(36, 229.00, 'Stainless Steel Watch with Blue Dial', 'A men\'s stainless steel watch with a striking blue dial.', 'A stylish stainless steel watch featuring a blue dial and a robust band.', 6, 35),
(37, 99.00, 'Silver Brooch with Pearls', 'A silver brooch adorned with pearls.', 'A classic silver brooch with lustrous pearls.', 7, 60),
(38, 149.00, 'Gold Brooch with Sapphire', 'A gold brooch featuring a sapphire stone.', 'An elegant gold brooch showcasing a stunning sapphire gemstone.', 7, 43),
(39, 129.00, 'Silver Butterfly Brooch', 'Charming silver brooch in the shape of a butterfly.', 'A delicate silver brooch featuring a butterfly design.', 7, 53),
(40, 179.00, 'Gold Rose Brooch', 'Luxurious gold brooch shaped like a rose.', 'An exquisite gold brooch with a rose design.', 7, 38),
(41, 149.00, 'Diamond Brooch', 'A diamond brooch with a floral design.', 'A refined diamond brooch featuring a floral design.', 7, 50),
(42, 199.00, 'Vintage Brooch with Garnet', 'A vintage brooch featuring a garnet stone.', 'A classic vintage brooch with a captivating garnet gemstone.', 7, 29),
(43, 99.00, 'Silver Anklet with Charms', 'A delicate silver anklet with charms.', 'A charming silver anklet with multiple decorative charms.', 8, 60),
(44, 129.00, 'Gold Anklet with Diamonds', 'Gold anklet adorned with diamonds.', 'An elegant gold anklet featuring shimmering diamonds.', 8, 44),
(45, 149.00, 'Silver Anklet with Turquoise', 'Silver anklet featuring turquoise stones.', 'A beautiful silver anklet with natural turquoise stones.', 8, 50),
(46, 179.00, 'Gold Anklet with Pearls', 'A luxurious gold anklet with pearls.', 'A refined gold anklet showcasing lustrous pearls.', 8, 40),
(47, 159.00, 'Diamond Anklet in White Gold', 'White gold anklet with diamonds.', 'A sophisticated white gold anklet adorned with sparkling diamonds.', 8, 30),
(48, 189.00, 'Silver Anklet with Amethyst', 'A delicate silver anklet with amethyst stones.', 'A charming silver anklet featuring a beautiful amethyst stone.', 8, 35),
(49, 79.00, 'Silver Charm with Enamel', 'A cute silver charm with colorful enamel.', 'A playful silver charm adorned with vibrant enamel colors.', 9, 90),
(50, 129.00, 'Gold Charm with Diamonds', 'Gold charm featuring diamonds.', 'A luxurious gold charm with dazzling diamonds.', 9, 40),
(51, 99.00, 'Silver Heart Charm', 'Silver charm shaped like a heart.', 'A charming silver heart-shaped charm perfect for bracelets.', 9, 70),
(52, 149.00, 'Gold Charm with Ruby', 'Gold charm featuring a ruby stone.', 'An elegant gold charm adorned with a vibrant ruby gemstone.', 9, 50),
(53, 179.00, 'Silver Star Charm', 'A silver charm shaped like a star.', 'A sleek silver charm featuring a star design.', 9, 60),
(54, 159.00, 'Gold Moon Charm', 'Gold charm shaped like a crescent moon.', 'A beautiful gold charm with a crescent moon design.', 9, 30),
(55, 199.00, 'Silver Cufflinks with Onyx', 'Sophisticated silver cufflinks featuring onyx stones.', 'A stylish pair of silver cufflinks with black onyx stones.', 10, 55),
(56, 249.00, 'Gold Cufflinks with Mother of Pearl', 'Elegant gold cufflinks with mother of pearl inlay.', 'A refined pair of gold cufflinks featuring mother of pearl inlay.', 10, 30),
(57, 179.00, 'Silver Cufflinks with Sapphire', 'Silver cufflinks adorned with sapphire stones.', 'A stylish pair of silver cufflinks featuring stunning sapphire stones.', 10, 40),
(58, 169.00, 'Gold Cufflinks with Diamond', 'Gold cufflinks featuring a diamond inlay.', 'A sophisticated pair of gold cufflinks with diamond accents.', 10, 25),
(59, 159.00, 'Silver Cufflinks with Amethyst', 'Silver cufflinks featuring amethyst stones.', 'A refined pair of silver cufflinks adorned with amethyst stones.', 10, 50),
(60, 189.00, 'Gold Cufflinks with Emeralds', 'Elegant gold cufflinks with emerald gemstones.', 'A luxurious pair of gold cufflinks featuring stunning emerald gemstones.', 10, 35);

-- --------------------------------------------------------

--
-- Table structure for table `refresh_tokens`
--

CREATE TABLE `refresh_tokens` (
  `token_id` int NOT NULL,
  `token` varchar(800) NOT NULL,
  `expiry_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `refresh_tokens`
--

INSERT INTO `refresh_tokens` (`token_id`, `token`, `expiry_date`) VALUES
(1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Ind3MjJ6Y3h6Y3hjMkBnbWFpbC5jb20iLCJpZCI6MTEsImlzX2FkbWluIjpmYWxzZSwiaWF0IjoxNzM3MjA3MzUyLCJleHAiOjE3Mzc4MTIxNTJ9.5_fjMDtudfjG4CUegjcvlknGTINbwHrzzMPkOj3514c', '2025-01-25 13:35:52'),
(3, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InRlc3RAZ21haWwuY29tIiwiaWQiOjEyLCJpc19hZG1pbiI6ZmFsc2UsImlhdCI6MTczNzIxMTg2NywiZXhwIjoxNzM3ODE2NjY3fQ.eUcWyUZGnKVcTPZxBcx0ggApHDELedg_TqK2XQVL_ik', '2025-01-25 14:51:07'),
(18, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFkbWluZWtAb3AucGwiLCJpZCI6MTQsImlzX2FkbWluIjp0cnVlLCJpYXQiOjE3MzczMTA5ODQsImV4cCI6MTczNzkxNTc4NH0.okeVBYhlJ28pAmYKJ_eCbvVFzeoR2FSrDmucWgbLg20', '2025-01-26 18:23:04'),
(26, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNlbXBhaUBnbWFpbC5jb20iLCJpZCI6MTMsImlzX2FkbWluIjpmYWxzZSwiaWF0IjoxNzM3MzgxNDExLCJleHAiOjE3Mzc5ODYyMTF9.2UqPIJZVqDh3AYZYLX7p598qxJZ_PzrPUzcEV_LaZeA', '2025-01-27 13:56:51'),
(46, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InJld0B0ZXN0LmNvbSIsImlkIjoxNywiaXNfYWRtaW4iOmZhbHNlLCJpYXQiOjE3MzkzOTczMTMsImV4cCI6MTc0MDAwMjExM30.boMJSO2_SALFAgwBftSrjPTNH5SZ7ZohGW7OpkIILVc', '2025-02-19 21:55:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `unique_email` (`email`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `images_products` (`product_id`);

--
-- Indexes for table `opinions`
--
ALTER TABLE `opinions`
  ADD PRIMARY KEY (`opinion_id`),
  ADD KEY `opinions_customers` (`customer_id`),
  ADD KEY `opinions_products` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `orders_customers` (`customer_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`product_id`,`order_id`),
  ADD KEY `order_details_orders` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `products_categories` (`category_id`);

--
-- Indexes for table `refresh_tokens`
--
ALTER TABLE `refresh_tokens`
  ADD PRIMARY KEY (`token_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `image_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `opinions`
--
ALTER TABLE `opinions`
  MODIFY `opinion_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `refresh_tokens`
--
ALTER TABLE `refresh_tokens`
  MODIFY `token_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `opinions`
--
ALTER TABLE `opinions`
  ADD CONSTRAINT `opinions_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `opinions_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
