-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 30, 2025 at 06:57 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Project 6`
--

-- --------------------------------------------------------

--
-- Table structure for table `ASSIGNMENT`
--

CREATE TABLE `ASSIGNMENT` (
  `AssignmentID` int(11) NOT NULL,
  `VolunteerID` int(11) NOT NULL,
  `TaskID` int(11) NOT NULL,
  `StartDate` date NOT NULL,
  `Status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ASSIGNMENT`
--

INSERT INTO `ASSIGNMENT` (`AssignmentID`, `VolunteerID`, `TaskID`, `StartDate`, `Status`) VALUES
(1, 1, 3, '2025-03-01', 'Completed'),
(2, 2, 2, '2025-03-05', 'In Progress'),
(3, 3, 1, '2025-03-10', 'Assigned'),
(4, 4, 5, '2025-03-12', 'Completed'),
(5, 5, 4, '2025-03-15', 'Assigned'),
(6, 6, 6, '2025-03-16', 'Assigned'),
(7, 7, 2, '2025-03-17', 'Completed'),
(8, 8, 3, '2025-03-17', 'In Progress'),
(9, 9, 5, '2025-03-18', 'Assigned'),
(10, 10, 1, '2025-03-19', 'Assigned');

-- --------------------------------------------------------

--
-- Table structure for table `INVENTORY_LOG`
--

CREATE TABLE `INVENTORY_LOG` (
  `LogID` int(11) NOT NULL,
  `SupplyID` int(11) NOT NULL,
  `DateLogged` date NOT NULL,
  `TimeLogged` time NOT NULL,
  `ActionType` varchar(30) NOT NULL,
  `AmountChanged` int(11) NOT NULL,
  `Notes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `INVENTORY_LOG`
--

INSERT INTO `INVENTORY_LOG` (`LogID`, `SupplyID`, `DateLogged`, `TimeLogged`, `ActionType`, `AmountChanged`, `Notes`) VALUES
(1, 1, '2025-03-24', '07:45:00', 'Deployment', -50, 'Trauma kits sent to Tornado Zone A'),
(2, 2, '2025-03-25', '11:30:00', 'Restock', 200, 'MREs delivered by FEMA Truck 12'),
(3, 3, '2025-03-25', '15:00:00', 'Deployment', -100, 'Sleeping bags issued at Emergency Shelter 3'),
(4, 5, '2025-03-26', '18:10:00', 'Restock', 60, 'Solar lanterns received from Logistics Center'),
(5, 4, '2025-03-27', '09:00:00', 'Damage Loss', -10, 'Water units damaged in transit, removed from count');

-- --------------------------------------------------------

--
-- Table structure for table `SKILLS`
--

