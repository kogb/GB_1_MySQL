/*
1/ Установите СУБД MySQL. Создайте в домашней директории файл .my.cnf, задав в нем логин и пароль, который указывался при установке.
*/

nikolay@nikolay-GB:~$ nano .my.cnf
nikolay@nikolay-GB:~$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 13
Server version: 8.0.29-0ubuntu0.20.04.3 (Ubuntu)

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

/*
2. Создайте базу данных example, разместите в ней таблицу users, состоящую из двух столбцов, числового id и строкового name.
*/

mysql> CREATE DATABASE example;
Query OK, 1 row affected (0,02 sec)

mysql> USE example;
Database changed
mysql> CREATE TABLE user (id INT, name TEXT);
Query OK, 0 rows affected (0,12 sec)

mysql> DESCRIBE users:
    -> 
[6]+  Stopped                 mysql
nikolay@nikolay-GB:~$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 14
Server version: 8.0.29-0ubuntu0.20.04.3 (Ubuntu)

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> USE example;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed

mysql> DESCRIBE user;
+-------+------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+-------+------+------+-----+---------+-------+
| id    | int  | YES  |     | NULL    |       |
| name  | text | YES  |     | NULL    |       |
+-------+------+------+-----+---------+-------+
2 rows in set (0,00 sec)

mysql> exit
Bye

/*
3. Создайте дамп базы данных example из предыдущего задания, разверните содержимое дампа в новую базу данных sample.
*/

nikolay@nikolay-GB:~$ mysqldump -u root example > example.sql
nikolay@nikolay-GB:~$ ls -la
total 100
drwxr-xr-x 14 nikolay nikolay 4096 ліп 13 20:40 .
drwxr-xr-x  3 root    root    4096 чэр 13 00:12 ..
-rw-------  1 nikolay nikolay  295 ліп 13 19:39 .bash_history
-rw-r--r--  1 nikolay nikolay  220 чэр 13 00:12 .bash_logout
-rw-r--r--  1 nikolay nikolay 3771 чэр 13 00:12 .bashrc
drwx------ 12 nikolay nikolay 4096 ліп 13 19:55 .cache
drwx------ 12 nikolay nikolay 4096 ліп 13 19:55 .config
drwxr-xr-x  2 nikolay nikolay 4096 чэр 13 00:20 Desktop
drwxr-xr-x  2 nikolay nikolay 4096 чэр 13 00:20 Documents
drwxr-xr-x  2 nikolay nikolay 4096 чэр 13 00:20 Downloads
-rw-rw-r--  1 nikolay nikolay 1809 ліп 13 20:40 example.sql
drwx------  3 nikolay nikolay 4096 чэр 13 00:20 .gnupg
drwx------  3 nikolay nikolay 4096 чэр 13 00:20 .local
drwxr-xr-x  2 nikolay nikolay 4096 чэр 13 00:20 Music
-rw-rw-r--  1 nikolay nikolay   40 ліп 13 20:33 .my.cnf
-rw-------  1 nikolay nikolay   95 ліп 13 20:39 .mysql_history
drwxr-xr-x  2 nikolay nikolay 4096 чэр 13 00:20 Pictures
-rw-r--r--  1 nikolay nikolay  807 чэр 13 00:12 .profile
drwxr-xr-x  2 nikolay nikolay 4096 чэр 13 00:20 Public
-rw-r--r--  1 nikolay nikolay    0 ліп 13 19:08 .sudo_as_admin_successful
drwxr-xr-x  2 nikolay nikolay 4096 чэр 13 00:20 Templates
-rw-r-----  1 nikolay nikolay    5 ліп 13 20:03 .vboxclient-clipboard.pid
-rw-r-----  1 nikolay nikolay    5 ліп 13 20:03 .vboxclient-display-svga-x11.pid
-rw-r-----  1 nikolay nikolay    5 ліп 13 20:03 .vboxclient-draganddrop.pid
-rw-r-----  1 nikolay nikolay    5 ліп 13 20:03 .vboxclient-seamless.pid
drwxr-xr-x  2 nikolay nikolay 4096 чэр 13 00:20 Videos
nikolay@nikolay-GB:~$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 16
Server version: 8.0.29-0ubuntu0.20.04.3 (Ubuntu)

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.


