-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2024 at 03:03 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bityeartwo2024`
--

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `artid` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `contents` text DEFAULT NULL,
  `dateofcreation` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`artid`, `userid`, `title`, `contents`, `dateofcreation`) VALUES
(1, 1, 'Gender Equality', 'Entertainment', '2024-04-03 22:00:00'),
(2, 2, 'Gender balance', 'Politics', '2024-04-03 22:00:00'),
(3, 2, 'Education', 'Development', '2024-04-03 22:00:00'),
(4, 2, 'Education', 'Dropout', '2024-04-03 22:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `cid` int(11) NOT NULL,
  `contentid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`cid`, `contentid`, `userid`) VALUES
(1, 1, 1),
(2, 3, 2),
(3, 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE `friends` (
  `fid` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `friendid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `friends`
--

INSERT INTO `friends` (`fid`, `userid`, `friendid`) VALUES
(1, 1, 1),
(2, 3, 2),
(3, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `lid` int(11) NOT NULL,
  `contentid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`lid`, `contentid`, `userid`) VALUES
(1, 1, 1),
(2, 2, 3),
(3, 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `multimedia`
--

CREATE TABLE `multimedia` (
  `mid` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `type` enum('image','video','audio') DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `upload_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `multimedia`
--

INSERT INTO `multimedia` (`mid`, `userid`, `type`, `location`, `upload_date`) VALUES
(1, 1, 'image', 'https://example.com/images/photo1.jpg', '2024-04-03 22:00:00'),
(2, 2, 'video', 'https://example.com/videos/video1.mp4', '2024-04-04 22:00:00'),
(3, 4, 'audio', 'https://example.com/audio/song1.mp3', '2024-04-04 22:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `pid` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `Campus` varchar(100) DEFAULT NULL,
  `College` varchar(100) DEFAULT NULL,
  `School` varchar(100) DEFAULT NULL,
  `Department` varchar(100) DEFAULT NULL,
  `Level` varchar(50) DEFAULT NULL,
  `Group` varchar(50) DEFAULT NULL,
  `Regnumber` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`pid`, `userid`, `Campus`, `College`, `School`, `Department`, `Level`, `Group`, `Regnumber`) VALUES
(1, 1, 'Huye campus', 'CBE', 'Business', 'BIT', 'Level 2', 'Group b', '222014600'),
(2, 2, 'Huye Cmpus', 'CBE', 'Business', 'BIT', 'Level 2', 'Group B', '222019728');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `rid` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `rolename` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`rid`, `userid`, `rolename`) VALUES
(1, 1, 'Disign'),
(2, 1, 'Disign'),
(3, 2, 'writer'),
(4, 2, 'writer');

-- --------------------------------------------------------

--
-- Table structure for table `unlike`
--

CREATE TABLE `unlike` (
  `lid` int(11) NOT NULL,
  `contentid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `unlike`
--

INSERT INTO `unlike` (`lid`, `contentid`, `userid`) VALUES
(2, 1, 1),
(3, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `creationdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `activation_code` varchar(50) DEFAULT NULL,
  `is_activated` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `firstname`, `lastname`, `username`, `email`, `telephone`, `password`, `creationdate`, `activation_code`, `is_activated`) VALUES
(1, 'Ineza', 'Eliane', 'inezaeliane', 'inezaeliane0@gmail.com', '0786230115', '$2y$10$Hh/RCIbfk9SToTyvNMnizOgStIrCgHkQ/0ox1.yHMHxjneCBTUrNa', '2024-04-11 10:46:42', '1', 0),
(2, 'Mahoro', 'Chany', 'mahorochany', 'mahorochany@gmail.com', '0786230234', '$2y$10$wa/j4L.qlNVYvWfgP1RVBujVlLitIAFlFQXOWnuN1e8eQ4t9Cw2dm', '2024-04-11 10:49:00', '1', 0),
(3, 'Byukusenge', 'Sarah', 'sarahbyukusenge', 'byukusenge@gmail.com', '0788452273', '$2y$10$nWw9nznJ.LIGFkA846iDUeOA7n/z/594swuqw6OzUro6XEakI2nUi', '2024-04-11 10:53:53', '1', 0),
(4, 'Batamuriza', 'Phiona', 'phionabatamuriza', 'batamuriza@gmail.com', '0788452273', '$2y$10$WRLsMy/ElgF1r4VuWFlA5.aB8QD78.fMUV764ZSmiqkZFEyIAHT8W', '2024-04-11 10:54:58', '1', 0),
(5, 'Mutakwayire', 'Belyse', 'belysemutakwayire', 'belysemutakwayire@gmail.com', '0788456789', '$2y$10$W1OZsYndiLXP8YtpZstSUO/H49OcCgLM0LrV9mrXwqbxc0e1xgCYq', '2024-04-11 10:56:30', '1', 0),
(6, 'Gwizimpundu', 'Irene', 'Gwizimpunduirene', 'irenegwizimpundu@gmail.com', '0789654312', '$2y$10$aGYatijBind5gxa.r0fjxuf/ubJfbav9r7zoMKl2K6gtjmSGGNzMa', '2024-04-11 10:58:41', '1', 0),
(7, 'Ishimwe', 'Dieudonne', 'ishimwedieudone', 'ishimwe@gmail.com', '0786230234', '$2y$10$k5G5S8nnNAhC9lY0LnDAXu/7Q/YrBNA0F.9E5HgT2J2ub9I4Dv81S', '2024-04-11 11:01:03', '1', 0),
(8, 'Niyimpa ', 'Emile', 'emileniyitanga', 'emileniyitanga@gmail.com', '078835678', '$2y$10$58QHO9ogGuLBhB/kyvv1X.cjjMNddw4b158pqIEVc2gBDnZSMPk1C', '2024-04-11 11:02:50', '1', 0),
(9, 'Kamukama', 'Joyce', 'kamukamajoyce', 'joycekamukama@gmail.com', '0796523456', '$2y$10$6MBZ30GltR7PlIq.TUw9t.Wr48DCVTe73nbqswB8RSgVD3KM7sd7i', '2024-04-11 11:04:29', '1', 0),
(10, '', '', 'mweziwinner', 'mwezi@gmail.com', '0788567890', '$2y$10$iPctkAwODsd1ERtWD0u8mO/.OOCdgD9q/g8jvZub1xHUBN50EPZE.', '2024-04-11 12:56:34', '1', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`artid`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `contentid` (`contentid`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`fid`),
  ADD KEY `userid` (`userid`),
  ADD KEY `friendid` (`friendid`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`lid`),
  ADD KEY `contentid` (`contentid`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `multimedia`
--
ALTER TABLE `multimedia`
  ADD PRIMARY KEY (`mid`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`rid`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `unlike`
--
ALTER TABLE `unlike`
  ADD PRIMARY KEY (`lid`),
  ADD KEY `contentid` (`contentid`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `artid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `friends`
--
ALTER TABLE `friends`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `lid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `multimedia`
--
ALTER TABLE `multimedia`
  MODIFY `mid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `unlike`
--
ALTER TABLE `unlike`
  MODIFY `lid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`contentid`) REFERENCES `article` (`artid`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `user` (`id`);

--
-- Constraints for table `friends`
--
ALTER TABLE `friends`
  ADD CONSTRAINT `friends_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `friends_ibfk_2` FOREIGN KEY (`friendid`) REFERENCES `user` (`id`);

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`contentid`) REFERENCES `article` (`artid`),
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `user` (`id`);

--
-- Constraints for table `multimedia`
--
ALTER TABLE `multimedia`
  ADD CONSTRAINT `multimedia_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`);

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`);

--
-- Constraints for table `role`
--
ALTER TABLE `role`
  ADD CONSTRAINT `role_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`);

--
-- Constraints for table `unlike`
--
ALTER TABLE `unlike`
  ADD CONSTRAINT `unlike_ibfk_1` FOREIGN KEY (`contentid`) REFERENCES `article` (`artid`),
  ADD CONSTRAINT `unlike_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
