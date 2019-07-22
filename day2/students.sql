/*
SQLyog Ultimate - MySQL GUI v8.2 
MySQL - 5.7.14-log : Database - students
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`students` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `students`;

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `courseno` int(11) NOT NULL,
  `coursename` varchar(20) NOT NULL,
  PRIMARY KEY (`courseno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `course` */

insert  into `course`(`courseno`,`coursename`) values (1,'java基础'),(2,'数据库'),(3,'HTML'),(4,'javascript'),(5,'spring');

/*Table structure for table `scores` */

DROP TABLE IF EXISTS `scores`;

CREATE TABLE `scores` (
  `studentno` varchar(8) NOT NULL,
  `courseno` int(11) NOT NULL,
  `score` int(11) DEFAULT NULL,
  PRIMARY KEY (`studentno`,`courseno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `scores` */

insert  into `scores`(`studentno`,`courseno`,`score`) values ('20170101',1,98),('20170101',2,88),('20170101',3,56),('20170101',4,NULL),('20170101',5,60),('20170102',1,55),('20170102',2,66),('20170102',3,78),('20170102',4,NULL),('20170102',5,87),('20170201',1,88),('20170201',2,76),('20170201',3,NULL),('20170201',4,90),('20170201',5,50),('20170202',1,62),('20170202',2,55),('20170202',3,78),('20170202',4,69),('20170202',5,80),('20170301',1,75),('20170301',2,86),('20170301',3,68),('20170301',4,NULL),('20170301',5,93),('20170302',1,82),('20170302',2,74),('20170302',3,67),('20170302',4,NULL),('20170302',5,80),('20170401',1,73),('20170401',2,56),('20170401',3,NULL),('20170401',4,79),('20170401',5,91),('20170402',1,51),('20170402',2,55),('20170402',3,77),('20170402',4,95);

/*Table structure for table `studentinfo` */

DROP TABLE IF EXISTS `studentinfo`;

CREATE TABLE `studentinfo` (
  `studentno` varchar(8) NOT NULL,
  `studentname` varchar(20) NOT NULL,
  `studentsex` varchar(2) NOT NULL,
  `birthday` datetime DEFAULT NULL,
  `speciality` varchar(20) DEFAULT NULL,
  `class` varchar(6) DEFAULT NULL,
  `isparty` int(1) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `homeaddress` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`studentno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `studentinfo` */

insert  into `studentinfo`(`studentno`,`studentname`,`studentsex`,`birthday`,`speciality`,`class`,`isparty`,`email`,`qq`,`homeaddress`) values ('20170101','张无忌','男','1996-05-03 00:00:00','计算机软件','201701',1,'qwert@qq.com','1265432345','广州市天河区'),('20170102','张飞','男','1997-05-03 00:00:00','计算机软件','201701',0,'tgrvxggd@qq5gftg','76543743','广州市海珠区'),('20170201','范冰冰','女','1998-05-03 00:00:00','电子商务','201702',1,'ygtgj@163.com','7654376','广州市花都区'),('20170202','李白','男','1996-05-03 00:00:00','电子商务','201702',0,'hhvf@163.com','876347','广州市天河区'),('20170301','李寻欢','男','1999-05-03 00:00:00','酒店管理','201703',0,'hyhtfhyg@sina.com','87657654','广州市海珠区'),('20170302','陈圆圆','女','1997-05-03 00:00:00','酒店管理','201703',0,'ygdrd@sina.com','3453456','广州市天河区'),('20170401','周伯通','男','1995-05-03 00:00:00','英语','201704',1,'jgbuyg@sohu.con','34563456','广州市花都区'),('20170402','黄蓉','女','1997-05-03 00:00:00','英语','201704',1,'yhgfyutf@sohu.com','87654435','广州市天河区'),('20170501','aaa','男','1998-08-17 00:00:00','外语','201705',0,'jhhgu@qq.com','98765456','广州市天河区');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
