-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 08-06-2022 a las 14:03:04
-- Versión del servidor: 10.6.4-MariaDB-1:10.6.4+maria~focal
-- Versión de PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

CREATE DATABASE crosstube;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `crosstube`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `exercises`
--

CREATE TABLE `exercises` (
  `exercise_id` int(11) NOT NULL,
  `type` enum('CARDIO','MUSCLE') NOT NULL,
  `exercise_name` varchar(150) NOT NULL,
  `level_id` int(11) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `calisthenics` tinyint(1) NOT NULL,
  `views` int(11) DEFAULT NULL,
  `reps` int(11) DEFAULT NULL,
  `video_link` varchar(1000) NOT NULL,
  `poster_link` varchar(1000) NOT NULL,
  `time` int(11) DEFAULT NULL,
  `fat_burn` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `exercises`
--

INSERT INTO `exercises` (`exercise_id`, `type`, `exercise_name`, `level_id`, `description`, `calisthenics`, `views`, `reps`, `video_link`, `poster_link`, `time`, `fat_burn`) VALUES
(1, 'MUSCLE', 'Abdominales', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 4, 10, 'https://www.youtube.com/watch?v=_HDZODOx7Zw&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=30', 'https://img.youtube.com/vi/_HDZODOx7Zw/sddefault.jpg', 0, 0),
(2, 'MUSCLE', 'Abdominales-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 40, 'https://www.youtube.com/watch?v=_HDZODOx7Zw&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=30', 'https://img.youtube.com/vi/_HDZODOx7Zw/sddefault.jpg', 0, 0),
(3, 'MUSCLE', 'Abdominales V-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 10, 'https://www.youtube.com/watch?v=7UVgs18Y1P4', 'https://img.youtube.com/vi/7UVgs18Y1P4/sddefault.jpg', 0, 0),
(4, 'MUSCLE', 'Toque a los pies-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 20, 'https://www.youtube.com/watch?v=34B8AUoNdZg', 'https://img.youtube.com/vi/34B8AUoNdZg/sddefault.jpg', 0, 0),
(5, 'MUSCLE', 'Tuck Crunch-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 10, 'https://www.youtube.com/watch?v=Xbi6dVlys1w', 'https://img.youtube.com/vi/Xbi6dVlys1w/sddefault.jpg', 0, 0),
(6, 'MUSCLE', 'Abdominales Lastradas-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 3, 15, 'https://www.youtube.com/watch?v=lYZKNVZNWGA', 'https://img.youtube.com/vi/lYZKNVZNWGA/sddefault.jpg', 0, 0),
(7, 'MUSCLE', 'Elevación de una pierna', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 10, 'https://www.youtube.com/watch?v=IUCoqgdvDxU', 'https://img.youtube.com/vi/IUCoqgdvDxU/sddefault.jpg', 0, 0),
(8, 'MUSCLE', 'Dragon Flag Tucked-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 15, 'https://www.youtube.com/watch?v=0Bt6bHm-G6s', 'https://img.youtube.com/vi/0Bt6bHm-G6s/sddefault.jpg', 0, 0),
(9, 'MUSCLE', 'Dragon flag una pierna-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 10, 'https://www.youtube.com/watch?v=ncEZO_gHk2Y', 'https://img.youtube.com/vi/ncEZO_gHk2Y/sddefault.jpg', 0, 0),
(10, 'MUSCLE', 'Dragon-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 15, 'https://www.youtube.com/watch?v=DJnX__TFB9o', 'https://img.youtube.com/vi/DJnX__TFB9o/sddefault.jpg', 0, 0),
(11, 'MUSCLE', 'Cambios Tuck a L-Sit una pierna en paralelas-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 10, 'https://www.youtube.com/watch?v=kr9ia1sygRg', 'https://img.youtube.com/vi/kr9ia1sygRg/sddefault.jpg', 0, 0),
(12, 'MUSCLE', 'L-Sit en paralelas seg-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 30, 'https://www.youtube.com/watch?v=63IZyYnDalY', 'https://img.youtube.com/vi/63IZyYnDalY/sddefault.jpg', 0, 0),
(13, 'MUSCLE', 'Tijeretas en L seg', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 10, 'https://www.youtube.com/watch?v=hddaM93v3_0', 'https://img.youtube.com/vi/hddaM93v3_0/sddefault.jpg', 0, 0),
(14, 'MUSCLE', 'Tijeretas en L seg-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 20, 'https://www.youtube.com/watch?v=hddaM93v3_0', 'https://img.youtube.com/vi/hddaM93v3_0/sddefault.jpg', 0, 0),
(15, 'MUSCLE', 'L-Sit seg', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 10, 'https://www.youtube.com/watch?v=iJPsBpUHaRc', 'https://img.youtube.com/vi/iJPsBpUHaRc/sddefault.jpg', 0, 0),
(16, 'MUSCLE', 'L-Sit seg-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 20, 'https://www.youtube.com/watch?v=iJPsBpUHaRc', 'https://img.youtube.com/vi/iJPsBpUHaRc/sddefault.jpg', 0, 0),
(17, 'MUSCLE', 'Tuck Hang seg', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 10, 'https://www.youtube.com/watch?v=CopqkoUUOyE', 'https://img.youtube.com/vi/CopqkoUUOyE/sddefault.jpg', 0, 0),
(18, 'MUSCLE', 'Tuck Sit seg-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 30, 'https://www.youtube.com/watch?v=zV_jJ7px0Vo', 'https://img.youtube.com/vi/zV_jJ7px0Vo/sddefault.jpg', 0, 0),
(19, 'MUSCLE', 'Plancha Alta seg', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 30, 'https://www.youtube.com/watch?v=x5Wm9TIwlbY', 'https://img.youtube.com/vi/x5Wm9TIwlbY/sddefault.jpg', 0, 0),
(20, 'MUSCLE', 'Plancha Baja seg-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 1, 40, 'https://www.youtube.com/watch?v=tOwnFDJZzyg', 'https://img.youtube.com/vi/tOwnFDJZzyg/sddefault.jpg', 0, 0),
(21, 'MUSCLE', 'Plancha toque al hombro-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 20, 'https://www.youtube.com/watch?v=8aiEd9jTrqM', 'https://img.youtube.com/vi/8aiEd9jTrqM/sddefault.jpg', 0, 0),
(22, 'MUSCLE', 'Plank March-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 20, 'https://www.youtube.com/watch?v=Uw83y7v63W8', 'https://img.youtube.com/vi/Uw83y7v63W8/sddefault.jpg', 0, 0),
(23, 'MUSCLE', 'Side Plank Hip Drop-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 10, 'https://www.youtube.com/watch?v=ia57H04rLyU', 'https://img.youtube.com/vi/ia57H04rLyU/sddefault.jpg', 0, 0),
(24, 'MUSCLE', 'Plancha Alta a Baja-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 30, 'https://www.youtube.com/watch?v=jdnPcOf4YOA', 'https://img.youtube.com/vi/jdnPcOf4YOA/sddefault.jpg', 0, 0),
(25, 'MUSCLE', 'Plancha en Anillas seg-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 15, 'https://www.youtube.com/watch?v=jp8g1t32Ne8', 'https://img.youtube.com/vi/jp8g1t32Ne8/sddefault.jpg', 0, 0),
(26, 'MUSCLE', 'Plancha en Anillas seg-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 45, 'https://www.youtube.com/watch?v=jp8g1t32Ne8', 'https://img.youtube.com/vi/jp8g1t32Ne8/sddefault.jpg', 0, 0),
(27, 'MUSCLE', 'Complex de Plancha en Anillas-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 5, 'https://www.youtube.com/watch?v=8RlCWYjt1Qg', 'https://img.youtube.com/vi/8RlCWYjt1Qg/sddefault.jpg', 0, 0),
(28, 'MUSCLE', 'Plancha en Anillas Lateral seg-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 30, 'https://www.youtube.com/watch?v=PQ3Vz8fp73k', 'https://img.youtube.com/vi/PQ3Vz8fp73k/sddefault.jpg', 0, 0),
(29, 'MUSCLE', 'Plancha en Anillas a una Pierna seg-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 30, 'https://www.youtube.com/watch?v=k9Z1C4Yz8F0', 'https://img.youtube.com/vi/k9Z1C4Yz8F0/sddefault.jpg', 0, 0),
(30, 'MUSCLE', 'Plancha en Anillas a un Brazo seg-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 20, 'https://www.youtube.com/watch?v=UsPOv4Taxq8', 'https://img.youtube.com/vi/UsPOv4Taxq8/sddefault.jpg', 0, 0),
(31, 'MUSCLE', 'Plancha en Anillas en cajón seg-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 60, 'https://www.youtube.com/watch?v=bhclHDAaLpM', 'https://img.youtube.com/vi/bhclHDAaLpM/sddefault.jpg', 0, 0),
(32, 'MUSCLE', 'Plancha lateral seg', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 15, 'https://www.youtube.com/watch?v=nmkABS8Pgks', 'https://img.youtube.com/vi/nmkABS8Pgks/sddefault.jpg', 0, 0),
(33, 'MUSCLE', 'Plancha lateral seg-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 60, 'https://www.youtube.com/watch?v=nmkABS8Pgks', 'https://img.youtube.com/vi/nmkABS8Pgks/sddefault.jpg', 0, 0),
(34, 'MUSCLE', 'Plancha lateral dinámica-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 30, 'https://www.youtube.com/watch?v=MgRdCn5l5VY', 'https://img.youtube.com/vi/MgRdCn5l5VY/sddefault.jpg', 0, 0),
(35, 'MUSCLE', 'Evil Wheel Rodillas-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 8, 'https://www.youtube.com/watch?v=YbGUIE8q5sg', 'https://img.youtube.com/vi/YbGUIE8q5sg/sddefault.jpg', 0, 0),
(36, 'MUSCLE', 'Evil Wheel-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 4, 'https://www.youtube.com/watch?v=UD7__sTmx60', 'https://img.youtube.com/vi/UD7__sTmx60/sddefault.jpg', 0, 0),
(37, 'MUSCLE', 'Tuck en anillas seg-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 20, 'https://www.youtube.com/watch?v=se4-AVYbfnQ', 'https://img.youtube.com/vi/se4-AVYbfnQ/sddefault.jpg', 0, 0),
(38, 'MUSCLE', 'L-Sit en anillas seg-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 45, 'https://www.youtube.com/watch?v=DemH-mw1O9I&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=36', 'https://img.youtube.com/vi/DemH-mw1O9I/sddefault.jpg', 0, 0),
(39, 'MUSCLE', 'Subida de rodillas Kipping', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 10, 'https://www.youtube.com/watch?v=kfdOkBnIQx0', 'https://img.youtube.com/vi/kfdOkBnIQx0/sddefault.jpg', 0, 0),
(40, 'MUSCLE', 'Subida de rodillas-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 20, 'https://www.youtube.com/watch?v=Eumn60ExMas', 'https://img.youtube.com/vi/Eumn60ExMas/sddefault.jpg', 0, 0),
(41, 'MUSCLE', 'Crunch Oblicuos', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 10, 'https://www.youtube.com/watch?v=NNHEd8Y6FUc', 'https://img.youtube.com/vi/NNHEd8Y6FUc/sddefault.jpg', 0, 0),
(42, 'MUSCLE', 'Crunch Oblicuos-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 30, 'https://www.youtube.com/watch?v=NNHEd8Y6FUc', 'https://img.youtube.com/vi/NNHEd8Y6FUc/sddefault.jpg', 0, 0),
(43, 'MUSCLE', 'Rodillas a codos-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 30, 'https://www.youtube.com/watch?v=CwX4Dk3h26M', 'https://img.youtube.com/vi/CwX4Dk3h26M/sddefault.jpg', 0, 0),
(44, 'MUSCLE', 'Pies a la barra-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 20, 'https://www.youtube.com/watch?v=BContPDoOpk', 'https://img.youtube.com/vi/BContPDoOpk/sddefault.jpg', 0, 0),
(45, 'MUSCLE', 'Pies a la barra estrictos-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 10, 'https://www.youtube.com/watch?v=HHjvtdJKMhg', 'https://img.youtube.com/vi/HHjvtdJKMhg/sddefault.jpg', 0, 0),
(46, 'MUSCLE', 'Hollow seg', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 15, 'https://www.youtube.com/watch?v=Z1BN3DIHFsU', 'https://img.youtube.com/vi/Z1BN3DIHFsU/sddefault.jpg', 0, 0),
(47, 'MUSCLE', 'Hollow seg-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 45, 'https://www.youtube.com/watch?v=Z1BN3DIHFsU', 'https://img.youtube.com/vi/Z1BN3DIHFsU/sddefault.jpg', 0, 0),
(48, 'MUSCLE', 'Hollow Rock una pierna', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 15, 'https://www.youtube.com/watch?v=mKuTK0zTQKk', 'https://img.youtube.com/vi/mKuTK0zTQKk/sddefault.jpg', 0, 0),
(49, 'MUSCLE', 'Hollow Rock-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 20, 'https://www.youtube.com/watch?v=HtaO2Rd81Qs', 'https://img.youtube.com/vi/HtaO2Rd81Qs/sddefault.jpg', 0, 0),
(50, 'MUSCLE', 'Plancha inversa seg-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 60, 'https://www.youtube.com/watch?v=wQxvnVIO2Kw', 'https://img.youtube.com/vi/wQxvnVIO2Kw/sddefault.jpg', 0, 0),
(51, 'MUSCLE', 'Filly Press', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 4, 'https://www.youtube.com/watch?v=cd5Bbx765_M', 'https://img.youtube.com/vi/cd5Bbx765_M/sddefault.jpg', 0, 0),
(52, 'MUSCLE', 'Filly Press-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 8, 'https://www.youtube.com/watch?v=cd5Bbx765_M', 'https://img.youtube.com/vi/cd5Bbx765_M/sddefault.jpg', 0, 0),
(53, 'MUSCLE', 'Russian Twist-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 20, 'https://www.youtube.com/watch?v=qIJ716_3qIw', 'https://img.youtube.com/vi/qIJ716_3qIw/sddefault.jpg', 0, 0),
(54, 'MUSCLE', 'Russian Twist-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 40, 'https://www.youtube.com/watch?v=qIJ716_3qIw', 'https://img.youtube.com/vi/qIJ716_3qIw/sddefault.jpg', 0, 0),
(55, 'MUSCLE', 'Tijerillas en Hollow', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 20, 'https://www.youtube.com/watch?v=9hGtwGwoS_4', 'https://img.youtube.com/vi/9hGtwGwoS_4/sddefault.jpg', 0, 0),
(56, 'MUSCLE', 'Tijerillas en Hollow-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 60, 'https://www.youtube.com/watch?v=9hGtwGwoS_4', 'https://img.youtube.com/vi/9hGtwGwoS_4/sddefault.jpg', 0, 0),
(57, 'MUSCLE', 'Climbers', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 15, 'https://www.youtube.com/watch?v=UOGvtqv856A', 'https://img.youtube.com/vi/UOGvtqv856A/sddefault.jpg', 0, 0),
(58, 'MUSCLE', 'Climbers-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 35, 'https://www.youtube.com/watch?v=UOGvtqv856A', 'https://img.youtube.com/vi/UOGvtqv856A/sddefault.jpg', 0, 0),
(59, 'MUSCLE', 'Rack KB Hold seg', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 20, 'https://www.youtube.com/watch?v=MAHFkvjtYsk', 'https://img.youtube.com/vi/MAHFkvjtYsk/sddefault.jpg', 0, 0),
(60, 'MUSCLE', 'Rack KB Hold seg-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 20, 'https://www.youtube.com/watch?v=MAHFkvjtYsk', 'https://img.youtube.com/vi/MAHFkvjtYsk/sddefault.jpg', 0, 0),
(61, 'MUSCLE', 'Toques a pies', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 6, 'https://www.youtube.com/watch?v=ohszH6UUNLs', 'https://img.youtube.com/vi/ohszH6UUNLs/sddefault.jpg', 0, 0),
(62, 'MUSCLE', 'Toques a pies-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 14, 'https://www.youtube.com/watch?v=ohszH6UUNLs', 'https://img.youtube.com/vi/ohszH6UUNLs/sddefault.jpg', 0, 0),
(63, 'MUSCLE', 'Sentadilla Goblet', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 5, 'https://www.youtube.com/watch?v=1FucOlSntPo', 'https://img.youtube.com/vi/1FucOlSntPo/sddefault.jpg', 0, 0),
(64, 'MUSCLE', 'Sentadilla Goblet-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 9, 'https://www.youtube.com/watch?v=1FucOlSntPo', 'https://img.youtube.com/vi/1FucOlSntPo/sddefault.jpg', 0, 0),
(65, 'MUSCLE', 'Pica sentado levantamiento de pierna', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 5, 'https://www.youtube.com/watch?v=a2fBw2pjiy0', 'https://img.youtube.com/vi/a2fBw2pjiy0/sddefault.jpg', 0, 0),
(66, 'MUSCLE', 'Pica sentado levantamiento de pierna-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 20, 'https://www.youtube.com/watch?v=a2fBw2pjiy0', 'https://img.youtube.com/vi/a2fBw2pjiy0/sddefault.jpg', 0, 0),
(67, 'MUSCLE', 'Pica sentado aguantar piernas seg', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 6, 'https://www.youtube.com/watch?v=5KTnjX11mLE', 'https://img.youtube.com/vi/5KTnjX11mLE/sddefault.jpg', 0, 0),
(68, 'MUSCLE', 'Pica sentado aguantar piernas seg-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 18, 'https://www.youtube.com/watch?v=5KTnjX11mLE', 'https://img.youtube.com/vi/5KTnjX11mLE/sddefault.jpg', 0, 0),
(69, 'MUSCLE', 'Vela', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 6, 'https://www.youtube.com/watch?v=cKYAF8oisKc', 'https://img.youtube.com/vi/cKYAF8oisKc/sddefault.jpg', 0, 0),
(70, 'MUSCLE', 'Vela-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 14, 'https://www.youtube.com/watch?v=cKYAF8oisKc', 'https://img.youtube.com/vi/cKYAF8oisKc/sddefault.jpg', 0, 0),
(71, 'MUSCLE', 'Plancha extendida-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 15, 'https://www.youtube.com/watch?v=fMoFdVEIcY8', 'https://img.youtube.com/vi/fMoFdVEIcY8/sddefault.jpg', 0, 0),
(72, 'MUSCLE', 'Plancha extendida-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 45, 'https://www.youtube.com/watch?v=fMoFdVEIcY8', 'https://img.youtube.com/vi/fMoFdVEIcY8/sddefault.jpg', 0, 0),
(73, 'MUSCLE', 'Paso leopardo', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 5, 'https://www.youtube.com/watch?v=mNc7yk2LS6A', 'https://img.youtube.com/vi/mNc7yk2LS6A/sddefault.jpg', 0, 0),
(74, 'MUSCLE', 'Paso leopardo-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 15, 'https://www.youtube.com/watch?v=mNc7yk2LS6A', 'https://img.youtube.com/vi/mNc7yk2LS6A/sddefault.jpg', 0, 0),
(75, 'MUSCLE', 'V alterna', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 6, 'https://www.youtube.com/watch?v=RA9nGJVwtJ4', 'https://img.youtube.com/vi/RA9nGJVwtJ4/sddefault.jpg', 0, 0),
(76, 'MUSCLE', 'V alterna-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 16, 'https://www.youtube.com/watch?v=RA9nGJVwtJ4', 'https://img.youtube.com/vi/RA9nGJVwtJ4/sddefault.jpg', 0, 0),
(77, 'MUSCLE', 'Circulos Abdominales-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 6, 'https://www.youtube.com/watch?v=L83ngXEmxn0', 'https://img.youtube.com/vi/L83ngXEmxn0/sddefault.jpg', 0, 0),
(78, 'MUSCLE', 'Extensión de pierna alterna colgado', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 6, 'https://www.youtube.com/watch?v=hy5yJUqYsKg', 'https://img.youtube.com/vi/hy5yJUqYsKg/sddefault.jpg', 0, 0),
(79, 'MUSCLE', 'Extensión de pierna alterna colgado-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 8, 'https://www.youtube.com/watch?v=RAwb_sAlGpI', 'https://img.youtube.com/vi/RAwb_sAlGpI/sddefault.jpg', 0, 0),
(80, 'MUSCLE', 'Heel Touch Crunch-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 10, 'https://www.youtube.com/watch?v=Gmi_M4-ngeo', 'https://img.youtube.com/vi/Gmi_M4-ngeo/sddefault.jpg', 0, 0),
(81, 'MUSCLE', 'Dead Bug-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 10, 'https://www.youtube.com/watch?v=uRW6LLbdqCs', 'https://img.youtube.com/vi/uRW6LLbdqCs/sddefault.jpg', 0, 0),
(82, 'MUSCLE', 'Hanging Knee Raises-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 10, 'https://www.youtube.com/watch?v=sUFvSwPlJSg', 'https://img.youtube.com/vi/sUFvSwPlJSg/sddefault.jpg', 0, 0),
(83, 'MUSCLE', 'Elevaciones Frontales-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 10, 'https://www.youtube.com/watch?v=lrt7Tcxomws', 'https://img.youtube.com/vi/lrt7Tcxomws/sddefault.jpg', 0, 0),
(84, 'MUSCLE', 'Elevaciones Frontales-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 10, 'https://www.youtube.com/watch?v=lrt7Tcxomws', 'https://img.youtube.com/vi/lrt7Tcxomws/sddefault.jpg', 0, 0),
(85, 'MUSCLE', 'Elevaciones Laterales', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 10, 'https://www.youtube.com/watch?v=tttEkbV0WIQ', 'https://img.youtube.com/vi/tttEkbV0WIQ/sddefault.jpg', 0, 0),
(86, 'MUSCLE', 'Elevaciones Laterales-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 10, 'https://www.youtube.com/watch?v=tttEkbV0WIQ', 'https://img.youtube.com/vi/tttEkbV0WIQ/sddefault.jpg', 0, 0),
(87, 'MUSCLE', 'Press Z-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 8, 'https://www.youtube.com/watch?v=zSRug_uTztg', 'https://img.youtube.com/vi/zSRug_uTztg/sddefault.jpg', 0, 0),
(88, 'MUSCLE', 'Press Z-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 1, 8, 'https://www.youtube.com/watch?v=zSRug_uTztg', 'https://img.youtube.com/vi/zSRug_uTztg/sddefault.jpg', 0, 0),
(89, 'MUSCLE', 'Overhead Squat-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=RD_vUnqwqqI&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=4', 'https://img.youtube.com/vi/RD_vUnqwqqI/sddefault.jpg', 0, 0),
(90, 'MUSCLE', 'Overhead Squat-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=RD_vUnqwqqI&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=4', 'https://img.youtube.com/vi/RD_vUnqwqqI/sddefault.jpg', 0, 0),
(91, 'MUSCLE', 'Shoulder Press-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=xe19t2_6yis&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=5', 'https://img.youtube.com/vi/xe19t2_6yis/sddefault.jpg', 0, 0),
(92, 'MUSCLE', 'Shoulder Press-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=xe19t2_6yis&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=5', 'https://img.youtube.com/vi/xe19t2_6yis/sddefault.jpg', 0, 0),
(93, 'MUSCLE', 'Push Press', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=X6-DMh-t4nQ&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=6', 'https://img.youtube.com/vi/X6-DMh-t4nQ/sddefault.jpg', 0, 0),
(94, 'MUSCLE', 'Push Press-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=X6-DMh-t4nQ&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=6', 'https://img.youtube.com/vi/X6-DMh-t4nQ/sddefault.jpg', 0, 0),
(95, 'MUSCLE', 'Push Jerk-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=V-hKuAfWNUw&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=7', 'https://img.youtube.com/vi/V-hKuAfWNUw/sddefault.jpg', 0, 0),
(96, 'MUSCLE', 'Thruster-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 8, 'https://www.youtube.com/watch?v=aea5BGj9a8Y&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=9', 'https://img.youtube.com/vi/aea5BGj9a8Y/sddefault.jpg', 0, 0),
(97, 'MUSCLE', 'Thruster-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 8, 'https://www.youtube.com/watch?v=aea5BGj9a8Y&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=9', 'https://img.youtube.com/vi/aea5BGj9a8Y/sddefault.jpg', 0, 0),
(98, 'MUSCLE', 'S.Deadlift H.Pull', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=o6QniJ9FaGA&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=11', 'https://img.youtube.com/vi/o6QniJ9FaGA/sddefault.jpg', 0, 0),
(99, 'MUSCLE', 'S.Deadlift H.Pull-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=o6QniJ9FaGA&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=11', 'https://img.youtube.com/vi/o6QniJ9FaGA/sddefault.jpg', 0, 0),
(100, 'MUSCLE', 'Muscle Up-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 4, 'https://www.youtube.com/watch?v=2QTCBcTj7hM', 'https://img.youtube.com/vi/2QTCBcTj7hM/sddefault.jpg', 0, 0),
(101, 'MUSCLE', 'Muscle Up-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 8, 'https://www.youtube.com/watch?v=OCg3UXgzftc&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=16', 'https://img.youtube.com/vi/OCg3UXgzftc/sddefault.jpg', 0, 0),
(102, 'MUSCLE', 'Muscle Up estricto-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 4, 'https://www.youtube.com/watch?v=o69WaY_7k2c', 'https://img.youtube.com/vi/o69WaY_7k2c/sddefault.jpg', 0, 0),
(103, 'MUSCLE', 'Muscle up en anillas-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 4, 'https://www.youtube.com/watch?v=fHrGdxGi_Og', 'https://img.youtube.com/vi/fHrGdxGi_Og/sddefault.jpg', 0, 0),
(104, 'MUSCLE', 'Hang Power Clean-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=0aP3tgKZcHQ', 'https://img.youtube.com/vi/0aP3tgKZcHQ/sddefault.jpg', 0, 0),
(105, 'MUSCLE', 'Snatch-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=9xQp2sldyts&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=26', 'https://img.youtube.com/vi/9xQp2sldyts/sddefault.jpg', 0, 0),
(106, 'MUSCLE', 'Zancada Overhead-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 5, 'https://www.youtube.com/watch?v=m6MczOv_Ayg&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=28', 'https://img.youtube.com/vi/m6MczOv_Ayg/sddefault.jpg', 0, 0),
(107, 'MUSCLE', 'Snatch con mancuerna', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 5, 'https://www.youtube.com/watch?v=R0mhHuVrLHA&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=32', 'https://img.youtube.com/vi/R0mhHuVrLHA/sddefault.jpg', 0, 0),
(108, 'MUSCLE', 'Snatch con mancuerna-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 5, 'https://www.youtube.com/watch?v=R0mhHuVrLHA&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=32', 'https://img.youtube.com/vi/R0mhHuVrLHA/sddefault.jpg', 0, 0),
(109, 'MUSCLE', 'DB Press-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 1, 'https://www.youtube.com/watch?v=AqzDJHxynwo&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=33', 'https://img.youtube.com/vi/AqzDJHxynwo/sddefault.jpg', 0, 0),
(110, 'MUSCLE', 'DB Press-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 1, 'https://www.youtube.com/watch?v=AqzDJHxynwo&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=33', 'https://img.youtube.com/vi/AqzDJHxynwo/sddefault.jpg', 0, 0),
(111, 'MUSCLE', 'DB Press Snetado', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 4, 'https://www.youtube.com/watch?v=LRc1rHyMSUA', 'https://img.youtube.com/vi/LRc1rHyMSUA/sddefault.jpg', 0, 0),
(112, 'MUSCLE', 'DB Press Snetado-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 8, 'https://www.youtube.com/watch?v=LRc1rHyMSUA', 'https://img.youtube.com/vi/LRc1rHyMSUA/sddefault.jpg', 0, 0),
(113, 'MUSCLE', 'Sentadilla con mancuerna sobre la cabeza-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 4, 'https://www.youtube.com/watch?v=fa_yJa2XwXk&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=34', 'https://img.youtube.com/vi/fa_yJa2XwXk/sddefault.jpg', 0, 0),
(114, 'MUSCLE', 'Handstand Push Up estricto-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 4, 'https://www.youtube.com/watch?v=hvoQiF0kBI8&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=39', 'https://img.youtube.com/vi/hvoQiF0kBI8/sddefault.jpg', 0, 0),
(115, 'MUSCLE', 'Cargada a media sentadilla-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=GVt4uQ0sDJE&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=42', 'https://img.youtube.com/vi/GVt4uQ0sDJE/sddefault.jpg', 0, 0),
(116, 'MUSCLE', 'Cargada a media sentadilla-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 10, 'https://www.youtube.com/watch?v=GVt4uQ0sDJE&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=42', 'https://img.youtube.com/vi/GVt4uQ0sDJE/sddefault.jpg', 0, 0),
(117, 'MUSCLE', 'Power Snatch-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 4, 'https://www.youtube.com/watch?v=tuOiNeTvLJs&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=43', 'https://img.youtube.com/vi/tuOiNeTvLJs/sddefault.jpg', 0, 0);
INSERT INTO `exercises` (`exercise_id`, `type`, `exercise_name`, `level_id`, `description`, `calisthenics`, `views`, `reps`, `video_link`, `poster_link`, `time`, `fat_burn`) VALUES
(118, 'MUSCLE', 'Power Snatch-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 8, 'https://www.youtube.com/watch?v=tuOiNeTvLJs&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=43', 'https://img.youtube.com/vi/tuOiNeTvLJs/sddefault.jpg', 0, 0),
(119, 'MUSCLE', 'Thrusters con mancuernas', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 4, 'https://www.youtube.com/watch?v=M5gEwLTtWbg&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=45', 'https://img.youtube.com/vi/M5gEwLTtWbg/sddefault.jpg', 0, 0),
(120, 'MUSCLE', 'Thrusters con mancuernas-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 8, 'https://www.youtube.com/watch?v=M5gEwLTtWbg&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=45', 'https://img.youtube.com/vi/M5gEwLTtWbg/sddefault.jpg', 0, 0),
(121, 'MUSCLE', 'Muscle Snatch-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 5, 'https://www.youtube.com/watch?v=LRcTB2-Xyg8&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=46', 'https://img.youtube.com/vi/LRcTB2-Xyg8/sddefault.jpg', 0, 0),
(122, 'MUSCLE', 'Levantamiento turco-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 4, 'https://www.youtube.com/watch?v=1hLE_OOeq_A', 'https://img.youtube.com/vi/1hLE_OOeq_A/sddefault.jpg', 0, 0),
(123, 'MUSCLE', 'Levantamiento turco-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=1hLE_OOeq_A', 'https://img.youtube.com/vi/1hLE_OOeq_A/sddefault.jpg', 0, 0),
(124, 'MUSCLE', 'Muscle Clean-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 4, 'https://www.youtube.com/watch?v=K7CctePUCYA&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=51', 'https://img.youtube.com/vi/K7CctePUCYA/sddefault.jpg', 0, 0),
(125, 'MUSCLE', 'Muscle Clean-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=K7CctePUCYA&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=51', 'https://img.youtube.com/vi/K7CctePUCYA/sddefault.jpg', 0, 0),
(126, 'MUSCLE', 'Hang Power Clean', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 4, 'https://www.youtube.com/watch?v=_iUFG1-H7d0&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=52', 'https://img.youtube.com/vi/_iUFG1-H7d0/sddefault.jpg', 0, 0),
(128, 'MUSCLE', 'Hang Power Snatch-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 5, 'https://www.youtube.com/watch?v=8AyTzORaBM8&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=53', 'https://img.youtube.com/vi/8AyTzORaBM8/sddefault.jpg', 0, 0),
(129, 'MUSCLE', 'Split Jerk-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 5, 'https://www.youtube.com/watch?v=PsiO8lZTU2I&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=44', 'https://img.youtube.com/vi/PsiO8lZTU2I/sddefault.jpg', 0, 0),
(130, 'MUSCLE', 'Aguantar Flexión en pica con cajón seg-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 30, 'https://www.youtube.com/watch?v=7-Rtq5RBLCc', 'https://img.youtube.com/vi/7-Rtq5RBLCc/sddefault.jpg', 0, 0),
(131, 'MUSCLE', 'Flexión en pica-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 6, 'https://www.youtube.com/watch?v=B1GTcDZm1IE', 'https://img.youtube.com/vi/B1GTcDZm1IE/sddefault.jpg', 0, 0),
(132, 'MUSCLE', 'Flexión en pica con deficit-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 4, 'https://www.youtube.com/watch?v=psVldHs0aQk', 'https://img.youtube.com/vi/psVldHs0aQk/sddefault.jpg', 0, 0),
(133, 'MUSCLE', 'Subidas a pino en pared-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 7, 'https://www.youtube.com/watch?v=epwboFMa2HY', 'https://img.youtube.com/vi/epwboFMa2HY/sddefault.jpg', 0, 0),
(134, 'MUSCLE', 'Andar en pino seg-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 12, 'https://www.youtube.com/watch?v=LcD6a47JvYM', 'https://img.youtube.com/vi/LcD6a47JvYM/sddefault.jpg', 0, 0),
(135, 'MUSCLE', 'Pino Estático seg-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 10, 'https://www.youtube.com/watch?v=v_O4t4Yiv5g', 'https://img.youtube.com/vi/v_O4t4Yiv5g/sddefault.jpg', 0, 0),
(136, 'MUSCLE', 'Pino en pared seg-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 20, 'https://www.youtube.com/watch?v=rvGcNSgp9y8', 'https://img.youtube.com/vi/rvGcNSgp9y8/sddefault.jpg', 0, 0),
(137, 'MUSCLE', 'Pies a la barra estrictos-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 8, 'https://www.youtube.com/watch?v=HHjvtdJKMhg', 'https://img.youtube.com/vi/HHjvtdJKMhg/sddefault.jpg', 0, 0),
(138, 'MUSCLE', 'Pies a la barra-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 20, 'https://www.youtube.com/watch?v=BContPDoOpk', 'https://img.youtube.com/vi/BContPDoOpk/sddefault.jpg', 0, 0),
(139, 'MUSCLE', 'Rodillas a codos-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 10, 'https://www.youtube.com/watch?v=CwX4Dk3h26M', 'https://img.youtube.com/vi/CwX4Dk3h26M/sddefault.jpg', 0, 0),
(140, 'MUSCLE', 'Press Arnold', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 4, 'https://www.youtube.com/watch?v=ZMYcP3Z_w0E', 'https://img.youtube.com/vi/ZMYcP3Z_w0E/sddefault.jpg', 0, 0),
(141, 'MUSCLE', 'Press Arnold-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=ZMYcP3Z_w0E', 'https://img.youtube.com/vi/ZMYcP3Z_w0E/sddefault.jpg', 0, 0),
(142, 'MUSCLE', 'Hang DB Clean-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=iIMg_6wZ38w', 'https://img.youtube.com/vi/iIMg_6wZ38w/sddefault.jpg', 0, 0),
(143, 'MUSCLE', 'Hang DB Clean-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 10, 'https://www.youtube.com/watch?v=iIMg_6wZ38w', 'https://img.youtube.com/vi/iIMg_6wZ38w/sddefault.jpg', 0, 0),
(144, 'MUSCLE', 'Man maker', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 4, 'https://www.youtube.com/watch?v=NJztTcxHgm4', 'https://img.youtube.com/vi/NJztTcxHgm4/sddefault.jpg', 0, 0),
(145, 'MUSCLE', 'Man maker-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 8, 'https://www.youtube.com/watch?v=NJztTcxHgm4', 'https://img.youtube.com/vi/NJztTcxHgm4/sddefault.jpg', 0, 0),
(146, 'MUSCLE', 'Filly Press-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 7, 'https://www.youtube.com/watch?v=cd5Bbx765_M', 'https://img.youtube.com/vi/cd5Bbx765_M/sddefault.jpg', 0, 0),
(147, 'MUSCLE', 'Filly Press-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 11, 'https://www.youtube.com/watch?v=cd5Bbx765_M', 'https://img.youtube.com/vi/cd5Bbx765_M/sddefault.jpg', 0, 0),
(148, 'MUSCLE', 'Devil Press', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 4, 'https://www.youtube.com/watch?v=arhBxv_pFDM', 'https://img.youtube.com/vi/arhBxv_pFDM/sddefault.jpg', 0, 0),
(149, 'MUSCLE', 'Devil Press-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 8, 'https://www.youtube.com/watch?v=arhBxv_pFDM', 'https://img.youtube.com/vi/arhBxv_pFDM/sddefault.jpg', 0, 0),
(150, 'MUSCLE', 'KB Deadlift H.P-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 8, 'https://www.youtube.com/watch?v=kmmnVzHlWmU', 'https://img.youtube.com/vi/kmmnVzHlWmU/sddefault.jpg', 0, 0),
(151, 'MUSCLE', 'KB Press cada brazo-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 7, 'https://www.youtube.com/watch?v=yvgO_zdYn7c', 'https://img.youtube.com/vi/yvgO_zdYn7c/sddefault.jpg', 0, 0),
(152, 'MUSCLE', 'DB Push Press-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 7, 'https://www.youtube.com/watch?v=ZUpujXKd5sU', 'https://img.youtube.com/vi/ZUpujXKd5sU/sddefault.jpg', 0, 0),
(153, 'MUSCLE', 'KB Push Press-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 7, 'https://www.youtube.com/watch?v=VsBDlsXE9vc', 'https://img.youtube.com/vi/VsBDlsXE9vc/sddefault.jpg', 0, 0),
(154, 'MUSCLE', 'KB Clean and Push Jerk-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 10, 'https://www.youtube.com/watch?v=Ax9m0QF4Duk', 'https://img.youtube.com/vi/Ax9m0QF4Duk/sddefault.jpg', 0, 0),
(155, 'MUSCLE', 'KB Clean and Push Jerk-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 12, 'https://www.youtube.com/watch?v=Ax9m0QF4Duk', 'https://img.youtube.com/vi/Ax9m0QF4Duk/sddefault.jpg', 0, 0),
(156, 'MUSCLE', 'DB Maltese Press', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=rZZp3XJqpkw', 'https://img.youtube.com/vi/rZZp3XJqpkw/sddefault.jpg', 0, 0),
(157, 'MUSCLE', 'DB Maltese Press-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 10, 'https://www.youtube.com/watch?v=rZZp3XJqpkw', 'https://img.youtube.com/vi/rZZp3XJqpkw/sddefault.jpg', 0, 0),
(158, 'MUSCLE', 'Dominadas Comando-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 10, 'https://www.youtube.com/watch?v=GITBFhecTII', 'https://img.youtube.com/vi/GITBFhecTII/sddefault.jpg', 0, 0),
(159, 'MUSCLE', 'Remo sentado con goma-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 10, 'https://www.youtube.com/watch?v=XQG6BCKFOXQ', 'https://img.youtube.com/vi/XQG6BCKFOXQ/sddefault.jpg', 0, 0),
(160, 'MUSCLE', 'Dominada Asistida-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 10, 'https://www.youtube.com/watch?v=qGEY0sTct0M', 'https://img.youtube.com/vi/qGEY0sTct0M/sddefault.jpg', 0, 0),
(161, 'MUSCLE', 'Dominada negativa con salto', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 5, 'https://www.youtube.com/watch?v=Rq4TneUtD3Y', 'https://img.youtube.com/vi/Rq4TneUtD3Y/sddefault.jpg', 0, 0),
(162, 'MUSCLE', 'Dominada con salto', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 5, 'https://www.youtube.com/watch?v=9K4h8gJ1z8M', 'https://img.youtube.com/vi/9K4h8gJ1z8M/sddefault.jpg', 0, 0),
(163, 'MUSCLE', 'Dominada con Kipping-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 10, 'https://www.youtube.com/watch?v=r45xLlH7r_M&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=41', 'https://img.youtube.com/vi/r45xLlH7r_M/sddefault.jpg', 0, 0),
(164, 'MUSCLE', 'Dominada-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 5, 'https://www.youtube.com/watch?v=aAggnpPyR6E&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=14', 'https://img.youtube.com/vi/aAggnpPyR6E/sddefault.jpg', 0, 0),
(165, 'MUSCLE', 'Dominada bajada lenta-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 8, 'https://www.youtube.com/watch?v=ZVotRx6nMzE', 'https://img.youtube.com/vi/ZVotRx6nMzE/sddefault.jpg', 0, 0),
(166, 'MUSCLE', 'Dominada lastrada-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 4, 5, 'https://www.youtube.com/watch?v=pPzW1KE2ye4', 'https://img.youtube.com/vi/pPzW1KE2ye4/sddefault.jpg', 0, 0),
(167, 'MUSCLE', 'Pecho a la barra-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 10, 'https://www.youtube.com/watch?v=p9Stan68FYM&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=15', 'https://img.youtube.com/vi/p9Stan68FYM/sddefault.jpg', 0, 0),
(168, 'MUSCLE', 'Pecho a la barra estricto-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 6, 'https://www.youtube.com/watch?v=PmdNNN8nLGI&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=57', 'https://img.youtube.com/vi/PmdNNN8nLGI/sddefault.jpg', 0, 0),
(169, 'MUSCLE', 'Dominada Butterfly-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 10, 'https://www.youtube.com/watch?v=OenVG15QMj8', 'https://img.youtube.com/vi/OenVG15QMj8/sddefault.jpg', 0, 0),
(170, 'MUSCLE', 'Muscle Up-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 4, 'https://www.youtube.com/watch?v=OCg3UXgzftc&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=16', 'https://img.youtube.com/vi/OCg3UXgzftc/sddefault.jpg', 0, 0),
(171, 'MUSCLE', 'Muscle up en anillas-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 8, 'https://www.youtube.com/watch?v=fHrGdxGi_Og', 'https://img.youtube.com/vi/fHrGdxGi_Og/sddefault.jpg', 0, 0),
(172, 'MUSCLE', 'Muscle up estricto en anillas-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 4, 'https://www.youtube.com/watch?v=rtF51pQB6Wc&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=17', 'https://img.youtube.com/vi/rtF51pQB6Wc/sddefault.jpg', 0, 0),
(173, 'MUSCLE', 'Subir la cuerda sin piernas-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 1, 'https://www.youtube.com/watch?v=rfr-Tw3Pxh8&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=29', 'https://img.youtube.com/vi/rfr-Tw3Pxh8/sddefault.jpg', 0, 0),
(174, 'MUSCLE', 'Flexiones con remo-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=IKleZO43o7o', 'https://img.youtube.com/vi/IKleZO43o7o/sddefault.jpg', 0, 0),
(175, 'MUSCLE', 'Flexiones con remo-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 10, 'https://www.youtube.com/watch?v=IKleZO43o7o', 'https://img.youtube.com/vi/IKleZO43o7o/sddefault.jpg', 0, 0),
(176, 'MUSCLE', 'Retracción escapular', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 10, 'https://www.youtube.com/watch?v=qzlN-sTUeRE', 'https://img.youtube.com/vi/qzlN-sTUeRE/sddefault.jpg', 0, 0),
(177, 'MUSCLE', 'Retracción escapular-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 10, 'https://www.youtube.com/watch?v=qzlN-sTUeRE', 'https://img.youtube.com/vi/qzlN-sTUeRE/sddefault.jpg', 0, 0),
(178, 'MUSCLE', 'Retracción escapular colgado', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 10, 'https://www.youtube.com/watch?v=nHAd_BhaNkk', 'https://img.youtube.com/vi/nHAd_BhaNkk/sddefault.jpg', 0, 0),
(179, 'MUSCLE', 'Dominadas australianas-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 8, 'https://www.youtube.com/watch?v=bHO0A4ZF_Zg', 'https://img.youtube.com/vi/bHO0A4ZF_Zg/sddefault.jpg', 0, 0),
(180, 'MUSCLE', 'Remo Renegado-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 8, 'https://www.youtube.com/watch?v=M9XJV-q_EP0', 'https://img.youtube.com/vi/M9XJV-q_EP0/sddefault.jpg', 0, 0),
(181, 'MUSCLE', 'Ball Slam-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 8, 'https://www.youtube.com/watch?v=GhfpjZad6hE', 'https://img.youtube.com/vi/GhfpjZad6hE/sddefault.jpg', 0, 0),
(182, 'MUSCLE', 'Remo con KB-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 8, 'https://www.youtube.com/watch?v=CgK2Qx1NM74', 'https://img.youtube.com/vi/CgK2Qx1NM74/sddefault.jpg', 0, 0),
(183, 'MUSCLE', 'Burpee Dominada-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 8, 'https://www.youtube.com/watch?v=jVzrLDIRqnE', 'https://img.youtube.com/vi/jVzrLDIRqnE/sddefault.jpg', 0, 0),
(184, 'MUSCLE', 'Remo KB-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 7, 'https://www.youtube.com/watch?v=Db2NSEyPY_Y', 'https://img.youtube.com/vi/Db2NSEyPY_Y/sddefault.jpg', 0, 0),
(185, 'MUSCLE', 'Fondos cajón', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 10, 'https://www.youtube.com/watch?v=P_jCs3mY5e4', 'https://img.youtube.com/vi/P_jCs3mY5e4/sddefault.jpg', 0, 0),
(186, 'MUSCLE', 'Fondos cajón-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 30, 'https://www.youtube.com/watch?v=P_jCs3mY5e4', 'https://img.youtube.com/vi/P_jCs3mY5e4/sddefault.jpg', 0, 0),
(187, 'MUSCLE', 'Remo en anillas-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 10, 'https://www.youtube.com/watch?v=xhlReCpAE9k&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=13', 'https://img.youtube.com/vi/xhlReCpAE9k/sddefault.jpg', 0, 0),
(188, 'MUSCLE', 'Fondos-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 8, 'https://www.youtube.com/watch?v=eERwCQHZqfA&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=48', 'https://img.youtube.com/vi/eERwCQHZqfA/sddefault.jpg', 0, 0),
(189, 'MUSCLE', 'Fondos lastrados-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 8, 'https://www.youtube.com/watch?v=QGcbSt4NSC0', 'https://img.youtube.com/vi/QGcbSt4NSC0/sddefault.jpg', 0, 0),
(190, 'MUSCLE', 'Fondos en anillas con goma', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 5, 'https://www.youtube.com/watch?v=lLAibvQh_VI', 'https://img.youtube.com/vi/lLAibvQh_VI/sddefault.jpg', 0, 0),
(191, 'MUSCLE', 'Fondos en anillas con salto', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 8, 'https://www.youtube.com/watch?v=Nh_rfKovWM4', 'https://img.youtube.com/vi/Nh_rfKovWM4/sddefault.jpg', 0, 0),
(192, 'MUSCLE', 'Fondos en anillas-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=ZBiLetJ1XD4', 'https://img.youtube.com/vi/ZBiLetJ1XD4/sddefault.jpg', 0, 0),
(193, 'MUSCLE', 'Fondos en anillas-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 10, 'https://www.youtube.com/watch?v=ZBiLetJ1XD4', 'https://img.youtube.com/vi/ZBiLetJ1XD4/sddefault.jpg', 0, 0),
(194, 'MUSCLE', 'Fondos lastrados en anillas-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=Ag207YybkMo', 'https://img.youtube.com/vi/Ag207YybkMo/sddefault.jpg', 0, 0),
(196, 'CARDIO', 'Saltos a la comba', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 50, 'https://www.youtube.com/watch?v=hCuXYrTOMxI', 'https://img.youtube.com/vi/hCuXYrTOMxI/sddefault.jpg', 403, 480),
(197, 'CARDIO', 'Saltos dobles a la comba-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 100, 'https://www.youtube.com/watch?v=-tF3hUsPZAI&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=19', 'https://img.youtube.com/vi/-tF3hUsPZAI/sddefault.jpg', 431, 360),
(198, 'CARDIO', 'Saltos triples a la comba-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 1, 50, 'https://www.youtube.com/watch?v=OSMvoZnh_ng', 'https://img.youtube.com/vi/OSMvoZnh_ng/sddefault.jpg', 358, 660),
(199, 'CARDIO', 'High Knees seg', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 15, 'https://www.youtube.com/watch?v=Z5GdcUYXwt0', 'https://img.youtube.com/vi/Z5GdcUYXwt0/sddefault.jpg', 266, 120),
(200, 'CARDIO', 'High Knees seg-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 45, 'https://www.youtube.com/watch?v=Z5GdcUYXwt0', 'https://img.youtube.com/vi/Z5GdcUYXwt0/sddefault.jpg', 268, 420),
(201, 'CARDIO', 'Burpee', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 2, 6, 'https://www.youtube.com/watch?v=TU8QYVW0gDU&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=22', 'https://img.youtube.com/vi/TU8QYVW0gDU/sddefault.jpg', 53, 660),
(202, 'CARDIO', 'Burpee-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 2, 14, 'https://www.youtube.com/watch?v=TU8QYVW0gDU&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=22', 'https://img.youtube.com/vi/TU8QYVW0gDU/sddefault.jpg', 214, 600),
(203, 'CARDIO', 'Remo cal', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 5, 'https://www.youtube.com/watch?v=S7HEm-fd534&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=35', 'https://img.youtube.com/vi/S7HEm-fd534/sddefault.jpg', 184, 420),
(204, 'CARDIO', 'Remo cal-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 15, 'https://www.youtube.com/watch?v=S7HEm-fd534&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=35', 'https://img.youtube.com/vi/S7HEm-fd534/sddefault.jpg', 404, 120),
(205, 'CARDIO', 'Assult Bike cal-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 2, 10, 'https://www.youtube.com/watch?v=9xfUu652CMg', 'https://img.youtube.com/vi/9xfUu652CMg/sddefault.jpg', 421, 480),
(206, 'CARDIO', 'Assult Bike cal-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 2, 20, 'https://www.youtube.com/watch?v=9xfUu652CMg', 'https://img.youtube.com/vi/9xfUu652CMg/sddefault.jpg', 260, 600),
(207, 'CARDIO', 'Ski cal', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 5, 'https://www.youtube.com/watch?v=44YUR_dln0k', 'https://img.youtube.com/vi/44YUR_dln0k/sddefault.jpg', 419, 120),
(208, 'CARDIO', 'Ski cal-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 15, 'https://www.youtube.com/watch?v=44YUR_dln0k', 'https://img.youtube.com/vi/44YUR_dln0k/sddefault.jpg', 376, 240),
(209, 'CARDIO', 'Sentadilla con salto-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 20, 'https://www.youtube.com/watch?v=rskNyaJnfvY', 'https://img.youtube.com/vi/rskNyaJnfvY/sddefault.jpg', 54, 180),
(210, 'CARDIO', 'Salto lateral-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 15, 'https://www.youtube.com/watch?v=hPm2y5rGKpY', 'https://img.youtube.com/vi/hPm2y5rGKpY/sddefault.jpg', 195, 60),
(211, 'CARDIO', 'Saltos al cajon altura media-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 18, 'https://www.youtube.com/watch?v=52r_Ul5k03g&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=49', 'https://img.youtube.com/vi/52r_Ul5k03g/sddefault.jpg', 412, 480),
(212, 'CARDIO', 'Salto sobre cajón-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 12, 'https://www.youtube.com/watch?v=-Tz4BF2ne2A', 'https://img.youtube.com/vi/-Tz4BF2ne2A/sddefault.jpg', 416, 600),
(213, 'CARDIO', 'Salto al cajón con burpee-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 8, 'https://www.youtube.com/watch?v=TMsvKvT-o_4', 'https://img.youtube.com/vi/TMsvKvT-o_4/sddefault.jpg', 54, 660),
(215, 'CARDIO', 'Salto barra lateral con burpee-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 8, 'https://www.youtube.com/watch?v=Ot4WqENrTFc', 'https://img.youtube.com/vi/Ot4WqENrTFc/sddefault.jpg', 257, 180),
(216, 'CARDIO', 'Salto rodillas arriba-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 6, 'https://www.youtube.com/watch?v=ofVWxtDSNRg', 'https://img.youtube.com/vi/ofVWxtDSNRg/sddefault.jpg', 412, 60),
(217, 'CARDIO', 'Salto barra con burpee-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 10, 'https://www.youtube.com/watch?v=F4Osiwr4g1w', 'https://img.youtube.com/vi/F4Osiwr4g1w/sddefault.jpg', 368, 540),
(218, 'MUSCLE', 'Sentadilla al aire', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 15, 'https://www.youtube.com/watch?v=C_VtOYc6j5c&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=2', 'https://img.youtube.com/vi/C_VtOYc6j5c/sddefault.jpg', 0, 0),
(219, 'MUSCLE', 'Sentadilla al aire-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 50, 'https://www.youtube.com/watch?v=C_VtOYc6j5c&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=2', 'https://img.youtube.com/vi/C_VtOYc6j5c/sddefault.jpg', 0, 0),
(220, 'MUSCLE', 'Sentadilla con salto', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 10, 'https://www.youtube.com/watch?v=rskNyaJnfvY', 'https://img.youtube.com/vi/rskNyaJnfvY/sddefault.jpg', 0, 0),
(221, 'MUSCLE', 'Sentadilla con salto-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 30, 'https://www.youtube.com/watch?v=rskNyaJnfvY', 'https://img.youtube.com/vi/rskNyaJnfvY/sddefault.jpg', 0, 0),
(222, 'MUSCLE', 'Front Squat', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 5, 'https://www.youtube.com/watch?v=m4ytaCJZpl0&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=3', 'https://img.youtube.com/vi/m4ytaCJZpl0/sddefault.jpg', 0, 0),
(223, 'MUSCLE', 'Front Squat-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 9, 'https://www.youtube.com/watch?v=m4ytaCJZpl0&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=3', 'https://img.youtube.com/vi/m4ytaCJZpl0/sddefault.jpg', 0, 0),
(226, 'MUSCLE', 'Wall Ball', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 5, 'https://www.youtube.com/watch?v=fpUD0mcFp_0&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=8', 'https://img.youtube.com/vi/fpUD0mcFp_0/sddefault.jpg', 0, 0),
(227, 'MUSCLE', 'Wall Ball-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 15, 'https://www.youtube.com/watch?v=fpUD0mcFp_0&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=8', 'https://img.youtube.com/vi/fpUD0mcFp_0/sddefault.jpg', 0, 0),
(230, 'MUSCLE', 'Clean Balón Medicinal', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 4, 'https://www.youtube.com/watch?v=-nk0GqeSTJs&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=12', 'https://img.youtube.com/vi/-nk0GqeSTJs/sddefault.jpg', 0, 0),
(231, 'MUSCLE', 'Clean Balón Medicinal-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 8, 'https://www.youtube.com/watch?v=-nk0GqeSTJs&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=12', 'https://img.youtube.com/vi/-nk0GqeSTJs/sddefault.jpg', 0, 0),
(232, 'MUSCLE', 'Pistol con goma-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=5sTn1HTkZ8E', 'https://img.youtube.com/vi/5sTn1HTkZ8E/sddefault.jpg', 0, 0),
(233, 'MUSCLE', 'Pistol con cajón', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 3, 'https://www.youtube.com/watch?v=aoCqj2Wc5O8', 'https://img.youtube.com/vi/aoCqj2Wc5O8/sddefault.jpg', 0, 0),
(234, 'MUSCLE', 'Clean-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=EKRiW9Yt3Ps&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=24', 'https://img.youtube.com/vi/EKRiW9Yt3Ps/sddefault.jpg', 0, 0),
(235, 'MUSCLE', 'Snatch con mancuerna-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 4, 'https://www.youtube.com/watch?v=R0mhHuVrLHA&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=32', 'https://img.youtube.com/vi/R0mhHuVrLHA/sddefault.jpg', 0, 0),
(236, 'MUSCLE', 'Snatch con mancuerna-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 16, 'https://www.youtube.com/watch?v=R0mhHuVrLHA&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=32', 'https://img.youtube.com/vi/R0mhHuVrLHA/sddefault.jpg', 0, 0),
(239, 'MUSCLE', 'Sentadilla trasera-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=lYf8lz3sVLA', 'https://img.youtube.com/vi/lYf8lz3sVLA/sddefault.jpg', 0, 0),
(240, 'MUSCLE', 'Sentadilla trasera-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 10, 'https://www.youtube.com/watch?v=lYf8lz3sVLA', 'https://img.youtube.com/vi/lYf8lz3sVLA/sddefault.jpg', 0, 0),
(243, 'MUSCLE', 'Bajada al cajón-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 8, 'https://www.youtube.com/watch?v=t5tmJ94IFtc', 'https://img.youtube.com/vi/t5tmJ94IFtc/sddefault.jpg', 0, 0);
INSERT INTO `exercises` (`exercise_id`, `type`, `exercise_name`, `level_id`, `description`, `calisthenics`, `views`, `reps`, `video_link`, `poster_link`, `time`, `fat_burn`) VALUES
(244, 'MUSCLE', 'Wall Sit seg', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 30, 'https://www.youtube.com/watch?v=FMCLlSSgbt8', 'https://img.youtube.com/vi/FMCLlSSgbt8/sddefault.jpg', 0, 0),
(245, 'MUSCLE', 'Wall Sit seg-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 90, 'https://www.youtube.com/watch?v=FMCLlSSgbt8', 'https://img.youtube.com/vi/FMCLlSSgbt8/sddefault.jpg', 0, 0),
(246, 'MUSCLE', 'Wall Sit One Leg seg-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 40, 'https://www.youtube.com/watch?v=Xe5INIuphX4', 'https://img.youtube.com/vi/Xe5INIuphX4/sddefault.jpg', 0, 0),
(247, 'MUSCLE', 'Sentadilla partida lastrada cada pierna-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 8, 'https://www.youtube.com/watch?v=MEG6blZtUpc', 'https://img.youtube.com/vi/MEG6blZtUpc/sddefault.jpg', 0, 0),
(248, 'MUSCLE', 'Sentadilla Partida búlgara cada pierna-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 8, 'https://www.youtube.com/watch?v=KIFlBgE7-oc', 'https://img.youtube.com/vi/KIFlBgE7-oc/sddefault.jpg', 0, 0),
(249, 'MUSCLE', 'Sentadilla Partida búlgara lastrada cada pierna-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=r3jzvjt-0l8', 'https://img.youtube.com/vi/r3jzvjt-0l8/sddefault.jpg', 0, 0),
(250, 'MUSCLE', 'Sentadilla Partida búlgara lastrada cada pierna-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 10, 'https://www.youtube.com/watch?v=r3jzvjt-0l8', 'https://img.youtube.com/vi/r3jzvjt-0l8/sddefault.jpg', 0, 0),
(251, 'MUSCLE', 'Zancada con salto-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 10, 'https://www.youtube.com/watch?v=ejSYwQmPb_8', 'https://img.youtube.com/vi/ejSYwQmPb_8/sddefault.jpg', 0, 0),
(252, 'MUSCLE', 'Sentadilla Goblet-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 7, 'https://www.youtube.com/watch?v=1FucOlSntPo', 'https://img.youtube.com/vi/1FucOlSntPo/sddefault.jpg', 0, 0),
(253, 'MUSCLE', 'Subida al cajón con mancuerna-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 10, 'https://www.youtube.com/watch?v=BcEIANRim1w', 'https://img.youtube.com/vi/BcEIANRim1w/sddefault.jpg', 0, 0),
(254, 'MUSCLE', 'Subida al cajón-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 14, 'https://www.youtube.com/watch?v=5qjqDHOUh-A', 'https://img.youtube.com/vi/5qjqDHOUh-A/sddefault.jpg', 0, 0),
(258, 'MUSCLE', 'Salto sobre cajón con burpee-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=TMsvKvT-o_4', 'https://img.youtube.com/vi/TMsvKvT-o_4/sddefault.jpg', 0, 0),
(260, 'MUSCLE', 'Salto de longitud-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 7, 'https://www.youtube.com/watch?v=MwiI72uFzNI', 'https://img.youtube.com/vi/MwiI72uFzNI/sddefault.jpg', 0, 0),
(261, 'MUSCLE', 'KB Squat Clean-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 8, 'https://www.youtube.com/watch?v=yK-s3HEe3A0', 'https://img.youtube.com/vi/yK-s3HEe3A0/sddefault.jpg', 0, 0),
(262, 'MUSCLE', 'KB Squat Clean-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 12, 'https://www.youtube.com/watch?v=yK-s3HEe3A0', 'https://img.youtube.com/vi/yK-s3HEe3A0/sddefault.jpg', 0, 0),
(263, 'MUSCLE', 'DB Squat Clean', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=JwaGTOxUSeg', 'https://img.youtube.com/vi/JwaGTOxUSeg/sddefault.jpg', 0, 0),
(264, 'MUSCLE', 'DB Squat Clean-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 10, 'https://www.youtube.com/watch?v=JwaGTOxUSeg', 'https://img.youtube.com/vi/JwaGTOxUSeg/sddefault.jpg', 0, 0),
(265, 'MUSCLE', 'Peso Muerto', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 3, 'https://www.youtube.com/watch?v=op9kVnSso6Q&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=10', 'https://img.youtube.com/vi/op9kVnSso6Q/sddefault.jpg', 0, 0),
(266, 'MUSCLE', 'Peso Muerto-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 9, 'https://www.youtube.com/watch?v=op9kVnSso6Q&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=10', 'https://img.youtube.com/vi/op9kVnSso6Q/sddefault.jpg', 0, 0),
(267, 'MUSCLE', 'S.Deadlift H.Pull-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=o6QniJ9FaGA&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=11', 'https://img.youtube.com/vi/o6QniJ9FaGA/sddefault.jpg', 0, 0),
(268, 'MUSCLE', 'S.Deadlift H.Pull-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 12, 'https://www.youtube.com/watch?v=o6QniJ9FaGA&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=11', 'https://img.youtube.com/vi/o6QniJ9FaGA/sddefault.jpg', 0, 0),
(269, 'MUSCLE', 'KB Swing', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 5, 'https://www.youtube.com/watch?v=RU88iqRVunk', 'https://img.youtube.com/vi/RU88iqRVunk/sddefault.jpg', 0, 0),
(270, 'MUSCLE', 'KB Swing-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 15, 'https://www.youtube.com/watch?v=RU88iqRVunk', 'https://img.youtube.com/vi/RU88iqRVunk/sddefault.jpg', 0, 0),
(271, 'MUSCLE', 'KB Swing Americano-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 15, 'https://www.youtube.com/watch?v=vdezTMulJ-k&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=23', 'https://img.youtube.com/vi/vdezTMulJ-k/sddefault.jpg', 0, 0),
(277, 'MUSCLE', 'Muscle Snatch-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 3, 'https://www.youtube.com/watch?v=LRcTB2-Xyg8&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=46', 'https://img.youtube.com/vi/LRcTB2-Xyg8/sddefault.jpg', 0, 0),
(278, 'MUSCLE', 'Muscle Snatch-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 9, 'https://www.youtube.com/watch?v=LRcTB2-Xyg8&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=46', 'https://img.youtube.com/vi/LRcTB2-Xyg8/sddefault.jpg', 0, 0),
(281, 'MUSCLE', 'Empuje de cadera', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 3, 'https://www.youtube.com/watch?v=_jAPWAZiKj0', 'https://img.youtube.com/vi/_jAPWAZiKj0/sddefault.jpg', 0, 0),
(282, 'MUSCLE', 'Empuje de cadera-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 9, 'https://www.youtube.com/watch?v=_jAPWAZiKj0', 'https://img.youtube.com/vi/_jAPWAZiKj0/sddefault.jpg', 0, 0),
(283, 'MUSCLE', 'Puente Cadera una pierna-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 10, 'https://www.youtube.com/watch?v=qglZbRtqRwk', 'https://img.youtube.com/vi/qglZbRtqRwk/sddefault.jpg', 0, 0),
(284, 'MUSCLE', 'Saltos al cajon altura baja', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 12, 'https://www.youtube.com/watch?v=52r_Ul5k03g&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=49', 'https://img.youtube.com/vi/52r_Ul5k03g/sddefault.jpg', 0, 0),
(285, 'MUSCLE', 'Saltos al cajon altura alta-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 24, 'https://www.youtube.com/watch?v=52r_Ul5k03g&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=49', 'https://img.youtube.com/vi/52r_Ul5k03g/sddefault.jpg', 0, 0),
(286, 'MUSCLE', 'Salto barra lateral con burpee', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 8, 'https://www.youtube.com/watch?v=Ot4WqENrTFc', 'https://img.youtube.com/vi/Ot4WqENrTFc/sddefault.jpg', 0, 0),
(287, 'MUSCLE', 'Salto barra lateral con burpee-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 8, 'https://www.youtube.com/watch?v=Ot4WqENrTFc', 'https://img.youtube.com/vi/Ot4WqENrTFc/sddefault.jpg', 0, 0),
(288, 'MUSCLE', 'Salto sobre cajón', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 8, 'https://www.youtube.com/watch?v=-Tz4BF2ne2A', 'https://img.youtube.com/vi/-Tz4BF2ne2A/sddefault.jpg', 0, 0),
(289, 'MUSCLE', 'Salto sobre cajón-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 16, 'https://www.youtube.com/watch?v=-Tz4BF2ne2A', 'https://img.youtube.com/vi/-Tz4BF2ne2A/sddefault.jpg', 0, 0),
(290, 'MUSCLE', 'Salto sobre cajón con burpee', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 8, 'https://www.youtube.com/watch?v=TMsvKvT-o_4', 'https://img.youtube.com/vi/TMsvKvT-o_4/sddefault.jpg', 0, 0),
(291, 'MUSCLE', 'Salto sobre cajón con burpee-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 8, 'https://www.youtube.com/watch?v=TMsvKvT-o_4', 'https://img.youtube.com/vi/TMsvKvT-o_4/sddefault.jpg', 0, 0),
(292, 'MUSCLE', 'Salto barra con burpee', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 8, 'https://www.youtube.com/watch?v=F4Osiwr4g1w', 'https://img.youtube.com/vi/F4Osiwr4g1w/sddefault.jpg', 0, 0),
(293, 'MUSCLE', 'Salto barra con burpee-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 12, 'https://www.youtube.com/watch?v=F4Osiwr4g1w', 'https://img.youtube.com/vi/F4Osiwr4g1w/sddefault.jpg', 0, 0),
(294, 'MUSCLE', 'KB Clean', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=ZuTKcP6vtfI', 'https://img.youtube.com/vi/ZuTKcP6vtfI/sddefault.jpg', 0, 0),
(295, 'MUSCLE', 'KB Clean-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 10, 'https://www.youtube.com/watch?v=ZuTKcP6vtfI', 'https://img.youtube.com/vi/ZuTKcP6vtfI/sddefault.jpg', 0, 0),
(298, 'MUSCLE', 'KB Clean and Push Jerk', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=Ax9m0QF4Duk', 'https://img.youtube.com/vi/Ax9m0QF4Duk/sddefault.jpg', 0, 0),
(299, 'MUSCLE', 'KB Clean and Push Jerk-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 10, 'https://www.youtube.com/watch?v=Ax9m0QF4Duk', 'https://img.youtube.com/vi/Ax9m0QF4Duk/sddefault.jpg', 0, 0),
(300, 'MUSCLE', 'DB Squat Clean-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 8, 'https://www.youtube.com/watch?v=JwaGTOxUSeg', 'https://img.youtube.com/vi/JwaGTOxUSeg/sddefault.jpg', 0, 0),
(301, 'MUSCLE', 'DB Squat Clean-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 12, 'https://www.youtube.com/watch?v=JwaGTOxUSeg', 'https://img.youtube.com/vi/JwaGTOxUSeg/sddefault.jpg', 0, 0),
(302, 'MUSCLE', 'DB Hang Clean', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=qppB3f1V5yc', 'https://img.youtube.com/vi/qppB3f1V5yc/sddefault.jpg', 0, 0),
(303, 'MUSCLE', 'DB Hang Clean-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 10, 'https://www.youtube.com/watch?v=qppB3f1V5yc', 'https://img.youtube.com/vi/qppB3f1V5yc/sddefault.jpg', 0, 0),
(304, 'MUSCLE', 'Single KB Snatch-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 8, 'https://www.youtube.com/watch?v=OFV-GRUY2RY', 'https://img.youtube.com/vi/OFV-GRUY2RY/sddefault.jpg', 0, 0),
(305, 'MUSCLE', 'Single KB Snatch-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 12, 'https://www.youtube.com/watch?v=OFV-GRUY2RY', 'https://img.youtube.com/vi/OFV-GRUY2RY/sddefault.jpg', 0, 0),
(306, 'MUSCLE', 'Salto de longitud', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 5, 'https://www.youtube.com/watch?v=MwiI72uFzNI', 'https://img.youtube.com/vi/MwiI72uFzNI/sddefault.jpg', 0, 0),
(307, 'MUSCLE', 'Salto de longitud-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 9, 'https://www.youtube.com/watch?v=MwiI72uFzNI', 'https://img.youtube.com/vi/MwiI72uFzNI/sddefault.jpg', 0, 0),
(308, 'MUSCLE', 'Peso Muerto-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=op9kVnSso6Q&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=10', 'https://img.youtube.com/vi/op9kVnSso6Q/sddefault.jpg', 0, 0),
(309, 'MUSCLE', 'Peso Muerto-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 12, 'https://www.youtube.com/watch?v=op9kVnSso6Q&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=10', 'https://img.youtube.com/vi/op9kVnSso6Q/sddefault.jpg', 0, 0),
(312, 'MUSCLE', 'KB Swing-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 10, 'https://www.youtube.com/watch?v=RU88iqRVunk', 'https://img.youtube.com/vi/RU88iqRVunk/sddefault.jpg', 0, 0),
(313, 'MUSCLE', 'KB Swing-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 20, 'https://www.youtube.com/watch?v=RU88iqRVunk', 'https://img.youtube.com/vi/RU88iqRVunk/sddefault.jpg', 0, 0),
(314, 'MUSCLE', 'KB Swing Americano-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 10, 'https://www.youtube.com/watch?v=vdezTMulJ-k&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=23', 'https://img.youtube.com/vi/vdezTMulJ-k/sddefault.jpg', 0, 0),
(315, 'MUSCLE', 'KB Swing Americano-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 20, 'https://www.youtube.com/watch?v=vdezTMulJ-k&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=23', 'https://img.youtube.com/vi/vdezTMulJ-k/sddefault.jpg', 0, 0),
(316, 'MUSCLE', 'Clean-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 3, 'https://www.youtube.com/watch?v=EKRiW9Yt3Ps&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=24', 'https://img.youtube.com/vi/EKRiW9Yt3Ps/sddefault.jpg', 0, 0),
(317, 'MUSCLE', 'Clean-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 7, 'https://www.youtube.com/watch?v=EKRiW9Yt3Ps&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=24', 'https://img.youtube.com/vi/EKRiW9Yt3Ps/sddefault.jpg', 0, 0),
(318, 'MUSCLE', 'Snatch-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 3, 'https://www.youtube.com/watch?v=9xQp2sldyts&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=26', 'https://img.youtube.com/vi/9xQp2sldyts/sddefault.jpg', 0, 0),
(319, 'MUSCLE', 'Snatch-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 9, 'https://www.youtube.com/watch?v=9xQp2sldyts&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=26', 'https://img.youtube.com/vi/9xQp2sldyts/sddefault.jpg', 0, 0),
(328, 'MUSCLE', 'Cargada a media sentadilla', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 3, 'https://www.youtube.com/watch?v=GVt4uQ0sDJE&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=42', 'https://img.youtube.com/vi/GVt4uQ0sDJE/sddefault.jpg', 0, 0),
(329, 'MUSCLE', 'Cargada a media sentadilla-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 9, 'https://www.youtube.com/watch?v=GVt4uQ0sDJE&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=42', 'https://img.youtube.com/vi/GVt4uQ0sDJE/sddefault.jpg', 0, 0),
(330, 'MUSCLE', 'Power Snatch-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 8, 'https://www.youtube.com/watch?v=tuOiNeTvLJs&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=43', 'https://img.youtube.com/vi/tuOiNeTvLJs/sddefault.jpg', 0, 0),
(331, 'MUSCLE', 'Superman seg-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 50, 'https://www.youtube.com/watch?v=dxzGhQMvb7E', 'https://img.youtube.com/vi/dxzGhQMvb7E/sddefault.jpg', 0, 0),
(332, 'MUSCLE', 'Superman dinámico seg-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 50, 'https://www.youtube.com/watch?v=h4DZOajtOaU', 'https://img.youtube.com/vi/h4DZOajtOaU/sddefault.jpg', 0, 0),
(335, 'MUSCLE', 'Superman ángel de nieve-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 10, 'https://www.youtube.com/watch?v=uUgrxJ4yKcg', 'https://img.youtube.com/vi/uUgrxJ4yKcg/sddefault.jpg', 0, 0),
(336, 'MUSCLE', 'Superman Rock-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 10, 'https://www.youtube.com/watch?v=YCAYXQNB4X0', 'https://img.youtube.com/vi/YCAYXQNB4X0/sddefault.jpg', 0, 0),
(345, 'MUSCLE', 'DB Hang Clean-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 8, 'https://www.youtube.com/watch?v=qppB3f1V5yc', 'https://img.youtube.com/vi/qppB3f1V5yc/sddefault.jpg', 0, 0),
(346, 'MUSCLE', 'DB Hang Clean-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 12, 'https://www.youtube.com/watch?v=qppB3f1V5yc', 'https://img.youtube.com/vi/qppB3f1V5yc/sddefault.jpg', 0, 0),
(347, 'MUSCLE', 'Single KB Snatch', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=OFV-GRUY2RY', 'https://img.youtube.com/vi/OFV-GRUY2RY/sddefault.jpg', 0, 0),
(348, 'MUSCLE', 'Single KB Snatch-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 10, 'https://www.youtube.com/watch?v=OFV-GRUY2RY', 'https://img.youtube.com/vi/OFV-GRUY2RY/sddefault.jpg', 0, 0),
(349, 'MUSCLE', 'Dominada negativa supina-(Máximo)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 5, 'https://www.youtube.com/watch?v=mjNHoibfrMo', 'https://img.youtube.com/vi/mjNHoibfrMo/sddefault.jpg', 0, 0),
(350, 'MUSCLE', 'Dominada supina-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 6, 'https://www.youtube.com/watch?v=nMngQ4nxUU0', 'https://img.youtube.com/vi/nMngQ4nxUU0/sddefault.jpg', 0, 0),
(351, 'MUSCLE', 'Dominada supina-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 10, 'https://www.youtube.com/watch?v=nMngQ4nxUU0', 'https://img.youtube.com/vi/nMngQ4nxUU0/sddefault.jpg', 0, 0),
(352, 'MUSCLE', 'Dominada de biceps bajada lenta-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 8, 'https://www.youtube.com/watch?v=iYzHD8gtF7E', 'https://img.youtube.com/vi/iYzHD8gtF7E/sddefault.jpg', 0, 0),
(353, 'MUSCLE', 'Domindada supina pecho a la barra-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 8, 'https://www.youtube.com/watch?v=PagPsEIc7HI', 'https://img.youtube.com/vi/PagPsEIc7HI/sddefault.jpg', 0, 0),
(354, 'MUSCLE', 'Dominada supina lastrada-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=ylSSCipTaCk', 'https://img.youtube.com/vi/ylSSCipTaCk/sddefault.jpg', 0, 0),
(355, 'MUSCLE', 'Dominadas australianas de biceps-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 8, 'https://www.youtube.com/watch?v=7_6_xlLx-Kk', 'https://img.youtube.com/vi/7_6_xlLx-Kk/sddefault.jpg', 0, 0),
(357, 'MUSCLE', 'Aguantar en anillas seg-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 15, 'https://www.youtube.com/watch?v=SHOQKB3s1No', 'https://img.youtube.com/vi/SHOQKB3s1No/sddefault.jpg', 0, 0),
(358, 'MUSCLE', 'Flexiones-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 24, 'https://www.youtube.com/watch?v=_l3ySVKYVJ8&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=21', 'https://img.youtube.com/vi/_l3ySVKYVJ8/sddefault.jpg', 0, 0),
(359, 'MUSCLE', 'Flexiones lentas-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 6, 'https://www.youtube.com/watch?v=5aD4V6iAG2k', 'https://img.youtube.com/vi/5aD4V6iAG2k/sddefault.jpg', 0, 0),
(360, 'MUSCLE', 'Flexiones Diamante-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 10, 'https://www.youtube.com/watch?v=XtU2VQVuLYs', 'https://img.youtube.com/vi/XtU2VQVuLYs/sddefault.jpg', 0, 0),
(361, 'MUSCLE', 'Flexiones lastradas-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=_9YqyFzAXB4', 'https://img.youtube.com/vi/_9YqyFzAXB4/sddefault.jpg', 0, 0),
(362, 'MUSCLE', 'Flexiones lastradas-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 10, 'https://www.youtube.com/watch?v=_9YqyFzAXB4', 'https://img.youtube.com/vi/_9YqyFzAXB4/sddefault.jpg', 0, 0),
(363, 'MUSCLE', 'Flexiones con goma-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=cOFwFzzLFWw', 'https://img.youtube.com/vi/cOFwFzzLFWw/sddefault.jpg', 0, 0),
(364, 'MUSCLE', 'Flexiones con goma-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 10, 'https://www.youtube.com/watch?v=cOFwFzzLFWw', 'https://img.youtube.com/vi/cOFwFzzLFWw/sddefault.jpg', 0, 0),
(365, 'MUSCLE', 'Flexiones en anillas-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=VaLefQtOXDg', 'https://img.youtube.com/vi/VaLefQtOXDg/sddefault.jpg', 0, 0),
(366, 'MUSCLE', 'Flexiones declinadas-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 8, 'https://www.youtube.com/watch?v=PXIpw1JD4qw', 'https://img.youtube.com/vi/PXIpw1JD4qw/sddefault.jpg', 0, 0),
(367, 'MUSCLE', 'Flexiones Archer-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 6, 'https://www.youtube.com/watch?v=sU6c0z881os', 'https://img.youtube.com/vi/sU6c0z881os/sddefault.jpg', 0, 0),
(370, 'MUSCLE', 'Fondos en anillas separadas-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=pGXy_etf0D0', 'https://img.youtube.com/vi/pGXy_etf0D0/sddefault.jpg', 0, 0),
(371, 'MUSCLE', 'Man maker-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=NJztTcxHgm4', 'https://img.youtube.com/vi/NJztTcxHgm4/sddefault.jpg', 0, 0),
(372, 'MUSCLE', 'Man maker-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 10, 'https://www.youtube.com/watch?v=NJztTcxHgm4', 'https://img.youtube.com/vi/NJztTcxHgm4/sddefault.jpg', 0, 0),
(373, 'MUSCLE', 'Press banca', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 4, 'https://www.youtube.com/watch?v=uqAsj8ozt40', 'https://img.youtube.com/vi/uqAsj8ozt40/sddefault.jpg', 0, 0),
(374, 'MUSCLE', 'Press banca-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 8, 'https://www.youtube.com/watch?v=uqAsj8ozt40', 'https://img.youtube.com/vi/uqAsj8ozt40/sddefault.jpg', 0, 0),
(375, 'MUSCLE', 'Press banca agarre amplio-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=u_PW2locwZs', 'https://img.youtube.com/vi/u_PW2locwZs/sddefault.jpg', 0, 0),
(376, 'MUSCLE', 'Press banca agarre amplio-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 10, 'https://www.youtube.com/watch?v=u_PW2locwZs', 'https://img.youtube.com/vi/u_PW2locwZs/sddefault.jpg', 0, 0),
(377, 'MUSCLE', 'Press banca mancuernas', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 4, 'https://www.youtube.com/watch?v=_HnF0C1R7gI', 'https://img.youtube.com/vi/_HnF0C1R7gI/sddefault.jpg', 0, 0),
(378, 'MUSCLE', 'Press banca mancuernas-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 8, 'https://www.youtube.com/watch?v=_HnF0C1R7gI', 'https://img.youtube.com/vi/_HnF0C1R7gI/sddefault.jpg', 0, 0),
(384, 'MUSCLE', 'Flexiones toque hombro', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 5, 'https://www.youtube.com/watch?v=ZZ1Wf23EKjg', 'https://img.youtube.com/vi/ZZ1Wf23EKjg/sddefault.jpg', 0, 0),
(385, 'MUSCLE', 'Flexiones toque hombro-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 15, 'https://www.youtube.com/watch?v=ZZ1Wf23EKjg', 'https://img.youtube.com/vi/ZZ1Wf23EKjg/sddefault.jpg', 0, 0),
(386, 'MUSCLE', 'Press Bancha Mancuernas', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=azSwL5xr8PQ', 'https://img.youtube.com/vi/azSwL5xr8PQ/sddefault.jpg', 0, 0),
(387, 'MUSCLE', 'Press Bancha Mancuernas-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 10, 'https://www.youtube.com/watch?v=azSwL5xr8PQ', 'https://img.youtube.com/vi/azSwL5xr8PQ/sddefault.jpg', 0, 0),
(388, 'MUSCLE', 'Zancada', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 1, 'https://www.youtube.com/watch?v=GBaWQsV_SHg', 'https://img.youtube.com/vi/GBaWQsV_SHg/sddefault.jpg', 0, 0),
(389, 'MUSCLE', 'Zancada con peso', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=JNftH58BYw4', 'https://img.youtube.com/vi/JNftH58BYw4/sddefault.jpg', 0, 0),
(390, 'MUSCLE', 'Zancada con peso-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 10, 'https://www.youtube.com/watch?v=JNftH58BYw4', 'https://img.youtube.com/vi/JNftH58BYw4/sddefault.jpg', 0, 0),
(391, 'MUSCLE', 'Zancada Front Rack-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=f3WLs_HutLw&list=PLgve_TNgIw480TOU1ZuFiZh-zfRkRZVM6&index=27', 'https://img.youtube.com/vi/f3WLs_HutLw/sddefault.jpg', 0, 0),
(398, 'MUSCLE', 'Colgarse de la barra seg', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 20, 'https://www.youtube.com/watch?v=PBBqA7gPtZw', 'https://img.youtube.com/vi/PBBqA7gPtZw/sddefault.jpg', 0, 0),
(399, 'MUSCLE', 'Colgarse de la barra seg-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 40, 'https://www.youtube.com/watch?v=PBBqA7gPtZw', 'https://img.youtube.com/vi/PBBqA7gPtZw/sddefault.jpg', 0, 0),
(400, 'MUSCLE', 'Cambio de mano en barra', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 1, 0, 15, 'https://www.youtube.com/watch?v=CVjzQ0WDYe8', 'https://img.youtube.com/vi/CVjzQ0WDYe8/sddefault.jpg', 0, 0),
(402, 'MUSCLE', 'Press KB Bottom desde suelo', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 2, 'https://www.youtube.com/watch?v=OzBf1I2o2hY', 'https://img.youtube.com/vi/OzBf1I2o2hY/sddefault.jpg', 0, 0),
(403, 'MUSCLE', 'Press KB Bottom desde suelo-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 6, 'https://www.youtube.com/watch?v=OzBf1I2o2hY', 'https://img.youtube.com/vi/OzBf1I2o2hY/sddefault.jpg', 0, 0),
(404, 'MUSCLE', 'Press KB Bottom-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 4, 'https://www.youtube.com/watch?v=igBk9KYImak', 'https://img.youtube.com/vi/igBk9KYImak/sddefault.jpg', 0, 0),
(405, 'MUSCLE', 'Press KB Bottom-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 8, 'https://www.youtube.com/watch?v=igBk9KYImak', 'https://img.youtube.com/vi/igBk9KYImak/sddefault.jpg', 0, 0),
(406, 'MUSCLE', 'Aguantar KB Bottom en rack seg', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 10, 'https://www.youtube.com/watch?v=Zzlg3UfvcFg', 'https://img.youtube.com/vi/Zzlg3UfvcFg/sddefault.jpg', 0, 0),
(407, 'MUSCLE', 'Aguantar KB Bottom en rack seg-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 20, 'https://www.youtube.com/watch?v=Zzlg3UfvcFg', 'https://img.youtube.com/vi/Zzlg3UfvcFg/sddefault.jpg', 0, 0),
(408, 'MUSCLE', 'Aguantar KB Bottom en rack alto seg-(Moderado)', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 10, 'https://www.youtube.com/watch?v=Sw43V-NGfnQ', 'https://img.youtube.com/vi/Sw43V-NGfnQ/sddefault.jpg', 0, 0);
INSERT INTO `exercises` (`exercise_id`, `type`, `exercise_name`, `level_id`, `description`, `calisthenics`, `views`, `reps`, `video_link`, `poster_link`, `time`, `fat_burn`) VALUES
(409, 'MUSCLE', 'Aguantar KB Bottom en rack alto seg-(Máximo)', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 18, 'https://www.youtube.com/watch?v=Sw43V-NGfnQ', 'https://img.youtube.com/vi/Sw43V-NGfnQ/sddefault.jpg', 0, 0),
(410, 'MUSCLE', 'Farmer seg', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 20, 'https://www.youtube.com/watch?v=MH8id-EaoPA', 'https://img.youtube.com/vi/MH8id-EaoPA/sddefault.jpg', 0, 0),
(411, 'MUSCLE', 'Farmer seg-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 20, 'https://www.youtube.com/watch?v=MH8id-EaoPA', 'https://img.youtube.com/vi/MH8id-EaoPA/sddefault.jpg', 0, 0),
(412, 'MUSCLE', 'Subida al cajón con mancuerna', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 8, 'https://www.youtube.com/watch?v=BcEIANRim1w', 'https://img.youtube.com/vi/BcEIANRim1w/sddefault.jpg', 0, 0),
(413, 'MUSCLE', 'Subida al cajón con mancuerna-(Intenso)', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 0, 0, 12, 'https://www.youtube.com/watch?v=BcEIANRim1w', 'https://img.youtube.com/vi/BcEIANRim1w/sddefault.jpg', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favourites`
--

CREATE TABLE `favourites` (
  `exercise_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `favourites`
--

INSERT INTO `favourites` (`exercise_id`, `user_id`) VALUES
(1, 2),
(6, 1),
(166, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `levels`
--

CREATE TABLE `levels` (
  `level_id` int(11) NOT NULL,
  `level_name` varchar(50) DEFAULT NULL,
  `description` varchar(50) NOT NULL,
  `value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `levels`
--

INSERT INTO `levels` (`level_id`, `level_name`, `description`, `value`) VALUES
(1, 'N1', 'Suave', 1),
(2, 'N2', 'Moderado', 2),
(3, 'RX', 'Intenso', 3),
(4, 'RX+', 'Máximo', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `muscle_group`
--

CREATE TABLE `muscle_group` (
  `muscle_group_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `muscle_group`
--

INSERT INTO `muscle_group` (`muscle_group_id`, `name`) VALUES
(0, 'Hombros'),
(1, 'Espalda'),
(2, 'Biceps'),
(3, 'Triceps'),
(4, 'Pecho'),
(5, 'Core'),
(6, 'Glúteos'),
(7, 'Cuadriceps'),
(8, 'Hamstring'),
(9, 'Cardio'),
(10, 'Lumbar'),
(11, 'Agarre (Grip)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `muscle_works`
--

CREATE TABLE `muscle_works` (
  `muscle_group_id` int(11) NOT NULL,
  `exercise_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `muscle_works`
--

INSERT INTO `muscle_works` (`muscle_group_id`, `exercise_id`) VALUES
(0, 83),
(0, 84),
(0, 85),
(0, 86),
(0, 87),
(0, 88),
(0, 89),
(0, 90),
(0, 91),
(0, 92),
(0, 93),
(0, 94),
(0, 95),
(0, 96),
(0, 97),
(0, 98),
(0, 99),
(0, 100),
(0, 101),
(0, 102),
(0, 103),
(0, 104),
(0, 105),
(0, 106),
(0, 107),
(0, 108),
(0, 109),
(0, 110),
(0, 111),
(0, 112),
(0, 113),
(0, 114),
(0, 115),
(0, 116),
(0, 117),
(0, 118),
(0, 119),
(0, 120),
(0, 121),
(0, 122),
(0, 123),
(0, 124),
(0, 125),
(0, 126),
(0, 128),
(0, 129),
(0, 130),
(0, 131),
(0, 132),
(0, 133),
(0, 134),
(0, 135),
(0, 136),
(0, 137),
(0, 138),
(0, 139),
(0, 140),
(0, 141),
(0, 142),
(0, 143),
(0, 144),
(0, 145),
(0, 146),
(0, 147),
(0, 148),
(0, 149),
(0, 150),
(0, 151),
(0, 152),
(0, 153),
(0, 154),
(0, 155),
(0, 156),
(0, 157),
(0, 158),
(1, 159),
(1, 160),
(1, 161),
(1, 162),
(1, 163),
(1, 164),
(1, 165),
(1, 166),
(1, 167),
(1, 168),
(1, 169),
(1, 170),
(1, 171),
(1, 172),
(1, 173),
(1, 174),
(1, 175),
(1, 176),
(1, 177),
(1, 178),
(1, 179),
(1, 180),
(1, 181),
(1, 182),
(1, 183),
(1, 184),
(2, 158),
(2, 349),
(2, 350),
(2, 351),
(2, 352),
(2, 353),
(2, 354),
(2, 355),
(3, 185),
(3, 186),
(3, 187),
(3, 188),
(3, 189),
(3, 190),
(3, 191),
(3, 192),
(3, 193),
(3, 194),
(4, 148),
(4, 149),
(4, 174),
(4, 175),
(4, 180),
(4, 188),
(4, 189),
(4, 357),
(4, 358),
(4, 359),
(4, 360),
(4, 361),
(4, 362),
(4, 363),
(4, 364),
(4, 365),
(4, 366),
(4, 367),
(4, 370),
(4, 371),
(4, 372),
(4, 373),
(4, 374),
(4, 375),
(4, 376),
(4, 377),
(4, 378),
(4, 384),
(4, 385),
(4, 386),
(4, 387),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 5),
(5, 6),
(5, 7),
(5, 8),
(5, 9),
(5, 10),
(5, 11),
(5, 12),
(5, 13),
(5, 14),
(5, 15),
(5, 16),
(5, 17),
(5, 18),
(5, 19),
(5, 20),
(5, 21),
(5, 22),
(5, 23),
(5, 24),
(5, 25),
(5, 26),
(5, 27),
(5, 28),
(5, 29),
(5, 30),
(5, 31),
(5, 32),
(5, 33),
(5, 34),
(5, 35),
(5, 36),
(5, 37),
(5, 38),
(5, 39),
(5, 40),
(5, 41),
(5, 42),
(5, 43),
(5, 44),
(5, 45),
(5, 46),
(5, 47),
(5, 48),
(5, 49),
(5, 50),
(5, 51),
(5, 52),
(5, 53),
(5, 54),
(5, 55),
(5, 56),
(5, 57),
(5, 58),
(5, 59),
(5, 60),
(5, 61),
(5, 62),
(5, 63),
(5, 64),
(5, 65),
(5, 66),
(5, 67),
(5, 68),
(5, 69),
(5, 70),
(5, 71),
(5, 72),
(5, 73),
(5, 74),
(5, 75),
(5, 76),
(5, 77),
(5, 78),
(5, 79),
(5, 80),
(5, 81),
(5, 82),
(6, 106),
(6, 281),
(6, 282),
(6, 283),
(6, 388),
(6, 389),
(6, 390),
(6, 391),
(7, 89),
(7, 90),
(7, 96),
(7, 97),
(7, 119),
(7, 120),
(7, 144),
(7, 145),
(7, 218),
(7, 219),
(7, 220),
(7, 221),
(7, 222),
(7, 223),
(7, 226),
(7, 227),
(7, 230),
(7, 231),
(7, 232),
(7, 233),
(7, 234),
(7, 235),
(7, 236),
(7, 239),
(7, 240),
(7, 243),
(7, 244),
(7, 245),
(7, 246),
(7, 247),
(7, 248),
(7, 249),
(7, 250),
(7, 251),
(7, 252),
(7, 253),
(7, 254),
(7, 258),
(7, 260),
(7, 261),
(7, 262),
(7, 263),
(7, 264),
(8, 105),
(8, 115),
(8, 116),
(8, 117),
(8, 118),
(8, 124),
(8, 125),
(8, 261),
(8, 262),
(8, 265),
(8, 266),
(8, 267),
(8, 268),
(8, 269),
(8, 270),
(8, 271),
(8, 277),
(8, 278),
(8, 281),
(8, 282),
(8, 283),
(8, 284),
(8, 285),
(8, 286),
(8, 287),
(8, 288),
(8, 289),
(8, 290),
(8, 291),
(8, 292),
(8, 293),
(8, 294),
(8, 295),
(8, 298),
(8, 299),
(8, 300),
(8, 301),
(8, 302),
(8, 303),
(8, 304),
(8, 305),
(8, 306),
(8, 307),
(10, 107),
(10, 108),
(10, 124),
(10, 125),
(10, 142),
(10, 143),
(10, 154),
(10, 155),
(10, 182),
(10, 230),
(10, 231),
(10, 261),
(10, 262),
(10, 263),
(10, 264),
(10, 277),
(10, 278),
(10, 294),
(10, 295),
(10, 308),
(10, 309),
(10, 312),
(10, 313),
(10, 314),
(10, 315),
(10, 316),
(10, 317),
(10, 318),
(10, 319),
(10, 328),
(10, 329),
(10, 330),
(10, 331),
(10, 332),
(10, 335),
(10, 336),
(10, 345),
(10, 346),
(10, 347),
(10, 348),
(11, 142),
(11, 143),
(11, 263),
(11, 264),
(11, 345),
(11, 346),
(11, 347),
(11, 348),
(11, 398),
(11, 399),
(11, 400),
(11, 402),
(11, 403),
(11, 404),
(11, 405),
(11, 406),
(11, 407),
(11, 408),
(11, 409),
(11, 410),
(11, 411),
(11, 412),
(11, 413);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `routines`
--

CREATE TABLE `routines` (
  `routine_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `difficulty` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `routines`
--

INSERT INTO `routines` (`routine_id`, `user_id`, `difficulty`, `date`) VALUES
(1, 1, 16, '2022-06-08 13:48:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `routine_exercises`
--

CREATE TABLE `routine_exercises` (
  `exercise_id` int(11) NOT NULL,
  `routine_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `routine_exercises`
--

INSERT INTO `routine_exercises` (`exercise_id`, `routine_id`) VALUES
(198, 1),
(202, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `name`, `password`, `email`) VALUES
(1, 'Paco', '8cb2237d0679ca88db6464eac60da96345513964', 'rucaju5@gmail.com'),
(2, 'user', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'rucaju5@gmail.es');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `votes`
--

CREATE TABLE `votes` (
  `exercise_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `votes`
--

INSERT INTO `votes` (`exercise_id`, `user_id`, `rating`) VALUES
(1, 1, 4),
(6, 1, 4),
(166, 1, 4),
(201, 1, 3),
(202, 1, 2),
(205, 1, 4),
(206, 1, 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `exercises`
--
ALTER TABLE `exercises`
  ADD PRIMARY KEY (`exercise_id`),
  ADD KEY `level_id` (`level_id`);

--
-- Indices de la tabla `favourites`
--
ALTER TABLE `favourites`
  ADD PRIMARY KEY (`exercise_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`level_id`),
  ADD UNIQUE KEY `level_name` (`level_name`);

--
-- Indices de la tabla `muscle_group`
--
ALTER TABLE `muscle_group`
  ADD PRIMARY KEY (`muscle_group_id`);

--
-- Indices de la tabla `muscle_works`
--
ALTER TABLE `muscle_works`
  ADD PRIMARY KEY (`muscle_group_id`,`exercise_id`),
  ADD KEY `exercise_id` (`exercise_id`);

--
-- Indices de la tabla `routines`
--
ALTER TABLE `routines`
  ADD PRIMARY KEY (`routine_id`);

--
-- Indices de la tabla `routine_exercises`
--
ALTER TABLE `routine_exercises`
  ADD PRIMARY KEY (`exercise_id`,`routine_id`),
  ADD KEY `routine_id` (`routine_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indices de la tabla `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`exercise_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `exercises`
--
ALTER TABLE `exercises`
  ADD CONSTRAINT `exercises_ibfk_1` FOREIGN KEY (`level_id`) REFERENCES `levels` (`level_id`);

--
-- Filtros para la tabla `favourites`
--
ALTER TABLE `favourites`
  ADD CONSTRAINT `favourites_ibfk_1` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`exercise_id`),
  ADD CONSTRAINT `favourites_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Filtros para la tabla `muscle_works`
--
ALTER TABLE `muscle_works`
  ADD CONSTRAINT `muscle_works_ibfk_1` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`exercise_id`),
  ADD CONSTRAINT `muscle_works_ibfk_2` FOREIGN KEY (`muscle_group_id`) REFERENCES `muscle_group` (`muscle_group_id`);

--
-- Filtros para la tabla `routine_exercises`
--
ALTER TABLE `routine_exercises`
  ADD CONSTRAINT `routine_exercises_ibfk_1` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`exercise_id`),
  ADD CONSTRAINT `routine_exercises_ibfk_2` FOREIGN KEY (`routine_id`) REFERENCES `routines` (`routine_id`);

--
-- Filtros para la tabla `votes`
--
ALTER TABLE `votes`
  ADD CONSTRAINT `votes_ibfk_1` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`exercise_id`),
  ADD CONSTRAINT `votes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
