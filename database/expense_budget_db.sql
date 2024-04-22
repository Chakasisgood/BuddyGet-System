-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2024 at 11:21 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `expense_budget_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `balance` float NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `description`, `status`, `balance`, `date_created`, `date_updated`) VALUES
(7, 'Groceries', '&lt;p&gt;&lt;span style=&quot;color: rgb(13, 13, 13); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; white-space-collapse: preserve;&quot;&gt;Purchasing food items such as fruits, vegetables, meats, dairy products, grains, and beverages.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, 2000, '2024-04-22 14:44:59', '2024-04-22 14:53:02'),
(8, 'Transportation', '&lt;p&gt;&lt;span style=&quot;color: rgb(13, 13, 13); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; white-space-collapse: preserve;&quot;&gt;Costs associated with commuting to work or school, including fuel for vehicles, public transportation fares, parking fees, tolls, or rideshare services.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, 450, '2024-04-22 14:45:50', '2024-04-22 14:53:53'),
(9, 'Meals and Snacks', '&lt;p&gt;&lt;span style=&quot;color: rgb(13, 13, 13); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; white-space-collapse: preserve;&quot;&gt;Buying breakfast, lunch, dinner, or snacks throughout the day, whether dining out, ordering takeout, or grabbing a quick bite.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, 900, '2024-04-22 14:46:28', '2024-04-22 14:54:35'),
(10, 'Utilities', '&lt;p&gt;&lt;span style=&quot;color: rgb(13, 13, 13); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; white-space-collapse: preserve;&quot;&gt;Paying for essential services like electricity, water, gas, and heating or cooling for your home.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, 500, '2024-04-22 14:46:49', '2024-04-22 14:51:51'),
(11, 'Rent', '&lt;p&gt;&lt;span style=&quot;color: rgb(13, 13, 13); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; white-space-collapse: preserve;&quot;&gt;Monthly payments for housing, whether renting an apartment or paying off a mortgage for a home.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, 2500, '2024-04-22 14:47:07', '2024-04-22 14:52:16'),
(12, 'Personal Care Products', '&lt;p&gt;&lt;span style=&quot;color: rgb(13, 13, 13); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; white-space-collapse: preserve;&quot;&gt;Buying toiletries, grooming supplies, hygiene products, and over-the-counter medications.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, 1000, '2024-04-22 14:47:52', '2024-04-22 14:52:26'),
(13, 'Entertainment', '&lt;p&gt;&lt;span style=&quot;color: rgb(13, 13, 13); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; white-space-collapse: preserve;&quot;&gt;Expenses related to leisure activities and entertainment, including movie tickets, streaming subscriptions, video games, books, or outings to restaurants and cafes.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, 500, '2024-04-22 14:48:33', '2024-04-22 14:51:39'),
(14, 'Communication Services', '&lt;p&gt;&lt;span style=&quot;color: rgb(13, 13, 13); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; white-space-collapse: preserve;&quot;&gt;Paying for phone plans, internet access, cable or satellite television, and other communication services.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, 500, '2024-04-22 14:49:14', '2024-04-22 14:53:13'),
(15, 'Household Supplies', '&lt;p&gt;&lt;span style=&quot;color: rgb(13, 13, 13); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; white-space-collapse: preserve;&quot;&gt;Purchasing cleaning products, laundry detergent, paper towels, toilet paper, and other household essentials.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, 500, '2024-04-22 14:49:47', '2024-04-22 17:20:29');

-- --------------------------------------------------------

--
-- Table structure for table `running_balance`
--

CREATE TABLE `running_balance` (
  `id` int(30) NOT NULL,
  `balance_type` tinyint(1) NOT NULL COMMENT '1=budget, 2=expense',
  `category_id` int(30) NOT NULL,
  `amount` float NOT NULL,
  `remarks` text NOT NULL,
  `user_id` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `running_balance`
--

INSERT INTO `running_balance` (`id`, `balance_type`, `category_id`, `amount`, `remarks`, `user_id`, `date_created`, `date_updated`) VALUES
(24, 1, 13, 500, '', '1', '2024-04-22 14:51:39', NULL),
(25, 1, 10, 500, '', '1', '2024-04-22 14:51:51', NULL),
(26, 1, 8, 500, '', '1', '2024-04-22 14:52:04', NULL),
(27, 1, 11, 2500, '', '1', '2024-04-22 14:52:16', NULL),
(28, 1, 12, 1000, '', '1', '2024-04-22 14:52:26', NULL),
(29, 1, 9, 1000, '', '1', '2024-04-22 14:52:43', NULL),
(30, 1, 15, 1000, '', '1', '2024-04-22 14:52:51', NULL),
(31, 1, 7, 2000, '', '1', '2024-04-22 14:53:02', NULL),
(32, 1, 14, 500, '', '1', '2024-04-22 14:53:13', NULL),
(33, 2, 8, 50, '&lt;p&gt;I spend 50 pesos this day.&lt;/p&gt;', '1', '2024-04-22 14:53:53', NULL),
(34, 2, 9, 100, '&lt;p&gt;I spend 100 pesos for my lunch.&lt;/p&gt;', '1', '2024-04-22 14:54:35', NULL),
(35, 2, 15, 500, '&lt;p&gt;I spend 500 pesos for house products.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '1', '2024-04-22 17:20:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'BuddyGet: Saving Managment System'),
(6, 'short_name', 'BuddyGet'),
(11, 'logo', 'uploads/1627606920_modeylogo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'Arian', '0192023a7bbd73250516f069df18b500', 'uploads/1713767700_taytay.jpg', NULL, 1, '2021-01-20 14:02:37', '2024-04-22 16:06:12'),
(12, 'Nana', 'Qt', 'Nana', '7568036e75d2c86a5d3c1f999d7f0d1e', NULL, NULL, 0, '2024-04-22 16:40:29', '2024-04-22 16:53:16'),
(13, '', '', 'QtNana', '2a1466bbf85e4fb9809f046dc1cdf862', NULL, NULL, 0, '2024-04-22 16:45:30', NULL),
(14, '', '', 'Zilong', '85f5f7650696fac2133c6934498211b2', NULL, NULL, 0, '2024-04-22 16:51:52', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `running_balance`
--
ALTER TABLE `running_balance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `running_balance`
--
ALTER TABLE `running_balance`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `running_balance`
--
ALTER TABLE `running_balance`
  ADD CONSTRAINT `running_balance_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
