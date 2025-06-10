

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qcd`
--

-- --------------------------------------------------------

--
-- Table structure for table `assigned_to`
--

CREATE TABLE `assigned_to` (
  `Patient_no` char(6) NOT NULL,
  `Room_no` char(3) DEFAULT NULL,
  `Staff_ID` char(6) NOT NULL,
  `Patient_condition` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `assigned_to`
--

INSERT INTO `assigned_to` (`Patient_no`, `Room_no`, `Staff_ID`, `Patient_condition`) VALUES
('PAT001', '101', 'STA001', 'Normal'),
('PAT002', '101', 'STA002', 'Normal'),
('PAT003', '200', 'STA003', 'Serious'),
('PAT004', '308', 'STA003', 'Serious'),
('PAT005', '102', 'STA003', 'Serious'),
('PAT006', '405', 'STA005', 'Normal'),
('PAT007', '407', 'STA006', 'Normal'),
('PAT008', '103', 'STA007', 'Serious'),
('PAT009', '102', 'STA004', 'Serious'),
('PAT010', '308', 'STA002', 'Serious'),
('PAT011', '509', 'STA005', 'Normal');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `Doctor_ID` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`Doctor_ID`) VALUES
('DOC001'),
('DOC002'),
('DOC003'),
('DOC004'),
('DOC005');

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `Manager_ID` char(6) NOT NULL,
  `Doctor_ID` char(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`Manager_ID`, `Doctor_ID`) VALUES
('MAN002', NULL),
('MAN003', NULL),
('MAN004', NULL),
('MAN005', NULL),
('MAN001', 'DOC001');

-- --------------------------------------------------------

--
-- Table structure for table `medication`
--

CREATE TABLE `medication` (
  `Unique_code` char(7) NOT NULL,
  `Med_name` varchar(30) DEFAULT NULL,
  `Effect` varchar(100) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  `Expiration_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medication`
--

INSERT INTO `medication` (`Unique_code`, `Med_name`, `Effect`, `Price`, `Expiration_Date`) VALUES
('MED0001', 'Bromhexin hydroclorid', 'cough', 2000, '2022-10-20'),
('MED0002', 'Paracetamol', 'fever, headache', 3000, '2022-11-08'),
('MED0003', 'Terpin Codein', 'cough', 1000, '2022-10-02'),
('MED0004', 'Esphelaran', 'constipation', 3000, '2022-10-20'),
('MED0005', 'Mythyl Orange', 'cold', 2500, '2022-12-22');

-- --------------------------------------------------------

--
-- Table structure for table `normal_symptom`
--

CREATE TABLE `normal_symptom` (
  `Patient_no` char(6) NOT NULL,
  `Normal_symptoms` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `normal_symptom`
--

INSERT INTO `normal_symptom` (`Patient_no`, `Normal_symptoms`) VALUES
('PAT001', 'dry cough'),
('PAT001', 'loss of smell'),
('PAT001', 'tiredness'),
('PAT002', 'cough'),
('PAT002', 'fever'),
('PAT003', 'discolouration of fingers'),
('PAT003', 'sore throat'),
('PAT004', 'aches and pains'),
('PAT004', 'conjunctivitis'),
('PAT004', 'diarrhoea'),
('PAT005', 'cough'),
('PAT005', 'loss of taste'),
('PAT006', 'discolouration of toes'),
('PAT007', 'fever'),
('PAT007', 'sore throat'),
('PAT008', 'fever'),
('PAT008', 'loss of smell'),
('PAT008', 'tiredness'),
('PAT009', 'cough'),
('PAT009', 'discolouration of fingers'),
('PAT009', 'headache'),
('PAT010', 'discolouration of toes'),
('PAT010', 'fever'),
('PAT010', 'rash on skin'),
('PAT011', 'dry cough'),
('PAT011', 'headache'),
('PAT011', 'sore throat'),
('PAT011', 'tiredness');

-- --------------------------------------------------------

--
-- Table structure for table `nurse`
--

CREATE TABLE `nurse` (
  `Nurse_ID` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nurse`
--

