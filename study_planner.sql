-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 29, 2026 at 10:44 AM
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
-- Database: `study_planner`
--

-- --------------------------------------------------------

--
-- Table structure for table `chapters`
--

CREATE TABLE `chapters` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `chapter_name` varchar(200) NOT NULL,
  `completion_percentage` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `master_subjects`
--

CREATE TABLE `master_subjects` (
  `id` int(11) NOT NULL,
  `subject_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `master_subjects`
--

INSERT INTO `master_subjects` (`id`, `subject_name`) VALUES
(1, 'Mathematics'),
(2, 'Physics'),
(3, 'Chemistry'),
(4, 'Biology'),
(5, 'English'),
(6, 'Hindi'),
(7, 'Marathi'),
(8, 'Computer Science'),
(9, 'Programming'),
(10, 'Artificial Intelligence'),
(11, 'Data Science'),
(12, 'Cyber Security'),
(13, 'Commerce'),
(14, 'Accountancy'),
(15, 'Business Studies'),
(16, 'Economics'),
(17, 'History'),
(18, 'Geography'),
(19, 'Political Science'),
(20, 'Psychology'),
(21, 'Mechanical Engineering'),
(22, 'Civil Engineering'),
(23, 'Electrical Engineering'),
(24, 'Electronics Engineering'),
(25, 'Medical'),
(26, 'MBA'),
(27, 'Law'),
(28, 'Aptitude'),
(29, 'Reasoning'),
(30, 'General Knowledge'),
(31, 'Current Affairs');

-- --------------------------------------------------------

--
-- Table structure for table `planner_quiz_scores`
--

CREATE TABLE `planner_quiz_scores` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject_name` varchar(255) NOT NULL,
  `topic` varchar(255) DEFAULT '',
  `score` decimal(5,2) NOT NULL,
  `total_marks` decimal(5,2) NOT NULL,
  `quiz_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `planner_task_status`
--

CREATE TABLE `planner_task_status` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `study_date` date NOT NULL,
  `subject_name` varchar(255) NOT NULL,
  `topic` varchar(255) NOT NULL,
  `status` enum('Pending','Completed') NOT NULL DEFAULT 'Pending',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `planner_task_status`
--

INSERT INTO `planner_task_status` (`id`, `user_id`, `study_date`, `subject_name`, `topic`, `status`, `updated_at`) VALUES
(1, 21, '2026-10-27', 'Java Programming', 'Core concepts', 'Completed', '2026-10-27 07:01:48'),
(2, 21, '2026-10-27', 'Data Science', 'Theory and concepts', 'Completed', '2026-10-27 06:30:39'),
(3, 22, '2026-10-27', 'Java Programming', 'Core concepts', 'Completed', '2026-10-27 07:18:19'),
(4, 22, '2026-10-27', 'SQL', 'Learn core concepts', 'Completed', '2026-10-27 07:18:24');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_results`
--

CREATE TABLE `quiz_results` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `subject` varchar(150) NOT NULL,
  `topic` varchar(255) DEFAULT '',
  `marks_obtained` decimal(8,2) NOT NULL,
  `total_marks` decimal(8,2) NOT NULL,
  `quiz_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_profile`
--

CREATE TABLE `student_profile` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `school_name` varchar(150) DEFAULT NULL,
  `class_name` varchar(50) DEFAULT NULL,
  `board` varchar(50) DEFAULT NULL,
  `target_exam` varchar(100) DEFAULT NULL,
  `exam_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_profilenew`
--

CREATE TABLE `student_profilenew` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `school_name` varchar(150) DEFAULT NULL,
  `class_name` varchar(50) DEFAULT NULL,
  `board` varchar(50) DEFAULT NULL,
  `target_exam` varchar(100) DEFAULT NULL,
  `exam_date` date DEFAULT NULL,
  `study_hours` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `medium` varchar(50) DEFAULT NULL,
  `study_time` varchar(30) DEFAULT NULL,
  `weak_subjects` text DEFAULT NULL,
  `profile_photo` varchar(255) NOT NULL,
  `session_duration` int(11) DEFAULT NULL,
  `break_duration` int(11) DEFAULT NULL,
  `target_percentage` int(11) DEFAULT NULL,
  `study_methods` text DEFAULT NULL,
  `college_name` varchar(150) DEFAULT NULL,
  `course_name` varchar(100) DEFAULT NULL,
  `course_year` varchar(30) DEFAULT NULL,
  `semester` varchar(30) DEFAULT NULL,
  `subjects_data` longtext DEFAULT NULL,
  `upcoming_exams` longtext DEFAULT NULL,
  `assignment_deadlines` longtext DEFAULT NULL,
  `revision_preference` varchar(50) DEFAULT NULL,
  `available_days` text DEFAULT NULL,
  `weekly_availability` longtext DEFAULT NULL,
  `planner_preferences` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_profilenew`
--

INSERT INTO `student_profilenew` (`id`, `user_id`, `age`, `gender`, `school_name`, `class_name`, `board`, `target_exam`, `exam_date`, `study_hours`, `created_at`, `medium`, `study_time`, `weak_subjects`, `profile_photo`, `session_duration`, `break_duration`, `target_percentage`, `study_methods`, `college_name`, `course_name`, `course_year`, `semester`, `subjects_data`, `upcoming_exams`, `assignment_deadlines`, `revision_preference`, `available_days`, `weekly_availability`, `planner_preferences`) VALUES
(1, 1, NULL, NULL, '', '', '', '', NULL, NULL, '2026-08-01 09:34:29', '', NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 3, 22, 'Female', 'KIT\'s IMER Kolhapur', 'PG', 'Other', 'Other', NULL, 5, '2026-08-01 13:53:04', 'English', 'Morning', 'Mathematics', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 5, 22, 'Female', 'KITs IMER', 'PG', 'Other', 'ese', NULL, 1, '2026-08-03 06:58:46', 'English', 'Morning', 'sOFTWARE eNGINEERING', 'uploads/profiles/user_5_1785740326.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 6, 15, 'Male', 'Anandsagar Olyampiad School', '9', 'CBSE', 'SSC', NULL, 5, '2026-08-03 07:11:21', 'English', 'Morning', 'Maths', 'uploads/profiles/user_6_1785741081.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 7, 23, 'Female', 'KIT\'s IMER Kolhapur', 'UG', 'Other', 'SSC', NULL, 5, '2026-08-03 08:14:52', 'English', 'Morning', 'Maths', 'uploads/profiles/user_7_1785744892.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 8, 50, 'Female', 'KIT\'s IMER Kolhapur', 'PG', 'Other', 'Coding', '2026-11-08', 1, '2026-08-03 08:25:21', 'English', 'Morning', 'Maths', 'uploads/profiles/user_8_1785745521.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 9, 22, 'Female', 'KIT\'s IMER Kolhapur', 'PG', 'Other', 'Programming', '2026-11-08', 5, '2026-08-04 03:41:32', 'English', 'Morning', 'Maths', 'uploads/profiles/user_9_1785814892.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 10, 22, 'Male', 'KIT\'s IMER Kolhapur', 'PG', 'CBSE', 'Coding', '2026-11-08', 1, '2026-08-24 11:30:56', 'English', 'Morning', 'Maths', 'uploads/profiles/user_10_1787571056.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 12, 24, 'Male', 'KIT\'s IMER Kolhapur', 'PG', 'Other', 'UPSC', '2026-11-08', 5, '2026-09-16 07:15:59', 'English', 'Afternoon', 'Maths', 'uploads/profiles/user_12_1789542959.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-10-25 21:03:23', NULL, 'Morning', 'Mathematics', '', 60, 10, 90, '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, '2026-10-25 21:06:45', NULL, 'Afternoon', 'sOFTWARE eNGINEERING', '', 90, 15, 100, '[\"Practice Questions\",\"Revision\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, '2026-10-25 21:09:18', NULL, 'Night', 'Mathematics', '', 90, 10, 90, '[\"Revision\",\"Mock Tests\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-10-25 21:13:40', NULL, 'Morning', '', '', 60, 10, 60, '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 17, 22, 'Female', 'Sanjay Ghodawat', 'Class 12', 'Maharashtra Board', 'HSC', '2027-04-04', 4, '2026-10-25 21:25:57', 'English', 'Evening', 'Mathematics', '../uploads/profile_photos/student_17_185b9376057d.jpg', 60, 15, 90, '[\"Reading\",\"Practice Questions\"]', 'Anandsagar Olampiad School', 'HSC Board', 'First Year', 'Semester 1', '[{\"name\":\"Computer Science\",\"marks\":90,\"knowledge\":\"Intermediate\",\"remaining\":\"Oops concept\",\"exam_date\":\"2026-11-08\"},{\"name\":\"Data Science\",\"marks\":99,\"knowledge\":\"Intermediate\",\"remaining\":\"basics\",\"exam_date\":\"2026-11-09\"}]', '[{\"name\":\"Computer Science\",\"date\":\"2026-11-08\"},{\"name\":\"Data Science\",\"date\":\"2026-11-09\"}]', '[{\"title\":\"AIML\",\"type\":\"Assignment\",\"date\":\"2026-11-04\"}]', '', '[\"Monday\",\"Tuesday\"]', '{\"Monday\":2,\"Tuesday\":2}', NULL),
(15, 19, 99, 'Female', 'Sanjay Ghodawat', 'Class 12', 'Maharashtra Board', 'HSC', '2026-11-08', 2, '2026-10-25 22:19:42', 'English', 'Evening', 'Mathematics', '../uploads/profile_photos/student_19_e32085db0f71.jpg', 60, 10, 85, '[]', 'Anandsagar Olampiad School', 'HSC Board', 'Second Year', 'Semester 3', '[{\"name\":\"Computer Science\",\"marks\":null,\"knowledge\":\"\",\"remaining\":\"fdteg\",\"exam_date\":\"\"}]', '[]', '[]', '', '[\"Monday\",\"Tuesday\"]', '{\"Monday\":2,\"Tuesday\":4}', NULL),
(16, 20, 8, 'Female', 'CIMDR Sangli', 'Master\'s', 'Shivaji University', 'MCA final year', '2026-11-08', 4, '2026-10-25 22:50:44', 'English', 'Morning', 'Mathematics', '../uploads/profile_photos/student_20_846d07374b54.jpg', 60, 15, 90, '[\"Reading\",\"Video Lectures\",\"Revision\"]', 'KIT\'s IMER Kolhapur', 'MCA', 'Second Year', 'Semester 3', '[{\"name\":\"Java Programming\",\"marks\":94,\"knowledge\":\"Intermediate\",\"remaining\":\"Oops Concept\",\"exam_date\":\"2026-11-08\"},{\"name\":\"AI ML\",\"marks\":68.78,\"knowledge\":\"Beginner\",\"remaining\":\"AI Ml Concept\",\"exam_date\":\"2026-11-09\"}]', '[{\"name\":\"Java Programming\",\"date\":\"2026-11-08\"},{\"name\":\"AI ML\",\"date\":\"2026-11-09\"}]', '[{\"title\":\"Data science\",\"type\":\"Practical\",\"date\":\"2026-11-04\"}]', 'Daily Short Revision', '[\"Monday\",\"Tuesday\",\"Wednesday\",\"Thursday\",\"Friday\",\"Saturday\"]', '{\"Monday\":2,\"Tuesday\":2,\"Wednesday\":2,\"Thursday\":2,\"Friday\":2,\"Saturday\":2}', NULL),
(17, 21, 24, 'Female', 'CIMDR Sangli', 'Master\'s', 'Shivaji University', 'MCA final year', '2026-11-08', 2, '2026-10-26 20:21:59', 'English', 'Evening', 'Mathematics', '../uploads/profile_photos/student_21_ac1c0f82329e.jpg', 60, 10, 85, '[\"Reading\",\"Practice Questions\",\"Video Lectures\"]', 'KIT\'s IMER Kolhapur', 'MCA', 'Second Year', 'Semester 3', '[{\"name\":\"Java Programming\",\"marks\":99,\"knowledge\":\"Intermediate\",\"remaining\":\"Inheritance,Encapsulation,Oops Concept\",\"exam_date\":\"2026-11-08\",\"topic_difficulty\":\"Medium\",\"topic_status\":\"In Progress\",\"topic_hours\":5,\"quiz_score\":99},{\"name\":\"Data Science\",\"marks\":90,\"knowledge\":\"Intermediate\",\"remaining\":\"Inheritance Oops Concept\",\"exam_date\":\"2026-11-08\",\"topic_difficulty\":\"Medium\",\"topic_status\":\"In Progress\",\"topic_hours\":4,\"quiz_score\":90},{\"name\":\"AI ML\",\"marks\":70,\"knowledge\":\"Intermediate\",\"remaining\":\"AI ML\",\"exam_date\":\"2026-08-10\",\"topic_difficulty\":\"Hard\",\"topic_status\":\"In Progress\",\"topic_hours\":5,\"quiz_score\":70},{\"name\":\"Cyber Security\",\"marks\":76,\"knowledge\":\"Intermediate\",\"remaining\":\"Cyber Security\",\"exam_date\":\"2026-08-11\",\"topic_difficulty\":\"Easy\",\"topic_status\":\"Not Started\",\"topic_hours\":3,\"quiz_score\":70}]', '[{\"name\":\"Java Programming\",\"date\":\"2026-11-08\"},{\"name\":\"Data Science\",\"date\":\"2026-11-08\"},{\"name\":\"AI ML\",\"date\":\"2026-08-10\"},{\"name\":\"Cyber Security\",\"date\":\"2026-08-11\"}]', '[{\"title\":\"AI ML\",\"type\":\"Assignment\",\"date\":\"2026-12-10\",\"priority\":\"Medium\",\"estimated_hours\":2}]', 'Weekly Revision', '[\"Monday\",\"Tuesday\"]', '{\"Monday\":2,\"Tuesday\":2}', '{\"preferred_start_time\":\"18:00\",\"college_hours\":6,\"other_unavailable_hours\":2,\"max_sessions_per_day\":4,\"rest_day\":\"Sunday\"}'),
(18, 22, 24, 'Female', 'CIMDR Sangli', 'Master\'s', 'Shivaji University', 'MCA final year', '2003-11-08', 2, '2026-10-27 07:15:20', 'Marathi', 'Evening', 'Mathematics', '../uploads/profile_photos/student_22_0b6e074f0098.jpg', 60, 10, 85, '[\"Reading\"]', 'KIT\'s IMER Kolhapur', 'MCA', 'Second Year', 'Semester 3', '[{\"name\":\"Java Programming\",\"marks\":99,\"knowledge\":\"\",\"remaining\":\"Oops concept\",\"exam_date\":\"2003-11-08\",\"topic_difficulty\":\"Easy\",\"topic_status\":\"In Progress\",\"topic_hours\":5,\"quiz_score\":99},{\"name\":\"SQL\",\"marks\":90,\"knowledge\":\"Intermediate\",\"remaining\":\"SQL Commands\",\"exam_date\":\"2026-08-10\",\"topic_difficulty\":\"Medium\",\"topic_status\":\"In Progress\",\"topic_hours\":3,\"quiz_score\":89.1}]', '[{\"name\":\"Java Programming\",\"date\":\"2003-11-08\"},{\"name\":\"SQL\",\"date\":\"2026-08-10\"}]', '[{\"title\":\"AI ML\",\"type\":\"Assignment\",\"date\":\"2026-08-10\",\"priority\":\"Medium\",\"estimated_hours\":83.5}]', '', '[\"Monday\",\"Tuesday\"]', '{\"Monday\":2,\"Tuesday\":4}', '{\"preferred_start_time\":\"18:00\",\"college_hours\":6,\"other_unavailable_hours\":2,\"max_sessions_per_day\":4,\"rest_day\":\"Sunday\"}');

-- --------------------------------------------------------

--
-- Table structure for table `study_goals`
--

CREATE TABLE `study_goals` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `goal_type` varchar(100) DEFAULT NULL,
  `target_percentage` decimal(5,2) DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `study_plan`
--

CREATE TABLE `study_plan` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `study_day` varchar(20) DEFAULT NULL,
  `study_hours` decimal(3,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `study_plans`
--

CREATE TABLE `study_plans` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `plan_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `subject` varchar(150) DEFAULT NULL,
  `topic` varchar(255) DEFAULT NULL,
  `activity` varchar(255) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `status` enum('pending','completed','skipped') DEFAULT 'pending',
  `ai_explanation` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `study_preferences`
--

CREATE TABLE `study_preferences` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `session_duration` int(11) DEFAULT 60,
  `break_duration` int(11) DEFAULT 10,
  `preferred_method` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `study_progress`
--

CREATE TABLE `study_progress` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `plan_date` date NOT NULL,
  `planned_tasks` int(11) DEFAULT 0,
  `completed_tasks` int(11) DEFAULT 0,
  `completion_percentage` decimal(5,2) DEFAULT 0.00,
  `study_hours` decimal(5,2) DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `study_sessions`
--

CREATE TABLE `study_sessions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `study_date` date DEFAULT NULL,
  `hours` decimal(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `subject_name` varchar(100) DEFAULT NULL,
  `priority` enum('High','Medium','Low') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `user_id`, `subject_name`, `priority`) VALUES
(1, 1, 'Mathematics', 'Medium'),
(2, 1, 'Science', 'Medium'),
(3, 1, 'English', 'Medium'),
(4, 3, 'Mathematics', 'Medium'),
(5, 3, 'Science', 'Medium'),
(6, 3, 'English', 'Medium'),
(7, 1, 'Physics', NULL),
(8, 1, 'Chemistry', NULL),
(9, 1, 'Biology', NULL),
(10, 1, 'Programming', NULL),
(11, 1, 'Computer Science', NULL),
(12, 1, 'Accountancy', NULL),
(13, 1, 'Economics', NULL),
(14, 1, 'History', NULL),
(15, 5, 'Mathematics', 'Medium'),
(16, 5, 'Science', 'Medium'),
(17, 5, 'English', 'Medium'),
(18, 6, 'Mathematics', 'Medium'),
(19, 6, 'Science', 'Medium'),
(20, 6, 'English', 'Medium'),
(21, 7, 'Mathematics', 'Medium'),
(22, 7, 'Science', 'Medium'),
(23, 7, 'English', 'Medium'),
(24, 8, 'Mathematics', 'Medium'),
(25, 8, 'Science', 'Medium'),
(26, 8, 'English', 'Medium'),
(27, 9, 'Mathematics', 'Medium'),
(28, 9, 'Science', 'Medium'),
(29, 9, 'English', 'Medium'),
(30, 10, 'Mathematics', 'Medium'),
(31, 10, 'Science', 'Medium'),
(32, 10, 'English', 'Medium'),
(33, 12, 'History', 'Medium'),
(34, 12, 'Geography', 'Medium'),
(35, 12, 'Polity', 'Medium'),
(36, 12, 'Economics', 'Medium'),
(37, 12, 'Current Affairs', 'Medium');

-- --------------------------------------------------------

--
-- Table structure for table `subject_details`
--

CREATE TABLE `subject_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject_name` varchar(150) NOT NULL,
  `current_marks` decimal(5,2) DEFAULT 0.00,
  `difficulty` enum('Easy','Medium','Difficult') DEFAULT 'Medium',
  `preparation_level` enum('Not Started','Beginner','Intermediate','Good','Excellent') DEFAULT 'Beginner',
  `priority` enum('Low','Medium','High') DEFAULT 'Medium',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subject_topics`
--

CREATE TABLE `subject_topics` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject_name` varchar(100) NOT NULL,
  `topic_name` varchar(150) NOT NULL,
  `status` enum('Not Started','In Progress','Completed') DEFAULT 'Not Started',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `syllabus_topic_progress`
--

CREATE TABLE `syllabus_topic_progress` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject_name` varchar(255) NOT NULL,
  `topic_name` varchar(500) NOT NULL,
  `is_completed` tinyint(1) NOT NULL DEFAULT 0,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `task_name` varchar(255) DEFAULT NULL,
  `task_date` date DEFAULT NULL,
  `status` enum('Pending','Completed') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `created_at`) VALUES
