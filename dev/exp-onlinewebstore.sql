-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 01, 2020 at 01:45 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlinewebstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `access_types`
--

CREATE TABLE `access_types` (
  `a_type_id` int(11) NOT NULL,
  `a_type_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `access_types`
--

INSERT INTO `access_types` (`a_type_id`, `a_type_name`) VALUES
(1, 'admin'),
(2, 'normal');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(25) NOT NULL,
  `item_cat` int(11) NOT NULL,
  `item_cat_stat` int(11) NOT NULL,
  `user` varchar(13) NOT NULL,
  `price` float NOT NULL,
  `is_sold` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_id`, `item_name`, `item_cat`, `item_cat_stat`, `user`, `price`, `is_sold`) VALUES
(1, 'tecno-camon-15-pro', 1, 2, '13301284/T.17', 350000, 0),
(2, 'Fridge', 1, 1, '13301284/T.17', 450000, 0),
(3, 'SharpAquos TV', 1, 1, '13301284/T.17', 3000000, 0),
(4, 'fridge', 1, 2, '13301197/T.18', 34566, 1),
(5, 'dress shirt', 2, 3, '13301197/T.18', 15000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `item_cats`
--

CREATE TABLE `item_cats` (
  `icat_id` int(11) NOT NULL,
  `icat_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_cats`
--

INSERT INTO `item_cats` (`icat_id`, `icat_name`) VALUES
(1, 'accessories'),
(2, 'cloth');

-- --------------------------------------------------------

--
-- Table structure for table `item_cat_status`
--

CREATE TABLE `item_cat_status` (
  `icst_id` int(11) NOT NULL,
  `icst_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_cat_status`
--

INSERT INTO `item_cat_status` (`icst_id`, `icst_name`) VALUES
(1, 'new'),
(2, 'used'),
(3, 'Good Condition');

-- --------------------------------------------------------

--
-- Table structure for table `item_image`
--

CREATE TABLE `item_image` (
  `item_img_id` int(11) NOT NULL,
  `item_img_name` longtext NOT NULL,
  `item` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_image`
--

INSERT INTO `item_image` (`item_img_id`, `item_img_name`, `item`) VALUES
(1, '2020-07-29-07-42-04_5f210c2c61ae2_tecno-camon-15-pro.jpg', 1),
(2, '2020-07-30-08-31-08_5f22692c48244_fridge.jpg', 2),
(3, '2020-07-30-11-41-42_5f2295d6eccbb_SharpAquos_picture.jpg', 3),
(4, '2020-07-30-13-35-13_5f22b0711d107_fridge.jpg', 4),
(5, '2020-08-01-13-33-14_5f2552fa84a82_dress-shirt.png', 5);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` varchar(13) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `middle_name` varchar(25) DEFAULT NULL,
  `last_name` varchar(25) NOT NULL,
  `phone_on` int(13) NOT NULL,
  `email` varchar(40) NOT NULL,
  `user_img` varchar(255) DEFAULT NULL,
  `user_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `middle_name`, `last_name`, `phone_on`, `email`, `user_img`, `user_address`) VALUES
('13301197/T.18', 'josh', 'EMMA', 'thabiti', 659967106, 'corogombe990@gmail.com', NULL, 'mkubege'),
('13301284', 'Deogratias', 'R.', 'Alison', 744004897, 'deesynertz@gmail.com', NULL, 'Tangen'),
('13301284/T.17', 'Benjamini', '', 'Sanga', 747862378, 'sanga@gmail.com', NULL, 'Vikenge'),
('13304222/T.18', 'Adam', 'G', 'Chengula', 752825812, 'adam@gmail.com', NULL, 'Changarawe');

-- --------------------------------------------------------

--
-- Table structure for table `users_login`
--

CREATE TABLE `users_login` (
  `login_id` int(11) NOT NULL,
  `user_pwd` varchar(40) NOT NULL,
  `user` varchar(13) NOT NULL,
  `access_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_login`
--

INSERT INTO `users_login` (`login_id`, `user_pwd`, `user`, `access_type`) VALUES
(1, 'd033e22ae348aeb5660fc2140aec35850c4da997', '13301284', 1),
(2, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '13301284/T.17', 2),
(3, 'cdab9743b5f2f0d6e7e7877e946a4b605095c711', '13301197/T.18', 2),
(4, '7c4a8d09ca3762af61e59520943dc26494f8941b', '13304222/T.18', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_types`
--
ALTER TABLE `access_types`
  ADD PRIMARY KEY (`a_type_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `item_cats_icat_id` (`item_cat`),
  ADD KEY `item_cat_status_icst_id` (`item_cat_stat`),
  ADD KEY `item_users_user_id` (`user`);

--
-- Indexes for table `item_cats`
--
ALTER TABLE `item_cats`
  ADD PRIMARY KEY (`icat_id`);

--
-- Indexes for table `item_cat_status`
--
ALTER TABLE `item_cat_status`
  ADD PRIMARY KEY (`icst_id`);

--
-- Indexes for table `item_image`
--
ALTER TABLE `item_image`
  ADD PRIMARY KEY (`item_img_id`),
  ADD KEY `item_image_item_id` (`item`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `users_login`
--
ALTER TABLE `users_login`
  ADD PRIMARY KEY (`login_id`),
  ADD KEY `users_login_id` (`user`),
  ADD KEY `users_login_access_type` (`access_type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access_types`
--
ALTER TABLE `access_types`
  MODIFY `a_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `item_cats`
--
ALTER TABLE `item_cats`
  MODIFY `icat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `item_cat_status`
--
ALTER TABLE `item_cat_status`
  MODIFY `icst_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `item_image`
--
ALTER TABLE `item_image`
  MODIFY `item_img_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users_login`
--
ALTER TABLE `users_login`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `item_cat_status_icst_id` FOREIGN KEY (`item_cat_stat`) REFERENCES `item_cat_status` (`icst_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_cats_icat_id` FOREIGN KEY (`item_cat`) REFERENCES `item_cats` (`icat_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_users_user_id` FOREIGN KEY (`user`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `item_image`
--
ALTER TABLE `item_image`
  ADD CONSTRAINT `item_image_item_id` FOREIGN KEY (`item`) REFERENCES `items` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users_login`
--
ALTER TABLE `users_login`
  ADD CONSTRAINT `users_login_access_type` FOREIGN KEY (`access_type`) REFERENCES `access_types` (`a_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_login_id` FOREIGN KEY (`user`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
