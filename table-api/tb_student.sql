-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2021 at 03:54 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_android`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_student`
--

CREATE TABLE `tb_student` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_student`
--

INSERT INTO `tb_student` (`id`, `name`, `age`, `email`, `phone`) VALUES
(1, 'Leo Reynolds', 32, 'leo.reynolds@email.com', '081565412003'),
(2, 'Lynn Moran', 19, 'lynn.moran@email', '081992312885'),
(3, 'Wendell Meyers', 56, 'wendell.meyers@email.com', '081234480120'),
(4, 'Bruce Odom', 37, 'bruce.odom@email.com', '085661204339'),
(5, 'Foster Drake', 40, 'foster.drake@email.com', '081902377564'),
(6, 'Palmer Watson', 29, 'palmer.watson@email.com', '085761200438'),
(7, 'Bennett Grant', 42, 'bennet.grant@email.com', '086554720331'),
(8, 'Fleming Baker', 31, 'fleming.baker@email.com', '085667631004'),
(9, 'Lennie Dickerson', 25, 'lennie.dickerson@email.com', '087654490225'),
(10, 'Rene Jacobs', 22, 'rene.jacobs@email.com', '089092237820'),
(11, 'Roger Patrick', 35, 'roger.patrick', '085761390559'),
(12, 'Thornton Howell', 51, 'thornton.howell@email.com', '086542048550'),
(13, 'Palmer Hunter', 47, 'palmer.hunter@email.com', '087672230120'),
(14, 'Lilian Stark', 12, 'lilian.stark@email.com', '089382204559'),
(15, 'Katy Conway', 30, 'katy.conway@email.com', '086754310440'),
(16, 'Quincy Bauer', 21, 'quincy.bauer@email.com', '087641209330'),
(17, 'Evelyn Sutton', 33, 'evelyn.sutton@email.com', '082352204775'),
(18, 'Stanford Greer', 51, 'standord.greer@email.com', '087632144770'),
(19, 'Wayne Ballard', 34, 'wayne.ballard@email.com', '083435321880'),
(20, 'Stanley Small', 35, 'stanley.small@email.com', '081553320576');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_student`
--
ALTER TABLE `tb_student`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_student`
--
ALTER TABLE `tb_student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
