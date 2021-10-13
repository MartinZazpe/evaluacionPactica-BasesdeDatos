/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/ NotasDeUsuario /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE NotasDeUsuario;

DROP TABLE IF EXISTS categories;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS notes;
CREATE TABLE `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `creation_date` date NOT NULL,
  `last_edit_date` date NOT NULL,
  `description_text` text DEFAULT NULL,
  `can_delete` tinyint(4) NOT NULL,
  `deleted` tinyint(4) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS notes_categories;
CREATE TABLE `notes_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_notes` int(11) NOT NULL,
  `id_categories` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_notes` (`id_notes`),
  KEY `id_categories` (`id_categories`),
  CONSTRAINT `notes_categories_ibfk_1` FOREIGN KEY (`id_notes`) REFERENCES `notes` (`id`),
  CONSTRAINT `notes_categories_ibfk_2` FOREIGN KEY (`id_categories`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS users;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;


INSERT INTO categories(id,category) VALUES
(1,'hobbies'),
(2,'pendientes'),
(3,'deudas'),
(4,'ideas'),
(5,'general'),
(6,'datos sensibles'),
(7,'tareas'),
(8,'comidas favoritas'),
(9,'lugares favoritos'),
(10,'lista de deseos');


INSERT INTO notes(id,title,creation_date,last_edit_date,description_text,can_delete,deleted,userId) VALUES
(3,'Lista de pendientes','2021-10-13','2021-10-13',X'6c61766172206c6120726f70612c20736163617220616c20706572726f2c20657374756469617220636f6469676f',1,0,1),
(4,'Hobbies','2021-10-13','2021-10-13',X'736e6f77626f6172642c20746f636172206c612067756974617272612c2069722061206c6120706c617961',1,0,3),
(5,'Mis contraseñas','2021-10-13','2021-10-13',X'7065727269746f733132332c2061677578783737382c203232393438646666382c20346f3833383330396e33',1,0,7),
(6,'Notas generales','2021-10-13','2021-10-13',X'6465626f20636f6d656e7a617220656c2067696d6e6173696f2c206c696d70696172206c6120636173612c206d6520677573746172696120756e206e7565766f206d6163626f6f6b',1,0,9),
(7,'ideas','2021-10-13','2021-10-13',X'4861636572206d69207072696d657220652d636f6d6d657263652c206573747564696172206672616d65776f726b73207468652066726f6e742c20617072656e64657220756e6974793364',1,0,8),
(8,'canciones favoritas','2021-10-13','2021-10-13',X'63616e6369c3b36e2070617261206d69206d75657274652c20656c20616e696c6c6f2064656c206361706974c3a16e206265746f',1,0,5),
(9,'lugares para visitar','2021-10-13','2021-10-13',X'43616e6164612c2066696e6c616e6469612c206e6f7275656761',1,0,2),
(10,'comidas favoritas','2021-10-13','2021-10-13',X'656e73616c61646120636f6e2070616c74612c20677569736f2064652076657264757261732c2063726f717565746173',1,0,7),
(11,'Que me quiero comprar!','2021-10-13','2021-10-13',X'556e20666572726172692c20756e20726f6c65782c20756e61206e75657661206775697461727261',1,0,10),
(12,'mis hobbies','2021-10-13','2021-10-13',X'5375726661722c20706172616361696469736d6f2c2070696e74617220616c206f6c656f',1,0,4),
(13,'construyendo mi casa','2021-10-13','2021-10-13',X'6e6563657369746f2070696e746172206c6173207061726564657320792061727265676172206167756a65726f73',1,0,6);

INSERT INTO notes_categories(id,id_notes,id_categories) VALUES
(1,3,2),
(2,4,1),
(3,5,6),
(4,6,5),
(5,7,4),
(6,8,5),
(7,9,9),
(8,10,8),
(9,11,10),
(10,12,1),
(11,13,7);

INSERT INTO users(id,firstname,lastname,email) VALUES
(1,'Juan','Perez','Juan_perez@gmail.com'),
(2,'Ramiro','Gutierrez','Rami98@gmail.com'),
(3,'Feliciano','Romero','Felir@hotmail.com'),
(4,'Soledad','Del sol','Sole_11_1@gmail.com'),
(5,'Fernando','Sanchez','SFernandito@me.com'),
(6,'Agustina','Marit','Agussmaa@icloud.com'),
(7,'Yanina','solic','Yanis_1@gmail.com'),
(8,'Akhaar','Amphi','AkhaarAmph@gmail.com'),
(9,'Ramiro','Gutierrez','Ramiramirami123@gmail.com'),
(10,'Augusto','Hilan','Agushil@gmail.com');