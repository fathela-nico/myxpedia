/*
SQLyog Community v13.3.0 (64 bit)
MySQL - 10.4.32-MariaDB : Database - xpedia
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`xpedia` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `xpedia`;

/*Table structure for table `  flightbookingclasses` */

DROP TABLE IF EXISTS `  flightbookingclasses`;

CREATE TABLE `  flightbookingclasses` (
  `bookingclasses-id` int(11) NOT NULL,
  `booking-id` int(11) DEFAULT NULL,
  `bookingclasse-id` int(11) DEFAULT NULL,
  `noofseats` int(11) DEFAULT NULL,
  `unitprice` decimal(10,0) DEFAULT NULL,
  `curencyid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`bookingclasses-id`),
  KEY `booking-id` (`booking-id`),
  KEY `bookingclasse-id` (`bookingclasse-id`),
  CONSTRAINT `  flightbookingclasses_ibfk_1` FOREIGN KEY (`booking-id`) REFERENCES `booking-type` (`type-id`),
  CONSTRAINT `  flightbookingclasses_ibfk_2` FOREIGN KEY (`bookingclasse-id`) REFERENCES `bookinclass` (`class-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `  flightbookingclasses` */

/*Table structure for table `airline` */

DROP TABLE IF EXISTS `airline`;

CREATE TABLE `airline` (
  `airline_id` int(11) NOT NULL,
  `airline_name` varchar(100) DEFAULT NULL,
  `airline_logo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`airline_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `airline` */

insert  into `airline`(`airline_id`,`airline_name`,`airline_logo`) values 
(0,'Quatar','0');

/*Table structure for table `airport` */

DROP TABLE IF EXISTS `airport`;

CREATE TABLE `airport` (
  `airport-id` int(11) NOT NULL,
  `airportcode` varchar(100) DEFAULT NULL,
  `airport-name` varchar(100) DEFAULT NULL,
  `city-id` int(11) DEFAULT NULL,
  PRIMARY KEY (`airport-id`),
  KEY `city-id` (`city-id`),
  CONSTRAINT `airport_ibfk_1` FOREIGN KEY (`city-id`) REFERENCES `city` (`city-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `airport` */

insert  into `airport`(`airport-id`,`airportcode`,`airport-name`,`city-id`) values 
(0,NULL,'',NULL);

/*Table structure for table `bookinclass` */

DROP TABLE IF EXISTS `bookinclass`;

CREATE TABLE `bookinclass` (
  `class-id` int(11) NOT NULL,
  `class-name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`class-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `bookinclass` */

/*Table structure for table `booking-type` */

DROP TABLE IF EXISTS `booking-type`;

CREATE TABLE `booking-type` (
  `type-id` int(11) NOT NULL,
  `type-name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`type-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `booking-type` */

/*Table structure for table `city` */

DROP TABLE IF EXISTS `city`;

CREATE TABLE `city` (
  `city-id` int(11) NOT NULL,
  `city-name` varchar(100) DEFAULT NULL,
  `country-id` int(11) DEFAULT NULL,
  PRIMARY KEY (`city-id`),
  KEY `country-id` (`country-id`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`country-id`) REFERENCES `country` (`country-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `city` */

/*Table structure for table `country` */

DROP TABLE IF EXISTS `country`;

CREATE TABLE `country` (
  `country-id` int(11) NOT NULL,
  `country-name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`country-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `country` */

insert  into `country`(`country-id`,`country-name`) values 
(1,'Kenya');

/*Table structure for table `flight-class` */

DROP TABLE IF EXISTS `flight-class`;

CREATE TABLE `flight-class` (
  `flightclass-id` int(11) NOT NULL,
  `flight-id` int(11) DEFAULT NULL,
  `bookingclass-id` int(11) DEFAULT NULL,
  `no-of-seats` int(11) DEFAULT NULL,
  `unitprice` decimal(10,0) DEFAULT NULL,
  `currency-id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`flightclass-id`),
  KEY `flight-id` (`flight-id`),
  KEY `bookingclass-id` (`bookingclass-id`),
  CONSTRAINT `flight-class_ibfk_1` FOREIGN KEY (`flight-id`) REFERENCES `flights` (`flight-id`),
  CONSTRAINT `flight-class_ibfk_2` FOREIGN KEY (`bookingclass-id`) REFERENCES `bookinclass` (`class-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `flight-class` */

/*Table structure for table `flightbooking` */

DROP TABLE IF EXISTS `flightbooking`;

CREATE TABLE `flightbooking` (
  `booking-id` int(11) NOT NULL,
  `flight-id` int(11) DEFAULT NULL,
  `booking-date` datetime DEFAULT NULL,
  `paymentmethode-id` int(11) DEFAULT NULL,
  `bookingtype-id` int(11) DEFAULT NULL,
  PRIMARY KEY (`booking-id`),
  KEY `flight-id` (`flight-id`),
  KEY `paymentmethode-id` (`paymentmethode-id`),
  KEY `bookingtype-id` (`bookingtype-id`),
  CONSTRAINT `flightbooking_ibfk_1` FOREIGN KEY (`flight-id`) REFERENCES `flights` (`flight-id`),
  CONSTRAINT `flightbooking_ibfk_2` FOREIGN KEY (`paymentmethode-id`) REFERENCES `paymentmethods` (`Methodeid`),
  CONSTRAINT `flightbooking_ibfk_3` FOREIGN KEY (`bookingtype-id`) REFERENCES `booking-type` (`type-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `flightbooking` */

/*Table structure for table `flightbookingpassengers` */

DROP TABLE IF EXISTS `flightbookingpassengers`;

CREATE TABLE `flightbookingpassengers` (
  `passengerboking-id` int(11) NOT NULL,
  `bookingclass-id` int(11) DEFAULT NULL,
  `document-id` int(11) DEFAULT NULL,
  `iddocumentno` varchar(100) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `middlename` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  PRIMARY KEY (`passengerboking-id`),
  KEY `bookingclass-id` (`bookingclass-id`),
  KEY `document-id` (`document-id`),
  CONSTRAINT `flightbookingpassengers_ibfk_1` FOREIGN KEY (`bookingclass-id`) REFERENCES `bookinclass` (`class-id`),
  CONSTRAINT `flightbookingpassengers_ibfk_2` FOREIGN KEY (`document-id`) REFERENCES `traveldocuments` (`document-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `flightbookingpassengers` */

/*Table structure for table `flights` */

DROP TABLE IF EXISTS `flights`;

CREATE TABLE `flights` (
  `flight-id` int(11) NOT NULL,
  `airline-id` int(11) DEFAULT NULL,
  `flight-no` varchar(100) DEFAULT NULL,
  `departurecity` varchar(100) DEFAULT NULL,
  `destinationcity` varchar(100) DEFAULT NULL,
  `departuretime` datetime DEFAULT NULL,
  `duration` time DEFAULT NULL,
  `departure-airport-id` int(11) DEFAULT NULL,
  `Airport_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`flight-id`),
  KEY `departure-airport-id` (`departure-airport-id`),
  KEY `Airport_id` (`Airport_id`),
  CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`departure-airport-id`) REFERENCES `airport` (`airport-id`),
  CONSTRAINT `flights_ibfk_2` FOREIGN KEY (`Airport_id`) REFERENCES `airport` (`airport-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `flights` */

/*Table structure for table `paymentmethods` */

DROP TABLE IF EXISTS `paymentmethods`;

CREATE TABLE `paymentmethods` (
  `Methodeid` int(11) NOT NULL,
  `Methode-Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Methodeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `paymentmethods` */

/*Table structure for table `traveldocuments` */

DROP TABLE IF EXISTS `traveldocuments`;

CREATE TABLE `traveldocuments` (
  `document-id` int(11) NOT NULL,
  `document-name` varchar(100) DEFAULT NULL,
  `document-expires` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`document-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `traveldocuments` */

/* Procedure structure for procedure `sp_checkAirline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkAirline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkAirline`(
    IN p_airlineid VARCHAR(10)
)
BEGIN
    SELECT `airline_id`, `airline_name`, `airline_logo`
    FROM `airline`
    WHERE `airline_id` = p_airlineid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkAirport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkAirport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkAirport`(
    IN p_airportId INT,
    IN p_airportName VARCHAR(100)
)
BEGIN
    SELECT 
        `airport-id`,
        `airportcode`,
        `airport-name`,
        `city-id`
    FROM airport
    WHERE `airport-id` = p_airportId
       OR `airport-name` = p_airportName;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkCity` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkCity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkCity`(
    IN p_city_ID INT,
    IN p_city_Name VARCHAR(100)
)
BEGIN
    SELECT COUNT(*) AS city_exists
    FROM `city`
    WHERE `city-id` = p_city_ID
       OR `city-name` = p_city_Name;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkCountry` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkCountry` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkCountry`(
    IN p_country_ID INT,
    IN p_country_Name VARCHAR(100)
)
BEGIN
    SELECT COUNT(*) AS country_exists
    FROM `country`
    WHERE `country-id`= p_country_ID
       OR `country-name` = p_country_Name;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkFlight` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkFlight` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkFlight`(
    IN p_flight_ID INT,
    IN p_flight_Number VARCHAR(50)
)
BEGIN
    SELECT COUNT(*) AS flight_exists
    FROM `flights`
    WHERE `flight-id` = p_flight_ID
       OR `flight-no` = p_flight_Number;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkPayment` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkPayment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkPayment`(
    IN p_payment_ID INT,
    IN p_method_Name VARCHAR(100)
)
BEGIN
    SELECT * 
    FROM `paymentmethods` 
    WHERE `Methodeid` = p_payment_ID 
       OR `Methode-Name` = p_method_Name;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteCity` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteCity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteCity`(
    IN p_city_ID INT
)
BEGIN
    DELETE FROM City
    WHERE `city-id` = p_city_ID;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteCountry` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteCountry` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteCountry`(
    IN p_country_ID INT
)
BEGIN
    DELETE FROM `country`
    WHERE `country-id` = p_country_ID;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteFlight` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteFlight` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteFlight`(
    IN p_flight_ID INT
)
BEGIN
    DELETE FROM `flights`
    WHERE `flight-id` = p_flight_ID;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletePayment_Methode` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletePayment_Methode` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletePayment_Methode`(
    IN p_methode_ID INT
)
BEGIN
    
        DELETE FROM `paymentmethods` WHERE `Methodeid` = p_methode_ID;
   
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_delete_airline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_delete_airline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_airline`(
    IN p_airlineId INT
)
BEGIN
    DELETE FROM `airline`
    WHERE `airline_id` = p_airlineId;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_delete_airport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_delete_airport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_airport`(
    IN p_airportId INT
)
BEGIN
    DELETE FROM `airport`
    WHERE `airport-id` = p_airportId;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filterAirport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filterAirport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filterAirport`(
    IN p_cityId INT,
    IN p_airportName VARCHAR(100)
)
BEGIN
    SELECT 
        `airport-id`,
        `airport-name`,
        `city-id`
    FROM airport
    WHERE (p_cityId IS NULL OR `city-id` = p_cityId)
      AND (p_airportName IS NULL OR `airport-name` LIKE CONCAT('%', p_airportName, '%'))
    ORDER BY `airport-name` ASC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filterCities` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filterCities` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filterCities`(
    IN p_country_ID INT,
    IN p_city_Name VARCHAR(100)
)
BEGIN
    SELECT `city-id`, `city-name`, `country-id`
    FROM `city`
    WHERE (p_country_ID IS NULL OR `city-id` = p_country_ID)
      AND (p_city_Name IS NULL OR `city-name` LIKE CONCAT('%', p_city_Name, '%'))
    ORDER BY `city-name` ASC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filtercountries` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filtercountries` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filtercountries`(
    IN p_countryid INT,
    IN p_countryname VARCHAR(100)
)
BEGIN
   
    SELECT `country-id`, `country-name`
    FROM `country`
    WHERE (p_countryid = 0 OR `country-id` = p_countryid)
      AND (p_countryname IS NULL OR `country-name` LIKE CONCAT('%', p_countryname, '%'))
    ORDER BY `country-name` ASC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filterFlights` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filterFlights` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filterFlights`(
    IN p_airport_ID INT,
    IN p_flight_Number VARCHAR(50)
)
BEGIN
    SELECT 
        f.`flight-id`,
        f.`flight-no`,
        f.`Airport_id`,
        a.`airport-name`
    FROM Flight f
    LEFT JOIN `airport` a ON f.`Airport_id` = a.`airport-id`
    WHERE (p_airport_ID IS NULL OR f.`Airport_id` = p_airport_ID)
      AND (p_flight_Number IS NULL OR f.`flight-no` LIKE CONCAT('%', p_flight_Number, '%'))
    ORDER BY f.`flight-id` DESC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filterPayments_Methode` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filterPayments_Methode` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filterPayments_Methode`(
    IN p_methode_ID INT,
    IN p_methode_Name VARCHAR(100)
)
BEGIN
    SELECT 
        `Methodeid`,
        `Methode-Name`
    FROM `paymentmethods`
    WHERE (p_methode_ID IS NULL OR `Methodeid` = p_methode_ID)
      AND (p_methode_Name IS NULL OR `Methode-Name` LIKE CONCAT('%', p_methode_Name, '%'))
    ORDER BY `Methode-Name` ASC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filter_airline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filter_airline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filter_airline`(
    IN p_active TINYINT,
    IN p_name VARCHAR(100)
)
BEGIN
    SELECT `airline-id`, `airline-name`, `airline-logo`, active
    FROM `airline`
    WHERE (p_country IS NULL OR country = p_country)
      AND (p_active IS NULL OR active = p_active)
      AND (p_name IS NULL OR `airline-name` LIKE CONCAT('%', p_name, '%'))
    ORDER BY `airline-name`;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getAirlineDetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getAirlineDetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getAirlineDetails`(
    IN p_airlineId INT
)
BEGIN
    SELECT `airline-id`, `airline-name`, `airline-logo`
    FROM `airline`
    WHERE `airline-id` = p_airlineId;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getairportDetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getairportDetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getairportDetails`(
    IN p_airportId INT
)
BEGIN
    SELECT 
        `airport-id`,
        `airport-name`,
        `city-id`
    FROM `airport`
    WHERE `airport-id` = p_airportId;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getCities` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getCities` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getCities`()
BEGIN
    SELECT c.`city-id`, 
           c.`city-name`, 
           c.`country-id`, 
           co.`country-name`
    FROM `city` c
    INNER JOIN `country` co ON c.`country-id` = co.`country-id`
    ORDER BY co.`country-name`, c.`city-name`;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getCityDetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getCityDetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getCityDetails`(
    IN p_city_ID INT
)
BEGIN
    SELECT c.`city-id`, 
           c.`city-name`, 
           c.`country-id`, 
           co.`country-name`
    FROM `city` c
    INNER JOIN `country` co ON c.`country-id` = co.`country-id`
    WHERE c.`city-id` = p_city_ID
    LIMIT 1;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getCountries` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getCountries` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getCountries`()
BEGIN
    SELECT 
        o.countryid,
        o.`country-name`,
        
        -- Country cities
        IFNULL((SELECT COUNT(*) 
                FROM `city` AS c 
                WHERE c.countryid = o.countryid), 0) AS cities,
        
        -- Country airports
        IFNULL((SELECT COUNT(*) 
                FROM `airport` a 
                JOIN `city` c ON c.cityid = a.cityid  
                WHERE c.countryid = o.countryid), 0) AS airports,
        
        -- Country airlines
        IFNULL((SELECT COUNT(*) 
                FROM `airline`  
                WHERE homecountryid = o.countryid), 0) AS airlines

    FROM `country` o
    ORDER BY o.`country-name` ASC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getCountryDetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getCountryDetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getCountryDetails`(
    IN p_country_ID INT
)
BEGIN
    SELECT `country-id`, `country-name`
    FROM `country`
    WHERE `country-id` = p_country_ID
    LIMIT 1;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getFlightDetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getFlightDetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getFlightDetails`(
    IN p_flight_ID INT
)
BEGIN
    SELECT 
        f.`flight-id`,
        f.`flight-no`,
        f.`Airport_id`,
        a.`airport-name`
    FROM `flights` f
    LEFT JOIN `airport` a ON f.`airport-id` = a.`Airport_id`
    WHERE f.`flight-id` = p_flight_ID;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getFlights` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getFlights` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getFlights`()
BEGIN
    SELECT 
        f.`flight-id`,
        f.`flight-no`,
        f.`Airport_id`,
        a.`airport-name`
    FROM `flights` f
    LEFT JOIN `airport` a ON f.`airport-id`= a.airport_ID
    ORDER BY f.`flight-id` DESC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getPaymentDetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getPaymentDetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getPaymentDetails`(
    IN p_payment_ID INT
)
BEGIN
    SELECT 
        p.payment_ID,
        p.reference_Number,
        p.amount,
        p.user_ID,
        u.username,
        p.methode_ID,
        m.methode_Name,
        p.created_at
    FROM payment p
    LEFT JOIN users u ON p.user_ID = u.user_ID
    LEFT JOIN payment_methode m ON p.methode_ID = m.methode_ID
    WHERE p.payment_ID = p_payment_ID;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getPaymentMethodes` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getPaymentMethodes` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getPaymentMethodes`()
BEGIN
    SELECT 
        `Methodeid`,
        `Methode-Name`
    FROM `paymentmethods`
    ORDER BY `Methode-Name` ASC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_get_airlines` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_get_airlines` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_airlines`()
BEGIN
    SELECT `airline_id`,  `airline_name`, `airline_logo`
    FROM `airline`
    ORDER BY `airline_name`;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_get_airports` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_get_airports` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_airports`()
BEGIN
    SELECT 
        `airport-id`,
        `airport-name`,
        `city-id`
    FROM `airport`
    ORDER BY `airport-name` ASC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveAirline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveAirline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveAirline`(
    IN p_airlineId INT,
    IN p_airlineName VARCHAR(100),
    IN p_logo INT
)
BEGIN
    -- If airline exists, update it
    IF EXISTS (SELECT 1 FROM `airline` WHERE `airline_id` = p_airlineId) THEN
        UPDATE `airline`
        SET 
            `airline_name` = p_airlineName,
            `airline_logo` = p_logo
        WHERE `airline_id` = p_airlineId;
    ELSE
        -- Otherwise, insert a new airline
        INSERT INTO `airline` (`airline_name`, `airline_logo`)
        VALUES (p_airlineName, p_logo);
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveAirport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveAirport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveAirport`(
    IN p_airportId INT,
    IN p_airportName VARCHAR(100),
    IN p_cityId INT
)
BEGIN
    IF p_airportId = 0 OR p_airportId IS NULL THEN
        -- Insert new airport
        INSERT INTO `airport` (`airport-name`, `city-id`)
        VALUES (p_airportName, p_cityId);
    ELSE
        -- Update existing airport
        UPDATE airport
        SET `airport-name` = p_airportName,
            `city-id`   = p_cityId
        WHERE `airport-id` = p_airportId;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveCity` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveCity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveCity`(
    IN p_city_ID INT,
    IN p_city_Name VARCHAR(100),
    IN p_country_ID INT
)
BEGIN
    -- Insert 
    IF p_city_ID IS NULL OR p_city_ID = 0 THEN
        INSERT INTO City (city_Name, country_ID)
        VALUES (p_city_Name, p_country_ID);

    --  update 
    ELSE
        UPDATE `city`
        SET `city-name` = p_city_Name,
            `country-id` = p_country_ID
        WHERE `city-id` = p_city_ID;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveCountry` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveCountry` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveCountry`(
    IN p_country_ID INT,
    IN p_country_Name VARCHAR(100)
)
BEGIN
    -- If ID = 0 or NULL, insert a new country
    IF p_country_ID IS NULL OR p_country_ID = 0 THEN
        INSERT INTO `country` (`country-name`)
        VALUES (p_country_Name);
    
    -- Otherwise, update existing country
    ELSE
        UPDATE `country`
        SET `country-name` = p_country_Name
        WHERE `country-id` = p_country_ID;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveFlight` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveFlight` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveFlight`(
    IN p_flight_ID INT,
    IN p_flight_Number VARCHAR(50),
    IN p_airline_ID INT
)
BEGIN
    
    IF p_flight_ID IS NULL OR p_flight_ID = 0 THEN
        INSERT INTO Flight (`flight-no`, `airline-id`)
        VALUES (p_flight_Number, p_airport_ID);

    
    ELSE
        UPDATE `flights`
        SET `flight-no` = p_flight_Number,
            `airline-id`    = p_airline_ID
        WHERE `flight-id`= p_flight_ID;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savePayment` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savePayment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savePayment`(
    IN p_methode_ID INT,
    IN p_methode_Name VARCHAR(100)
)
BEGIN
    -- If methode_ID exists, update it
    IF EXISTS (SELECT 1 FROM payment_methode WHERE methode_ID = p_methode_ID) THEN
        UPDATE payment_methode
        SET methode_Name = p_methode_Name
        WHERE methode_ID = p_methode_ID;
    ELSE
        -- Otherwise insert new record
        INSERT INTO payment_methode (methode_Name)
        VALUES (p_methode_Name);
    END IF;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