CREATE TABLE `SKILLS` (
  `SkillID` int(11) NOT NULL,
  `SkillName` varchar(50) NOT NULL COMMENT 'First Aid, Shelter, Support, and etc.',
  `Description` text NOT NULL COMMENT 'Basic emergency support and etc.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `SKILLS`
--

INSERT INTO `SKILLS` (`SkillID`, `SkillName`, `Description`) VALUES
(1, 'First Aid & CPR', 'Provides basic first aid and CPR in emergency situations.'),
(2, 'Search and Rescue', 'Assists in locating and retrieving individuals from danger zones.'),
(3, 'Shelter Operations', 'Helps manage and support temporary shelters for displaced people.'),
(4, 'Logistics and Supply Chain', 'Coordinates distribution of food, water, and supplies.'),
(5, 'Damage Assessment', 'Evaluates structural and environmental damage post-disaster.');

-- --------------------------------------------------------

--
-- Table structure for table `SUPPLIES`
--

CREATE TABLE `SUPPLIES` (
  `SupplyID` int(11) NOT NULL,
  `SupplyName` varchar(100) NOT NULL,
  `Category` varchar(50) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `StorageInfo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `SUPPLIES`
--

INSERT INTO `SUPPLIES` (`SupplyID`, `SupplyName`, `Category`, `Quantity`, `StorageInfo`) VALUES
(1, 'Trauma First Aid Kits', 'Medical', 120, 'Mobile Med Unit A (Climate Controlled)'),
(2, 'MREs (Meals Ready-to-Eat)', 'Food', 600, 'Warehouse 3 - Shelf B2'),
(3, 'Thermal Sleeping Bags', 'Shelter', 250, 'Truck 4 Storage Compartment'),
(4, 'Water Purification Units', 'Sanitation', 40, 'Storage Pod 12 - Near Field Site'),
(5, 'Solar-Powered Lanterns', 'Emergency Gear', 90, 'Supply Tent E (Emergency Lighting)');

-- --------------------------------------------------------

--
-- Table structure for table `TASKS`
--

CREATE TABLE `TASKS` (
  `TaskID` int(11) NOT NULL,
  `TaskName` varchar(100) NOT NULL,
  `Description` text NOT NULL,
  `SkillID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `TASKS`
--

INSERT INTO `TASKS` (`TaskID`, `TaskName`, `Description`, `SkillID`) VALUES
(1, 'Medical Triage', 'Provide immediate assessment and basic care to injured individuals.', 1),
(2, 'Evacuation Assistance', 'Help transport and guide people out of danger zones.', 2),
(3, 'Shelter Setup', 'Assemble and prepare emergency shelters for displaced families.', 3),
(4, 'Supply Coordination', 'Organize and distribute food, water, and aid supplies.', 4),
(5, 'Site Damage Survey', 'Inspect buildings and infrastructure to assess disaster impact.', 5),
(6, 'On-Site Check-In', 'Assist volunteers and victims with arrival, registration, and information', 4);

-- --------------------------------------------------------

--
-- Table structure for table `VOLUNTEERS`
--

CREATE TABLE `VOLUNTEERS` (
  `VolunteerID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `FEMA_Training` tinyint(1) NOT NULL COMMENT '0 or 1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `VOLUNTEERS`
--

INSERT INTO `VOLUNTEERS` (`VolunteerID`, `FirstName`, `LastName`, `Email`, `Phone`, `FEMA_Training`) VALUES
(1, 'Sarah', 'Lopez', 'sarahlopez@gmail.com', '617-555-1123', 1),
(2, 'Mark', 'Reyes', 'markreyes@gmail.com', '774-535-3544', 0),
(3, 'James', 'King', 'jamesking@gmail.com', '857-514-1566', 1),
(4, 'Linda', 'Chen', 'lindachen@gmail.com', '469-222-7852', 1),
(5, 'Robert', 'Patel', 'robertpatel@gmail.com', '737-923-8881', 1),
(6, 'Angela', 'Rodriguez', 'arodriguez@gmail.com', '832-111-2233', 1),
(7, 'Tom', 'Lee', 'tomlee@gmail.com', '210-333-4567', 0),
(8, 'Nina', 'Martinez', 'ninamartinez@gmail.com', '737-555-6744', 1),
(9, 'Kevin', 'Turner', 'kevinturner@gmail.com', '469-778-9922', 1),
(10, 'Diana', 'Nguyen', 'diananguyen@gmail.com', '512-112-7890', 0);

-- --------------------------------------------------------

--
-- Table structure for table `VOLUNTEER_SKILLS`
--

CREATE TABLE `VOLUNTEER_SKILLS` (
  `VolunteerID` int(11) NOT NULL,
  `SkillID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `VOLUNTEER_SKILLS`
--

INSERT INTO `VOLUNTEER_SKILLS` (`VolunteerID`, `SkillID`) VALUES
(1, 1),
(1, 3),
(2, 2),
(3, 1),
(4, 5),
(5, 2),
(6, 1),
(6, 4),
(7, 4),
(8, 3),
(9, 5),
(10, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ASSIGNMENT`
--
ALTER TABLE `ASSIGNMENT`
  ADD PRIMARY KEY (`AssignmentID`),
  ADD KEY `fk_Assignment_Volunteer` (`VolunteerID`),
  ADD KEY `fk_Assignment_Task` (`TaskID`);

--
-- Indexes for table `INVENTORY_LOG`
--
ALTER TABLE `INVENTORY_LOG`
  ADD PRIMARY KEY (`LogID`),
  ADD KEY `fk_Inventory_Supply` (`SupplyID`);

--
-- Indexes for table `SKILLS`
--
ALTER TABLE `SKILLS`
  ADD PRIMARY KEY (`SkillID`);

--
-- Indexes for table `SUPPLIES`
--
ALTER TABLE `SUPPLIES`
  ADD PRIMARY KEY (`SupplyID`);

--
-- Indexes for table `TASKS`
--
ALTER TABLE `TASKS`
  ADD PRIMARY KEY (`TaskID`),
  ADD KEY `SkillID` (`SkillID`);

--
-- Indexes for table `VOLUNTEERS`
--
ALTER TABLE `VOLUNTEERS`
  ADD PRIMARY KEY (`VolunteerID`),
  ADD UNIQUE KEY `unique_email` (`Email`);

--
-- Indexes for table `VOLUNTEER_SKILLS`
--
ALTER TABLE `VOLUNTEER_SKILLS`
  ADD KEY `VolunteerID` (`VolunteerID`),
  ADD KEY `SkillID` (`SkillID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ASSIGNMENT`
--
ALTER TABLE `ASSIGNMENT`
  MODIFY `AssignmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `INVENTORY_LOG`
--
ALTER TABLE `INVENTORY_LOG`
  MODIFY `LogID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `SKILLS`
--
ALTER TABLE `SKILLS`
  MODIFY `SkillID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `SUPPLIES`
--
ALTER TABLE `SUPPLIES`
  MODIFY `SupplyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `TASKS`
--
ALTER TABLE `TASKS`
  MODIFY `TaskID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `VOLUNTEERS`
--
ALTER TABLE `VOLUNTEERS`
  MODIFY `VolunteerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ASSIGNMENT`
--
ALTER TABLE `ASSIGNMENT`
  ADD CONSTRAINT `fk_Assignment_Task` FOREIGN KEY (`TaskID`) REFERENCES `TASKS` (`TaskID`),
  ADD CONSTRAINT `fk_Assignment_Volunteer` FOREIGN KEY (`VolunteerID`) REFERENCES `VOLUNTEERS` (`VolunteerID`);

--
-- Constraints for table `INVENTORY_LOG`
--
ALTER TABLE `INVENTORY_LOG`
  ADD CONSTRAINT `fk_Inventory_Supply` FOREIGN KEY (`SupplyID`) REFERENCES `SUPPLIES` (`SupplyID`);

--
-- Constraints for table `TASKS`
--
ALTER TABLE `TASKS`
  ADD CONSTRAINT `fk_Task_Skill` FOREIGN KEY (`SkillID`) REFERENCES `SKILLS` (`SkillID`);

--
-- Constraints for table `VOLUNTEER_SKILLS`
--
ALTER TABLE `VOLUNTEER_SKILLS`
  ADD CONSTRAINT `fk_VolunteerSkill_Skill` FOREIGN KEY (`SkillID`) REFERENCES `SKILLS` (`SkillID`),
  ADD CONSTRAINT `fk_VolunteerSkill_Volunteer` FOREIGN KEY (`VolunteerID`) REFERENCES `VOLUNTEERS` (`VolunteerID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