(1, 'Shweta Sadashiv Mali', 'shwetamali08112003@gmail.com', '$2y$10$ZgoSf3c.2GAt4Mpsdyl3H.BnAwgprUIvH7YqiVfL7t3y..Mq2Qc7y', '2026-07-31 15:20:51'),
(2, 'Shivam Sadashiv Mali', 'shivammali@gmail.com', '$2y$10$tPiQYhiaI3pCAnLcZWEX/e820..DVGsCqYMQBb61bcgGfPAuNdEx2', '2026-07-31 16:06:32'),
(3, 'Aditi Patil', 'aditi@gmail.com', '$2y$10$RAotoObg0r/jeEacXKsT5uhDqGh3QZeV8cQ7p1JHE3MKwidcjYZzG', '2026-08-01 08:03:45'),
(4, 'Aaditi Patil', 'aaditi123@gmail.com', '$2y$10$OITlWu1do/PJDAdegz.DVeZGruLn3D6B0JMoAEs2EdgJ4PjJdADDG', '2026-08-03 06:55:18'),
(5, 'Aaditi Patil', 'patilaaditi123@gmail.com', '$2y$10$EUm/eKeKmyAkN3rHj1r0Z.haZPQzGaim53SeWAJA.b2FCeQbnDaXC', '2026-08-03 06:56:14'),
(6, 'Shivam Mali', 'shivam@gmail.com', '$2y$10$IXBkpMOTOx9tSZ8fPoFixO5QFltfUR4P0FsPpxGPXrhRzX2tBB5su', '2026-08-03 07:02:43'),
(7, 'Aditya', 'aditya@gmail.com', '$2y$10$lWmy7ld1XX3ucyO7nmTwQO3jHuf2/g7WnMu.Z9m4WN1qRzPTcpYKa', '2026-08-03 08:14:11'),
(8, 'Sadashiv Mali', 'sadashiv123@gmail.com', '$2y$10$uOCniydkYgSDPdSlFC.FKend5i425hLwQVPO9bFI.HyMUnJn/uhLa', '2026-08-03 08:24:36'),
(9, 'Neha Phule', 'neha123@gmail.com', '$2y$10$uBoHrVZH.0c4Gq1/M21TOuG8c0UopAsKvvyqJ.aCRtpr2I4B5Rsam', '2026-08-04 03:40:18'),
(10, 'Shivam', 'shivam8113@gmail.com', '$2y$10$IATc2yz5RNBfJ/pBXyXJzuomrjmZy8bfTr2tRrfSXwko0DiA3rnEq', '2026-08-24 11:27:55'),
(11, 'Shweta Mali', 'smali@gmail.com', '$2y$10$wzDM7S3GNwobTjpWZxvHY.2UY.7nNb1Vafg/tneYWvHlVaj5tORTm', '2026-09-16 07:13:37'),
(12, 'Adi', 'adi@gmail.com', '$2y$10$i1uUMS1l9xWyQrFcxdklSeip6Bbl2ccCaHhGrWrYqurcTMmFvIYuO', '2026-09-16 07:14:47'),
(13, 'Vaishali Mali', 'vaishalimali@gmail.com', '$2y$10$RX0gY1URxAVgLFTzRNXJy./6Kuygd8SHIQgjD2PDZVSDGHmiBjO/S', '2026-10-22 02:03:35'),
(14, 'Aditya', 'adishw@gmail.com', '$2y$10$Zqnjk8iFI.4GNWZUO1uDAuAmzHwi/I6IjIyOk9ss2VJ/t7PbVsmh2', '2026-10-25 19:58:07'),
(15, 'Shweta Sadashiv Mali', 'shwetasmali@gmail.com', '$2y$10$khfx2lk9yG03lzqfNaG4..KMZYoWIEJPqqNn5W046wo83qTvZadri', '2026-10-25 21:08:48'),
(16, 'Shweta Sadashiv Mali', 'shwetas@gmail.com', '$2y$10$RGYe1pjjFSWsrStUHnSdN.lC.gdqaIaFVQXEl3VrIjpRBmr3xj4Ka', '2026-10-25 21:11:46'),
(17, 'A', 'a@gmail.com', '$2y$10$rt5knhf.ySrKZFp/eb9psuU0Koyhxq9ODS2M51yvpG2xzIFwpIfaW', '2026-10-25 21:14:56'),
(18, 'Neha Phule', 'nehaphule@gmail.com', '$2y$10$Ao8k8t33p0PLpMCrawTO6.oc9/iJ.UfCZDbqi6DSJUS9fLBB6O3GO', '2026-10-25 22:15:29'),
(19, 'Neha Phule', 'nehasphule@gmail.com', '$2y$10$dr.cc2ZpK/Gb4qO67zo0GOO60pV0YujnwSYqe/Gui.H4ex6xkKxXS', '2026-10-25 22:16:19'),
(20, 'Shweta_Mali', 'shwetamali@170726gmail.com', '$2y$10$8zzPFkjhG6C2T6U6dm8FhOEaP6qHaKXUnbpVJWHTRA2gD8aoE1kQq', '2026-10-25 22:45:58'),
(21, 'AA', 'Aamali@gmail.com', '$2y$10$GG7ldelQB4wQ/4D.ic/6nOFi0a.oIV1Fgfo8LXZluOvwxcKZlGSNy', '2026-10-26 20:05:25'),
(22, 'Advika', 'advika@gmail.com', '$2y$10$O2OG0FxbF61G9uN.jJhUOejCGIe4L7wD9zFXgd6pOtBMko0/m17Yq', '2026-10-27 07:11:40'),
(23, 'Vina Aware', 'vina@gmail.com', '$2y$10$QQUoSgsRufgwPNeJqU1dgeA3vHh7Hw6QMcrYR29hsuVX21P74U2n2', '2026-10-29 09:06:44');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('student','admin') DEFAULT 'student',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chapters`
--
ALTER TABLE `chapters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_subjects`
--
ALTER TABLE `master_subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `planner_quiz_scores`
--
ALTER TABLE `planner_quiz_scores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `planner_task_status`
--
ALTER TABLE `planner_task_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_task` (`user_id`,`study_date`,`subject_name`,`topic`);

--
-- Indexes for table `quiz_results`
--
ALTER TABLE `quiz_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_quiz_user` (`user_id`,`quiz_date`);

--
-- Indexes for table `student_profile`
--
ALTER TABLE `student_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `student_profilenew`
--
ALTER TABLE `student_profilenew`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `study_goals`
--
ALTER TABLE `study_goals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `study_plan`
--
ALTER TABLE `study_plan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `study_plans`
--
ALTER TABLE `study_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `study_preferences`
--
ALTER TABLE `study_preferences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `study_progress`
--
ALTER TABLE `study_progress`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `study_sessions`
--
ALTER TABLE `study_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `subject_details`
--
ALTER TABLE `subject_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject_topics`
--
ALTER TABLE `subject_topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `syllabus_topic_progress`
--
ALTER TABLE `syllabus_topic_progress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_student_topic` (`user_id`,`subject_name`,`topic_name`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chapters`
--
ALTER TABLE `chapters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `master_subjects`
--
ALTER TABLE `master_subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `planner_quiz_scores`
--
ALTER TABLE `planner_quiz_scores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `planner_task_status`
--
ALTER TABLE `planner_task_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `quiz_results`
--
ALTER TABLE `quiz_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_profile`
--
ALTER TABLE `student_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_profilenew`
--
ALTER TABLE `student_profilenew`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `study_goals`
--
ALTER TABLE `study_goals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `study_plan`
--
ALTER TABLE `study_plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `study_plans`
--
ALTER TABLE `study_plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `study_preferences`
--
ALTER TABLE `study_preferences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `study_progress`
--
ALTER TABLE `study_progress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `study_sessions`
--
ALTER TABLE `study_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `subject_details`
--
ALTER TABLE `subject_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subject_topics`
--
ALTER TABLE `subject_topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `syllabus_topic_progress`
--
ALTER TABLE `syllabus_topic_progress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `student_profile`
--
ALTER TABLE `student_profile`
  ADD CONSTRAINT `student_profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `student_profilenew`
--
ALTER TABLE `student_profilenew`
  ADD CONSTRAINT `student_profilenew_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `study_plan`
--
ALTER TABLE `study_plan`
  ADD CONSTRAINT `study_plan_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `study_plan_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`);

--
-- Constraints for table `study_sessions`
--
ALTER TABLE `study_sessions`
  ADD CONSTRAINT `study_sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
