-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `ISBN` varchar(20) NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Author_name` varchar(255) DEFAULT NULL,
  `Description` text,
  `Copies_on_loan` int DEFAULT NULL,
  `Number_of_copies` int DEFAULT NULL,
  `publisher_code` int DEFAULT NULL,
  `Genre_ID` int DEFAULT NULL,
  PRIMARY KEY (`ISBN`),
  KEY `publisher_code` (`publisher_code`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`publisher_code`) REFERENCES `publisher` (`publisher_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES ('978-0061120084','The Catcher in the Rye','J.D. Salinger','Coming-of-age novel about teenage angst',0,10,29,3),('978-0062315007','The Goldfinch','Donna Tartt','Literary novel about a young boy who survives a terrorist attack',0,10,12,3),('978-0062325146','Brave New World','Aldous Huxley','Dystopian novel about a future world state',0,10,26,2),('978-0062498533','To Kill a Mockingbird','Harper Lee','Classic novel exploring racial injustice in the American South',0,10,5,3),('978-0062671158','Nineteen Eighty-Four','George Orwell','Dystopian novel about a totalitarian regime',0,10,31,2),('978-0140186834','The Catcher in the Rye','J.D. Salinger','Coming-of-age novel about teenage angst',0,10,6,3),('978-0140449198','One Hundred Years of Solitude','Gabriel GarcÃ­a MÃ¡rquez','Novel depicting the BuendÃ­a family\'s history',0,10,28,12),('978-0141439563','Moby-Dick','Herman Melville','Novel about the journey of the whaling ship Pequod',0,10,33,15),('978-0141439594','The Catcher in the Rye','J.D. Salinger','Coming-of-age novel about teenage angst',0,10,37,3),('978-0143127550','The Fault in Our Stars','John Green','Young adult novel about two cancer patients who fall in love',0,10,8,4),('978-0312282990','The Grapes of Wrath','John Steinbeck','Novel about the plight of a family during the Great Depression',0,10,25,10),('978-0316228534','The Martian','Andy Weir','Science fiction novel about an astronaut stranded on Mars',0,10,4,2),('978-0316769488','The Catcher in the Rye','J.D. Salinger','Coming-of-age novel about teenage angst',0,10,34,3),('978-0385514240','The Catcher in the Rye','J.D. Salinger','Coming-of-age novel about teenage angst',0,10,23,3),('978-0451457998','The Hobbit','J.R.R. Tolkien','Fantasy novel about the journey of Bilbo Baggins',0,10,1,1),('978-0451457999','The Fellowship of the Ring','J.R.R. Tolkien','Fantasy novel about the journey of the Ring',0,10,22,1),('978-0525509288','Circe','Madeline Miller','Retelling of the story of the Greek mythological figure Circe',0,10,17,8),('978-0547928227','Harry Potter and the Philosopher\'s Stone','J.K. Rowling','Fantasy novel about a young wizard',0,10,2,1),('978-0553382836','The Shining','Stephen King','Horror novel about a haunted hotel',0,10,30,13),('978-0553803716','Dune','Frank Herbert','Science fiction novel set in a distant future',0,10,11,2),('978-0743273565','The Great Gatsby','F. Scott Fitzgerald','Classic novel set in the Jazz Age',0,10,7,3),('978-0812988406','Becoming','Michelle Obama','Memoir of former First Lady Michelle Obama',0,10,10,6),('978-0812988407','Animal Farm','George Orwell','Satirical allegorical novella about Stalinism',0,10,24,2),('978-1250301697','Where the Crawdads Sing','Delia Owens','Mystery novel about a young girl growing up in the marshes of North Carolina',0,10,18,9),('978-1400079988','Frankenstein','Mary Shelley','Science fiction novel about a scientist who creates a sapient creature',0,10,32,14),('978-1451673318','The Girl on the Train','Paula Hawkins','Thriller novel about a woman who becomes involved in a missing persons investigation',0,10,35,5),('978-1451673319','The Girl on the Train','Paula Hawkins','Thriller novel about a woman who becomes involved in a missing persons investigation',0,10,9,5),('978-1781398210','The Great Gatsby','F. Scott Fitzgerald','Classic novel set in the Jazz Age',0,10,36,3),('978-1982104156','The Odyssey','Homer','Epic poem recounting the journey of Odysseus',0,10,27,11),('978-1984801258','1984','George Orwell','Dystopian novel about a totalitarian regime',0,10,3,2);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrows`
--

DROP TABLE IF EXISTS `borrows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrows` (
  `Loan_ID` int NOT NULL,
  `checkout_date` date DEFAULT NULL,
  `Due_date` date DEFAULT NULL,
  `Return_date` date DEFAULT NULL,
  `Staff_ID` int DEFAULT NULL,
  `Member_ID` int DEFAULT NULL,
  `ISBN` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Loan_ID`),
  KEY `Staff_ID` (`Staff_ID`),
  KEY `Member_ID` (`Member_ID`),
  KEY `ISBN` (`ISBN`),
  CONSTRAINT `borrows_ibfk_1` FOREIGN KEY (`Staff_ID`) REFERENCES `staff` (`Staff_ID`),
  CONSTRAINT `borrows_ibfk_2` FOREIGN KEY (`Member_ID`) REFERENCES `member` (`Member_ID`),
  CONSTRAINT `borrows_ibfk_3` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrows`
--

LOCK TABLES `borrows` WRITE;
/*!40000 ALTER TABLE `borrows` DISABLE KEYS */;
INSERT INTO `borrows` VALUES (1,'2024-04-01','2024-05-01','2024-04-20',1,1,'978-0451457998'),(2,'2024-04-02','2024-05-02','2024-04-21',2,2,'978-0547928227'),(3,'2024-04-03','2024-05-03','2024-04-22',3,3,'978-1984801258'),(4,'2024-04-04','2024-05-04','2024-04-23',4,4,'978-0316228534'),(5,'2024-04-05','2024-05-05','2024-04-23',5,5,'978-0062498533'),(6,'2024-04-06','2024-05-06','2024-04-25',6,6,'978-0140186834'),(7,'2024-04-07','2024-05-07','2024-04-23',7,7,'978-0743273565'),(8,'2024-04-08','2024-05-08','2024-04-23',8,8,'978-0143127550'),(9,'2024-04-09','2024-05-09','2024-04-23',9,9,'978-1451673319'),(10,'2024-04-10','2024-05-10','2024-04-29',10,10,'978-0812988406'),(11,'2024-04-20','2024-05-20','2024-04-27',2,26,'978-0062325146'),(12,'2024-04-20','2024-05-20',NULL,2,26,'978-0061120084'),(13,'2024-04-20','2024-05-20',NULL,2,24,'978-0553382836'),(14,'2024-04-20','2024-05-20',NULL,2,13,'978-0062671158'),(15,'2024-04-20','2024-05-20',NULL,2,15,'978-1400079988');
/*!40000 ALTER TABLE `borrows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card` (
  `Card_number` int NOT NULL,
  `Issue_date` date DEFAULT NULL,
  `Expiry_date` date DEFAULT NULL,
  `Member_ID` int DEFAULT NULL,
  PRIMARY KEY (`Card_number`),
  KEY `Member_ID` (`Member_ID`),
  CONSTRAINT `card_ibfk_1` FOREIGN KEY (`Member_ID`) REFERENCES `member` (`Member_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
