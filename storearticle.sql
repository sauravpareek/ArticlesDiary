-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2019 at 12:56 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `storearticle`
--

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `articletext` text,
  `catname` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`id`, `articletext`, `catname`, `date`, `title`) VALUES
(22, 'The Story of My Experiments with Truth is the autobiography of Mohandas K. Gandhi, covering his life from early childhood through to 1921. It was written in weekly installments and published in his journal Navjivan from 1925 to 1929. Its English translation also appeared in installments in his other journal Young India.[1] It was initiated at the insistence of Swami Anand and other close co-workers of Gandhi, who encouraged him to explain the background of his public campaigns. In 1999, the book was designated as one of the "100 Best Spiritual Books of the 20th Century" by a committee of global spiritual and religious authorities.[2]', 'novel', '2019-07-14', 'MY EXPERIMENTS WITH TRUTHS'),
(25, 'Biotechnology (commonly abbreviated as biotech) is the broad area of biology involving living systems and organisms to develop or make products, or "any technological application that uses biological systems, living organisms, or derivatives thereof, to make or modify products or processes for specific use" (UN Convention on Biological Diversity, Art. 2).[1] Depending on the tools and applications, it often overlaps with the (related) fields of molecular biology, bio-engineering, biomedical engineering, biomanufacturing, molecular engineering, etc.\r\n\r\nFor thousands of years, humankind has used biotechnology in agriculture, food production, and medicine.[2] The term is largely believed to have been coined in 1919 by Hungarian engineer Károly Ereky. In the late 20th and early 21st centuries, biotechnology has expanded to include new and diverse sciences such as genomics, recombinant gene techniques, applied immunology, and development of pharmaceutical therapies and diagnostic tests.[2]', 'novel', '2019-07-14', 'biogases'),
(34, 'hello everyone...', 'novel', '2019-07-14', 'Hello Gentlmen'),
(58, 'adsfjadfkjknjej ', 'comics', '2019-07-14', 'Hello Brother'),
(59, 'There  was   a monnk....n', 'novel', '2019-07-14', 'MONK WHO SOLD HIS FERRARI'),
(61, 'didfidsgoggfdff', 'technology', '2019-07-14', 'Artificial Neural Network for prediction of Breast Cancer'),
(62, 'hello all welcome to cyberwar', 'cyber', '2019-07-14', 'hello cyber');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'novel'),
(2, 'comics'),
(17, 'Non-Fiction'),
(18, 'Fiction'),
(26, 'technology'),
(27, 'cyber');

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE `signup` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `signup`
--

INSERT INTO `signup` (`id`, `email`, `password`) VALUES
(32, 'sarjeetsingh037@gmail.com', 'Abcdef02051997@'),
(33, 'sauravpareek05@gmail.com', 'Abcdef02051997@'),
(34, 'sauravpareek97@gmail.com', 'Ramgopal02@'),
(35, 'admin@cdac.in', 'Sauravpareek02@'),
(36, 'hello@g.com', 'Adminn@12345');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `signup`
--
ALTER TABLE `signup`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `signup`
--
ALTER TABLE `signup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