mysql> CREATE DATABASE sample;
Query OK, 1 row affected (0,03 sec)

mysql> USE sample;
Database changed
mysql> SHOW TABLES;
Empty set (0,00 sec)

mysql> exit
Bye
nikolay@nikolay-GB:~$ mysql sample < example.sql
nikolay@nikolay-GB:~$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 18
Server version: 8.0.29-0ubuntu0.20.04.3 (Ubuntu)

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> USE sample;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> SHOW TABLES;
+------------------+
| Tables_in_sample |
+------------------+
| user             |
+------------------+
1 row in set (0,01 sec)

mysql> exit
Bye
/*
4. Ознакомьтесь более подробно с документацией утилиты mysqldump. Создайте дамп единственной таблицы help_keyword базы данных mysql. Причем добейтесь того, чтобы дамп содержал только первые 100 строк таблицы.
*/
nikolay@nikolay-GB:~$ mysqldump -u root -p --opt --where="1 limit 100" mysql help_keyword > help100.sql
Enter password: 
nikolay@nikolay-GB:~$ ls -la
total 104
drwxr-xr-x 14 nikolay nikolay 4096 ліп 13 20:57 .
drwxr-xr-x  3 root    root    4096 чэр 13 00:12 ..
-rw-------  1 nikolay nikolay  295 ліп 13 19:39 .bash_history
-rw-r--r--  1 nikolay nikolay  220 чэр 13 00:12 .bash_logout
-rw-r--r--  1 nikolay nikolay 3771 чэр 13 00:12 .bashrc
drwx------ 12 nikolay nikolay 4096 ліп 13 19:55 .cache
drwx------ 12 nikolay nikolay 4096 ліп 13 19:55 .config
drwxr-xr-x  2 nikolay nikolay 4096 чэр 13 00:20 Desktop
drwxr-xr-x  2 nikolay nikolay 4096 чэр 13 00:20 Documents
drwxr-xr-x  2 nikolay nikolay 4096 чэр 13 00:20 Downloads
-rw-rw-r--  1 nikolay nikolay 1809 ліп 13 20:40 example.sql
drwx------  3 nikolay nikolay 4096 чэр 13 00:20 .gnupg
-rw-rw-r--  1 nikolay nikolay 3657 ліп 13 20:57 help100.sql
drwx------  3 nikolay nikolay 4096 чэр 13 00:20 .local
drwxr-xr-x  2 nikolay nikolay 4096 чэр 13 00:20 Music
-rw-rw-r--  1 nikolay nikolay   40 ліп 13 20:33 .my.cnf
-rw-------  1 nikolay nikolay  232 ліп 13 20:48 .mysql_history
drwxr-xr-x  2 nikolay nikolay 4096 чэр 13 00:20 Pictures
-rw-r--r--  1 nikolay nikolay  807 чэр 13 00:12 .profile
drwxr-xr-x  2 nikolay nikolay 4096 чэр 13 00:20 Public
-rw-r--r--  1 nikolay nikolay    0 ліп 13 19:08 .sudo_as_admin_successful
drwxr-xr-x  2 nikolay nikolay 4096 чэр 13 00:20 Templates
-rw-r-----  1 nikolay nikolay    5 ліп 13 20:03 .vboxclient-clipboard.pid
-rw-r-----  1 nikolay nikolay    5 ліп 13 20:03 .vboxclient-display-svga-x11.pid
-rw-r-----  1 nikolay nikolay    5 ліп 13 20:03 .vboxclient-draganddrop.pid
-rw-r-----  1 nikolay nikolay    5 ліп 13 20:03 .vboxclient-seamless.pid
drwxr-xr-x  2 nikolay nikolay 4096 чэр 13 00:20 Videos
nikolay@nikolay-GB:~$ cat help100*
-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: mysql
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `help_keyword`
--

