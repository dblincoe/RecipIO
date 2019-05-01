-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: team_14
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.04.1

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
-- Table structure for table `CommentVotes`
--

DROP TABLE IF EXISTS `CommentVotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CommentVotes` (
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `vote_value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_id`,`user_id`),
  KEY `CommentVotes_ibfk_2` (`user_id`),
  CONSTRAINT `CommentVotes_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `Comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CommentVotes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CommentVotes`
--

LOCK TABLES `CommentVotes` WRITE;
/*!40000 ALTER TABLE `CommentVotes` DISABLE KEYS */;
INSERT INTO `CommentVotes` VALUES (47,2,1),(48,17,1),(50,2,0);
/*!40000 ALTER TABLE `CommentVotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comments`
--

DROP TABLE IF EXISTS `Comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipe_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment_text` text NOT NULL,
  `time_posted` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `Comments_ibfk_1` (`recipe_id`),
  KEY `Comments_ibfk_2` (`user_id`),
  CONSTRAINT `Comments_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `Recipes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comments`
--

LOCK TABLES `Comments` WRITE;
/*!40000 ALTER TABLE `Comments` DISABLE KEYS */;
INSERT INTO `Comments` VALUES (47,15,1,'aaaaa\';) DROP TABLE Users;--','2019-04-30 01:28:34'),(48,18,17,'Wow so delicious\n','2019-04-30 01:38:48'),(49,1,17,'I like to put bananas in mine','2019-04-30 01:39:18'),(50,15,17,'Yum!','2019-04-30 01:39:36'),(51,19,1,'Wow! I really love this recipe Sammy Boy! I made some for my whole family the other day! Really Great! 1 upvote!!','2019-04-30 01:54:21');
/*!40000 ALTER TABLE `Comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `CommentsWithVotes`
--

DROP TABLE IF EXISTS `CommentsWithVotes`;
/*!50001 DROP VIEW IF EXISTS `CommentsWithVotes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `CommentsWithVotes` AS SELECT 
 1 AS `id`,
 1 AS `recipe_id`,
 1 AS `user_id`,
 1 AS `comment_text`,
 1 AS `time_posted`,
 1 AS `vote_score`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Ingredients`
--

DROP TABLE IF EXISTS `Ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ingredients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ingredient_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ingredients`
--

LOCK TABLES `Ingredients` WRITE;
/*!40000 ALTER TABLE `Ingredients` DISABLE KEYS */;
INSERT INTO `Ingredients` VALUES (2,'All-Purpose Flour'),(34,'Bacon'),(4,'Baking Powder'),(5,'Baking Soda'),(26,'beer'),(25,'bread'),(11,'Brown Sugar'),(8,'Butter'),(40,'Cheddar Cheese'),(38,'Chicken Breast'),(12,'Chocolate Chips'),(42,'Coconut Oil'),(46,'Cooking Spray'),(41,'Cottage Cheese'),(29,'Cream of Chicken Soup'),(16,'Cucumber'),(7,'Egg'),(17,'Fresh Mint'),(36,'Garlic'),(15,'Grapefruit'),(18,'Ice'),(13,'Lemon'),(14,'Lime'),(39,'Macaroni'),(9,'Margerine'),(45,'Milk'),(44,'onion'),(43,'Paprika'),(35,'Parmesan Cheese'),(10,'Peanut Butter'),(37,'Pepper'),(27,'Poppyseeds'),(28,'Ritz Crackers'),(6,'Salt'),(30,'Sour Cream'),(33,'Spaghetti'),(19,'Water'),(3,'White Sugar'),(1,'White Vinegar');
/*!40000 ALTER TABLE `Ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PageViews`
--

DROP TABLE IF EXISTS `PageViews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PageViews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipe_id` int(11) NOT NULL,
  `view_count` int(11) NOT NULL DEFAULT '0',
  `view_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `recipe_id` (`recipe_id`),
  CONSTRAINT `PageViews_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `Recipes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PageViews`
--

LOCK TABLES `PageViews` WRITE;
/*!40000 ALTER TABLE `PageViews` DISABLE KEYS */;
INSERT INTO `PageViews` VALUES (28,15,44,'2019-04-30 00:00:00'),(29,1,49,'2019-04-30 00:00:00'),(32,18,38,'2019-04-30 00:00:00'),(33,19,17,'2019-04-30 00:00:00'),(34,20,13,'2019-04-30 00:00:00'),(35,21,10,'2019-04-30 00:00:00'),(37,15,1,'2019-05-01 00:00:00'),(38,1,5,'2019-05-01 00:00:00');
/*!40000 ALTER TABLE `PageViews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RecipeIngredients`
--

DROP TABLE IF EXISTS `RecipeIngredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RecipeIngredients` (
  `recipe_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `amountText` varchar(100) NOT NULL,
  PRIMARY KEY (`recipe_id`,`ingredient_id`),
  KEY `ingredient_id` (`ingredient_id`),
  CONSTRAINT `RecipeIngredients_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `Recipes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `RecipeIngredients_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `Ingredients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RecipeIngredients`
--

LOCK TABLES `RecipeIngredients` WRITE;
/*!40000 ALTER TABLE `RecipeIngredients` DISABLE KEYS */;
INSERT INTO `RecipeIngredients` VALUES (1,1,'2 tablespoons'),(1,2,'1 cup'),(1,3,'2 tablespoons'),(1,4,'1 teaspoon'),(1,5,'1/2 teaspoon'),(1,6,'1/2 teaspoon'),(1,7,'1'),(1,8,'2 tablespoons, melted'),(1,45,'3/4 cup'),(1,46,'apply as necessary'),(15,2,'2 Cups, unbleached'),(15,3,'1 Cup'),(15,5,'1 Tsp'),(15,7,'2'),(15,9,'1 Cup'),(15,10,'1 Cup'),(15,11,'1 Cup, packed'),(15,12,'2 Cups'),(18,8,'1 Cup, melted'),(18,27,'1 Tablespoon'),(18,28,'2 cups'),(18,29,'29 oz'),(18,30,'1 cup '),(18,38,'1, boiled and cubed'),(19,7,'2'),(19,8,'enough to cover the bread'),(19,25,'2 slices'),(20,6,'to taste'),(20,7,'3'),(20,33,'12 oz'),(20,34,'8 slices'),(20,35,'1 cup'),(20,36,'2 cloves, minced'),(20,37,'to taste'),(21,6,'1 teaspoon'),(21,7,'1, lightly beaten'),(21,30,'8 oz'),(21,39,'8 oz'),(21,40,'2 cups, shredded'),(21,41,'2 cups, small curd'),(21,42,'1 tablespoon'),(21,43,'to garnish');
/*!40000 ALTER TABLE `RecipeIngredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RecipeSteps`
--

DROP TABLE IF EXISTS `RecipeSteps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RecipeSteps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipe_id` int(11) NOT NULL,
  `step_num` int(11) NOT NULL,
  `step_text` varchar(1500) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `recipe_step` (`recipe_id`,`step_num`),
  KEY `recipe_id` (`recipe_id`),
  CONSTRAINT `RecipeSteps_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `Recipes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RecipeSteps`
--

LOCK TABLES `RecipeSteps` WRITE;
/*!40000 ALTER TABLE `RecipeSteps` DISABLE KEYS */;
INSERT INTO `RecipeSteps` VALUES (91,15,3,'Bake for 12 to 15 minutes in the preheated oven, or until lightly browned at the edges. Allow cookies to cool on the cookie sheets for a minute before removing to wire racks to cool completely. '),(92,15,2,'In a large bowl, cream together the margarine, peanut butter, white sugar, and brown sugar until smooth. Beat in the eggs one at a time, mixing well after each. Combine the flour and baking soda; stir into the peanut butter mixture. Mix in chocolate chips. Drop by heaping spoonfuls onto ungreased cookie sheets'),(93,15,1,'Preheat oven to 325 degrees F (165 degrees C). '),(115,19,1,'Use a cup to cut a circular hole in the middle of the bread'),(116,19,2,'Butter it up and toss it in a pan'),(117,19,3,'Crack an egg and put it in the middle'),(118,19,4,'Butter the cut out hole and toast that too'),(119,19,5,'Enjoy!'),(120,20,1,'Cook spaghetti in a a large pot according to directions. Drain and keep 1 cup pasta water.'),(121,20,2,'In a medium bowl, whisk eggs and parmesan together.'),(122,20,3,'Cook bacon in a large skillet until crispy, then place on paper towel to drain. Keep the fat in the skillet!'),(123,20,4,'Cook garlic in skillet until fragrent, approx 1 minute. Add cooked spaghetti and toss until fully coated. Remove from heat.'),(124,20,5,'Pour in egg and cheese and stir until creamy. Add a couple of tablespoons of pasta water if it gets too thick.'),(125,20,6,'Season with salt and pepper and stir in crumbled bacon. Garnish with parsley if desired.'),(126,18,1,'Preheat oven to 250'),(127,18,2,'Cube chicken breast, place in casserole dish'),(128,18,3,'Stir together soup and sour cream. Pour over chicken\n'),(129,18,4,'Crush ritz crackers, stir into melted butter. Sprinkle over chicken and sauce, then sprinkle poppyseeds over top.'),(130,18,5,'Bake for 25 minutes. Enjoy!'),(131,21,1,'Cook macaroni al dente according to instructions and drain with cold water'),(132,21,2,'Preheat oven to 350F'),(133,21,3,'In a medium bowl combine cottage cheese, cheese, sour cream, egg, and salt. Fold in macaroni.'),(134,21,4,'Grease a 2-Quart casserole dish with coconut oil'),(135,21,5,'Spoon into dish and sprinkle with cheese and paprika'),(136,21,6,'Bake for 45 minutes'),(137,21,7,'Enjoy!'),(139,1,3,'Heat a large skillet over medium heat, and coat with cooking spray. Pour 1/4 cupfuls of batter onto the skillet, and cook until bubbles appear on the surface. Flip with a spatula, and cook until browned on the other side. ');
/*!40000 ALTER TABLE `RecipeSteps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RecipeTags`
--

DROP TABLE IF EXISTS `RecipeTags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RecipeTags` (
  `recipe_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`recipe_id`,`tag_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `RecipeTags_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `Recipes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `RecipeTags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `Tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RecipeTags`
--

LOCK TABLES `RecipeTags` WRITE;
/*!40000 ALTER TABLE `RecipeTags` DISABLE KEYS */;
INSERT INTO `RecipeTags` VALUES (1,1),(19,1),(1,5),(18,5),(21,5),(20,35),(18,53),(18,54),(18,55),(20,55),(21,55),(19,57),(20,57),(19,58),(20,59),(21,60);
/*!40000 ALTER TABLE `RecipeTags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RecipeVotes`
--

DROP TABLE IF EXISTS `RecipeVotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RecipeVotes` (
  `recipe_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `vote_value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`recipe_id`,`user_id`),
  KEY `RecipeVotes_ibfk_2` (`user_id`),
  CONSTRAINT `RecipeVotes_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `Recipes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `RecipeVotes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RecipeVotes`
--

LOCK TABLES `RecipeVotes` WRITE;
/*!40000 ALTER TABLE `RecipeVotes` DISABLE KEYS */;
INSERT INTO `RecipeVotes` VALUES (1,1,0),(1,2,1),(15,2,1),(18,1,1),(18,2,0),(19,1,1),(20,2,1),(21,2,0);
/*!40000 ALTER TABLE `RecipeVotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recipes`
--

DROP TABLE IF EXISTS `Recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Recipes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `time_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `authorID_idx` (`author_id`),
  CONSTRAINT `authorID` FOREIGN KEY (`author_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recipes`
--

LOCK TABLES `Recipes` WRITE;
/*!40000 ALTER TABLE `Recipes` DISABLE KEYS */;
INSERT INTO `Recipes` VALUES (1,'Fluffy Pancakes','Tall and fluffy. These pancakes are just right. Topped with strawberries and whipped cream, they are impossible to resist!','2019-05-01 17:59:16',2),(15,'Aunt Cora\'s World\'s Greatest Cookies','WORLD\'S BEST CHOCOLATE CHIP PEANUT BUTTER COOKIES!','2019-04-30 00:05:03',1),(18,'Grandma\'s Poppyseed Chicken','Delicious poppyseed chicken just like Grandma Jenkins used to make','2019-04-30 02:09:37',17),(19,'Egg in a hole','Pretty basic. Eggs and bread','2019-04-30 01:52:36',17),(20,'Pasta Carbonara','Quick and easy creamy pasta carbonara','2019-04-30 02:03:13',17),(21,'Mac and Jeezy','Delicious mac and cheese brought to you by Terry Crews\n','2019-04-30 02:10:14',17);
/*!40000 ALTER TABLE `Recipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `RecipesWithVotes`
--

DROP TABLE IF EXISTS `RecipesWithVotes`;
/*!50001 DROP VIEW IF EXISTS `RecipesWithVotes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `RecipesWithVotes` AS SELECT 
 1 AS `id`,
 1 AS `title`,
 1 AS `description`,
 1 AS `time_created`,
 1 AS `author_id`,
 1 AS `vote_score`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `SavedRecipes`
--

DROP TABLE IF EXISTS `SavedRecipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SavedRecipes` (
  `user_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`recipe_id`),
  KEY `recipe_id` (`recipe_id`),
  CONSTRAINT `SavedRecipes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SavedRecipes_ibfk_2` FOREIGN KEY (`recipe_id`) REFERENCES `Recipes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SavedRecipes`
--

LOCK TABLES `SavedRecipes` WRITE;
/*!40000 ALTER TABLE `SavedRecipes` DISABLE KEYS */;
INSERT INTO `SavedRecipes` VALUES (1,1),(2,15),(2,18),(17,18);
/*!40000 ALTER TABLE `SavedRecipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tags`
--

DROP TABLE IF EXISTS `Tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Tags_name_uindex` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tags`
--

LOCK TABLES `Tags` WRITE;
/*!40000 ALTER TABLE `Tags` DISABLE KEYS */;
INSERT INTO `Tags` VALUES (5,'american'),(1,'breakfast'),(34,'canadian'),(54,'casserole'),(6,'chinese'),(2,'dessert'),(55,'dinner'),(52,'german'),(3,'healthy'),(33,'indian'),(35,'italian'),(23,'lunch'),(60,'macaroni'),(53,'main course'),(31,'mexican'),(59,'noodles'),(58,'quick'),(57,'simple'),(4,'vegetarian');
/*!40000 ALTER TABLE `Tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password_hash` char(64) NOT NULL,
  `time_creates` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Users_email_uindex` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'Kennan LeJeune','kcl60@case.edu','5f4dcc3b5aa765d61d8327deb882cf99','2019-04-17 03:10:16'),(2,'David Blincoe','drb133@case.edu','5f4dcc3b5aa765d61d8327deb882cf99','2019-04-17 03:10:52'),(17,'Sammy Boy','soj3@case.edu','11b2aa7f1311b2985f82a96951688d0d','2019-04-30 01:28:56'),(18,'Daniel','dlmarc@gmail.com','d8814d062410a1bd2dfb4f87320085e1','2019-04-30 21:25:06'),(19,'dblbil','dblinfoaf','03c69568797ea8bc5465c298361f4be9','2019-05-01 01:09:05');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'team_14'
--
/*!50003 DROP PROCEDURE IF EXISTS `Comments_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team_14`@`%` PROCEDURE `Comments_DELETE`(IN vcomment_id int)
BEGIN
    DELETE FROM Comments WHERE id = vcomment_id;
    DELETE FROM CommentVotes Where comment_id = vcomment_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Comments_INSERT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team_14`@`%` PROCEDURE `Comments_INSERT`(IN vrecipe_id int, IN vuser_id int, IN vcomment_text varchar(500))
BEGIN
    INSERT INTO Comments
    ( recipe_id
    , user_id
    , comment_text
    , time_posted)
    VALUES ( vrecipe_id
           , vuser_id
           , vcomment_text
           , NOW());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Comments_SELECT_by_recipe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team_14`@`%` PROCEDURE `Comments_SELECT_by_recipe`(IN vrecipe_id int, IN vuser_id int)
BEGIN
	SELECT 
		c.id
        , c.recipe_id
        , c.user_id
        , u.user_name
        , c.time_posted
        , c.comment_text
        , c.vote_score
        , IFNULL
			(
            (SELECT cv.vote_value FROM CommentVotes cv WHERE cv.comment_id = c.id AND cv.user_id = vuser_id)
            , 0) AS user_vote
	FROM CommentsWithVotes c
	INNER JOIN Users u
		ON u.id = c.user_id
	WHERE
		c.recipe_id = vrecipe_id
	ORDER BY c.vote_score DESC
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Comments_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team_14`@`%` PROCEDURE `Comments_UPDATE`(IN vcomment_id int, IN vcomment_text varchar(500))
BEGIN
    UPDATE Comments c SET c.comment_text = vcomment_text WHERE c.id = vcomment_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CommentVotes_SAVE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team_14`@`%` PROCEDURE `CommentVotes_SAVE`(IN vcomment_id int, IN vuser_id int, IN visUpvote int)
BEGIN
    DECLARE vCurrentVote int;
    SET vCurrentVote =
            (
                SELECT vote_value
                FROM CommentVotes
                WHERE vcomment_id = comment_id
                  AND user_id = vuser_id
            );
    IF vCurrentVote IS NULL
    THEN
        INSERT INTO CommentVotes
        ( comment_id
        , user_id
        , vote_value)
        VALUES ( vcomment_id
               , vuser_id
               , visUpvote);
    ELSEIF vCurrentVote = visUpvote
    THEN
        UPDATE CommentVotes
        SET vote_value = 0
        WHERE vcomment_id = comment_id
          AND user_id = vuser_id;
    ELSE
        UPDATE CommentVotes
        SET vote_value = visUpvote
        WHERE vcomment_id = comment_id
          AND user_id = vuser_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CommentVotes_SELECT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team_14`@`%` PROCEDURE `CommentVotes_SELECT`(IN vcomment_id int)
BEGIN
    SELECT SUM(cv.vote_value) as vote_count
    FROM Comments c
             LEFT JOIN CommentVotes cv ON c.id = cv.comment_id
    WHERE c.id = vcomment_id
    GROUP BY c.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Ingredients_SAVE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team_14`@`%` PROCEDURE `Ingredients_SAVE`(IN vingredient_name varchar(150))
BEGIN
    IF NOT EXISTS(SELECT name FROM Ingredients WHERE name = vingredient_name)
    THEN
        INSERT INTO `team_14`.`Tags` (`name`) VALUES (vingredient_name);
    END IF;
    SELECT id FROM Ingredients WHERE name = vingredient_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Ingredients_SELECT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team_14`@`%` PROCEDURE `Ingredients_SELECT`()
BEGIN
    SELECT * FROM Ingredients i;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Ingredients_SELECT_by_recipe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team_14`@`%` PROCEDURE `Ingredients_SELECT_by_recipe`(IN vrecipe_id int)
BEGIN
    SELECT *
    FROM Ingredients i
             INNER JOIN RecipeIngredients ri ON ri.ingredient_id = i.id
    WHERE ri.recipe_id = vrecipe_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PageView_INSERT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team_14`@`%` PROCEDURE `PageView_INSERT`(IN vrecipe_id int)
BEGIN
    IF EXISTS(SELECT 1 FROM PageViews p WHERE p.recipe_id = vrecipe_id AND view_date = CURDATE())
    THEN
        UPDATE PageViews
        SET view_count = view_count + 1
        WHERE recipe_id = vrecipe_id
          AND view_date = CURDATE();
    ELSE
        INSERT INTO PageViews
        ( recipe_id
        , view_count
        , view_date)
        VALUES ( vrecipe_id
               , 1
               , CURDATE());
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RecipeAttributes_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team_14`@`%` PROCEDURE `RecipeAttributes_DELETE`(IN vrecipe_id int)
BEGIN
    DELETE FROM RecipeIngredients WHERE recipe_id = vrecipe_id;
    DELETE FROM RecipeSteps WHERE recipe_id = vrecipe_id;
    DELETE FROM RecipeTags WHERE recipe_id = vrecipe_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RecipeIngredients_SAVE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team_14`@`%` PROCEDURE `RecipeIngredients_SAVE`(IN vrecipe_id int, IN vingredient_name varchar(64),
                                                           IN vamount_text varchar(100))
BEGIN
    DECLARE vingredient_id int;
    IF NOT EXISTS(SELECT name FROM Ingredients WHERE name = vingredient_name)
    THEN
        INSERT INTO `team_14`.`Ingredients` (`name`) VALUES (vingredient_name);
    END IF;
    SET vingredient_id = (SELECT id FROM Ingredients WHERE name = vingredient_name);
    INSERT INTO RecipeIngredients
        (recipe_id, ingredient_id, amountText)
    VALUES (vrecipe_id, vingredient_id, vamount_text);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RecipeSteps_SAVE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team_14`@`%` PROCEDURE `RecipeSteps_SAVE`(IN vrecipe_id int, IN vstep_num int, IN vstep_text varchar(1500))
BEGIN
	IF EXISTS (
		SELECT 1 
        FROM RecipeSteps r 
        WHERE r.recipe_id = vrecipe_id 
			AND r.step_num = vstep_num)
	THEN
		UPDATE RecipeSteps
        SET step_text = vstep_text
        WHERE recipe_id = vrecipe_id 
			AND step_num = vstep_num;
    ELSE
		INSERT INTO RecipeSteps
		(
			recipe_id
			, step_num
			, step_text
		)
		VALUES
		(
			vrecipe_id
			, vstep_num
			, vstep_text
		);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RecipeSteps_SELECT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team_14`@`%` PROCEDURE `RecipeSteps_SELECT`(IN recipeId int)
BEGIN
    SELECT *
    FROM RecipeSteps
    WHERE recipe_id = recipeId
    ORDER BY step_num ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Recipes_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team_14`@`%` PROCEDURE `Recipes_DELETE`(IN vrecipe_id int)
BEGIN
    DELETE FROM Recipes WHERE id = vrecipe_id;
    DELETE FROM SavedRecipes WHERE recipe_id = vrecipe_id;
    DELETE FROM RecipeIngredients WHERE recipe_id = vrecipe_id;
    DELETE FROM RecipeSteps WHERE recipe_id = vrecipe_id;
    DELETE FROM RecipeTags WHERE recipe_id = vrecipe_id;
    DELETE FROM RecipeVotes WHERE recipe_id = vrecipe_id;
    DELETE cv
    FROM CommentVotes cv
             INNER JOIN Comments c ON cv.comment_id = c.id
    WHERE c.recipe_id = vrecipe_id;
    DELETE FROM Comments WHERE id = vrecipe_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Recipes_SAVE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team_14`@`%` PROCEDURE `Recipes_SAVE`(IN vid int, IN vtitle varchar(150), IN vdescription text,
                                                 IN vauthor_id int)
BEGIN
    IF vid = -1
    THEN
        INSERT INTO Recipes
        ( title
        , description
        , time_created
        , author_id)
        VALUES ( vtitle
               , vdescription
               , NOW()
               , vauthor_id);
        SET vid = LAST_INSERT_ID();
    ELSE
        UPDATE Recipes
        SET title        = vtitle
          , description  = vdescription
          , time_created = NOW()
          , author_id    = vauthor_id
        WHERE id = vid;
    END IF;
    SELECT vid AS id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Recipes_SELECT_byuser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team_14`@`%` PROCEDURE `Recipes_SELECT_byuser`(IN vqueryUser int, IN vuser_id int)
BEGIN 
	SELECT
		r.id
        , r.title
        , r.description
        , r.time_created
        , r.author_id
        , u.user_name
        , r.vote_score
        , IFNULL
			(
            (SELECT rv.vote_value FROM RecipeVotes rv WHERE rv.recipe_id = r.id AND rv.user_id = vuser_id)
            , 0) AS userVote
	FROM
		RecipesWithVotes r
		INNER JOIN Users u
			ON r.author_id = u.id
            AND u.id = vqueryUser
	ORDER BY r.time_created DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Recipes_SELECT_by_popular` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team_14`@`%` PROCEDURE `Recipes_SELECT_by_popular`(IN vuser_id int)
BEGIN
    DECLARE dayCount INT;
    SET dayCount = 20;
    SELECT r.id
         , r.title
         , r.description
         , r.time_created
         , r.author_id
         , u.user_name
         , r.vote_score
         , IFNULL
        ((SELECT rv.vote_value FROM RecipeVotes rv WHERE rv.recipe_id = r.id AND rv.user_id = vuser_id)
        , 0) AS userVote
    FROM RecipesWithVotes r
             INNER JOIN Users u
                        ON r.author_id = u.id
             INNER JOIN (
        SELECT SUM(v.view_count * (dayCount - DATEDIFF(NOW(), v.view_date))) AS views
             , v.recipe_id
        FROM PageViews v
        WHERE DATEDIFF(NOW(), v.view_date) < dayCount
        GROUP BY recipe_id
    ) p
                        ON r.id = p.recipe_id
    ORDER BY p.views DESC
    LIMIT 0, 100;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Recipes_SELECT_search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team_14`@`%` PROCEDURE `Recipes_SELECT_search`(IN vtext varchar(100), IN vuser_id int)
BEGIN
    SELECT DISTINCT r.id
                  , r.title
                  , r.description
                  , r.time_created
                  , r.author_id
                  , u.user_name
                  , r.vote_score
                  , IFNULL
        ((SELECT rv.vote_value FROM RecipeVotes rv WHERE rv.recipe_id = r.id AND rv.user_id = vuser_id)
        , 0) AS userVote
    FROM RecipesWithVotes r
             LEFT JOIN Users u ON r.author_id = u.id
             LEFT JOIN RecipeIngredients ri ON ri.recipe_id = r.id
             LEFT JOIN Ingredients i ON i.id = ri.ingredient_id
             LEFT JOIN RecipeTags rt ON rt.recipe_id = r.id
             LEFT JOIN Tags t ON t.id = rt.tag_id
    WHERE r.title LIKE CONCAT('%', vtext, '%')
       OR r.description LIKE CONCAT('%', vtext, '%')
       OR u.user_name LIKE CONCAT('%', vtext, '%')
       OR t.name LIKE CONCAT('%', vtext, '%')
       OR i.name LIKE CONCAT('%', vtext, '%')
    ORDER BY r.vote_score DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Recipes_SELECT_top` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team_14`@`%` PROCEDURE `Recipes_SELECT_top`(
IN vuser_id INT
)
BEGIN
	SELECT
		r.id
        , r.title
        , r.description
        , r.time_created
        , r.author_id
        , u.user_name
        , r.vote_score
        , IFNULL
			(
            (SELECT rv.vote_value FROM RecipeVotes rv WHERE rv.recipe_id = r.id AND rv.user_id = vuser_id)
            , 0) AS userVote
	FROM RecipesWithVotes r
	INNER JOIN Users u
			ON r.author_id = u.id
	ORDER BY r.vote_score DESC;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RecipeTags_SAVE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team_14`@`%` PROCEDURE `RecipeTags_SAVE`(IN vrecipe_id int, IN vtag_name varchar(64))
BEGIN
    DECLARE vtag_id int;
    IF NOT EXISTS(SELECT name FROM Tags WHERE name = vtag_name)
    THEN
        INSERT INTO `team_14`.`Tags` (`name`) VALUES (vtag_name);
    END IF;
    SET vtag_id = (SELECT id FROM Tags WHERE name = vtag_name);
    IF NOT EXISTS(SELECT 1 FROM RecipeTags WHERE recipe_id = vrecipe_id AND vtag_id = tag_id)
    THEN
        INSERT INTO RecipeTags (recipe_id, tag_id)
        VALUES (vrecipe_id, vtag_id);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RecipeTags_SELECT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team_14`@`%` PROCEDURE `RecipeTags_SELECT`(IN vrecipe_id int)
BEGIN
    SELECT t.*
    FROM Tags t
        INNER JOIN RecipeTags rt ON t.id = rt.tag_id 
    WHERE rt.recipe_id = vrecipe_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RecipeVotes_SAVE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team_14`@`%` PROCEDURE `RecipeVotes_SAVE`(IN vrecipe_id int, IN vuser_id int, IN visUpvote int)
BEGIN
    DECLARE vCurrentVote int;
    SET vCurrentVote =
            (
                SELECT vote_value
                FROM RecipeVotes
                WHERE vrecipe_id = recipe_id
                  AND user_id = vuser_id
            );
    IF vCurrentVote IS NULL
    THEN
        INSERT INTO RecipeVotes
        ( recipe_id
        , user_id
        , vote_value)
        VALUES ( vrecipe_id
               , vuser_id
               , visUpvote);
    ELSEIF vCurrentVote = visUpvote
    THEN
        UPDATE RecipeVotes
        SET vote_value = 0
        WHERE vrecipe_id = recipe_id
          AND user_id = vuser_id;
    ELSE
        UPDATE RecipeVotes
        SET vote_value = visUpvote
        WHERE vrecipe_id = recipe_id
          AND user_id = vuser_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RecipeVotes_SELECT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team_14`@`%` PROCEDURE `RecipeVotes_SELECT`(IN vrecipe_id int)
BEGIN
    SELECT SUM(IFNULL(rv.vote_value, 0)) as vote_count
    FROM Recipes r
             LEFT JOIN RecipeVotes rv ON r.id = rv.recipe_id
    WHERE r.id = vrecipe_id
    GROUP BY r.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SavedRecipes_isSaved` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team_14`@`%` PROCEDURE `SavedRecipes_isSaved`(IN vrecipe_id int, IN vuser_id int)
BEGIN
    SELECT EXISTS(
                   SELECT 1
                   FROM SavedRecipes
                   WHERE recipe_id = vrecipe_id
                     AND user_id = vuser_id
               ) AS is_saved;
    -- DECLARE IS_SAVED int;
    -- SET IS_SAVED =
    --        (SELECT 1
    --         FROM SavedRecipes
    --         WHERE recipe_id = vrecipe_id
    --           AND user_id = vuser_id);
    -- SELECT IFNULL(IS_SAVED, 0) as is_saved;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SavedRecipes_SAVE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team_14`@`%` PROCEDURE `SavedRecipes_SAVE`(IN vrecipe_id int, IN vuser_id int)
BEGIN
    DECLARE IS_SAVED int;
    IF EXISTS
        (
            SELECT 1
            FROM SavedRecipes
            WHERE recipe_id = vrecipe_id
              AND user_id = vuser_id
        )
    THEN
        DELETE FROM SavedRecipes WHERE recipe_id = vrecipe_id AND user_id = vuser_id;
    ELSE
        INSERT INTO SavedRecipes
        (user_id,
         recipe_id)
        VALUES (vuser_id,
                vrecipe_id);
    END IF;
    SET IS_SAVED =
            (SELECT 1
             FROM SavedRecipes
             WHERE recipe_id = vrecipe_id
               AND user_id = vuser_id);
    SELECT IFNULL(IS_SAVED, 0) as is_saved;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SavedRecipes_SELECT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team_14`@`%` PROCEDURE `SavedRecipes_SELECT`(IN vuser_id int)
BEGIN
	SELECT
		r.id
        , r.title
        , r.description
        , r.time_created
        , r.author_id
        , u.user_name
        , r.vote_score
	FROM RecipesWithVotes r
	INNER JOIN Users u
		ON r.author_id = u.id
	INNER JOIN SavedRecipes s
		ON s.recipe_id = r.id
		AND s.user_id = vuser_id
	ORDER BY r.title ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Tags_SELECT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team_14`@`%` PROCEDURE `Tags_SELECT`()
BEGIN
    SELECT * FROM Tags;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Users_SELECT_byid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team_14`@`%` PROCEDURE `Users_SELECT_byid`(IN vid int)
BEGIN
    SELECT u.id
         , u.user_name
         , u.email
         , u.time_creates
    FROM Users u
    WHERE u.id = vid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `User_authenticate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team_14`@`%` PROCEDURE `User_authenticate`(IN vemail varchar(50), IN vpassword char(64))
BEGIN 
	SELECT (EXISTS(
		SELECT 1
        FROM Users u
        WHERE vemail = u.email
        AND vpassword = u.password_hash
    )) as authenticated,
	(SELECT u.id
        FROM Users u
        WHERE vemail = u.email
        AND vpassword = u.password_hash
    ) as id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `User_check_email` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team_14`@`%` PROCEDURE `User_check_email`(IN vemail varchar(50))
BEGIN
    SELECT (EXISTS(
            SELECT 1
            FROM Users u
            WHERE vemail = u.email
        )) as user_exists;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `User_INSERT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team_14`@`%` PROCEDURE `User_INSERT`(IN vuser_name varchar(50), IN vemail varchar(50),
                                                IN vpassword varchar(50))
BEGIN
    INSERT INTO Users
    (user_name,
     email,
     password_hash)
    VALUES (vuser_name,
            vemail,
            vpassword);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `CommentsWithVotes`
--

/*!50001 DROP VIEW IF EXISTS `CommentsWithVotes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`team_14`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `CommentsWithVotes` AS select `c`.`id` AS `id`,`c`.`recipe_id` AS `recipe_id`,`c`.`user_id` AS `user_id`,`c`.`comment_text` AS `comment_text`,`c`.`time_posted` AS `time_posted`,sum(ifnull(`v`.`vote_value`,0)) AS `vote_score` from (`Comments` `c` left join `CommentVotes` `v` on((`c`.`id` = `v`.`comment_id`))) group by `c`.`id`,`c`.`recipe_id`,`c`.`user_id`,`c`.`comment_text`,`c`.`time_posted` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `RecipesWithVotes`
--

/*!50001 DROP VIEW IF EXISTS `RecipesWithVotes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`team_14`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `RecipesWithVotes` AS select `r`.`id` AS `id`,`r`.`title` AS `title`,`r`.`description` AS `description`,`r`.`time_created` AS `time_created`,`r`.`author_id` AS `author_id`,sum(ifnull(`v`.`vote_value`,0)) AS `vote_score` from (`Recipes` `r` left join `RecipeVotes` `v` on((`r`.`id` = `v`.`recipe_id`))) group by `r`.`id`,`r`.`title`,`r`.`description`,`r`.`time_created`,`r`.`author_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-01 22:37:09
