-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2022 at 10:44 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `igapecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `firebaseid` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `username`, `password`, `firebaseid`) VALUES
(1, 'Abhijit Gatade', 'admin', 'admin', 'undefined'),
(2, 'Dilip Gatade', 'dilip', 'admin', 'undefined');

-- --------------------------------------------------------

--
-- Table structure for table `businesses`
--

CREATE TABLE `businesses` (
  `id` int(11) NOT NULL,
  `name` varchar(110) NOT NULL,
  `website` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `cityid` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `mobileno` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `pincode` varchar(50) NOT NULL,
  `joiningdate` date NOT NULL,
  `expirydate` date NOT NULL,
  `localrate500` double DEFAULT 0,
  `staterate500` double DEFAULT 0,
  `nationalrate500` double DEFAULT 0,
  `localrate500plus` double DEFAULT 0,
  `staterate500plus` double DEFAULT 0,
  `nationalrate500plus` double DEFAULT 0,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `businesses`
--

INSERT INTO `businesses` (`id`, `name`, `website`, `address`, `cityid`, `email`, `mobileno`, `password`, `pincode`, `joiningdate`, `expirydate`, `localrate500`, `staterate500`, `nationalrate500`, `localrate500plus`, `staterate500plus`, `nationalrate500plus`, `status`) VALUES
(1, 'Vipras India', 'vipras-india', 'kop', 1, 'vipras@gmail.com', '9876543210', 'vipras', '416001', '0000-00-00', '0000-00-00', 0, 0, 0, 0, 0, 0, ''),
(2, 'iGAP', 'undefined', 'Hari Om Nagar', 1, 'gatadeabhijit@gmail.com', '9561320192', 'aaa', 'undefined', '2022-05-27', '2021-05-27', 0, 0, 0, 0, 0, 0, 'active'),
(4, 'Kishor Store', 'https://kishor.com', 'Hari Om Nagar', 1, 'kishor@gmail.com', '9561320192', 'kishor', 'undefined', '2022-05-27', '2023-05-27', 0, 0, 0, 0, 0, 0, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `business_ads`
--

CREATE TABLE `business_ads` (
  `id` int(11) NOT NULL,
  `businessid` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `picpath` varchar(300) NOT NULL,
  `link` varchar(200) NOT NULL,
  `srno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `business_affiliates`
--