DROP TABLE IF EXISTS `help_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `help_keyword` (
  `help_keyword_id` int unsigned NOT NULL,
  `name` char(64) NOT NULL,
  PRIMARY KEY (`help_keyword_id`),
  UNIQUE KEY `name` (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='help keywords';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_keyword`
--
-- WHERE:  1 limit 100

LOCK TABLES `help_keyword` WRITE;
/*!40000 ALTER TABLE `help_keyword` DISABLE KEYS */;
INSERT INTO `help_keyword` VALUES (108,'%'),(264,'&'),(422,'(JSON'),(86,'*'),(84,'+'),(85,'-'),(423,'->'),(425,'->>'),(87,'/'),(75,':='),(59,'<'),(266,'<<'),(58,'<='),(56,'<=>'),(57,'<>'),(55,'='),(61,'>'),(60,'>='),(267,'>>'),(90,'ABS'),(879,'ACCOUNT'),(91,'ACOS'),(659,'ACTION'),(49,'ADD'),(120,'ADDDATE'),(121,'ADDTIME'),(913,'ADMIN'),(270,'AES_DECRYPT'),(271,'AES_ENCRYPT'),(581,'AFTER'),(247,'AGAINST'),(934,'AGGREGATE'),(582,'ALGORITHM'),(721,'ALL'),(50,'ALTER'),(583,'ANALYZE'),(62,'AND'),(526,'ANY_VALUE'),(660,'ARCHIVE'),(254,'ARRAY'),(722,'AS'),(464,'ASC'),(185,'ASCII'),(92,'ASIN'),(774,'ASSIGN_GTIDS_TO_ANONYMOUS_TRANSACTIONS'),(6,'ASYMMETRIC_DECRYPT'),(7,'ASYMMETRIC_DERIVE'),(8,'ASYMMETRIC_ENCRYPT'),(9,'ASYMMETRIC_SIGN'),(10,'ASYMMETRIC_VERIFY'),(643,'AT'),(93,'ATAN'),(94,'ATAN2'),(880,'ATTRIBUTE'),(911,'AUTHENTICATION'),(743,'AUTOCOMMIT'),(584,'AUTOEXTEND_SIZE'),(585,'AUTO_INCREMENT'),(458,'AVG'),(586,'AVG_ROW_LENGTH'),(755,'BACKUP'),(769,'BEFORE'),(744,'BEGIN'),(288,'BENCHMARK'),(63,'BETWEEN'),(186,'BIN'),(253,'BINARY'),(563,'BINLOG'),(527,'BIN_TO_UUID'),(460,'BIT_AND'),(269,'BIT_COUNT'),(187,'BIT_LENGTH'),(461,'BIT_OR'),(462,'BIT_XOR'),(17,'BOOL'),(18,'BOOLEAN'),(230,'BOTH'),(647,'BTREE'),(465,'BY'),(42,'BYTE'),(969,'CACHE'),(689,'CALL'),(497,'CAN_ACCESS_COLUMN'),(498,'CAN_ACCESS_DATABASE'),(499,'CAN_ACCESS_TABLE'),(500,'CAN_ACCESS_USER'),(501,'CAN_ACCESS_VIEW'),(661,'CASCADE'),(76,'CASE'),(255,'CAST'),(860,'CATALOG_NAME'),(95,'CEIL'),(96,'CEILING'),(745,'CHAIN'),(881,'CHALLENGE_RESPONSE'),(587,'CHANGE'),(564,'CHANNEL'),(43,'CHAR'),(39,'CHARACTER'),(189,'CHARACTER_LENGTH');
/*!40000 ALTER TABLE `help_keyword` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-13 20:57:35
nikolay@nikolay-GB:~$ 