INSERT INTO `card` VALUES (1001,'2024-04-01','2025-04-27',1),(1002,'2024-04-02','2025-04-02',2),(1003,'2024-04-03','2025-04-03',3),(1004,'2024-04-04','2025-04-04',4),(1005,'2024-04-05','2025-04-05',5),(1006,'2024-04-06','2025-04-06',6),(1007,'2024-04-07','2025-04-07',7),(1008,'2024-04-08','2025-04-08',8),(1009,'2024-04-09','2025-04-09',9),(1010,'2024-04-10','2025-04-10',10),(1011,'2024-04-11','2025-04-11',11),(1012,'2024-04-12','2025-04-12',12),(1013,'2024-04-13','2025-04-13',13),(1014,'2024-04-14','2025-04-14',14),(1015,'2024-04-15','2025-04-15',15),(1016,'2024-04-16','2025-04-16',16),(1017,'2024-04-17','2025-04-17',17),(1018,'2024-04-18','2025-04-18',18),(1019,'2024-04-19','2025-04-19',19),(1020,'2024-04-20','2025-04-20',20),(1021,'2024-04-21','2025-04-21',21),(1022,'2024-04-22','2025-04-22',22),(1023,'2024-04-23','2025-04-23',23),(1024,'2024-04-24','2025-04-24',24),(1025,'2024-04-25','2025-04-25',25),(1026,'2024-04-26','2025-04-26',26),(1027,'2024-04-27','2025-04-27',27),(1028,'2024-04-28','2025-04-28',28),(1029,'2024-04-29','2025-04-29',29),(1030,'2024-04-30','2025-04-30',30);
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `Genre_ID` int DEFAULT NULL,
  `ISBN` varchar(20) DEFAULT NULL,
  KEY `ISBN` (`ISBN`),
  CONSTRAINT `genre_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'978-0451457998'),(1,'978-0547928227'),(2,'978-1984801258'),(2,'978-0316228534'),(3,'978-0062498533'),(3,'978-0140186834'),(3,'978-0743273565'),(4,'978-0143127550'),(5,'978-1451673319'),(6,'978-0812988406'),(2,'978-0553803716'),(3,'978-0062315007'),(7,'978-0525509288'),(8,'978-1250301697'),(1,'978-0451457999'),(3,'978-0385514240'),(2,'978-0812988407'),(10,'978-0312282990'),(2,'978-0062325146'),(11,'978-1982104156'),(12,'978-0140449198'),(3,'978-0061120084'),(13,'978-0553382836'),(2,'978-0062671158'),(14,'978-1400079988'),(15,'978-0141439563'),(3,'978-0316769488'),(5,'978-1451673318'),(3,'978-1781398210');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `Member_ID` int NOT NULL,
  `SSN` varchar(20) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Phone_number` varchar(20) DEFAULT NULL,
  `Home_addr` varchar(255) DEFAULT NULL,
  `Campus_addr` varchar(255) DEFAULT NULL,
  `Mem_card_num` int DEFAULT NULL,
  `Is_faculty` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Member_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'123-45-6789','John Doe','123-456-7890','123 Main St','Campus Building A',1001,0),(2,'987-65-4321','Jane Smith','987-654-3210','456 Elm St','Campus Building B',1002,1),(3,'111-22-3333','Alice Johnson','111-222-3333','789 Oak St','Campus Building C',1003,0),(4,'444-55-6666','Bob Williams','444-555-6666','321 Pine St','Campus Building D',1004,0),(5,'777-88-9999','Emily Brown','777-888-9999','456 Maple St','Campus Building E',1005,0),(6,'222-33-4444','Michael Davis','222-333-4444','987 Cedar St','Campus Building F',1006,0),(7,'555-66-7777','Sarah Taylor','555-666-7777','654 Birch St','Campus Building G',1007,0),(8,'888-99-0000','David Martinez','888-999-0000','135 Walnut St','Campus Building H',1008,0),(9,'333-44-5555','Samantha Miller','333-444-5555','246 Cherry St','Campus Building I',1009,0),(10,'666-77-8888','James Wilson','666-777-8888','789 Elmwood St','Campus Building J',1010,0),(11,'999-00-1111','Olivia Rodriguez','999-000-1111','987 Spruce St','Campus Building K',1011,0),(12,'444-55-6666','Liam Garcia','444-555-6666','357 Oakwood St','Campus Building L',1012,1),(13,'777-88-9999','Isabella Hernandez','777-888-9999','753 Maplewood St','Campus Building M',1013,0),(14,'222-33-4444','Emma Lopez','222-333-4444','246 Cedarwood St','Campus Building N',1014,1),(15,'555-66-7777','Mason Gonzales','555-666-7777','987 Birchwood St','Campus Building O',1015,0),(16,'888-99-0000','Ethan Perez','888-999-0000','753 Pinewood St','Campus Building P',1016,1),(17,'333-44-5555','Lucas Torres','333-444-5555','357 Walnutwood St','Campus Building Q',1017,0),(18,'666-77-8888','Harper Roberts','666-777-8888','987 Birchwood St','Campus Building R',1018,0),(19,'999-00-1111','Avery Ramirez','999-000-1111','753 Pinewood St','Campus Building S',1019,0),(20,'444-55-6666','William Campbell','444-555-6666','357 Oakwood St','Campus Building T',1020,0),(21,'777-88-9999','Evelyn Cox','777-888-9999','753 Maplewood St','Campus Building U',1021,0),(22,'222-33-4444','Aria Gray','222-333-4444','246 Cedarwood St','Campus Building V',1022,1),(23,'555-66-7777','Alexander James','555-666-7777','987 Birchwood St','Campus Building W',1023,1),(24,'888-99-0000','Julian Fisher','888-999-0000','753 Pinewood St','Campus Building X',1024,1),(25,'333-44-5555','Sofia Hughes','333-444-5555','357 Walnutwood St','Campus Building Y',1025,0),(26,'666-77-8888','Charlotte Russell','666-777-8888','987 Birchwood St','Campus Building Z',1026,0),(27,'999-00-1111','Levi Turner','999-000-1111','753 Pinewood St','Campus Building AA',1027,0),(28,'444-55-6666','Aiden Ward','444-555-6666','357 Oakwood St','Campus Building BB',1028,0),(29,'777-88-9999','Owen Cruz','777-888-9999','753 Maplewood St','Campus Building CC',1029,0),(30,'222-33-4444','Grace Austin','222-333-4444','246 Cedarwood St','Campus Building DD',1030,0);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `physical_presence`
