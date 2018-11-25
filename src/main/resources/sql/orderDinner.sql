/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.7.21-log : Database - order_dinner
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`order_dinner` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `order_dinner`;

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `food_name` varchar(50) DEFAULT NULL,
  `price` varchar(50) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  `flag` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `menu` */

insert  into `menu`(`id`,`food_name`,`price`,`image`,`update_time`,`flag`) values (5,'1312321','12321','/images/0a95a05b94e446b8bd738f210547aabc.jpg',1543124495447,1);

/*Table structure for table `menu_type` */

DROP TABLE IF EXISTS `menu_type`;

CREATE TABLE `menu_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `menu_type` */

insert  into `menu_type`(`id`,`name`,`remark`,`sort`) values (1,'qqq','qqq',NULL),(2,'aaa','aaa',NULL);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `flag` varchar(50) DEFAULT '1' COMMENT '0商家1顾客',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`user_name`,`password`,`name`,`sex`,`flag`) values (1,'111','111','111',0,'1'),(2,'root','123456','aa',1,'0');

/*Table structure for table `user_menu` */

DROP TABLE IF EXISTS `user_menu`;

CREATE TABLE `user_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  `flag` int(10) DEFAULT NULL COMMENT '1购物车2已完结',
  `data_day` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `user_menu` */

insert  into `user_menu`(`id`,`user_id`,`menu_id`,`update_time`,`flag`,`data_day`) values (1,2,5,1543157856906,1,1543075200),(2,2,5,1543157963283,1,1543075200);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
