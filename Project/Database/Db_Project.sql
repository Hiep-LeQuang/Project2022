-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 21, 2020 lúc 09:17 AM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `project`
--
CREATE DATABASE IF NOT EXISTS `Project` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `Project`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE IF NOT EXISTS `account` (
  `accountID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  PRIMARY KEY (`accountID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`accountID`, `userName`, `password`) VALUES
(1, 'Admin', '25d55ad283aa40af464c76d713c7ad');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brand`
--

CREATE TABLE IF NOT EXISTS `brand` (
  `brandID` int(11) NOT NULL AUTO_INCREMENT,
  `brand` varchar(255) NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`brandID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `brand`
--

INSERT INTO `brand` (`brandID`, `brand`, `status`) VALUES
(1, 'Toyota', 1),
(2, 'Hyundai', 1),
(3, 'Audi', 1),
(4, 'Honda', 1),
(5, 'Mercedes', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `car`
--

CREATE TABLE IF NOT EXISTS `car` (
  `carID` int(11) NOT NULL AUTO_INCREMENT,
  `sku` varchar(17) NOT NULL,
  `carName` varchar(255) NOT NULL,
  `yearOfManufacture` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `seat` int(11) NOT NULL,
  `fuelUsed` varchar(50) NOT NULL,
  `gear` varchar(50) NOT NULL,
  `status` int(1) NOT NULL,
  `brandID` int(11) NOT NULL,
  `categoryID` int(11) NOT NULL,
  `colorID` int(11) NOT NULL,
  PRIMARY KEY (`carID`),
  KEY `FK_Car_Brand` (`brandID`),
  KEY `FK_Car_Color` (`colorID`),
  KEY `FK_Car_Category` (`categoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `car`
--

INSERT INTO `car` (`carID`, `sku`, `carName`, `yearOfManufacture`, `price`, `seat`, `fuelUsed`, `gear`, `status`, `brandID`, `categoryID`, `colorID`) VALUES
(1, 'OTO01', 'Camry', 2020, 123, 5, 'Xăng', 'Tự động', 1, 1, 1, 4),
(2, 'OTO02', 'Elantra', 2019, 456, 5, 'Xăng', 'Ly hợp kép', 1, 2, 2, 3),
(3, 'OTO03', 'Rolls Royce', 2018, 789, 5, 'Diesel', 'Tự động vô cấp', 1, 3, 1, 4),
(4, 'OTO04', 'Rafael', 2018, 456, 5, 'Xăng', 'Tự động', 1, 4, 1, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `categoryID` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(255) NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`categoryID`, `categoryName`, `status`) VALUES
(1, 'Xe Con', 1),
(2, 'Bán Tải', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `color`
--

CREATE TABLE IF NOT EXISTS `color` (
  `colorID` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(100) NOT NULL,
  PRIMARY KEY (`colorID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `color`
--

INSERT INTO `color` (`colorID`, `color`) VALUES
(1, 'Đỏ'),
(2, 'Xanh'),
(3, 'Vàng'),
(4, 'Đen'),
(5, 'Trắng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contract`
--

CREATE TABLE IF NOT EXISTS `contract` (
  `contractID` int(11) NOT NULL AUTO_INCREMENT,
  `customerID` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `dateOfSale` datetime NOT NULL,
  `status` int(11) NOT NULL,
  `deposits` int(11) NOT NULL,
  `productReceiptDate` date NOT NULL,
  `accountant` varchar(50) NOT NULL,
  `CarID` int(11) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`contractID`),
  KEY `FK_Contract_Car` (`CarID`),
  KEY `FK_Contract_Customer` (`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `contract`
--

INSERT INTO `contract` (`contractID`, `customerID`, `price`, `dateOfSale`, `status`, `deposits`, `productReceiptDate`, `accountant`, `CarID`, `note`) VALUES
(1, 1, 456, '2020-08-21 08:49:48', 0, 123, '2020-08-21', 'Lê Thị Huyền', 1, 'ghhfg'),
(2, 2, 7894, '2020-08-21 08:54:18', 0, 123, '2020-08-21', 'Lê Thị Huyền', 2, ''),
(3, 2, 789, '2020-08-21 09:09:05', 0, 416, '2020-08-30', 'Lê Thị Huyền', 4, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `customerID` int(11) NOT NULL AUTO_INCREMENT,
  `customerName` varchar(255) NOT NULL,
  `CMND` varchar(12) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`customerID`, `customerName`, `CMND`, `phone`, `address`, `email`) VALUES
(1, 'Vũ Văn Minh', '563548591525', '1234567892', 'Hà Nội', 'minh@gmail.com'),
(2, 'Hoàng Trung Hòa', '123456789121', '0989585858', 'Hà Nội', 'ha2@gmail.com'),
(3, 'Nguyễn Ngọc Ánh', '123456789123', '0915464646', 'Hà Nam', 'anh@gmail.com');

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `FK_Car_Brand` FOREIGN KEY (`brandID`) REFERENCES `brand` (`brandID`),
  ADD CONSTRAINT `FK_Car_Category` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`),
  ADD CONSTRAINT `FK_Car_Color` FOREIGN KEY (`colorID`) REFERENCES `color` (`colorID`);

--
-- Các ràng buộc cho bảng `contract`
--
ALTER TABLE `contract`
  ADD CONSTRAINT `FK_Contract_Car` FOREIGN KEY (`CarID`) REFERENCES `car` (`carID`),
  ADD CONSTRAINT `FK_Contract_Customer` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
