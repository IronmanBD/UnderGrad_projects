-- MySQL dump 10.13  Distrib 5.7.14, for Win64 (x86_64)
--
-- Host: localhost    Database: cinetophilia_database
-- ------------------------------------------------------
-- Server version	5.7.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `daily_box_office`
--

DROP TABLE IF EXISTS `daily_box_office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_box_office` (
  `dbo_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `movie_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`date`,`movie_id`),
  KEY `dbo_id` (`dbo_id`),
  KEY `movie_id` (`movie_id`),
  CONSTRAINT `daily_box_office_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_box_office`
--

LOCK TABLES `daily_box_office` WRITE;
/*!40000 ALTER TABLE `daily_box_office` DISABLE KEYS */;
INSERT INTO `daily_box_office` VALUES (1,'2017-08-16',2,10000),(2,'2017-08-16',3,15000),(7,'2017-08-16',7,8000),(10,'2017-08-16',8,22000),(3,'2017-08-16',11,12000),(5,'2017-08-17',2,18000),(6,'2017-08-17',3,10000),(8,'2017-08-17',5,20000),(4,'2017-08-17',10,20000),(9,'2017-08-18',11,11000),(18,'2017-08-20',5,15000),(19,'2017-08-20',6,20000),(20,'2017-08-20',7,18000),(17,'2017-08-21',7,21000),(16,'2017-08-21',8,25000),(15,'2017-08-21',9,20000),(13,'2017-08-22',2,22000),(14,'2017-08-22',9,25000),(12,'2017-08-22',10,20000),(11,'2017-08-22',11,10000);
/*!40000 ALTER TABLE `daily_box_office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre` (
  `Genre_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Genre_Type` varchar(50) NOT NULL,
  PRIMARY KEY (`Genre_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Action'),(2,'Horror'),(3,'Comedy');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(100) DEFAULT NULL,
  `Release_date` date DEFAULT NULL,
  `Movie_Length` time DEFAULT NULL,
  `Rating` float DEFAULT NULL,
  `Country` varchar(50) NOT NULL,
  `details` longtext,
  `image_id` varchar(50) NOT NULL,
  `trailer_link` text NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (2,'Spider-Man:Homecoming','2017-07-07','03:06:11',4.3,'USA','Spider-Man (Tom Holland) learns the ropes of being a superhero under the tutelage of Tony Stark (Robert Downey Jr.), all while juggling his responsibilities as high schooler Peter Parker. Eager to prove to Stark that he\'s ready to join the Avengers, Parker soon gets tangled up with a sinister new villain known as the Vulture (Michael Keaton). Zendaya, Donald Glover, and Marisa Tomei co-star. Directed by Jon Watts (Cop Car).Spider-Man (Tom Holland) learns the ropes of being a superhero under the tutelage of Tony Stark (Robert Downey Jr.), all while juggling his responsibilities as high schooler Peter Parker. Eager to prove to Stark that he\'s ready to join the Avengers, Parker soon gets tangled up with a sinister new villain known as the Vulture (Michael Keaton). Zendaya, Donald Glover, and Marisa Tomei co-star. Directed by Jon Watts (Cop Car).','img2.jpg','https://www.youtube.com/embed/n9DwoQ7HWvI?ecver=2'),(3,'Aynabaji','2016-09-30','02:15:40',4.5,'Bangladesh','Ayna is an actor and the prison is his stage. He slips into the characters of the powerful convicted in exchange of money and take their place in prison. This strange profession is borne out of a society that doesn\'t give him a chance to follow his passion of acting, but forces him to act in the real life. Falling in love with the girl next door changes his life equation and he decides to end this career with one last performance. But this one takes him too deep in the rabbit hole. The story unfolds on how an underdog survives in a society that is merciless and struggles his way out from the clutch of crime game in which he is a part too.','img3.jpg','https://www.youtube.com/embed/q4HuPKhyStk?ecver=2'),(4,'Jab Harry met Sejal','2017-08-04','01:40:30',2.9,'India','The story revolves around Harry and Sejal\'s journey across Europe. A search for Sejal\'s engagement ring makes Harry understand love and relationships better. Sejal experiences new found freedom, security and solace in Harry\'s company and in between all of this - there is love, life, lies, thrill, fantasy and the search for the voice within.','img4.jpg','https://www.youtube.com/embed/W5MZevEH5Ns?ecver=2'),(5,'The Foreigner','2017-10-13',NULL,NULL,'UK','A humble businessman with a buried past seeks justice when his daughter is killed in an act of terrorism. A cat-and-mouse conflict ensues with a government official, whose past may hold clues to the killers\' identities.','img5.jpg','https://www.youtube.com/embed/33iuQu3UtjI?ecver=2'),(6,'The Hitman\'s Bodyguard','2017-08-18',NULL,NULL,'USA','The world\'s top bodyguard gets a new client, a hit man who must testify at the International Court of Justice. They must put their differences aside and work together to make it to the trial on time.','img6.jpg','https://www.youtube.com/embed/uPRed1WMEug?ecver=2'),(7,'Moana','2016-11-23','01:51:00',4.8,'UK','In Ancient Polynesia, when a terrible curse incurred by the Demigod Maui reaches Moana\'s island, she answers the Ocean\'s call to seek out the Demigod to set things right.','img7.jpeg','https://www.youtube.com/embed/LKFuXETZUsI?ecver=2'),(8,'Dunkirk','2017-08-01','02:10:00',5,'Canada','Allied soldiers from Belgium, the British Empire and France are surrounded by the German army and evacuated during a fierce battle in World War II.','img8.jpg','https://www.youtube.com/embed/F-eMt3SrfFU?ecver=2'),(9,'Baby Driver','2017-06-28','02:00:20',4.9,'USA','After being coerced into working for a crime boss, a young getaway driver finds himself taking part in a heist doomed to fail.','img9.jpg','https://www.youtube.com/embed/z2z857RSfhk?ecver=2'),(10,'Mad Max: Fury Road','2015-05-15','01:50:00',4.8,'USA','A woman rebels against a tyrannical ruler in postapocalyptic Australia in search for her home-land with the help of a group of female prisoners, a psychotic worshipper, and a drifter named Max.','img10.jpg','https://www.youtube.com/embed/hEJnMQG9ev8?ecver=2'),(11,'Kingsman: The Secret Service','2014-08-01','02:54:00',4.3,'UK','A spy organization recruits an unrefined, but promising street kid into the agency\'s ultra-competitive training program, just as a global threat emerges from a twisted tech genius.','img11.png','https://www.youtube.com/embed/6Nxc-3WpMbg?ecver=2');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_has_genre`
--

DROP TABLE IF EXISTS `movies_has_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies_has_genre` (
  `Movies_ID` int(10) NOT NULL,
  `Genre_ID` int(10) NOT NULL,
  PRIMARY KEY (`Movies_ID`,`Genre_ID`),
  KEY `Genre_ID` (`Genre_ID`),
  CONSTRAINT `movies_has_genre_ibfk_1` FOREIGN KEY (`Movies_ID`) REFERENCES `movies` (`ID`),
  CONSTRAINT `movies_has_genre_ibfk_2` FOREIGN KEY (`Genre_ID`) REFERENCES `genre` (`Genre_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_has_genre`
--

LOCK TABLES `movies_has_genre` WRITE;
/*!40000 ALTER TABLE `movies_has_genre` DISABLE KEYS */;
INSERT INTO `movies_has_genre` VALUES (2,1),(3,1),(5,1),(4,2),(5,3);
/*!40000 ALTER TABLE `movies_has_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewers`
--

DROP TABLE IF EXISTS `reviewers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviewers` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(100) NOT NULL,
  `rating` float DEFAULT NULL,
  `img_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`email`),
  KEY `r_id` (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewers`
--

LOCK TABLES `reviewers` WRITE;
/*!40000 ALTER TABLE `reviewers` DISABLE KEYS */;
INSERT INTO `reviewers` VALUES (5,'Amir Hamza','ah@gmail.com','654',3,'img5.jpg'),(9,'Arefeen Sultan','as@yahoo.com','326',NULL,NULL),(3,'Afrina Zahan Mithila','azm@gmail.com','567',4.5,'img3.jpg'),(6,'Fahim Ahsan Khan','fak@gmail.com','345',NULL,NULL),(7,'Hasib Ahmed','ha@gmail.com','678',NULL,NULL),(8,'Masud Rana','mr@yahoo.com','abc',NULL,NULL),(1,'Nahid Pranto','nh@gmail.com','123',3.5,'img1.jpg'),(4,'Rakib Hossain Ayon','rha@yahoo.com','ert',4.5,'img4.jpg'),(2,'Rasheeq Zaman','rsq@gmail.com','432',3,'img2.jpg');
/*!40000 ALTER TABLE `reviewers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewers_review_movies`
--

DROP TABLE IF EXISTS `reviewers_review_movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviewers_review_movies` (
  `reviewer_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `rating` float DEFAULT NULL,
  `review` varchar(300) NOT NULL,
  PRIMARY KEY (`reviewer_id`,`movie_id`),
  KEY `movie_id` (`movie_id`),
  CONSTRAINT `reviewers_review_movies_ibfk_1` FOREIGN KEY (`reviewer_id`) REFERENCES `reviewers` (`r_id`),
  CONSTRAINT `reviewers_review_movies_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewers_review_movies`
--

LOCK TABLES `reviewers_review_movies` WRITE;
/*!40000 ALTER TABLE `reviewers_review_movies` DISABLE KEYS */;
INSERT INTO `reviewers_review_movies` VALUES (1,2,3,'Average'),(1,3,4.5,'Really Good'),(1,4,4,'Nice!'),(1,5,4.6,'xyz'),(1,11,NULL,'Very Good!!!'),(3,2,2.5,'Not that good!'),(3,7,4.5,'Really good'),(4,2,2,'Bad Movie'),(4,3,3.5,'Nice!'),(5,4,5,'Awesome!'),(5,7,5,'Awesome!');
/*!40000 ALTER TABLE `reviewers_review_movies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-22 21:37:16