INSERT INTO `nurse` (`Nurse_ID`) VALUES
('NUR001'),
('NUR002'),
('NUR003'),
('NUR004'),
('NUR005'),
('NUR006'),
('NUR007'),
('NUR008'),
('NUR009'),
('NUR010');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `Patient_no` char(6) NOT NULL,
  `Patient_name` varchar(30) NOT NULL,
  `ID_no` char(9) NOT NULL,
  `Phone_no` char(10) DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `Patient_address` varchar(50) DEFAULT NULL,
  `Discharge_date` date DEFAULT NULL,
  `Nurse_ID` char(6) DEFAULT NULL,
  `Admission_date` date NOT NULL,
  `Location_before` varchar(50) DEFAULT NULL,
  `Staff_ID` char(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`Patient_no`, `Patient_name`, `ID_no`, `Phone_no`, `Gender`, `Patient_address`, `Discharge_date`, `Nurse_ID`, `Admission_date`, `Location_before`, `Staff_ID`) VALUES
('PAT001', 'Peter Trần', '123456789', '0912345678', 'M', 'Bien Hoa City, Dong Nai Province', '2021-11-20', 'NUR001', '2020-10-20', 'Bach Khoa Dormitory', 'STA001'),
('PAT002', 'Ben Parker', '573723683', '0893797192', 'F', '268 Ly Thuong Kiet Str, HCM City', '2020-10-20', 'NUR002', '2020-09-25', 'Bach Khoa University', 'STA002'),
('PAT003', 'Nguyen Bach Cuc', '871238978', '0997187933', 'F', '67 Tran Hung Dao Str, HCM City', NULL, 'NUR003', '2021-11-01', '23 Tran Hung Dao Str, HCM City', 'STA003'),
('PAT004', 'Le The Duy', '882772739', '0917936782', 'M', '127 Tran Quoc Toan Str, HCM City', '2021-04-03', 'NUR005', '2021-03-25', 'University of Economics', 'STA005'),
('PAT005', 'Truong Quang Thai', '183934678', '0891731933', 'F', '635 Ly Thuong Kiet Str, HCM City', '2021-06-30', 'NUR004', '2021-06-23', 'Ly Thuong Kiet Co.op Mart', 'STA006'),
('PAT006', 'Nguyen Van A', '723972033', '0781673811', 'F', '36 Nguyen Tri Phuong Str, HCM City', NULL, 'NUR006', '2021-10-10', 'Tu Du Hospital', 'STA007'),
('PAT007', 'Tran Van B', '913797193', '0367481791', 'M', '23 Hai Ba Truong Str, HCM City', '2021-05-03', 'NUR008', '2021-03-30', 'Tien Giang Province', 'STA004'),
('PAT008', 'Nguyen Van A', '742810139', '0183981613', 'M', '33 Dinh Tien Hoang Str, HCM City', '2021-09-02', 'NUR009', '2021-08-07', 'United State', 'STA002'),
('PAT009', 'Le Thi C', '816387793', '0819738618', 'F', '29 Phu Dong Str, HCM City', NULL, 'NUR007', '2021-10-15', 'Bach Khoa Dormitory', 'STA003'),
('PAT010', 'Bui Trong D', '183834678', '0891379613', 'M', '99 Ngo Quyen Str, HCM City', '2021-05-07', 'NUR001', '2021-05-01', '56 Nguyen Trai Str, HCM City', 'STA001'),
('PAT011', 'Ly Van T', '813781731', '0185714617', 'F', '94 Au Co Str, HCM City', '2021-05-04', 'NUR002', '2021-04-20', '6 Ly Tu Trong Str, HCM City', 'STA002'),
('PAT012', 'Tran Van V', '123645631', '0312412879', 'M', '8 Tan Thuan Dong Str, HCM City', '2020-05-20', 'NUR001', '2021-12-25', 'Bach Khoa Dormitory', 'STA001');

-- --------------------------------------------------------

--
-- Table structure for table `patient_comorbidity`
--

