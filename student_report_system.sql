-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 21, 2024 at 08:00 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student_report_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `degrees`
--

CREATE TABLE `degrees` (
  `id` int(11) NOT NULL,
  `degree_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `degrees`
--

INSERT INTO `degrees` (`id`, `degree_name`) VALUES
(1, 'Bsc information Technology specialized in doing nothing'),
(2, 'Msc Information Technology specialized in Nothing');

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `grade` varchar(2) DEFAULT NULL,
  `mid_marks` varchar(5) DEFAULT 'N/A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`id`, `student_id`, `module_id`, `grade`, `mid_marks`) VALUES
(15, 4, 4, 'A+', 'N/A'),
(16, 4, 1, 'D+', 'N/A'),
(17, 4, 2, 'B', 'N/A'),
(18, 4, 5, 'B', 'N/A'),
(26, 4, 12, 'A+', '19'),
(27, 4, 11, 'C+', 'N/A');

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(11) NOT NULL,
  `module_name` varchar(100) NOT NULL,
  `module_code` varchar(50) NOT NULL,
  `degree_id` int(11) DEFAULT NULL,
  `year` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `credits` int(11) NOT NULL DEFAULT 4
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `module_name`, `module_code`, `degree_id`, `year`, `semester`, `credits`) VALUES
(1, 'Y1S2-Module2', 'Y1S2M2', 1, 1, 2, 4),
(2, 'Y1S2-Module1', 'Y1S2M1', 1, 1, 2, 4),
(3, 'Advanced Gaming', 'AGMG', 2, 1, 1, 4),
(4, 'Y1S1-Module1', 'Y1S1M1', 1, 1, 1, 4),
(5, 'Y1S1-Module2', 'Y1S1M2', 1, 1, 1, 4),
(11, 'Y2S1-Module1', 'Y2S1M1', 1, 2, 1, 4),
(12, 'Y2S1-Module2', 'Y2S1M2', 1, 2, 1, 4),
(14, 'Y2S2-Module1', 'Y2S2M1', 1, 2, 2, 4),
(15, 'Y2S2-Module2', 'Y2S2M2', 1, 2, 2, 4),
(16, 'Y3S1-Module1', 'Y3S1M1', 1, 3, 1, 4),
(17, 'Y3S1-Module2', 'Y3S1M2', 1, 3, 1, 4),
(18, 'Y3S2-Module1', 'Y3S2M1', 1, 3, 2, 4),
(19, 'Y3S2-Module2', 'Y3S2M2', 1, 3, 2, 4),
(20, 'Y4S1-Module1', 'Y4S1M1', 1, 4, 1, 4),
(21, 'Y4S1-Module2', 'Y4S1M2', 1, 4, 1, 4),
(22, 'Y4S2-Module1', 'Y4S2M1', 1, 4, 2, 4),
(24, 'Y4S2-Module2', 'Y4S2M2', 1, 4, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `degree_id` int(11) DEFAULT NULL,
  `enroll_year` int(11) DEFAULT NULL,
  `current_semester` int(11) DEFAULT NULL,
  `student_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `user_id`, `degree_id`, `enroll_year`, `current_semester`, `student_name`) VALUES
(4, 7, 1, 2, 2, 'student5');

-- --------------------------------------------------------

--
-- Table structure for table `student_modules`
--

CREATE TABLE `student_modules` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `year` int(11) NOT NULL,
  `semester` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_modules`
--

INSERT INTO `student_modules` (`id`, `student_id`, `module_id`, `year`, `semester`) VALUES
(26, 4, 1, 1, 2),
(27, 4, 2, 1, 2),
(28, 4, 4, 1, 1),
(29, 4, 5, 1, 1),
(30, 4, 11, 2, 1),
(31, 4, 12, 2, 1),
(32, 4, 14, 2, 2),
(33, 4, 15, 2, 2),
(34, 4, 16, 3, 1),
(35, 4, 17, 3, 1),
(36, 4, 18, 3, 2),
(37, 4, 19, 3, 2),
(38, 4, 20, 4, 1),
(39, 4, 21, 4, 1),
(40, 4, 22, 4, 2),
(41, 4, 24, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('teacher','student') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`) VALUES
(1, 'student1', '$2y$10$Q3a5J9tiNQzNxLXk2oWzyOoszDaeyb8RlXic7z1D/QR4andtNgSSG', 'student'),
(2, 'student2', '$2y$10$cpFIsAtldC3b42RevJOLJu7sp7QZOiNnXY5e9Set2IiGK34nsfO72', 'student'),
(3, 'test', '$2y$10$HvUIBgmtXFF6Imvb6hm.guVcFdiwWCqrzPzJ4uFbQFgjdTVZuwZEy', 'teacher'),
(4, 'test', '$2y$10$6r5v1jmyPLLXjys4ADK6s.IuceHAedmaOvkI6nkxS6q8yUiC07iqi', 'student'),
(5, 'student3', '$2y$10$fRLLVe6fQHJ6c1qMDR0l9OmkLmXdIR344Hi69IbqFi2d6moaFrmCW', 'student'),
(6, 'student4', '$2y$10$2cokjqQv5xMUCVshhaCDVuek.C0wVk28R4PixOPkD6lyK5UKtCtcW', 'student'),
(7, 'student5', '$2y$10$8ZBDI3alx71OZjIynjIqp.yLvVAWdmeCtI7IrCCF99dzLmEBjzMn6', 'student');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `degrees`
--
ALTER TABLE `degrees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `module_id` (`module_id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `degree_id` (`degree_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `degree_id` (`degree_id`);

--
-- Indexes for table `student_modules`
--
ALTER TABLE `student_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `module_id` (`module_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `degrees`
--
ALTER TABLE `degrees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `student_modules`
--
ALTER TABLE `student_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `grades_ibfk_2` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `modules`
--
ALTER TABLE `modules`
  ADD CONSTRAINT `modules_ibfk_1` FOREIGN KEY (`degree_id`) REFERENCES `degrees` (`id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `students_ibfk_2` FOREIGN KEY (`degree_id`) REFERENCES `degrees` (`id`);

--
-- Constraints for table `student_modules`
--
ALTER TABLE `student_modules`
  ADD CONSTRAINT `student_modules_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `student_modules_ibfk_2` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