--

DROP TABLE IF EXISTS `physical_presence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `physical_presence` (
  `Visit_ID` int NOT NULL,
  `Member_ID` int DEFAULT NULL,
  `Enter_time` datetime DEFAULT NULL,
  `Exit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`Visit_ID`),
  KEY `Member_ID` (`Member_ID`),
  CONSTRAINT `physical_presence_ibfk_1` FOREIGN KEY (`Member_ID`) REFERENCES `member` (`Member_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `physical_presence`
--

LOCK TABLES `physical_presence` WRITE;
/*!40000 ALTER TABLE `physical_presence` DISABLE KEYS */;
INSERT INTO `physical_presence` VALUES (1,1,'2024-04-26 09:00:00','2024-04-26 11:30:00'),(2,6,'2024-04-26 10:15:00','2024-04-26 12:45:00'),(3,22,'2024-04-26 11:30:00','2024-04-26 14:00:00'),(4,4,'2024-04-26 12:45:00','2024-04-26 15:30:00'),(5,5,'2024-04-26 13:30:00','2024-04-26 16:45:00'),(6,11,'2024-04-26 14:45:00','2024-04-26 18:00:00'),(7,17,'2024-04-26 15:30:00','2024-04-26 19:15:00'),(8,18,'2024-04-26 16:45:00','2024-04-26 20:30:00'),(9,19,'2024-04-26 17:30:00','2024-04-26 21:45:00'),(10,10,'2024-04-26 18:45:00','2024-04-26 22:00:00'),(11,11,'2024-04-27 09:30:00','2024-04-27 12:00:00'),(12,9,'2024-04-27 10:45:00','2024-04-27 13:30:00'),(13,8,'2024-04-27 11:30:00','2024-04-27 15:00:00'),(14,7,'2024-04-27 12:45:00','2024-04-27 16:15:00'),(15,16,'2024-04-27 13:30:00','2024-04-27 17:45:00'),(16,17,'2024-04-27 14:45:00','2024-04-27 19:00:00'),(17,25,'2024-04-27 15:30:00','2024-04-27 20:15:00'),(18,18,'2024-04-27 16:45:00','2024-04-27 21:30:00'),(19,22,'2024-04-27 17:30:00','2024-04-27 22:45:00'),(20,1,'2024-04-27 18:45:00','2024-04-28 00:00:00'),(21,5,'2024-04-28 09:15:00','2024-04-28 11:30:00'),(22,2,'2024-04-28 10:30:00','2024-04-28 13:45:00'),(23,23,'2024-04-28 11:45:00','2024-04-28 15:00:00'),(24,4,'2024-04-28 13:00:00','2024-04-28 16:15:00'),(25,25,'2024-04-28 14:15:00','2024-04-28 17:30:00'),(26,6,'2024-04-28 15:30:00','2024-04-28 18:45:00'),(27,27,'2024-04-28 16:45:00','2024-04-28 20:00:00'),(28,28,'2024-04-28 18:00:00','2024-04-28 21:15:00'),(29,9,'2024-04-28 19:15:00','2024-04-28 22:30:00'),(30,3,'2024-04-28 20:30:00','2024-04-28 23:45:00');
/*!40000 ALTER TABLE `physical_presence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publisher` (
  `publisher_code` int NOT NULL,
  `publisher_name` varchar(255) DEFAULT NULL,
  `publisher_country` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`publisher_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (1,'Book Haven','United States'),(2,'Novel World','United Kingdom'),(3,'Storyteller Press','Canada'),(4,'Page Turner Books','Australia'),(5,'Imagination Ink','Germany'),(6,'Plot Twist Publishers','France'),(7,'Adventure Books','Italy'),(8,'Chapter One Publishing','Spain'),(9,'Verse Ventures','Japan'),(10,'Whimsy Press','South Korea'),(11,'Fiction Forge','India'),(12,'Legend Books','Brazil'),(17,'Dreamscape Publishing','Mexico'),(18,'Quest Publishing','Argentina'),(22,'Frontier Press','South Africa'),(23,'Fantasy Fiction','New Zealand'),(24,'Mythical Publishing','Netherlands'),(25,'Saga Books','Sweden'),(26,'Tale Teller Press','Denmark'),(27,'Enigma Editions','Norway'),(28,'Fable Publishing','Finland'),(29,'Chronicle Books','Ireland'),(30,'Mythos Media','Switzerland'),(31,'Epic Tales','Austria'),(32,'Legend Lore','Portugal'),(33,'Spectacle Stories','Belgium'),(34,'Whispering Woods','Greece'),(35,'Adventurous Reads','Poland'),(36,'Fairytale Publishing','Russia'),(37,'Mystery Manor','Czech Republic');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `Staff_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Job_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Staff_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'John Doe','Chief Librarian'),(2,'Jane Smith','Departmental Associate Librarian'),(3,'Alice Johnson','Reference Librarian'),(4,'Bob Williams','Check-out Staff'),(5,'Emily Brown','Library Assistant'),(6,'Michael Davis','Departmental Associate Librarian'),(7,'Sarah Taylor','Reference Librarian'),(8,'David Martinez','Check-out Staff'),(9,'Samantha Miller','Library Assistant'),(10,'James Wilson','Reference Librarian'),(97,NULL,NULL);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-27 18:47:46