CREATE TABLE `patient_comorbidity` (
  `Patient_no` char(6) NOT NULL,
  `Comorbidity` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient_comorbidity`
--

INSERT INTO `patient_comorbidity` (`Patient_no`, `Comorbidity`) VALUES
('PAT001', 'cancer'),
('PAT005', 'cancer'),
('PAT011', 'cancer'),
('PAT002', 'chronic lung diseases'),
('PAT005', 'chronic lung diseases'),
('PAT003', 'diabetes'),
('PAT010', 'diabetes'),
('PAT011', 'diabetes'),
('PAT007', 'heart conditions'),
('PAT010', 'heart conditions'),
('PAT006', 'immunocompromised state'),
('PAT008', 'immunocompromised state');

-- --------------------------------------------------------

--
-- Table structure for table `patient_test_results`
--

CREATE TABLE `patient_test_results` (
  `Patient_no` char(6) NOT NULL,
  `SPO2` decimal(5,2) NOT NULL,
  `Respiratory_rate` int(11) NOT NULL,
  `PCR_test` char(1) NOT NULL,
  `PCR_ct_value` int(11) DEFAULT NULL,
  `Quick_test` char(1) NOT NULL,
  `Quick_ct_value` int(11) DEFAULT NULL,
  `Warning_mark` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient_test_results`
--

INSERT INTO `patient_test_results` (`Patient_no`, `SPO2`, `Respiratory_rate`, `PCR_test`, `PCR_ct_value`, `Quick_test`, `Quick_ct_value`, `Warning_mark`) VALUES
('PAT001', '38.00', 42, 'T', 25, 'T', 67, 'T'),
('PAT001', '39.00', 42, 'T', 25, 'T', 67, 'T'),
('PAT001', '97.88', 20, 'F', NULL, 'F', NULL, 'F'),
('PAT001', '98.12', 22, 'T', 40, 'T', 34, 'T'),
('PAT001', '98.12', 23, 'T', 40, 'T', 34, 'T'),
('PAT002', '99.12', 23, 'T', 35, 'T', 36, 'F'),
('PAT003', '50.14', 25, 'F', NULL, 'F', NULL, 'T'),
('PAT004', '97.88', 19, 'T', 40, 'T', 50, 'F'),
('PAT005', '86.34', 17, 'T', 32, 'T', 40, 'F'),
('PAT006', '50.88', 23, 'F', NULL, 'F', NULL, 'T'),
('PAT007', '98.34', 18, 'F', NULL, 'F', NULL, 'F'),
('PAT008', '97.54', 19, 'F', NULL, 'F', NULL, 'F'),
('PAT009', '50.78', 21, 'F', NULL, 'F', NULL, 'T'),
('PAT010', '96.34', 21, 'T', 33, 'T', 34, 'F'),
('PAT011', '89.78', 22, 'F', NULL, 'F', NULL, 'F'),
('PAT012', '90.69', 22, 'T', 30, 'T', 30, 'T');

-- --------------------------------------------------------

--
-- Table structure for table `pa_location`
--

CREATE TABLE `pa_location` (
  `Patient_no` char(6) NOT NULL,
  `Staff_ID` char(6) NOT NULL,
  `Locations` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pa_location`
--

INSERT INTO `pa_location` (`Patient_no`, `Staff_ID`, `Locations`) VALUES
('PAT001', 'STA001', 'Emergency room'),
('PAT002', 'STA002', 'Normal room'),
('PAT003', 'STA003', 'Recuperation room'),
('PAT004', 'STA003', 'Normal room'),
('PAT005', 'STA003', 'Emergency room'),
('PAT006', 'STA005', 'Normal room'),
('PAT007', 'STA006', 'Recuperation room'),
('PAT008', 'STA007', 'Normal room'),
('PAT009', 'STA004', 'Normal room'),
('PAT010', 'STA002', 'Recuperation room'),
('PAT011', 'STA005', 'Normal room');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `Person_ID` char(6) NOT NULL,
  `Person_address` varchar(50) DEFAULT NULL,
  `Person_name` varchar(30) NOT NULL,
  `Gender` char(1) DEFAULT NULL,
  `Phone_no` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`Person_ID`, `Person_address`, `Person_name`, `Gender`, `Phone_no`) VALUES
('DOC001', '1 Tran Hung Dao Str, HCM City', 'Tran Thi B', 'F', '0786543678'),
('DOC002', '268 Ly Thuong Kiet Str, HCM City', 'Nguyen Duc D', 'M', '0338861579'),
('DOC003', '5 Phan Xich Long Str, Da Nang City', 'Yamada N', 'M', '0908925454'),
('DOC004', '565 Phan Huy Ich Str, HCM City', 'Nguyen Thi Trau', 'F', '0972377382'),
('DOC005', '456 Le Thai To, Tien Giang Province', 'Tran Van N', 'M', '0782396473'),
('MAN001', '20 Cach Mang Thang Tam Str, HCM City', 'Nguyen Van A', 'M', '0763872917'),
('MAN002', '180 Nguyen Anh Thu Str, HCM City', 'Nha Bach D', 'F', '0989873279'),
('MAN003', '32 Tran Hung Dao Str, HCM City', 'Nakamura R', 'M', '0989897678'),
('MAN004', '44 Le Loi Str, HCM City', 'Tran Van Z', 'F', '0943567854'),
('MAN005', '12 Bach Dang Str, HCM City', 'Nguyen Thi Ba', 'M', '0976767578'),
('NUR001', '24 Le Loi Str, HCM City', 'Nguyen Van A', 'F', '0945519390'),
('NUR002', '69 Nguyen Binh Khiem Str, HCM City', 'Thay Giao Ba', 'M', '0838963738'),
('NUR003', '44/32 Phan Xich Long Str, HCM City', 'Takahashi N', 'M', '0904445454'),
('NUR004', '497 Hoa Hao Str, HCM City', 'Nguyen Van A', 'F', '0788757051'),
('NUR005', '168 Ly Thuong Kiet Str, HCM City', 'Nobi Nobita', 'M', '0789788124'),
('NUR006', '26 Le Lai Str, HCM City', 'Nguyen Van B', 'F', '0857871872'),
('NUR007', '6 Nguyen Trai Str, Dong Nai Province', 'Thay Giao Bon', 'M', '0386272293'),
('NUR008', '44 Nguyen Thuong Hien, HCM City', 'Satoshi', 'M', '0829397332'),
('NUR009', '497 30 Thang 4, Vinh Long Province', 'Shin Nohara', 'F', '0819739173'),
('NUR010', '168 Ly Thuong Kiet Str, Ha Noi', 'Nobi Doraemon', 'M', '0819379733'),
('STA001', '497 Hoa Hao Str, HCM City', 'Nguyen Van A', 'M', '0683286282'),
('STA002', '24 Ly Thai To Str, HCM City', 'Le Duan', 'M', '0789253282'),
('STA003', '57 Phan Xich Long Str, HCM City', 'Takeshi A', 'F', '0917637429'),
('STA004', '123 Nguyen Kim Str, HCM City', 'Nguyen Huu Truong', 'F', '0891638217'),
('STA005', '98 Le Thanh Tong Str, HCM City', 'Le Quang Tin', 'M', '0978133782'),
('STA006', '124 Nguyen Kim Str, HCM City', 'Nguyen Minh Tho', 'F', '0829379372'),
('STA007', '676 Le Thanh Tong Str, Ha Noi', 'Ly Quang Tin', 'M', '0872903782'),
('VOL001', '215 Ngo Gia Tu Str, HCM City', 'Nguyen Van A', 'M', '0965487364'),
('VOL002', '781 3 thang 2 Str, HCM City', 'Luong Van T', 'F', '0897685362'),
('VOL003', '4 Phan Xich Long Str, HN City', 'Honda N', 'F', '0897658436'),
('VOL004', '15 Ngo Gia Tu Str, HCM City', 'Nguyen Van B', 'M', '0812328123'),
('VOL005', '119 Ngo Quyen Str, HCM City', 'Nguyen Van Binh', 'M', '0987387388');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `Room_no` char(3) NOT NULL,
  `Building_no` char(3) DEFAULT NULL,
  `Floor_no` smallint(6) DEFAULT NULL,
  `Capacity` smallint(6) DEFAULT NULL,
  `Room_Type` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`Room_no`, `Building_no`, `Floor_no`, `Capacity`, `Room_Type`) VALUES
('101', 'B12', 1, 30, 'Normal'),
('102', 'B12', 1, 50, 'Normal'),
('103', 'B12', 1, 40, 'Normal'),
('200', 'B12', 2, 10, 'VIP'),
('304', 'D07', 3, 50, 'Normal'),
('308', 'C10', 3, 10, 'VIP'),
('405', 'A04', 4, 20, 'Recuperation'),
('406', 'A04', 4, 20, 'Recuperation'),
('407', 'A04', 4, 20, 'Recuperation'),
('509', 'D08', 5, 50, 'Normal');

-- --------------------------------------------------------

--
-- Table structure for table `serious_symptom`
--

CREATE TABLE `serious_symptom` (
  `Patient_no` char(6) NOT NULL,
  `Serious_symptoms` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `serious_symptom`
--

INSERT INTO `serious_symptom` (`Patient_no`, `Serious_symptoms`) VALUES
('PAT001', 'chest pain'),
('PAT001', 'shortness of breath'),
('PAT002', 'loss of speech'),
('PAT002', 'shortness of breath'),
('PAT004', 'chest pain'),
('PAT005', 'shortness of breath'),
('PAT006', 'chest pain'),
('PAT008', 'loss of movement'),
('PAT009', 'chest pain'),
('PAT010', 'loss of movement'),
('PAT011', 'chest pain'),
('PAT011', 'shortness of breath');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `Staff_ID` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`Staff_ID`) VALUES
('STA001'),
('STA002'),
('STA003'),
('STA004'),
('STA005'),
('STA006'),
('STA007');

-- --------------------------------------------------------

--
-- Table structure for table `treats`
--

CREATE TABLE `treats` (
  `Patient_no` char(6) NOT NULL,
  `Doctor_ID` char(6) NOT NULL,
  `Medication_code` char(7) NOT NULL,
  `Start_date` date DEFAULT NULL,
  `End_date` date DEFAULT NULL,
  `Treat_result` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `treats`
--

INSERT INTO `treats` (`Patient_no`, `Doctor_ID`, `Medication_code`, `Start_date`, `End_date`, `Treat_result`) VALUES
('PAT001', 'DOC001', 'MED0001', '2022-10-20', '2022-10-27', 'Normal'),
('PAT001', 'DOC001', 'MED0002', '2020-10-28', '2020-10-05', 'Normal'),
('PAT001', 'DOC001', 'MED0003', '2021-10-06', '2021-10-20', 'Normal'),
('PAT002', 'DOC002', 'MED0001', '2021-10-11', '2021-11-01', 'Normal'),
('PAT002', 'DOC002', 'MED0004', '2020-09-25', '2020-10-02', 'Normal'),
('PAT002', 'DOC002', 'MED0005', '2021-10-03', '2021-10-10', 'Normal'),
('PAT003', 'DOC002', 'MED0002', '2021-11-01', '2021-11-11', 'Normal'),
('PAT004', 'DOC001', 'MED0001', '2021-04-01', '2021-04-03', 'Normal'),
('PAT004', 'DOC003', 'MED0005', '2021-03-25', '2021-03-31', 'Serious'),
('PAT005', 'DOC002', 'MED0002', '2021-06-23', '2021-06-25', 'Serious'),
('PAT005', 'DOC002', 'MED0003', '2021-06-26', '2021-06-28', 'Serious'),
('PAT005', 'DOC002', 'MED0004', '2021-06-29', '2021-06-30', 'Normal'),
('PAT006', 'DOC003', 'MED0001', '2021-10-20', '2021-10-27', 'Normal'),
('PAT006', 'DOC003', 'MED0005', '2021-10-25', '2021-11-25', 'Normal'),
('PAT007', 'DOC004', 'MED0002', '2021-03-30', '2021-04-15', 'Normal'),
('PAT007', 'DOC004', 'MED0003', '2021-04-16', '2021-05-03', 'Normal'),
('PAT008', 'DOC005', 'MED0004', '2021-08-07', '2021-08-27', 'Normal'),
('PAT008', 'DOC005', 'MED0005', '2021-09-28', '2021-09-02', 'Normal'),
('PAT009', 'DOC005', 'MED0001', '2021-10-15', '2021-10-20', 'Serious'),
('PAT009', 'DOC005', 'MED0002', '2021-10-21', '2021-10-31', 'Serious'),
('PAT010', 'DOC002', 'MED0004', '2021-05-03', '2021-05-04', 'Normal'),
('PAT010', 'DOC003', 'MED0003', '2021-05-01', '2021-05-02', 'Serious'),
('PAT010', 'DOC003', 'MED0005', '2021-05-05', '2021-05-07', 'Normal'),
('PAT011', 'DOC001', 'MED0001', '2021-04-20', '2021-04-27', 'Normal'),
('PAT011', 'DOC002', 'MED0002', '2021-04-28', '2021-04-30', 'Normal'),
('PAT011', 'DOC003', 'MED0003', '2021-05-01', '2021-05-04', 'Normal');

-- --------------------------------------------------------

--
-- Table structure for table `user_manager`
--

CREATE TABLE `user_manager` (
  `id` int(4) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_manager`
--

INSERT INTO `user_manager` (`id`, `username`, `password`) VALUES
(1, 'admin', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `volunteer`
--

CREATE TABLE `volunteer` (
  `Volunteer_ID` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `volunteer`
--

INSERT INTO `volunteer` (`Volunteer_ID`) VALUES
('VOL001'),
('VOL002'),
('VOL003'),
('VOL004'),
('VOL005');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assigned_to`
--
ALTER TABLE `assigned_to`
  ADD PRIMARY KEY (`Patient_no`,`Staff_ID`),
  ADD KEY `fk_assign_room_no` (`Room_no`),
  ADD KEY `fk_assign_staff_ID` (`Staff_ID`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`Doctor_ID`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`Manager_ID`),
  ADD KEY `fk_manager_doctor_id` (`Doctor_ID`);

--
-- Indexes for table `medication`
--
ALTER TABLE `medication`
  ADD PRIMARY KEY (`Unique_code`),
  ADD UNIQUE KEY `Med_name` (`Med_name`);

--
-- Indexes for table `normal_symptom`
--
ALTER TABLE `normal_symptom`
  ADD PRIMARY KEY (`Patient_no`,`Normal_symptoms`);

--
-- Indexes for table `nurse`
--
ALTER TABLE `nurse`
  ADD PRIMARY KEY (`Nurse_ID`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`Patient_no`),
  ADD KEY `fk_patient_nurse_cares` (`Nurse_ID`),
  ADD KEY `fk_patient_staff_admits` (`Staff_ID`);

--
-- Indexes for table `patient_comorbidity`
--
ALTER TABLE `patient_comorbidity`
  ADD PRIMARY KEY (`Comorbidity`,`Patient_no`),
  ADD KEY `fk_comorbidity_patient_no` (`Patient_no`);

--
-- Indexes for table `patient_test_results`
--
ALTER TABLE `patient_test_results`
  ADD PRIMARY KEY (`Patient_no`,`SPO2`,`Respiratory_rate`,`PCR_test`,`Quick_test`);

--
-- Indexes for table `pa_location`
--
ALTER TABLE `pa_location`
  ADD PRIMARY KEY (`Patient_no`,`Staff_ID`,`Locations`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`Person_ID`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`Room_no`);

--
-- Indexes for table `serious_symptom`
--
ALTER TABLE `serious_symptom`
  ADD PRIMARY KEY (`Patient_no`,`Serious_symptoms`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`Staff_ID`);

--
-- Indexes for table `treats`
--
ALTER TABLE `treats`
  ADD PRIMARY KEY (`Patient_no`,`Doctor_ID`,`Medication_code`),
  ADD KEY `fk_treat_medication_code` (`Medication_code`),
  ADD KEY `fk_treat_doctor_id` (`Doctor_ID`);

--
-- Indexes for table `user_manager`
--
ALTER TABLE `user_manager`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `volunteer`
--
ALTER TABLE `volunteer`
  ADD PRIMARY KEY (`Volunteer_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assigned_to`
--
ALTER TABLE `assigned_to`
  ADD CONSTRAINT `fk_assign_patient_no` FOREIGN KEY (`Patient_no`) REFERENCES `patient` (`Patient_no`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_assign_room_no` FOREIGN KEY (`Room_no`) REFERENCES `room` (`Room_no`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_assign_staff_ID` FOREIGN KEY (`Staff_ID`) REFERENCES `staff` (`Staff_ID`) ON DELETE CASCADE;

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `fk_doctor_person_id` FOREIGN KEY (`Doctor_ID`) REFERENCES `person` (`Person_ID`) ON DELETE CASCADE;

--
-- Constraints for table `manager`
--
ALTER TABLE `manager`
  ADD CONSTRAINT `fk_manager_doctor_id` FOREIGN KEY (`Doctor_ID`) REFERENCES `doctor` (`Doctor_ID`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_manager_person_id` FOREIGN KEY (`Manager_ID`) REFERENCES `person` (`Person_ID`) ON DELETE CASCADE;

--
-- Constraints for table `normal_symptom`
--
ALTER TABLE `normal_symptom`
  ADD CONSTRAINT `fk_normal_symptom_patient_no` FOREIGN KEY (`Patient_no`) REFERENCES `patient` (`Patient_no`) ON DELETE CASCADE;

--
-- Constraints for table `nurse`
--
ALTER TABLE `nurse`
  ADD CONSTRAINT `fk_nurse_person_id` FOREIGN KEY (`Nurse_ID`) REFERENCES `person` (`Person_ID`) ON DELETE CASCADE;

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `fk_patient_nurse_cares` FOREIGN KEY (`Nurse_ID`) REFERENCES `nurse` (`Nurse_ID`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_patient_staff_admits` FOREIGN KEY (`Staff_ID`) REFERENCES `staff` (`Staff_ID`) ON DELETE SET NULL;

--
-- Constraints for table `patient_comorbidity`
--
ALTER TABLE `patient_comorbidity`
  ADD CONSTRAINT `fk_comorbidity_patient_no` FOREIGN KEY (`Patient_no`) REFERENCES `patient` (`Patient_no`) ON DELETE CASCADE;

--
-- Constraints for table `patient_test_results`
--
ALTER TABLE `patient_test_results`
  ADD CONSTRAINT `fk_test_patient_no` FOREIGN KEY (`Patient_no`) REFERENCES `patient` (`Patient_no`) ON DELETE CASCADE;

--
-- Constraints for table `pa_location`
--
ALTER TABLE `pa_location`
  ADD CONSTRAINT `fk_Location_assign` FOREIGN KEY (`Patient_no`,`Staff_ID`) REFERENCES `assigned_to` (`Patient_no`, `Staff_ID`) ON DELETE CASCADE;

--
-- Constraints for table `serious_symptom`
--
ALTER TABLE `serious_symptom`
  ADD CONSTRAINT `fk_serious_symptom_patient_no` FOREIGN KEY (`Patient_no`) REFERENCES `patient` (`Patient_no`) ON DELETE CASCADE;

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `fk_staff_person_id` FOREIGN KEY (`Staff_ID`) REFERENCES `person` (`Person_ID`) ON DELETE CASCADE;

--
-- Constraints for table `treats`
--
ALTER TABLE `treats`
  ADD CONSTRAINT `fk_treat_doctor_id` FOREIGN KEY (`Doctor_ID`) REFERENCES `doctor` (`Doctor_ID`),
  ADD CONSTRAINT `fk_treat_medication_code` FOREIGN KEY (`Medication_code`) REFERENCES `medication` (`Unique_code`),
  ADD CONSTRAINT `fk_treat_patient_no` FOREIGN KEY (`Patient_no`) REFERENCES `patient` (`Patient_no`) ON DELETE CASCADE;

--
-- Constraints for table `volunteer`
--
ALTER TABLE `volunteer`
  ADD CONSTRAINT `fk_volunteer_person_id` FOREIGN KEY (`Volunteer_ID`) REFERENCES `person` (`Person_ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;