CREATE TABLE `business_affiliates` (
  `id` int(11) NOT NULL,
  `businessid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `requestedon` datetime DEFAULT NULL,
  `approvedon` datetime DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `business_banners`
--

CREATE TABLE `business_banners` (
  `id` int(11) NOT NULL,
  `businessid` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `picpath` varchar(200) NOT NULL,
  `link` varchar(200) NOT NULL,
  `srno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `business_banners`
--

INSERT INTO `business_banners` (`id`, `businessid`, `title`, `picpath`, `link`, `srno`) VALUES
(3, 2, 'Second', 'businessbanners/w816m.png', 'http://google.com', 5),
(4, 2, 'hello', 'businessbanners/tiuyo.png', 'sada', 1),
(5, 2, 'sfs', 'businessbanners/4fz39.png', 'sdfsd', 4),
(6, 2, 'fdsf', 'businessbanners/29y24.png', 'fsdfsd', 2);

-- --------------------------------------------------------

--
-- Table structure for table `business_blogcategories`
--

CREATE TABLE `business_blogcategories` (
  `id` int(11) NOT NULL,
  `businessid` int(11) DEFAULT NULL,
  `title` varchar(1000) DEFAULT NULL,
  `urltitle` varchar(1000) DEFAULT NULL,
  `srno` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `business_blogcategories`
--

INSERT INTO `business_blogcategories` (`id`, `businessid`, `title`, `urltitle`, `srno`) VALUES
(1, 1, 'Title', 'title', 1),
(2, 3, 'abc', 'pqr', 2),
(3, 5, 'abcddf⏱', 'hello', 0),
(4, 5, 'abcddf', 'pqrsf', 4),
(5, 5, 'Welcome', 'hello', 0),
(6, 5, 'Welcome', 'hello', 40),
(8, 2, 'Angular Minds', 'angular', 1);

-- --------------------------------------------------------

--
-- Table structure for table `business_blogs`
--

CREATE TABLE `business_blogs` (
  `id` int(11) NOT NULL,
  `businessid` int(11) DEFAULT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `title` varchar(1000) DEFAULT NULL,
  `urltitle` varchar(1000) DEFAULT NULL,
  `createdon` varchar(50) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `picpath` varchar(100) DEFAULT NULL,
  `body` text DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `business_blogs`
--

INSERT INTO `business_blogs` (`id`, `businessid`, `categoryid`, `title`, `urltitle`, `createdon`, `author`, `picpath`, `body`, `status`) VALUES
(6, 6, 6, 'myproduct', 'myproduct/product', 'team', 'harsh', 'businessproductcategories/hiron.png', 'good product', NULL),
(8, 5, 0, 'harsh', 'nilesh', 'pradip', 'shree', 'businessblog/poyoo.png', 'suryakant', 'active'),
(10, 2, 8, 'Angular 1', 'angular', '01 June 2022', 'Abhijit Gatade', 'businessblogs/0df9t.png', 'Hello', 'inactive');

-- --------------------------------------------------------

--
-- Table structure for table `business_couponproducts`
--

CREATE TABLE `business_couponproducts` (
  `id` int(11) NOT NULL,
  `couponid` int(11) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `business_coupons`
--

CREATE TABLE `business_coupons` (
  `id` int(11) NOT NULL,
  `businessid` int(11) NOT NULL,
  `couponcode` varchar(100) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `business_dealproducts`
--

CREATE TABLE `business_dealproducts` (
  `id` int(11) NOT NULL,
  `dealid` int(11) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `business_dealproducts`
--

INSERT INTO `business_dealproducts` (`id`, `dealid`, `productid`) VALUES
(2, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `business_deals`
--

CREATE TABLE `business_deals` (
  `id` int(11) NOT NULL,
  `businessid` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `business_deals`
--

INSERT INTO `business_deals` (`id`, `businessid`, `title`, `startdate`, `enddate`, `description`, `status`) VALUES
(2, 1, 'Abhijit ', '2022-04-11', '2022-05-15', 'close', NULL),
(3, 1, 'Abhijit ', '2022-04-11', '2022-05-15', 'trial coupon', 'close');

-- --------------------------------------------------------

--
-- Table structure for table `business_productcategories`
--

CREATE TABLE `business_productcategories` (
  `id` int(11) NOT NULL,
  `businessid` int(11) NOT NULL,
  `srno` int(11) NOT NULL,
  `picpath` varchar(500) NOT NULL,
  `name` varchar(100) NOT NULL,
  `igaproductcategoryid` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `business_productcategories`
--

INSERT INTO `business_productcategories` (`id`, `businessid`, `srno`, `picpath`, `name`, `igaproductcategoryid`) VALUES
(1, 2, 2, 'businessproductcategories/xt9pj.png', 'Cloths', 0),
(3, 2, 1, 'productcategories/cfyde.png', 'Cloths', 1);

-- --------------------------------------------------------

--
-- Table structure for table `business_productpictures`
--

CREATE TABLE `business_productpictures` (
  `id` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `picpath` varchar(100) NOT NULL,
  `srno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `business_productpictures`
--

INSERT INTO `business_productpictures` (`id`, `productid`, `title`, `picpath`, `srno`) VALUES
(15, 1, 'Title', 'businessproducts/pb1p0.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `business_productreviews`
--

CREATE TABLE `business_productreviews` (
  `id` int(11) NOT NULL,
  `productid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `review` varchar(1000) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `business_products`
--

CREATE TABLE `business_products` (
  `id` int(11) NOT NULL,
  `businessid` int(11) NOT NULL,
  `igapvendorid` int(11) NOT NULL,
  `igapvendorproductid` int(11) DEFAULT NULL,
  `name` varchar(500) NOT NULL,
  `title` varchar(500) NOT NULL,
  `description` text NOT NULL,
  `specification` text NOT NULL,
  `mrp` double NOT NULL,
  `price` double NOT NULL,
  `weight` double DEFAULT NULL,
  `picpath` varchar(200) NOT NULL,
  `instock` varchar(3) DEFAULT NULL,
  `affiliatepercent` double NOT NULL DEFAULT 0,
  `status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `business_products`
--

INSERT INTO `business_products` (`id`, `businessid`, `igapvendorid`, `igapvendorproductid`, `name`, `title`, `description`, `specification`, `mrp`, `price`, `weight`, `picpath`, `instock`, `affiliatepercent`, `status`) VALUES
(13, 2, 1, 1, 'Pen Drive', 'pen-drive', 'description', 'spectification', 2000, 1500, 100, 'businessproducts/mrhmw.png', 'Yes', 2, 'open');

-- --------------------------------------------------------

--
-- Table structure for table `business_productvarieties`
--

CREATE TABLE `business_productvarieties` (
  `id` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `size` varchar(50) NOT NULL,
  `color` varchar(100) NOT NULL,
  `weight` int(11) NOT NULL,
  `mrp` double NOT NULL,
  `price` double NOT NULL,
  `instock` varchar(20) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `business_productvarieties`
--

INSERT INTO `business_productvarieties` (`id`, `productid`, `size`, `color`, `weight`, `mrp`, `price`, `instock`, `status`) VALUES
(2, 0, 'xxl', 'red', 5, 0, 0, 'y', 'open'),
(3, 0, 'xxl', 'red', 5, 0, 0, 'y', 'open'),
(4, 0, 'xxl', 'red', 5, 0, 0, 'y', 'open'),
(5, 0, 'xxl', 'red', 5, 0, 0, 'y', 'open'),
(6, 0, 'xxl', 'red', 5, 0, 0, 'y', 'open'),
(7, 0, 'xxl', 'red', 5, 0, 0, 'y', 'open'),
(8, 0, 'xxl', 'red', 5, 0, 0, 'y', 'open');

-- --------------------------------------------------------

--
-- Table structure for table `business_subscriptions`
--

CREATE TABLE `business_subscriptions` (
  `id` int(11) NOT NULL,
  `businessid` int(11) NOT NULL,
  `email` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `stateid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `stateid`) VALUES
(1, 'Kolhapur', 1),
(2, 'Kolhapur', 1);

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `stateid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `name`, `stateid`) VALUES
(4, 'Kolhapur', 1),
(5, 'Belgaon', 4);

-- --------------------------------------------------------

--
-- Table structure for table `igap_productcategories`
--

CREATE TABLE `igap_productcategories` (
  `id` int(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `picpath` varchar(100) DEFAULT NULL,
  `srno` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `igap_productcategories`
--

INSERT INTO `igap_productcategories` (`id`, `name`, `picpath`, `srno`) VALUES
(1, 'Cloths', 'productcategories/cfyde.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `igap_vendorproductpictures`
--

CREATE TABLE `igap_vendorproductpictures` (
  `id` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `picpath` varchar(500) NOT NULL,
  `srno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `igap_vendorproductpictures`
--

INSERT INTO `igap_vendorproductpictures` (`id`, `productid`, `title`, `picpath`, `srno`) VALUES
(3, 2, 'demo', 'businessproductpicture/vec1r.png', 1),
(4, 2, 'demo', 'businessproductpicture/6wstv.png', 1),
(5, 1, 'picture', 'vendorproducts/8gxj5.png', 1),
(7, 0, 'asdasda', 'vendorproducts/fgnsg.png', 4),
(10, 4, 'sadas', 'vendorproducts/unsep.png', 2),
(11, 4, 'asdasdsadas', 'vendorproducts/falsz.png', 1),
(12, 6, 'Sample Picture', 'vendorproducts/yfsib.png', 2),
(13, 6, 'sdasda', 'vendorproducts/7z8dm.png', 2),
(14, 6, 'asdsdadasd', 'vendorproducts/tos2a.png', 2);

-- --------------------------------------------------------

--
-- Table structure for table `igap_vendorproducts`
--

CREATE TABLE `igap_vendorproducts` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `title` varchar(500) NOT NULL,
  `description` text NOT NULL,
  `specification` text NOT NULL,
  `picpath` varchar(500) NOT NULL,
  `igapvendorid` int(11) NOT NULL,
  `igaproductcategoryid` int(11) NOT NULL,
  `mrp` double NOT NULL,
  `price` double NOT NULL,
  `weight` double DEFAULT NULL,
  `instock` varchar(150) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `igap_vendorproducts`
--

INSERT INTO `igap_vendorproducts` (`id`, `name`, `title`, `description`, `specification`, `picpath`, `igapvendorid`, `igaproductcategoryid`, `mrp`, `price`, `weight`, `instock`, `status`) VALUES
(1, 'Dress for girls', 'dress-for-girls', '<p><br>Maybe you check this if you can update to angular 7</p><p><a href=\"https://netbasal.com/getting-to-know-the-angular-cdk-drag-and-drop-feature-d79ba462ce31\">https://netbasal.com/getting-to-know-the-angular-cdk-drag-and-drop-feature-d79ba462ce31</a></p>', '', 'vendorproducts/gw01e.png', 1, 1, 1000, 500, 500, 'No', 'close'),
(4, 'Dress', 'dress', '<p><br>Maybe you check this if you can update to angular 7</p><p><a href=\"https://netbasal.com/getting-to-know-the-angular-cdk-drag-and-drop-feature-d79ba462ce31\">https://netbasal.com/getting-to-know-the-angular-cdk-drag-and-drop-feature-d79ba462ce31</a></p>', '', 'vendorproducts/322aa.png', 1, 1, 1000, 500, 500, 'No', 'close'),
(5, 'Dress of choice red color', 'Dress+of%20choice%20red%20color', '<p>dress</p>', '', 'vendorproducts/sjwea.png', 1, 1, 1000, 500, 500, 'Yes', 'close'),
(6, 'Dress of choice red color', 'Dress of choice red color', '<p>dress</p>', '', 'vendorproducts/d4bvf.png', 1, 1, 1000, 500, 500, 'Yes', 'open'),
(7, 'Dress of choice red color', 'Dress of choice red color', '<p>dress</p>', '', 'vendorproducts/ti3ru.png', 1, 1, 1000, 500, 500, 'Yes', 'open'),
(8, 'Dress of choice red color', 'Dress-of-choice-red-color', '<p>dress</p>', '', 'vendorproducts/8t2ap.png', 1, 1, 1000, 500, 500, 'Yes', 'open'),
(9, 'Dress of choice red color', 'dress-of-choice-red-color', '<p>dress</p>', '', 'vendorproducts/h0riz.png', 1, 1, 1000, 500, 500, 'Yes', 'open');

-- --------------------------------------------------------

--
-- Table structure for table `igap_vendorproductvarieties`
--

CREATE TABLE `igap_vendorproductvarieties` (
  `id` int(11) NOT NULL,
  `productid` int(11) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `mrp` double DEFAULT NULL,
  `price` double DEFAULT NULL,
  `instock` varchar(3) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `igap_vendorproductvarieties`
--

INSERT INTO `igap_vendorproductvarieties` (`id`, `productid`, `color`, `size`, `weight`, `mrp`, `price`, `instock`, `status`) VALUES
(1, 1, 'red', 'XL', 100, 500, 400, 'N', 'open'),
(2, 1, '#d62424', 'XL', 500, 100, 100, 'Yes', 'open');

-- --------------------------------------------------------

--
-- Table structure for table `igap_vendors`
--

CREATE TABLE `igap_vendors` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(500) DEFAULT NULL,
  `mobileno` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `cityid` int(11) NOT NULL,
  `pincode` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `igap_vendors`
--

INSERT INTO `igap_vendors` (`id`, `name`, `email`, `password`, `mobileno`, `address`, `cityid`, `pincode`) VALUES
(1, 'Abhijit Gatade', 'gatadeabhijit@gmail.com', 'abcd', '9561320192', 'Hari Om Nagar', 1, '416001'),
(9, 'Abhijit Gatade', 'apgatade@gmail.com', 'iGAP@3479', '9561320191', 'Hari Om Nagar, Kolhapur', 1, '416001');

-- --------------------------------------------------------

--
-- Table structure for table `pincodes`
--

CREATE TABLE `pincodes` (
  `id` int(11) NOT NULL,
  `pincode` varchar(100) NOT NULL,
  `stateid` int(11) NOT NULL,
  `districtid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`) VALUES
(1, 'Maharashtra'),
(4, 'Karnataka');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `businessid` int(11) DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `mobileno` varchar(100) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  `firebaseid` varchar(500) DEFAULT NULL,
  `billingaddressid` int(11) DEFAULT NULL,
  `shippingaddressid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `businessid`, `name`, `email`, `mobileno`, `password`, `firebaseid`, `billingaddressid`, `shippingaddressid`) VALUES
(7, 0, 'Abhijit', NULL, NULL, '123', NULL, NULL, NULL),
(8, 1, 'Abhijit', 'a@gmail.com', '9561210192', '123', 'safasdas', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `mobileno` varchar(100) DEFAULT NULL,
  `address1` varchar(500) DEFAULT NULL,
  `address2` varchar(500) DEFAULT NULL,
  `nearestspot` varchar(500) DEFAULT NULL,
  `city` varchar(500) DEFAULT NULL,
  `district` varchar(500) DEFAULT NULL,
  `state` varchar(500) DEFAULT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `addresstype` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_orderdetails`
--

CREATE TABLE `user_orderdetails` (
  `id` int(11) NOT NULL,
  `orderid` int(11) NOT NULL,
  `orderinvoiceid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `color` varchar(500) DEFAULT NULL,
  `size` varchar(500) DEFAULT NULL,
  `productname` varchar(200) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `subtotal` double NOT NULL,
  `dealid` int(11) NOT NULL,
  `couponid` int(11) NOT NULL,
  `coupontotal` double NOT NULL,
  `shippingtotal` double NOT NULL,
  `billtotal` double NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_orderdetails`
--

INSERT INTO `user_orderdetails` (`id`, `orderid`, `orderinvoiceid`, `productid`, `color`, `size`, `productname`, `price`, `quantity`, `subtotal`, `dealid`, `couponid`, `coupontotal`, `shippingtotal`, `billtotal`, `status`) VALUES
(1, 1, 1, 1, 'red', 'XL', 'abc', 2022, 4, 233, 20, 607, 120, 200, 5000, 'paid'),
(2, 1, 1, 2, 'red', 'XL', 'abc', 2022, 4, 233, 20, 607, 120, 200, 5000, 'paid'),
(3, 1, 2, 3, 'red', 'XL', 'abc', 2022, 4, 233, 20, 607, 120, 200, 5000, 'paid'),
(4, 1, 2, 4, 'red', 'XL', 'abc', 2022, 4, 233, 20, 607, 120, 200, 5000, 'paid'),
(5, 2, 3, 1, 'red', 'XL', 'abc', 2022, 4, 233, 20, 607, 120, 200, 5000, 'paid'),
(6, 2, 3, 2, 'red', 'XL', 'abc', 2022, 4, 233, 20, 607, 120, 200, 5000, 'paid'),
(7, 2, 4, 3, 'red', 'XL', 'abc', 2022, 4, 233, 20, 607, 120, 200, 5000, 'paid'),
(8, 2, 4, 4, 'red', 'XL', 'abc', 2022, 4, 233, 20, 607, 120, 200, 5000, 'paid');

-- --------------------------------------------------------

--
-- Table structure for table `user_orderinvoices`
--

CREATE TABLE `user_orderinvoices` (
  `id` int(11) NOT NULL,
  `orderid` int(11) NOT NULL,
  `igapvendorid` int(11) NOT NULL,
  `subtotal` double NOT NULL,
  `shippingtotal` double NOT NULL,
  `coupontotal` double NOT NULL,
  `billtotal` double NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_orderinvoices`
--

INSERT INTO `user_orderinvoices` (`id`, `orderid`, `igapvendorid`, `subtotal`, `shippingtotal`, `coupontotal`, `billtotal`, `status`) VALUES
(1, 1, 0, 345, 45, 345, 3459, 'paid'),
(2, 1, 1, 24, 234, 43, 4000, 'paid'),
(3, 2, 2, 345, 45, 345, 3459, 'paid'),
(4, 2, 3, 24, 234, 43, 4000, 'paid');

-- --------------------------------------------------------

--
-- Table structure for table `user_orders`
--

CREATE TABLE `user_orders` (
  `id` int(11) NOT NULL,
  `paymentcode` varchar(50) NOT NULL,
  `businessid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `shippingaddressid` int(11) NOT NULL,
  `billingaddressid` int(11) NOT NULL,
  `orderdon` datetime NOT NULL,
  `subtotal` double NOT NULL,
  `shippingtotal` double NOT NULL,
  `couponid` int(11) NOT NULL,
  `coupontotal` double NOT NULL,
  `billtotal` double NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_orders`
--

INSERT INTO `user_orders` (`id`, `paymentcode`, `businessid`, `userid`, `shippingaddressid`, `billingaddressid`, `orderdon`, `subtotal`, `shippingtotal`, `couponid`, `coupontotal`, `billtotal`, `status`) VALUES
(1, 'hello', 1, 1, 2, 4, '0000-00-00 00:00:00', 6, 50, 6, 300, 500, 'paid'),
(2, 'hello', 2, 2, 2, 4, '0000-00-00 00:00:00', 6, 50, 6, 300, 500, 'paid');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `businesses`
--
ALTER TABLE `businesses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_ads`
--
ALTER TABLE `business_ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_affiliates`
--
ALTER TABLE `business_affiliates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_banners`
--
ALTER TABLE `business_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_blogcategories`
--
ALTER TABLE `business_blogcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_blogs`
--
ALTER TABLE `business_blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_couponproducts`
--
ALTER TABLE `business_couponproducts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_coupons`
--
ALTER TABLE `business_coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_dealproducts`
--
ALTER TABLE `business_dealproducts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_deals`
--
ALTER TABLE `business_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_productcategories`
--
ALTER TABLE `business_productcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_productpictures`
--
ALTER TABLE `business_productpictures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_productreviews`
--
ALTER TABLE `business_productreviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_products`
--
ALTER TABLE `business_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_productvarieties`
--
ALTER TABLE `business_productvarieties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_subscriptions`
--
ALTER TABLE `business_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fK_city_id` (`stateid`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `igap_productcategories`
--
ALTER TABLE `igap_productcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `igap_vendorproductpictures`
--
ALTER TABLE `igap_vendorproductpictures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `igap_vendorproducts`
--
ALTER TABLE `igap_vendorproducts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `igap_vendorproductvarieties`
--
ALTER TABLE `igap_vendorproductvarieties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `igap_vendors`
--
ALTER TABLE `igap_vendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `mobileno` (`mobileno`);

--
-- Indexes for table `pincodes`
--
ALTER TABLE `pincodes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pincode` (`pincode`),
  ADD KEY `fk_stateid` (`stateid`),
  ADD KEY `fk_districtid` (`districtid`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_orderdetails`
--
ALTER TABLE `user_orderdetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_orderinvoices`
--
ALTER TABLE `user_orderinvoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_orders`
--
ALTER TABLE `user_orders`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `businesses`
--
ALTER TABLE `businesses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `business_ads`
--
ALTER TABLE `business_ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `business_affiliates`
--
ALTER TABLE `business_affiliates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `business_banners`
--
ALTER TABLE `business_banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `business_blogcategories`
--
ALTER TABLE `business_blogcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `business_blogs`
--
ALTER TABLE `business_blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `business_couponproducts`
--
ALTER TABLE `business_couponproducts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `business_coupons`
--
ALTER TABLE `business_coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `business_dealproducts`
--
ALTER TABLE `business_dealproducts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `business_deals`
--
ALTER TABLE `business_deals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `business_productcategories`
--
ALTER TABLE `business_productcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `business_productpictures`
--
ALTER TABLE `business_productpictures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `business_productreviews`
--
ALTER TABLE `business_productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `business_products`
--
ALTER TABLE `business_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `business_productvarieties`
--
ALTER TABLE `business_productvarieties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `business_subscriptions`
--
ALTER TABLE `business_subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `igap_productcategories`
--
ALTER TABLE `igap_productcategories`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `igap_vendorproductpictures`
--
ALTER TABLE `igap_vendorproductpictures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `igap_vendorproducts`
--
ALTER TABLE `igap_vendorproducts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `igap_vendorproductvarieties`
--
ALTER TABLE `igap_vendorproductvarieties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `igap_vendors`
--
ALTER TABLE `igap_vendors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pincodes`
--
ALTER TABLE `pincodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_orderdetails`
--
ALTER TABLE `user_orderdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_orderinvoices`
--
ALTER TABLE `user_orderinvoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_orders`
--
ALTER TABLE `user_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `fK_city_id` FOREIGN KEY (`stateid`) REFERENCES `states` (`id`);

--
-- Constraints for table `pincodes`
--
ALTER TABLE `pincodes`
  ADD CONSTRAINT `fk_districtid` FOREIGN KEY (`districtid`) REFERENCES `districts` (`id`),
  ADD CONSTRAINT `fk_stateid` FOREIGN KEY (`stateid`) REFERENCES `states` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
